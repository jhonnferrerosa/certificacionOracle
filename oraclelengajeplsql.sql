
SELECT * from dept;
select * from emp;
select * from enfermo;
select * from doctor;
select * from hospital;
select * from sala;
select * from plantilla;

declare
    miVariable_$# integer := 333;
BEGIN
    dbms_output.put_line ('hola mundo');
    dbms_output.put_line (miVariable_$#);
end;

begin
    dbms_output.put_line ('hola mundo2');
end;

--quitar la definicion de las variabeles, para que cada vez que se se ejecuta la apllicacion ejecte la peticion de los  números. 
UNDEFINE dato;
UNDEFINE deptno;

SELECT * from dept;

declare 
  v_numero dept.DEPT_NO%TYPE;
  v_nombre dept.dnombre%TYPE;
  v_localidad dept.LOC%TYPE;
BEGIN
  -- le pedimos al usuario los valores. 
  v_numero := &iddepartamento;
  v_nombre := '&nombre;';
  v_localidad := '&localidad;';

  INSERT into dept values (v_numero, v_nombre, v_localidad);
end;

UNDEFINE iddepartamento;
UNDEFINE nombre;
UNDEFINE localidad;

--10/4/2025
--ejercicios de sintaxisu 
--2
INSERT INTO emp VALUES('7839', 'rey', 'PRESIDENTE', NULL, TO_DATE('17-11-2005', 'DD-MM-YYYY'), 650000, NULL, 10);

SELECT * from emp;

DECLARE
  v_empno emp.emp_no%TYPE;
BEGIN
  v_empno := &empno;
  INSERT into emp values (v_empno, 'perez', 'analista', null, sysdate, 2000, null, 10);
END;

UNDEFINE empno;

--3 
SELECT * from emp;

DECLARE
  v_oficio emp.oficio%TYPE;
  miValorSumar integer := 200;
BEGIN
  v_oficio := '&oficio';
  UPDATE emp SET salario = salario + miValorSumar WHERE oficio = v_oficio;
  dbms_output.put_line ('Se han actualizado los salarios de los empleados con oficio ' || v_oficio);
END;

--4  
DECLARE
  v_mientero integer;
  mistring varchar2(100);
BEGIN
  v_mientero := &mientero;
  mistring := to_char(v_mientero);
  dbms_output.put_line ('La cantidad de cifras es: ' || length (mistring));
END;

UNDEFINE mientero;

--5 ya esta hecho. 


--6 
SELECT * from emp;
SELECT emp_no, nvl (COMISION, 0) from emp;
--buscar a los empleados que tiene una comisión de más del 5%. 
SELECT * from emp where nvl(comision,0)/SALARIO > 0.05;

DECLARE 
BEGIN
  update emp set SALARIO = SALARIO * 1.05 where nvl(comision,0)/SALARIO < 0.05;
end;

--7
DECLARE
  miFecha date := sysdate;
  v_cantidadmeses integer := 0;
BEGIN
  v_cantidadmeses := '&cantidadmeses';
  miFecha := add_months (miFecha, v_cantidadmeses);
  dbms_output.put_line ('La fecha hoy es: ' || miFecha);
end;

--8
DECLARE
  v_numerouno integer := 0;
  v_numerodos integer := 0;

BEGIN
  v_numerouno := '&numerouno';
  v_numerodos := '&numerodos';
  dbms_output.put_line ('El resto de la división es:  ' || mod(v_numerouno, v_numerodos));
end;

--9
DECLARE
  v_minombre varchar2(100);
BEGIN
  v_minombre := '&minombre';
  dbms_output.put_line ('El nombre es: ' || initcap(v_minombre));
end;

UNDEFINE minombre;


--10
SELECT * from emp;

DECLARE
  v_numerempleado emp.emp_no%TYPE;
BEGIN
  v_numerempleado := '&numerodeempleado';
  DELETE FROM emp WHERE emp_no = v_numerempleado;
end;

UNDEFINE numerodeempleado;
--  aquí van  ir las estructuras de control.
-- en el texto es en el que tienes que poner las comillas, en el caso de que sea un entero,entonces no hace falta tener las 
-- comillas, esto a la hora de pedir valores por parámetro, pero lo que pasa es que el usar las comillas para pedir datos, 
--funciona en los dos tipos de datos. 

declare 
  v_minumerouno integer;
BEGIN
  v_minumerouno := '&minumerouno';

  if (v_minumerouno > 0) then
    dbms_output.put_line ('El número es positivo ');
  elsif (v_minumerouno = 0) then  
    dbms_output.put_line ('El número es cero ');
  else
    dbms_output.put_line ('El número es negativo ');
  end if;
end;

UNDEFINE minumerouno;


declare 
  v_numero integer;
BEGIN
  v_numero := &numero;
  if (v_numero = 1) then
    dbms_output.put_line ('es primavera');
  elsif (v_numero = 2) then
    dbms_output.put_line ('es verano');
  ELSIF (v_numero = 3) then
    dbms_output.put_line ('es otoño');
  ELSIF (v_numero = 4) then
    dbms_output.put_line ('es invierno');
  else
    dbms_output.put_line ('no es una estación válida');
  end if;
end;

UNDEFINE numero;


---ejemplo número mayor.
--hacer


---pedir un número al usuario y decir si es par o impar. 

declare
    v_numero integer;
begin
    v_numero := &numero;
    
    if (mod (v_numero,2) = 0) then
        dbms_output.put_line (' es par. ');
    else
        dbms_output.put_line (' es impar.');
    end if;
end;

-- en el caso de que sea vocal indiarlo, en el caso de que no, es consonante. 

/
declare 
    v_micarater varchar2 (1);
begin
    v_micarater := '&micaracter';
    v_micarater := lower (v_micarater);
    if ((v_micarater = 'a') or (v_micarater = 'e') or (v_micarater = 'i') or (v_micarater = 'o') or (v_micarater = 'u'))  then
        dbms_output.put_line ('es vocal');
    else
        dbms_output.put_line (' es consonante.');
    end if;
end;
/



declare 
    v_minumerouno integer;
    v_minumerodos integer;
    v_minumerotres integer;
begin
    v_minumerouno := &minumerouno;
    v_minumerodos := &minumerodos;
    v_minumerotres := &minumerotres;
    if (v_minumerouno > v_minumerodos) and (v_minumerouno > v_minumerotres) then
        dbms_output.put_line ('elmayor es el primero');
    elsif (v_minumerodos > v_minumerouno) and (v_minumerodos > v_minumerotres) then
        dbms_output.put_line ('elmayor es el segundo');
    else
        dbms_output.put_line ('elmayor es el tercero');
    end if;    
    if (v_minumerouno < v_minumerodos) and (v_minumerouno < v_minumerotres) then
        dbms_output.put_line ('el menor es el primero');
    elsif (v_minumerodos < v_minumerouno) and (v_minumerodos < v_minumerotres) then
        dbms_output.put_line ('el menor es el segundo');
    else
        dbms_output.put_line ('el menor es el tercero');
    end if;
end;


declare 
    v_minumerouno integer;
    v_minumerodos integer;
    v_minumerotres integer;
    v_maximo integer;
    v_minimo integer;
    v_intermedio integer;
begin
    v_minumerouno := &minumerouno;
    v_minumerodos := &minumerodos;
    v_minumerotres := &minumerotres;
    if (v_minumerouno > v_minumerodos) and (v_minumerouno > v_minumerotres) then
        dbms_output.put_line ('elmayor es el primero');
        v_maximo := v_minumerouno;
    elsif (v_minumerodos > v_minumerouno) and (v_minumerodos > v_minumerotres) then
        dbms_output.put_line ('elmayor es el segundo');
        v_maximo := v_minumerodos;
    else
        dbms_output.put_line ('elmayor es el tercero');
        v_maximo := v_minumerotres;
    end if;    
    if (v_minumerouno < v_minumerodos) and (v_minumerouno < v_minumerotres) then
        dbms_output.put_line ('el menor es el primero');
        v_minimo := v_minumerouno;
    elsif (v_minumerodos < v_minumerouno) and (v_minumerodos < v_minumerotres) then
        dbms_output.put_line ('el menor es el segundo');
        v_minimo := v_minumerodos;
    else
        dbms_output.put_line ('el menor es el tercero');
        v_minimo := v_minumerotres;
    end if;
    if (v_maximo != v_minumerouno) and (v_minimo != v_minumerouno) then
        dbms_output.put_line ('el intermedio es el primero');
    elsif (v_maximo != v_minumerodos) and (v_minimo != v_minumerodos) then
        dbms_output.put_line ('el intermedio es el segundo');
    else
        dbms_output.put_line ('el intermedio es el terero');
    end if;
end;


--en el caso de que el mes sea enero, el mes sera el trece y le restaremos uno al año. Lo mismo para febrero. 

declare
    v_dia integer; v_mes integer; v_ano integer; v_anoauxiliaruno integer; v_anoauxiliardos integer;
    v_anoauxiliartres integer; v_auxiliar_sumas_cinco integer;
begin
    v_dia := '&dia'; v_mes := '&mes'; v_ano := '&ano';
    --paso1. 
    v_mes := (((v_mes+1)*3)/5);
    dbms_output.put_line (v_mes);
    --paso2. 
    v_anoauxiliaruno := trunc(v_ano/4);
    dbms_output.put_line (v_anoauxiliaruno);
    --paso3
    v_anoauxiliardos := trunc (v_ano/100);
    dbms_output.put_line (v_anoauxiliardos);
    --paso4 
    v_anoauxiliartres := trunc (v_ano/400);
    dbms_output.put_line (v_anoauxiliartres);
    --paso5.
    v_auxiliar_sumas_cinco := v_dia + (v_mes * 2) + v_ano + ;
    --paso6.
    --paso7.
    --paso8. 
end;


---  21/4/2025   comenzamos con bucles. 
--se va a mostrar la suma de los primeros 100 números. 
----  este ejemplo escon un break. 
declare 
    i integer;
    miSuma integer;
begin 
    i := 1;
    miSuma := 0;
    loop 
        miSuma := miSuma + i;
        i := i + 1;
        EXIT WHEN i > 100;
    end loop;
    dbms_output.put_line (miSuma);
end;

-- este ejemplo es con un while. 
declare 
    miSuma integer;
    i integer;
begin 
    i := 1;
    miSuma := 0;
    while i <= 100 loop 
        miSuma := miSuma + i;
        i := i + 1;
    end loop;
    dbms_output.put_line (miSuma);
end;

---blucle contador. 
declare 
    miSuma integer;
begin 
    miSuma := 0;
    for i in 1..100 loop
        miSuma := miSuma + i;        
    end loop;
    dbms_output.put_line (miSuma);
end;

-- etiquetas GO TO. 
--No puede haber otra etiqueta en el entorno actual con el mismo nombre.
--No se puede saltar al interior de un bucle
--La etiqueta debe preceder a un bloque o a un conjunto de órdenes ejecutables.
--No se puede saltar al interior de una orden IF
declare 
    miSuma integer;
begin 
    miSuma := 0;
    goto etiqueta;
    for i in 1..100 loop
        miSuma := miSuma + i;        
    end loop;
    <<etiqueta>>
    dbms_output.put_line (miSuma);
end;


---  uso del NULL 
declare 
    miSuma integer;
begin 
    miSuma := &suma;
    if (miSuma > 10) then 
        dbms_output.put_line ('es mayor de 10');
    else
        null;
    end if;
end;

--- mostrar los números desde 1 al 10. 
declare
    i integer;
begin 
    i := 1;
    while (i <= 10) loop
        dbms_output.put_line (i);
        i := i + 1;
    end loop;
end;
-- ahora con for. 
declare
begin 
    for i in 1..10 loop
        dbms_output.put_line (i);
    end loop;
end;

-- mostrar los números comprendidos entre el rango. 
--  si el número inicial es mayor, entonces que no lo haga y que lo indique. 

declare
    minumerocomienzo integer := 0;
    minumerofin integer := 0;
begin
    minumerocomienzo:= &numerocomienzo;
    minumerofin:= &numerofin;
    if (minumerocomienzo >= minumerofin) then 
        dbms_output.put_line (' el del inicial es mayor o igual al mayor. ');
    else
        for i in minumerocomienzo..minumerofin loop
            dbms_output.put_line (i);
        end loop;
    end if;
end;


--queremos un bucle pidiendo un inicio y un fin. Mostrar los números pares en este rango. 
declare
    minumerocomienzo integer := 0;
    minumerofin integer := 0;
begin
    minumerocomienzo:= &numerocomienzo;
    minumerofin:= &numerofin;
    if (minumerocomienzo >= minumerofin) then 
        dbms_output.put_line (' el del inicial es mayor o igual al mayor. ');
    else
        for i in minumerocomienzo..minumerofin loop
            if (mod (i,2) = 0) then 
                dbms_output.put_line (i);
            end if;
        end loop;
    end if;
end;

---ún número siempre llegará a ser 1 siguiendo unas instrucciones. 
-- si el número es par, se divide entre dos. 
-- y si es impar, se multiplica por tres y se suma uno. 
declare
    minumero integer;
begin
    dbms_output.put_line ('comienza');
    minumero := &numero;
    while (minumero > 1) loop
        if (mod (minumero, 2) = 0) then
            minumero := minumero / 2;
        else
            minumero := (minumero * 3) + 1; 
        end if;
        dbms_output.put_line (minumero);
    end loop;
end;

----mostar la tabla de multiplicar dado un número. 

declare 
    miNumero integer;
begin 
    miNumero := &numero;
    for i in 1..10 loop
        dbms_output.put_line (miNumero ||'*' || i || '=' || miNumero*i);
    end loop;
end;

-- un progtama que pedirá un texto, de tal forma que hay que recorrer cada letra. 

declare 
    miTexto varchar2 (50);
begin 
    miTexto := '&texto';
    for i in 1..length(miTexto) loop
        --- recordar que esto es para sacar el caracter correspondiente. el primero es el índice. 
        -- y lo segundo es la cantidad de caracteres que se extraen de la cadena. 
        dbms_output.put_line (substr(miTexto, i, 1));
    end loop;
end;


-- un programa donde el usuario pondra un texto númerico. 
-- y se tiene que mostrar la suma de todos los catacteres númericos. 
declare 
    miTexto varchar2 (50);
    miTotal integer := 0;
begin 
    miTexto := '&texto';
    for i in 1..length(miTexto) loop
        miTotal := miTotal +  to_number (substr(miTexto, i, 1));
    end loop;
    dbms_output.put_line (miTotal);
end;

--22/4 
--consultas de acción. 
--  insertar 5 departamentos en un bloque plsql dinámico. 
select * from dept;
declare 
    v_nombre dept.dnombre%type;
    v_loc dept.loc%type;
begin
    ---  un bucle para insertar 5 departamentos. 
    for i in 1..5 loop
        v_nombre := 'departamento' || i;
        v_loc := 'localidad' || i;
        insert into dept values (i, v_nombre,v_loc);    
    end loop;
    dbms_output.put_line ('fin del programa.');
end;

select * from dept;

declare 
    v_nombre dept.dnombre%type;
    v_loc dept.loc%type;
begin
    ---  un bucle para insertar 5 departamentos. 
    for i in 1..5 loop
        v_nombre := 'departamento' || i;
        v_loc := 'localidad' || i;
        insert into dept values ((select max (dept_no) + 1 from dept), v_nombre,v_loc);    
    end loop;
    dbms_output.put_line ('fin del programa.');
end;

--- realizar un bloque que pedirá un número al usuario y mostrará el departamento con dicho número. 
select * from dept;
declare 
    v_id integer;
    miVariableFila dept%rowtype;
begin
    v_id := &id;
    select * into miVariableFila from dept where dept_no = v_id;
    dbms_output.put_line (miVariableFila.dnombre);
    dbms_output.put_line ('Fin de la ejecución. ');
end;


---implicito. sólo puede devolver una fila. 
-- recuperar el oficio del empleado. REY. 
declare
    v_oficio emp.oficio%type;
begin
    select oficio into v_oficio from emp where  upper(apellido) = 'REY';
    dbms_output.put_line (v_oficio);
end;
--explicito. 
-- puede devolver más de una fila y es necesario declararlo. 
--mostrar el apellido y el salario de todos los empleados. 
select * from emp;
declare
    v_apellido emp.apellido%type;
    v_sal emp.salario%type;
    -- declaramos el cursor con un consulta. 
    -- la consulta debe de tener los mismso detos para el select. 
    cursor cursoremp is select APELLIDO, SALARIO from emp;
begin
    --abrir el cursor. 
    open cursoremp;
    --bucle infinito. 
    loop
        -- extraemos los datos del cursor. 
        fetch cursoremp into v_apellido, v_sal;
        if (cursoremp%isopen) then
            dbms_output.put_line ('el cursor está abierto. ');
        else
            dbms_output.put_line ('el cursor está cerrado. ');
        end if;
        -- en not found salta cuando no se ha recuperado una fila de la consulta. 
        exit when cursoremp%notfound;
        --dibujamos las variables. 
        dbms_output.put_line (v_apellido);
        dbms_output.put_line (v_sal);
    end loop;
end;
 
 
--sql%rowcount también es para consultas de acción. 
--increemntar en 1 el salario  de los emleados ddel departamento 10. 
-- mostrar el númers de los empeados modificados. 
select * from emp;
declare
begin
    update emp set salario = salario + 1 where dept_no = 10;
    dbms_output.put_line ('emplados modificados: ');
    dbms_output.put_line (sql%rowcount);
end;

---incrementar en 10.000 al empleado que menos cobre en la empresa. 
select * from emp;
select min(salario) from emp; 

declare
    v_salariominimo emp.salario%type;
begin
    select min(salario) into v_salariominimo from emp;
    dbms_output.put_line (v_salariominimo);
    update emp set salario = salario + 10000 where salario =  v_salariominimo;
    dbms_output.put_line ('se ha incrementado el salario a esta cantidad de empleados:  ');
    dbms_output.put_line (sql%rowcount);
    dbms_output.put_line ('fin del prog.');
end;

-- se pide el numero, nombre y loc de un departamento. 
-- en el caso de que el departamento exista,modificamos nombre y localidad 
-- en el caso de que no exista lo insertamos. 
select * from dept;
declare
    v_dept_no dept.dept_no%type;
    v_dnombre dept.dnombre%type;
    v_loc dept.loc%type;
    v_dept_noleido emp.dept_no%type;
begin
    dbms_output.put_line ('comeinza');
    v_dept_no := &dept_no;
    v_dnombre := '&dnombre';
    v_loc := '&loc';
    select dept_no into v_dept_noleido from dept where dept_no = v_dept_no;
    dbms_output.put_line (v_dept_noleido);
    
    
    --- cuidado porque en este caso nunca va a llegar al primer if, ya que direcamente en el caso de que no se haya recuperado ningún
    -- valor, entonces va a saltar directamente a la excaption. 
    if (v_dept_noleido is null) then 
        dbms_output.put_line ('no existe ese deartamento, esto no debería de ejecutarse nunca. ');
    else
        dbms_output.put_line ('si que existe ese dept');
    end if;
    
    exception
        when no_data_found then
            dbms_output.put_line ('el error ha sido not data found, es decir, no se ha encontado ningún registro en la consulta con esos parámetros. ');
end;






----- ejercicio para ver que el IS NULL no fiunciona ni con  XXX%type ni con XXX%rowtype. 
declare 
    miDept_no  dept.dept_no%type;
    miFilaDept  dept%rowtype;
begin  
    dbms_output.put_line ('comienzaxx. ');
    miDept_no := &parametroa;
    
    select * into miFilaDept from dept where dept_no = miDept_no;
    dbms_output.put_line ('Fila leida:  ' || miFilaDept.dept_no || miFilaDept.dnombre || miFilaDept.loc);
    
    --- esto de AQUI no funciona. 
    --if (miFilaDept is null) then
    --    dbms_output.put_line ('el valor consultado es nulo. ');
    --else
    --    dbms_output.put_line ('Se ha encontrado un valor. ');
    --end if;
    
    if (miFilaDept.dept_no is null) then 
        dbms_output.put_line ('dentro de la fila, el valor dept_no es nulo, es decir, no se ha devuelto nada de la consulta. ');
    else
        dbms_output.put_line ('la consulta con dept_no tiene un valor. ');
    end if;
    
    exception 
        when no_data_found then
            dbms_output.put_line ('el error ha sido not data found, es decir, no se ha encontado ningún registro en la consulta con esos parámetros. ');
    dbms_output.put_line ('fin del programa... ');
end;



select * from dept;
-- hasta que no se hace el OPEN, no se ejecuta la consulta. 
declare
    v_dept_no dept.dept_no%type; v_dnombre dept.dnombre%type; v_loc dept.loc%type;        
    cursor cursoremp is select dept_no from dept;
    v_dept_norecuperado dept.dept_no%type;
    v_bandera boolean := false;
begin
    dbms_output.put_line ('comeinza');
    open cursoremp;
    v_dept_no := &dept_no;
    v_dnombre := '&dnombre';
    v_loc := '&loc';
    loop 
        fetch cursoremp into v_dept_norecuperado;
        if (v_dept_norecuperado = v_dept_no) then
            v_bandera := true;
        end if;
        exit when cursoremp%notfound;
    end loop;
    if (v_bandera = true) then
        dbms_output.put_line (' en este caso se actualizaaaa'); 
        update dept set dnombre = v_dnombre, loc = v_loc where dept_no = v_dept_no;
    else
        dbms_output.put_line (' en este caso se crea una nueva fila. ');
        insert into dept values (v_dept_no, v_dnombre, v_loc);
    end if;
    close cursoremp;
end;

--- otra form de hacerlo. 
select * from dept;
declare
    v_dept_no dept.dept_no%type; v_dnombre dept.dnombre%type; v_loc dept.loc%type;        
    cursor cursoremp is select dept_no from dept where dept_no = v_dept_no;
    v_dept_norecuperado dept.dept_no%type;
begin
    dbms_output.put_line ('comeinza');
    v_dept_no := &dept_no;
    v_dnombre := '&dnombre';
    v_loc := '&loc';
    open cursoremp;
    
    fetch cursoremp into v_dept_norecuperado;
    if (v_dept_norecuperado = v_dept_no) then
        update dept set dnombre = v_dnombre, loc = v_loc where dept_no = v_dept_no;
    else
        insert into dept values (v_dept_no, v_dnombre, v_loc);
    end if;
    close cursoremp;
end;

--código que modifique el salario del empleado arroyo. 
-- si es epplaedo  cobra más de 250.000  le bajamos el sueldo en 10.000 y en el caso contrario lesubimos a 10.000
select * from emp;
SELECT salario from emp where apellido = 'arroyo';
declare
    miCursorSalario emp.salario%type;
begin
    select salario into miCursorSalario from emp where apellido = 'arroyo';
    dbms_output.put_line (miCursorSalario);
end;

-- en el implicito, en el caso de que no encuentre nada, te saca "not data found" y si salen más de uno entonces te sale "to many rounds".
select * from emp;
declare
    cursor cursoremp is select SALARIO from emp where apellido = ('arroyo');
    v_apellido emp.apellido%type;
    v_salario_recuperado emp.salario%type;
begin
    open cursoremp;
    fetch cursoremp into v_salario_recuperado;
    
    if (v_salario_recuperado > 250000) then 
        dbms_output.put_line ('es mas de  250000');
        update emp set salario = salario - 10000 where apellido  = 'arroyo';
    else
        dbms_output.put_line (' es menos de 250000');
        update emp set salario = salario + 10000 where apellido  = 'arroyo';
    end if;
end;

--23/4/2025
--incrementar el salario de los doctores de la PAZ. si supera 1.000.000  bajamos a los que sean 10.000 y para los que cobren menos de un millón
-- entonces subirles 10.000. 
select * from hospital;
select * from doctor;
select * from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod;
select * from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod where hospital.nombre = 'la paz';
select salario from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod where hospital.nombre = 'la paz';

/
declare
    cursor cursordoctorhospital is select salario, doctor_no from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod where hospital.nombre = 'la paz';
    cursor cursordoctorhospital2 is select salario, doctor_no from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod where hospital.nombre = 'la paz';
    v_salario_recuperado doctor.salario%type; v_doctor_no_recuperado doctor.doctor_no%type; v_salario_total doctor.salario%type;
begin
    dbms_output.put_line ('comienza');
    open cursordoctorhospital;
    loop 
        fetch cursordoctorhospital into v_salario_recuperado, v_doctor_no_recuperado;
        exit when cursordoctorhospital%notfound;
        v_salario_total := v_salario_total + v_salario_recuperado;
    end loop;
    
    if (v_salario_total > 1000000) then 
        dbms_output.put_line (' el salario es más de un millon. ');
        open cursordoctorhospital2;
        loop 
            fetch cursordoctorhospital2 into v_salario_recuperado, v_doctor_no_recuperado;
            exit when cursordoctorhospital2%notfound;
            update doctor set salario = salario - 10000 where doctor_no = v_doctor_no_recuperado;
        end loop;
    else
        dbms_output.put_line (' los salarios son menos del millo. ');
        open cursordoctorhospital2;
        loop 
            fetch cursordoctorhospital2 into v_salario_recuperado, v_doctor_no_recuperado;
            exit when cursordoctorhospital2%notfound;
            update doctor set salario = salario + 10000 where doctor_no = v_doctor_no_recuperado;
        end loop;
    end if;
end;
/


---las subconsultas hay que evitarlas. porque crean dependencias. 

---miVariableFilaPrueba doctor%rowtype;

describe dept;

declare
    --v_id number;
    v_id dept.dept_no%type;
    --miVariableFila dept%rowtype;
    
begin
    dbms_output.put_line ('asdf');
    dbms_output.put_line (v_id);

end;

declare 
    v_fila dept%rowtype;
    cursor cursorDepartamento is select * from dept;
begin
    open cursorDepartamento;
    loop
        fetch cursorDepartamento into v_fila;
        exit when cursorDepartamento%notfound;
        dbms_output.put_line (v_fila.dept_no);
        dbms_output.put_line (v_fila.dnombre);
    end  loop; 
    close cursorDepartamento;
end;

-- realizar un cursor para mostrar el apellido, salario y oficio de los empleados. 
select * from emp;
declare 
    cursor miCursorDoctor is select apellido, salario, oficio from emp;
begin

end;



declare 
    v number;
begin
    if v < 11 then
        dbms_output.put_line ('menor');
    else
        dbms_output.put_line ('myor');
    end if;
end;


---  24/4/2025  control de exceptions. 
--no_data_found
--zero_divide
declare
    miException exception;
    miNumeroUno number := 444;
    miNumeroDos number := 0;
    miNumeroTres number;
begin
    dbms_output.put_line ('Comienza el programa. ');
    miNumeroTres := miNumeroUno / miNumeroDos;
    -- esto no se está ejecutando  (1/2). 
    dbms_output.put_line (miNumeroTres);
    dbms_output.put_line ('fin del programa. ');
    -- esto no se está ejecutando (2/2). 
    exception
        when zero_divide then
            dbms_output.put_line ('ha saltado la exception  de dividir por cero. ');
end;

--definir una exception.  En el momento en el que los empleados tengan una comisón de Cero, entonces devolver exception. 
-- habra una tabla en la que tenfremos a los que tenga una comision mayor de cero. 
select * from emp;
select   apellido, comision from emp order by comision desc;

create table emp_comision  (apellido varchar2(50), comision number(9));

declare
    cursor miCursor is select  apellido, comision from emp order by comision desc;    
    miException exception;
begin
    dbms_output.put_line ('comienza');
    for v_record in miCursor loop 
        insert into emp_comision values (v_record.apellido, v_record.comision);
        if (v_record.comision = 0) then
            --dbms_output.put_line ('comisión mayor que cero, el apellido: ' || v_record.apellido || ' la comision: ' || v_record.comision);
            raise miException;
        end if;
    end loop;
    
    exception
        when miException then
            dbms_output.put_line ('esta es la excption de comision Cero. ');
end;

select * from emp_comision;
select * from dept;
describe dept;


-- el pragma, es para que se pueda personaliar los mensajes que devueven las exceptions (ya que siempre tienen algo por defecto). 
declare
    miExceptionNulos exception;
    pragma exception_init (miExceptionNulos, -1400);
begin
    dbms_output.put_line ('comienza');
    insert into dept values (null, 'departe', 'pragma');
    
    exception
        when miExceptionNulos then
            dbms_output.put_line ('No se puede insertar NULL en la tabla. ');
end;

select * from dept;
declare 
    v_id number;
begin
    dbms_output.put_line ('comienza');
    --select dept_no into v_id from dept where dnombre = 'VENTAS';
    select dept_no into v_id from dept where dnombre = 'VEasdfNTAS';
    --select dept_no into v_id from dept;
    exception 
        when TOO_MANY_ROWS then
            dbms_output.put_line ('demasiadas filas en el cursor. ');
        when others then
            dbms_output.put_line ('algún error está ocurriendo... ');
            dbms_output.put_line (to_char (SQLCODE));
            dbms_output.put_line (SQLERRM);
end;



declare 
    v_id number;
begin
    dbms_output.put_line ('comienza');
    RAISE_APPLICATION_ERROR (-20400, ' esto es un error de aplicacion');
    dbms_output.put_line ('acaba');
end;

--en los procedieitos no se puede hacer  DROP. 
--  sp es por Store Procedore. 
select * from dept;
create or replace procedure storeProcedureMiProcedimiento 
as
begin 
    dbms_output.put_line ('comienza12');
end;

-- ahora queda llamarlo. 
begin
    storeProcedureMiProcedimiento;
end;
execute storeProcedureMiProcedimiento;

---procedieiento con bloque PLSQL. 
declare 
    v_numero number := 444;
begin
    if (v_numero > 0) then
        dbms_output.put_line ('positivo');
    else
        dbms_output.put_line ('negativo');
    end if;
end;

create or replace procedure storeProcedureMiProcedimientoPrueba
as
begin
    declare 
        v_numero number := 444;
    begin
        if (v_numero > 0) then
            dbms_output.put_line ('positivo');
        else
            dbms_output.put_line ('negativo');
        end if;
    end;
end;

begin
    storeProcedureMiProcedimientoPrueba;
end;


--sintaaxis1. tenemos otras sintaxis para tener variables dentro de un PROC. No se usa la palabra declare. 
create or replace procedure miProcedimientoEjemplo
as 
    v_numero number := -222;
begin
    if (v_numero > 0) then
        dbms_output.put_line ('positivo');
    else
        dbms_output.put_line ('negativo');
    end if;
end;

---show_errors


create or replace procedure miProcedimientoEjemploDos (parametro_uno number, parametro_dos number)
as
    v_suma number;
begin
    dbms_output.put_line ('comeinza miProcedimientoEjemploDos');
    v_suma := parametro_uno + parametro_dos;
    dbms_output.put_line (v_suma);
end;

BEGIN
    miProcedimientoEjemploDos(5, 10);
END;

create or replace procedure miProcedimientoEjemploTres (parametro_uno number, parametro_dos number)
as
begin
    declare 
        v_division number;
    begin
        v_suma := parametro_uno / parametro_dos;
        dbms_output.put_line (v_division);
        exception 
            when ZERO_DIVIDE then
                dbms_output.put_line ('miProcedimientoEjemploTres()--- INNER.  error se ha dividido por cero. o ')
            
    end;
    dbms_output.put_line ('comeinza miProcedimientoEjemploTres');
    exception 
        when ZERO_DIVIDE then
            dbms_output.put_line ('miProcedimientoEjemploTres()--- OUTER.  error se ha dividido por cero. o ');
end;

begin
    miProcedimientoEjemploTres (3, 0);
end;

--30/4. 
--procedimiento para insertar un departamento. 
create or replace procedure sp_insertaDepartamento (p_int integer, p_nombre varchar2, p_localidad varchar2)
as
begin
    dbms_output.put_line ('sp_insertaDepartamento ()--- arranca el procedmieito.');
end;

create or replace procedure sp_insertaDepartamento (p_int dept.dept_no%type, p_nombre dept.dnombre%type, p_localidad dept.loc%type)
as
begin
    --nomalnete dentro de los procedimientos de accion (los que modifican la BBDD) se incluye un commit. 
    dbms_output.put_line ('sp_insertaDepartamento ()--- arranca el procedmieito.');
    insert into dept values (p_int, p_nombre, p_localidad);
    commit;
end;



create or replace procedure sp_insertaDepartamento (p_int dept.dept_no%type, p_nombre dept.dnombre%type, p_localidad dept.loc%type)
as
    v_max_id dept.dept_no%type;
begin
    --realizamos el cursor implicito para biuscar el MAX id. 
    select max (dept_no)+1 into v_max_id from dept;

    --nomalnete dentro de los procedimientos de accion (los que modifican la BBDD) se incluye un commit. 
    dbms_output.put_line ('sp_insertaDepartamento ()--- arranca el procedmieito.');
    dbms_output.put_line (v_max_id);
    insert into dept values (v_max_id, p_nombre, p_localidad);
    commit;
end;

create or replace procedure sp_insertaDepartamento (p_int dept.dept_no%type, p_nombre dept.dnombre%type, p_localidad dept.loc%type)
as
    v_max_id dept.dept_no%type;
begin
    --realizamos el cursor implicito para biuscar el MAX id. 
    select max (dept_no)+1 into v_max_id from dept;

    --nomalnete dentro de los procedimientos de accion (los que modifican la BBDD) se incluye un commit. 
    dbms_output.put_line ('sp_insertaDepartamento ()--- arranca el procedmieito.');
    dbms_output.put_line (v_max_id);
    insert into dept values (v_max_id, p_nombre, p_localidad);
    commit;
    
    exception 
        when no_data_found then
            dbms_output.put_line ('sp_insertaDepartamento () --- no existen datos.');
            rollback;
end;


begin
    sp_insertaDepartamento (11, '11', '11');
end;

select * from dept;
rollback;


-- realizar un proc pra incrementar el salario por el oficio. 
-- hay que enviar el oficio y el incremento. 
select * from emp;

create or replace procedure sp_modificarSalario (p_oficio emp.oficio%type, p_salario emp.salario%type)
as
begin
    dbms_output.put_line ('sp_modificarSalario () --- ' || p_oficio || '---' ||  p_salario);
    update emp set salario  = salario +  p_salario where upper(oficio) = upper(p_oficio);
end;

begin
    sp_modificarSalario ('vendedor', 3000);
end;


-- se va a hacer los mismo con doctor.  Se necesita insertar un doctor con todos sus datos. 
-- se debe recuperar id del docotor dentro del procedure. 
select * from doctor;
describe doctor;
select * from plantilla;


create or replace procedure sp_insertaDoctorImprimirID (p_hospital_cod doctor.hospital_cod%type, p_apellido doctor.apellido%type, p_especialidad doctor.especialidad%type, p_salario doctor.salario%type)
as
    v_max_id number;
begin
    --realizamos el cursor implicito para biuscar el MAX id. 
    select max (doctor_no)+1 into v_max_id from doctor;

    --nomalnete dentro de los procedimientos de accion (los que modifican la BBDD) se incluye un commit. 
    dbms_output.put_line ('sp_insertaDoctorImprimirID ()--- arranca el procedmieito.');
    dbms_output.put_line (v_max_id);
    insert into doctor values (p_hospital_cod, v_max_id, p_apellido, p_especialidad, p_salario);
    commit;
    dbms_output.put_line (SQL%rowcount);    
end;

--en este ejercicio se va a hacer los mismo que el anterior, pero enviamos el nombre del hospital en lugar del id del hospital. 
-- controlamos en el caso de que no exista el nombre del hospital enviado. 

select * from doctor;
select * from hospital;

create or replace procedure sp_insertaDoctorImprimirID (p_hospital_nombre hospital.nombre%type, p_apellido doctor.apellido%type, p_especialidad doctor.especialidad%type, p_salario doctor.salario%type)
as
    v_max_id number;
    v_hospital_cod number;
begin
    dbms_output.put_line ('sp_insertaDoctorImprimirID ()--- arranca el procedmieito.');
    --realizamos el cursor implicito para biuscar el MAX id. 
    select max (doctor_no)+1 into v_max_id from doctor;
    --averiguo el id del hostital el que voy a insertar. 
    select hospital_cod into v_hospital_cod from hospital where nombre = p_hospital_nombre;

    
    dbms_output.put_line (v_max_id);
    dbms_output.put_line (v_hospital_cod);
    insert into doctor values (v_hospital_cod, v_max_id, p_apellido, p_especialidad, p_salario);
    dbms_output.put_line (' este ee s el row countt:  ' || SQL%rowcount); 
    exception 
        when no_data_found then 
            dbms_output.put_line ('sp_insertaDoctorImprimirID ()--- no se ha encontrado ese nombre de hospital. ');
    
end;


begin
    sp_insertaDoctorImprimirID ('la paz', 'serraono', 'cirujano', 4000);
end;


-- procedimiento para mostrar los empleados de un determinado número de departamentos. 
select * from emp;
create or replace procedure sp_mostrarEmpleadosDelDepartamento (p_deptno emp.dept_no%type)
as 
    cursor cursor_emp is select * from emp where dept_no = p_deptno;
begin
    dbms_output.put_line ('sp_mostrarEmpleadosDelDepartamento()--- empieza');
    for i in cursor_emp loop 
        dbms_output.put_line ('este es el apelido: ' || i.apellido || ' este es el oficio: ' || i.oficio);
    end loop;
end;

begin
    sp_mostrarEmpleadosDelDepartamento (10);
end;


-- nombre y departamento. 
--procedimiento para enviar el nombre del departamento y devolver el número del ese departameto. 
select * from dept;
create or replace procedure sp_numeroDepartamento (p_nombre dept.dnombre%type, p_out_idDepartmento out dept.dept_no%type)
as
    v_idDepartamento dept.dept_no%type;
begin
    dbms_output.put_line ('sp_numeroDepartamento()--- comeinza');
    select dept_no into v_idDepartamento from dept where  upper (dnombre) = upper (p_nombre); 
    p_out_idDepartmento := v_idDepartamento;
    dbms_output.put_line ('el numero de departamento es:  ' || v_idDepartamento);
end;

declare 
    v number;
begin
    sp_numeroDepartamento('ventas', v);
    dbms_output.put_line ('llamada al procedimeito con OUT:   ' || v);
end;


--- necesito un pric para incrementar en 1 el salario de los empleados de un deaprtamento. 
-- enviaremos al procedimiento el nombre del departamento. 

create or replace procedure sp_incrementar_salario_departamento (p_nombre dept.dnombre%type)
as
    v_num dept.dept_no%type;
begin
    dbms_output.put_line ('sp_incrementar_salario_departamento()--');
    --recuperamos el id del departamento  partir del nombre. 
    sp_numeroDepartamento (p_nombre, v_num);
    dbms_output.put_line ('el numero de departamento es:  ' || v_num);
    update emp set salario = salario + 1 where dept_no = v_num;
    dbms_output.put_line ('salarios modificados: ' || v_num);
end;

begin
    sp_incrementar_salario_departamento ('ventas');
end;


--05/05/2025.
---funciones
create or replace function f_sumar_numeros (p1 number, p2 number) return number
as
    v_suma number;
begin
    v_suma := p1 + p2;
    return v_suma;
end;

create or replace function f_sumar_numeros_2 (p1 number, p2 number) return number
as
    v_suma number;
begin
    v_suma := nvl(p1,0) + nvl(p2,0);
    return v_suma;
end;


declare 
    v_resultado number;
    v_resultado_2 number;
begin
    v_resultado := f_sumar_numeros (22,66);
    v_resultado_2 := f_sumar_numeros_2 (null, null);
    dbms_output.put_line  ('el resultado de la suma es:    ' || v_resultado);
    dbms_output.put_line  ('el resultado de la suma es:    ' || v_resultado_2);
end;

select f_sumar_numeros (33,33) from dual;


---funcion para saber el número de personas de un oficio. 
create or replace function f_numero_personas_oficio (p_oficio emp.oficio%type) return number
as 
    v_versonas int;
begin
    select count (emp_no) into v_versonas from emp where upper (oficio) = upper (p_oficio);
    return v_versonas;
end;

select * from emp;


select f_numero_personas_oficio ('director') from dual;
-- realizar uan funcion que devuelva el mayor de dos numeros. 

create or replace  function f_cual_es_mayor (p1 number, p2 number) return number
as
begin
    if (p1 > p2) then 
        return p1;
    else
        return p2;
    end if;
end;

select f_cual_es_mayor (5,9) from dual;

--realizar el mayor para devolver tres numeros, pero sin utilizar IF. 
create or replace function f_cual_es_mayor_2 (p1 number, p2 number, p3 number) return number
as 
begin
-- aqui el código por favor. 
    return GREATEST (p1,p2,p3);
end;


select f_cual_es_mayor_2 (4,5,6) from dual;


create or replace function sumar_iva (prametroPrecio number, parametroIva number := 1.18) return number
as
begin
    return prametroPrecio * parametroIva;
end;

select sumar_iva (100, 1.21) from dual;

--- aqui vamos a las vistas 
-- quiero una vista para tener todos los datos de los empleados SIN EL SLARIO. 
create or replace view vistaEmpleados
as
    select emp_no, apellido from emp;
    
select * from  vistaEmpleados;


--las vitas simlican las consultas. --
--
--
--
--
--
--
--

create or replace view vistaEmpleadosDepartamentos
as
    select emp.apellido, emp.emp_no, emp.oficio , dept.dnombre, dept.loc from emp  inner join dept on emp.dept_no = dept.dept_no;

select * from vistaEmpleadosDepartamentos where loc='CADIZ';

select * from dept;
select * from emp;

-- de esta forma es como se ve que vistas tiene este usuario, ademas muestra las consultas que ejecuta esa vistaa. 
select * from user_views;


--vamos a modificar el salario de los emleados ANALISTA.
--- ver como las vista no modifican los datos de las tblas. 
select * from emp;
select * from dept;
update emp set  salario = salario + 1 where oficio = 'ANALISTA';

-- eliminamos al empleados con id = 7917. 
delete from vistaEmpleadosDepartamentos where emp_no = 7917;

--- ahora vamos a insertar. 
insert into vistaEmpleadosDepartamentos values ('perez', 444, 'limpiador','VENTAS', 'MADRID');


--modiicar el slsario de los emelaados de MADID
--- en  esta parte sí que me esta dando error el moodifcar el salario, en principio al profesor sí que le dejo mofificar el salario. 
--- EXPLICACION.  mirar los apuntes del profesor, porque el devuelve en la vista el salario y por eso sí que de dejamodificarlo. 
update vistaEmpleadosDepartamentos set salario = salario + 1 where loc='MADRID';
select * from vistaEmpleadosDepartamentos where loc='MADRID';

--  (en el update o insert) en el caso de que la consullta afecte  a dos tablas no deja. 
-- en el caso del delete si que borra si que se ejecuta la vista. 


-- with check option.  veriifica que la vista no se quede inutil. 
-- en el caso de que vaya a moificar el whwre de una vista, que no le ddeje. 
create or replace view V_VENDEDORES 
as
    select emp_no, apellido, oficio, salario, dept_no  from emp where oficio = 'VENDEDOR' with check option;
--vamos a mofificar el salario de los vendedores. 

update V_VENDEDORES set salario = salario + 1;
update V_VENDEDORES set OFICIO = 'VENDIDOS';
select * from V_VENDEDORES;

rollback;


-- examenn teoria 10 preguntas tipo TEST. 

--- mirar examtopics que hay examnes de certificacion de PLSQL. 
create or replace procedure procedureNumeroNarcisista (parametroNumero varchar2)
as
    auxParametroNumero number;
    auxNumero number;
    miNumeroTotal number; 
begin
    dbms_output.put_line ('procedureNumeroNarcisista() --- ');
    auxParametroNumero := to_number (parametroNumero);
    for i in 1..length (parametroNumero) loop
        dbms_output.put_line (substr (parametroNumero, i, 1));
        auxNumero := to_number (substr (parametroNumero, i, 1));
        auxNumero := auxNumero + power (substr (parametroNumero, i, 1), lenth)
    end loop;
end;

begin
    procedureNumeroNarcisista ('125');
end;

--6/5/2025. 
-- En este día se dan paquetes. 
--- organizar o declaraciion de elementos. 
--- declaracion de variables. Record. 
create or replace package paquetePrueba
as 
    procedure mostrarMensaje;
end paquetePrueba;

create or replace package body paquetePrueba
as
    procedure mostrarMensaje
    as 
    begin
        dbms_output.put_line (' saludo desde el procedimiento almacenado dentro de un packete.');
    end;
end paquetePrueba;

begin
    paquetePrueba.mostrarMensaje;
end;

create or replace package paquetedelete
as
    procedure eliminaremp(p_empno emp.emp_no%type);
    procedure eliminardept(p_deptno dept.dept_no%type);
    procedure eliminardoctor(p_doctorno doctor.doctor_no%type);
    procedure eliminarenfermo(p_inscripcion enfermo.inscripcion%type);
end paquetedelete;

create or replace package body paquetedelete
as
    procedure eliminaremp(p_empno emp.emp_no%type)
    as
    begin
        delete from emp where emp_no = p_empno;
    end;
    procedure eliminardept(p_deptno dept.dept_no%type)
    as
    begin
        delete from dept where dept_no = p_deptno;
    end;
    procedure eliminardoctor(p_doctorno doctor.doctor_no%type)
    as
    begin
        delete from doctor where doctor_no = p_doctorno;
    end;
    procedure eliminarenfermo(p_inscripcion enfermo.inscripcion%type)
    as
    begin
        delete from enfermo where inscripcion = p_inscripcion;
    end;
end paquetedelete;
--llamada
begin
  paquetedelete.eliminaremp(7888);
end;

select * from emp;
delete from emp where emp_no = 7888;

--- de esta forma es de la que se borra. 
DROP PACKAGE paquetedelete;

create or replace package paquetesalariosemp
as
    function maximosalario return int;
    function minimosalario return int;
    function diferencia return int;
    procedure llamadaprueba;
end paquetesalariosemp;

create or replace package body paquetesalariosemp
as
  function maximosalario return int
  as
    v_maximo int;
  begin
    select max(salario) into v_maximo
    from emp;
    return v_maximo;
  end;
  function minimosalario return int
  as
    v_minimo int;
  begin
    select min(salario) into v_minimo
    from emp;
    return v_minimo;
  end;
  function diferencia return int
  as
    v_diferencia int;
  begin
    v_diferencia := maximosalario - minimosalario;
    return v_diferencia;
  end;
  procedure llamadaprueba
  as
  begin
    dbms_output.put_line('Máximo: ' || maximosalario);
    dbms_output.put_line('Mínimo: ' || minimosalario);
    dbms_output.put_line('Diferencia: ' || diferencia);
  end;
end paquetesalariosemp;
--LLAMADA FUNCIONES



select paquetesalariosemp.maximosalario as maximo
, paquetesalariosemp.minimosalario as minimo
, paquetesalariosemp.diferencia as diferencia from dual;
--LLAMADA PROCEDIMIENTO


begin
  paquetesalariosemp.llamadaprueba;
end;


--un paquete para realuzar update, insert y delete. 
-- todo esto dobre dept. 
select * from dept;
create or replace package pk_departamentos
as
    procedure insertar (p1 dept.dept_no%type, p2 dept.dnombre%type, p3 dept.loc%type);
    procedure actualizar (p0 dept.dept_no%type,p1 dept.dept_no%type, p2 dept.dnombre%type, p3 dept.loc%type);
    procedure eliminiar (p1 dept.dept_no%type);
end pk_departamentos;


create or replace package body pk_departamentos
as
    procedure insertar (p1 dept.dept_no%type, p2 dept.dnombre%type, p3 dept.loc%type)
    as
    begin
        dbms_output.put_line ('se insertado');
        insert into dept values (p1, p2, p3);
    end;
    
    procedure actualizar (p0 dept.dept_no%type, p1 dept.dept_no%type, p2 dept.dnombre%type, p3 dept.loc%type)
    as
    begin
        dbms_output.put_line ('se ha actualizado. ');
        update dept set dept_no = p1, dnombre = p2, loc = p3 where dept_no = p0;
    end;
    
    procedure eliminiar (p1 dept.dept_no%type)
    as
    begin
        dbms_output.put_line ('se elimina. ');
        delete from dept where dept_no = p1;
    end;
end pk_departamentos;


begin
    --pk_departamentos.insertar (101, 'ventas2', 'pamplona');
    --pk_departamentos.actualizar (10, 333, 'ventas2', 'pamplona');
    pk_departamentos.eliminiar (100);
end;

-- se pide una funcion que devuelva el apellido , el trabajo el salario y el lugar de trabajo de 
-- todas las personas de la BBDD. de las tablas dept y hospital 
--1) el select 
--2) ppnerlo en una vista. 
--3) paquete con dos procedimeintos. 
--3A) procedimitnro para devolver todos los datos en un cursor. 
--3B) procedimiento para devolver todos los datos en un cursor por salario. 
select * from emp;
select apellido, oficio, salario  from emp; 
select emp.apellido, emp.oficio, emp.salario, dept.loc  from emp inner join dept on emp.dept_no = dept.dept_no; 
select * from plantilla;
select apellido, funcion, salario from plantilla;
select plantilla.apellido, plantilla.funcion, plantilla.salario, hospital.direccion from plantilla inner join hospital on plantilla.hospital_cod = hospital.hospital_cod;
select * from doctor;
select apellido, especialidad, salario from doctor;
select doctor.apellido, doctor.especialidad, doctor.salario, hospital.direccion from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod;

select emp.apellido, emp.oficio, emp.salario, dept.loc  from emp inner join dept on emp.dept_no = dept.dept_no
union
select plantilla.apellido, plantilla.funcion, plantilla.salario, hospital.direccion from plantilla inner join hospital on plantilla.hospital_cod = hospital.hospital_cod
union
select doctor.apellido, doctor.especialidad, doctor.salario, hospital.direccion from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod;

create or replace view vistaTresTablas
as
    select emp.apellido, emp.oficio, emp.salario, dept.loc  from emp inner join dept on emp.dept_no = dept.dept_no
    union
    select plantilla.apellido, plantilla.funcion, plantilla.salario, hospital.direccion from plantilla inner join hospital on plantilla.hospital_cod = hospital.hospital_cod
    union
    select doctor.apellido, doctor.especialidad, doctor.salario, hospital.direccion from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod;

--- hay que ponerlo en una vista para que despues se pueda filtrar por determinados valores de los que devuelva la vista. 

select * from vistaTresTablas;


---jhonjames. recordar que estos dos procedmientos tiene que estr dentro de un paquete. 
create or replace procedure recibirDatosUno
as
    cursor cursorPrueba is select * from vistaTresTablas;
begin
    for i in cursorPrueba loop
        dbms_output.put_line ('estos son los datos: ' || i.apellido || ' - ' || i.oficio || ' - ' || i.salario || ' - ' || i.loc);
    end loop;
end;

begin
    recibirDatosUno;
end;

create or replace procedure recibirDatosDos
as
    cursor cursorPrueba is select * from vistaTresTablas where salario > 200000;
begin
    for i in cursorPrueba loop
        dbms_output.put_line ('estos son los datos: ' || i.apellido || ' - ' || i.oficio || ' - ' || i.salario || ' - ' || i.loc);
    end loop;
end;

begin
    recibirDatosDos;
end;




-----
select * from doctor;
select round(dbms_random.value(1,50), 0) from dual;


--Necesitamos un paquete con un procedimiento para modificar el salario de cada doctor de forma individual. 
-- La modificacion de los datos de cada doctor sera de forma aleatoria. 
-- debemos comprobr el salario de cada doctor para ajustar el numero aleatorio del incremento. 

--1) doctor con menos de 200.000 incremento aleatorio de 500. 
--2) doctor entre 200.000 y 300.000 incremento de 300.
--3) doctor mayor de 300.000 incremento de 50.
--dentro de este paquete tiene uque haber una fuincion y un procedure, la funcion reotorna el RANDOM y el procedure aplica 
-- los valores random a la columna salario. 
select * from doctor;
create or replace package paqueteIncrementosRandom
as 
    procedure aumentarSalarioDoctor;
    function generarRandom (parametronNumero number) return number;
end paqueteIncrementosRandom;

create or replace package body paqueteIncrementosRandom
as
    procedure aumentarSalarioDoctor
    as 
        cursor cursorPrueba is select * from doctor;
        miAuxiliarRandom number;
    begin
        --dbms_output.put_line ('paqueteIncrementosRandom.aumentarSalarioDoctor () --- ');
        for i in cursorPrueba loop
            --dbms_output.put_line ('paqueteIncrementosRandom.aumentarSalarioDoctor () --- ' || i.doctor_no);
            update doctor set salario = salario + generarRandom (i.salario) where doctor_no = i.doctor_no;
        end loop;
    end;
    
    function generarRandom (parametronNumero number) return number
    as
        miAuxiliarAleatorio number;
    begin
        --dbms_output.put_line ('generarRandom()---');
        if (parametronNumero < 200000) then 
            select round(dbms_random.value(1,500), 0) into miAuxiliarAleatorio from dual;
            return miAuxiliarAleatorio;
        elsif (parametronNumero >= 200000) and (parametronNumero < 500000) then 
            select round(dbms_random.value(1,300), 0) into miAuxiliarAleatorio from dual;
            return miAuxiliarAleatorio;
        else
            select round(dbms_random.value(1,50), 0) into miAuxiliarAleatorio from dual;
            return miAuxiliarAleatorio;
        end if;
    end;
end paqueteIncrementosRandom;


begin
    --dbms_output.put_line (paqueteIncrementosRandom.generarRandom (750000));
    paqueteIncrementosRandom.aumentarSalarioDoctor;
end;


--7/5/2025
select * from emp;
update into emp;  
select * 


declare
    miNumero number;
begin
    update  emp  set salario =   777 where emp_no = conseguirClaveEMP;  
end;

create or replace function conseguirClaveEMP return number
as
    miVariableNumero number;
begin 
    select emp_no into miVariableNumero from emp where emp_no = 7839;
    commit;
    return miVariableNumero;
end;

--- el tipo record se suele utilizar para comparir varables entre varios procedimientos. 
declare
    Type tipoEmpleados is record (
       	campo1 varchar2 (50), campo2 varchar2 (50), campo3 int
    );
    miArray tipoEmpleados;
begin
    dbms_output.put_line ('hola, empieza');
    select apellido, oficio, salario into miArray from emp where emp_no = 7839;
    dbms_output.put_line (miArray.campo1 || ' - ' || miArray.campo2 || ' - ' || miArray.campo3);
end;



--arrays. 
--por ul lado esta la declaracion del tippo. Por otro la variable de dicho tipo. 
declare
    -- este es el tipo array. 
    TYPE tablaNumeros is table of number index by binary_integer;
    -- aqui está el objeto. 
    miArray tablaNumeros;
begin
    dbms_output.put_line ('EMPIEZAAA. ');
    miArray (1) := 101;
    miArray (2) := 999;
    miArray (3) := 123;
    dbms_output.put_line (miArray(1));
    for i in 1..length(miArray) loop
        dbms_output.put_line (miArray(i));
    end loop;
end;

--guardamos un tipo fila de departamento. 
declare
    type arrayDeFilas is table of dept%rowtype index by binary_integer;
    miArrayPrueba arrayDeFilas;
begin
    dbms_output.put_line ('comienza');
    select * into miArrayPrueba(1) from dept where dept_no = 20;
    select * into miArrayPrueba(2) from dept where dept_no =30;
    dbms_output.put_line (miArrayPrueba.prior(2));
    for i in 1..miArrayPrueba.count loop 
        dbms_output.put_line (miArrayPrueba(i).dept_no);
    end loop;
end;

--arrays estaticos. 
declare
    cursor cursorEmpelado is select apellido from emp;
    type miTipoArrayEstatico is varray (20) of emp.apellido%type;
    miArrayEmpleados miTipoArrayEstatico := miTipoArrayEstatico ();
    contador integer := 0;
begin
    dbms_output.put_line ('array estatico. ');
    for i in cursorEmpelado loop
        contador := contador + 1;
        miArrayEmpleados.extend;
        miArrayEmpleados (contador) := i.apellido;
        dbms_output.put_line ('empleado: ' || contador || ' - ' || miArrayEmpleados(contador));
    end loop;
end;


--trigers.   after,, before instead of. 
select * from dept;
drop trigger trigger_before_insert_dept;
create or replace trigger trigger_before_insert_dept
before insert
on dept
for each row 
declare 
begin
    dbms_output.put_line ('trigger_before_insert_dept ()--- ');
    dbms_output.put_line (:new.dept_no || '  -  ' || :new.dnombre);
end;


drop trigger trigger_before_insert_dept;
create or replace trigger trigger_before_insert_dept
before insert
on dept
declare 
begin
    dbms_output.put_line ('trigger_before_insert_dept ()--- ');
    dbms_output.put_line (:new.dept_no || '  -  ' || :new.dnombre);
end;

INSERT into dept values (555, 'recursos hmanos', 'toledo');

select * from doctor;
drop trigger trigger_before_update_doctor;
create or replace trigger trigger_before_update_doctor
before update
on doctor
for each row
    -- esto signifia que el trigger sólo salta en los casos que 
    when (new.salario > 250000)
declare 
begin
    dbms_output.put_line ('trigger_before_update_doctor ()--- ');
    dbms_output.put_line (:old.apellido || '  -  ' || :new.salario);
end;

update doctor set salario = 123456 where doctor_no = 386;

-- no podemos tener dos triiger del mismo tipo en una tabla. 
-- cuisdado porque hay triggers que no se pueden hacer dos vaces. 
select * from dept;
drop trigger trigger_before_insert_dept_controlBarcelona;
drop trigger trigger_before_insert_dept_controlBarcelona;
create or replace trigger trigger_before_insert_dept_controlBarcelona
before insert
on dept
for each row 
declare 
begin
    dbms_output.put_line ('trigger_before_insert_dept_controlBarcelona ()--- ');
    if (upper(:new.loc) = 'BARCELONA') then
        dbms_output.put_line ('No se admiten departamentos de Barcelona. ');
        raise_application_error (-20003, 'Exception: No se admiten departamentos de Barcelona. ');
    end if;
end;

-- es mas eficiente usar el WHEN. 

insert into dept values (790, 'ventas333', 'Barcelona');

drop trigger trigger_before_insert_dept_controlLocalidades;
create or replace trigger trigger_before_insert_dept_controlLocalidades
before insert
on dept
for each row 
declare 
begin
    dbms_output.put_line ('trigger_before_insert_dept_controlLocalidades ()--- ');
    if (upper(:new.loc) = 'BARCELONA') then
        dbms_output.put_line ('No se admiten departamentos de Barcelona. ');
        raise_application_error (-20003, 'Exception: No se admiten departamentos de Barcelona. ');
    end if;
end;

---8/5/2025
select * from dept;

drop trigger tr_dept_control_localidades;
create or replace trigger tr_dept_control_localidades
before insert 
on DEPT
for each row
declare
    v_num number;
begin
    dbms_output.put_line('Trigger Control Localidades');
    select count(DEPT_NO) into v_num from DEPT 
    where UPPER(LOC)=UPPER(:new.loc);
    if (v_num > 0) then
        RAISE_APPLICATION_ERROR(-20001
        , 'Solo un departamento por ciudad ' || :new.LOC);
    end if;
end;

insert into DEPT values (98634345, 'MILANA', 'TERUEL');



--- en el caso de que sea AFTER, no se puede hacer consultas sobre las tablas. 
drop trigger tr_dept_control_localidades;
create or replace trigger tr_dept_control_localidades
after insert 
on DEPT
for each row
declare
    v_num number;
begin
    dbms_output.put_line('Trigger Control Localidades');
    select count(DEPT_NO) into v_num from DEPT 
    where UPPER(LOC)=UPPER(:new.loc);
    if (v_num > 0) then
        RAISE_APPLICATION_ERROR(-20001
        , 'Solo un departamento por ciudad ' || :new.LOC);
    end if;
end;

select * from dept;

insert into DEPT values (986325, 'MILANA', 'TERUEL');


--- ejemplo de integridad referencial o relacional. 

select * from emp;
select * from dept;
drop trigger tr_update_dept_cascade;
create or replace trigger tr_update_dept_cascade before update on dept for each row
    when (new.dept_no <> old.dept_no)
declare
begin
    dbms_output.put_line ('tr_update_dept_cascade()---');
    update emp set dept_no = :new.dept_no where dept_no = :old.dept_no;
end;
update dept set dept_no = 5538490 where dept_no = 30;

--- no se puede insertar un nuevo presidente si ya existe en la tabla emp;
---jhonjames:  este trigger ¿no deberia de dar error? ya que siempre hay mas de un presidente en la tabla, por lo 
-- tanto deberia de entrar siempre al error inducido. 
select * from emp;
drop trigger trigger_noAnadirMasDeUnPresidente;
create or replace trigger trigger_noAnadirMasDeUnPresidente  before insert on emp for each row
declare
    miCantidadPresidentes number;
begin
    dbms_output.put_line ('trigger_noAnadirMasDeUnPresidente()---');
    select count (*)into miCantidadPresidentes from emp where oficio = 'PRESIDENTE';
    if (miCantidadPresidentes >= 1) then
        raise_application_error (-20003, 'Exception: No se puede haber más de un presidente. ');
    end if;
end;

INSERT INTO EMP (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, COMISION, DEPT_NO)
VALUES (8000, 'Gomez', 'PRESIDENTE', NULL, TO_DATE('08-05-2025', 'DD-MM-YYYY'), 600000, NULL, 10);

INSERT INTO EMP (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, COMISION, DEPT_NO)
VALUES (8123, 'Gomez', 'PRESIDENTEAAA', NULL, TO_DATE('08-05-2025', 'DD-MM-YYYY'), 600000, NULL, 10);


delete  from emp where oficio = 'PRESIDENTE';







---
select * from dept;

drop trigger tr_dept_control_localidades;
create or replace trigger tr_dept_control_localidades
before insert 
on DEPT
for each row
declare
    v_num number;
begin
    dbms_output.put_line('Trigger Control Localidades');
    select count(DEPT_NO) into v_num from DEPT 
    where UPPER(LOC)=UPPER(:new.loc);
    if (v_num > 0) then
        RAISE_APPLICATION_ERROR(-20001
        , 'Solo un departamento por ciudad ' || :new.LOC);
    end if;
end;


drop trigger tr_dept_control_localidades;
create or replace trigger tr_dept_control_localidades
before update 
on DEPT
for each row
declare
    v_num number;
begin
    dbms_output.put_line('Trigger Control Localidades');
    select count(DEPT_NO) into v_num from DEPT 
    where UPPER(LOC)=UPPER(:new.loc);
    if (v_num > 0) then
        RAISE_APPLICATION_ERROR(-20001
        , 'Solo un departamento por ciudad ' || :new.LOC);
    end if;
end;

update dept set loc = 'CADIZ' where DEPT_NO = 20;

INSERT INTO DEPT (DEPT_NO, DNOMBRE, LOC)
VALUES (60, 'COMERCIAL', 'CADIZ');

-- ESTE ES EL ORDEN DE EJECUCION DE LOS TRIGGERS 
-- trigger before
-- trigger before row
-- trigger after row
-- trigger after


-- primero se necesita un paquete para compaartir las variables. 
create or replace package paqueteTrigger
as 
    procedure mostrarMensaje;
    v_nueva_localidad dept.loc%type;
end paqueteTrigger;

create or replace package body paqueteTrigger
as
    procedure mostrarMensaje
    as 
    begin
        dbms_output.put_line (' saludo desde el procedimiento almacenado dentro de un packete.');
    
    end;
end paqueteTrigger;

-- almanenamos al valor de la nueva localidad. 
drop trigger tr_dept_control_localidades_row;
create or replace trigger tr_dept_control_localidades_row
before update 
on DEPT
for each row
declare
begin
    dbms_output.put_line('Trigger Control Localidades');
    paqueteTrigger.v_nueva_localidad := :new.loc;
end;

create or replace trigger tr_dept_control_localidades_after after update on dept 
declare
    v_numero number;
begin
    dbms_output.put_line ('tr_dept_control_localidades_after()---  ' || paqueteTrigger.v_nueva_localidad);
    select count (dept_no) into v_numero from dept where upper (LOC) = upper (paqueteTrigger.v_nueva_localidad);
    dbms_output.put_line (v_numero);
    if (v_numero > 1) then 
                RAISE_APPLICATION_ERROR(-20001, 'Solo un departamento por localidad ' || paqueteTrigger.v_nueva_localidad);
    end if;
end;

update dept set loc = 'CADIZ' where DEPT_NO = 555;



-- uso del instead of. 
select * from dept;
create or replace view vistaDepartmentos
as
    select * from dept;
    
-- ahora se trabaj sólo con la vista. 
select * from vistaDepartmentos;

insert into vistaDepartmentos values (748, 'ventas748', 'huelva');

create or replace trigger trigger_vista_dept 
instead of insert  
on vistaDepartmentos 
declare
begin
    dbms_output.put_line ('trigger_vista_dept');
end;

insert into vistaDepartmentos values (434545, 'vista', 'contrigger');

--- crear una vista de los empleados, pero sin sus datos sensibles. 
select * from dept;
select * from emp;
create or replace view vistaEmpleados
as
    select emp_no, apellido, oficio, dir, dept_no from emp;
    
select * from  vistaEmpleados;

insert into vistaEmpleados values (54334, 'el nuevo', 'beario', 656, 20);

create or replace trigger trigger_vista_empleados
instead of insert 
on vistaEmpleados
declare
begin
    dbms_output.put_line ('trigger_vista_empleados');
    INSERT INTO EMP (EMP_NO, APELLIDO, OFICIO, DIR, DEPT_NO, FECHA_ALT, SALARIO, COMISION)
    VALUES (:NEW.EMP_NO, :NEW.APELLIDO, :NEW.OFICIO, :NEW.DIR, :NEW.DEPT_NO, NULL, NULL, NULL);
end;


---

select * from doctor;
select * from hospital;
create or replace view vistaDoctor 
as  
    select doctor.doctor_no, doctor.apellido, doctor.especialidad, doctor.salario, hospital.nombre from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod;

--ya que esta vista no funciona, hay que crear un trigger que consiga insertarla. 
insert into vistaDoctor values (111, 'casados', 'espialista', 450000, 'provincial');

rollback;

--jhonjames: el prolama aqui es que no se inseta en la tabla doctor o hospital?

create or replace trigger trigger_vistaDoctor
instead of insert 
on vistaDoctor
declare
    v_codigo hospital.hospital_cod%type;
begin
    dbms_output.put_line ('vistaDoctor()--- ');
    select hospital_cod into v_codigo from hospital where upper (nombre) = upper (:new.nombre);
    insert into doctor values (v_codigo, :new.doctor_no, :new.apellido, :new.especialidad, :new.salario);
end;


insert into vistaDoctor values (111, 'casados', 'espialista', 450000, 'provincial');



---------------------++++++------++---+++++
---------------------++++++------++---+++++
---------------------++++++------++---+++++
---------------------++++++------++---+++++
---------------------++++++------++---+++++
---------------------++++++------++---+++++
---------------------++++++------++---+++++
---------------------++++++------++---+++++
--PRUEBAS
---------------------++++++------++---+++++
---------------------++++++------++---+++++
---------------------++++++------++---+++++
---------------------++++++------++---+++++
---------------------++++++------++---+++++

select substr ('abcdefg', 4, 2) as dato from dual;
select substr ('abcdefg', 24, 2) as dato from dual;

alter session set NLS_DATE_FORMAT = 'MON-DD-YYYY';

declare
    miVariable integer := 2;
    --dos date := SYSDATE - 10;
    --cuatro varchar2 := null;
    --miVariablePrueba_h_#_$ number;
    --PruebaXX number;
    --pruebaYYY simple_integer := 0;
    --pruebaConstane  constant integer := 333;
    --pruebaConstanteDos  number(8,2);
    seis varchar (80) := SUBSTR ('Oracle corporation', 24, 0);
    --salary$ varchar2(10) not null := '9000$';
    ---miNumeroA, miNumeroB number;   -- esta linea NO complila. 
begin
    dbms_output.put_line ('esto es una prueba. ');
    dbms_output.put_line ('esta es la fecha de HOY: ' || sysdate);
    dbms_output.put_line ('esta es la fecha de HOY: ' || to_char(sysdate));
    DBMS_OUTPUT.PUT_LINE('Formato actual de fecha (NLS_DATE_FORMAT): ' || 
        SYS_CONTEXT('USERENV', 'NLS_DATE_FORMAT'));
    dbms_output.put_line (seis);
    --dbms_output.put_line (dos);
    --pruebaConstanteDos := 123456.141592;
    --dbms_output.put_line (pruebaConstanteDos);
    --dbms_output.put_line ('fin de la ejeucion');
    dbms_output.put_line (case miVariable when 4 then 'miVariable vale 4' else 'ne sé lo que vale. ' end);
    dbms_output.put_line (case when miVariable = 4 then 'miVariable vale 4' else 'ne sé lo que vale. ' end);
end;


declare
    miNumero integer;
    function saluda return number as
    begin
        dbms_output.put_line ('saluda.');
        return 0;
    end;
begin
    miNumero := saluda;
    dbms_output.put_line (miNumero);
end;

declare
    miNumero integer;
begin
    function saludaDos return number as
    begin
        dbms_output.put_line ('saludaDos');
        return 0;
    end;
    miNumero := saludaDos;
    dbms_output.put_line (miNumero);
end;


select * from dept;
insert into dept (dept_no, dnombre) values (212, 'd212');
update dept set dnombre = 'departamentoxxyy212' where dept_no = 212;
create or replace trigger trigger_b_u_tablaDeptMuestraValoresNuevosYViejos 
before update
on dept
for each row
declare
    procedure saludaTrigger_b_u_tablaDeptMuestraValoresNuevosYViejos is
    begin
        dbms_output.put_line ('saludaTrigger_b_u_tablaDeptMuestraValoresNuevosYViejos');
    end;
begin
    dbms_output.put_line ('se ejecuta: trigger_b_u_tablaDeptMuestraValoresNuevosYViejos');
    dbms_output.put_line (:old.dnombre);
    dbms_output.put_line (:new.dnombre);
    saludaTrigger_b_u_tablaDeptMuestraValoresNuevosYViejos;
end;

select * from employes;
drop table employes;
create table employes (id integer, name varchar(20), salary integer);
create or replace procedure add_employee (e_id number, e_name varchar2, e_salary number default 4000) is
begin
    insert into employes (id, name, salary) values (e_id, e_name, e_salary);
end;

begin 
    add_employee (112, 'jhon');
end;


select * from emp;
select * from emp where dept_no = 10;
create or replace procedure miPruebaSQLinjection (parametroA varchar) as
    miSting varchar(100) := parametroA;
    miCantidadDeFlias integer;
    miRecordDept dept%rowtype;
begin
    dbms_output.put_line ('vamos con el PLSL dinámico. ');
    execute immediate (miSting);
    dbms_output.put_line (sql%rowcount);
    dbms_output.put_line ('fin de la ejecución.');
end;

begin
    miPruebaSQLinjection ('update emp set salario = salario + 10 where dept_no = 10');
end;

SELECT * FROM v$parameter WHERE name = 'plsql_code_type';


declare
    date1 DATE := TO_DATE('10-ENERO-2018', 'DD-MONTH-YYYY');
    date2 date := sysdate;
    diferenciaDeFechas integer;
begin
    dbms_output.put_line ('comienzaassss');
    diferenciaDeFechas := date2 - date1;
    dbms_output.put_line (diferenciaDeFechas);
    dbms_output.put_line ('fin de fechas. ');
end;

create or replace procedure calculate_tax (income number, rate number default 0.1) is
    tax_amount number;
begin
    tax_amount := income * rate;
    dbms_output.put_line ('la cantidad de la tasa es:  ' || tax_amount);
end;

begin
    calculate_tax (120);
    calculate_tax (income => 120);
end;

ALTER SESSION SET plsql_warnings='DISABLE:ALL';

