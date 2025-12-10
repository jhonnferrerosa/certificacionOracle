



SELECT * from dept;
select * from emp;
select * from enfermo;
select * from doctor;
select * from hospital;
select * from sala;
select * from plantilla;

---Cuidado porque en PLSQL no se puede imprimir el boolean, es decir, esto no ejecuta: dbms_output.put_line(true);

-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
--- tema1: fundamentos de PLSQL. 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
--esto es para que se activa la salida de mensajes del put_line. 
set serveroutput on;


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
--ejercicios de sintaxis. Práctica01, fundamentos de PLSQL. 
--2: 
SELECT * from emp;
DECLARE
  v_empno emp.emp_no%TYPE;
BEGIN
  v_empno := &empno;
  INSERT into emp values (v_empno, 'perez', 'analista', null, sysdate, 2000, null, 10);
END;


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


--5 ya esta hecho. 


--6 
SELECT * from emp;
SELECT emp_no, nvl (COMISION, 0) from emp;
--buscar a los empleados que tiene una comisión de más del 5%. 

DECLARE 
BEGIN
  update emp set SALARIO = SALARIO * 1.05 where nvl(comision,0)= 0;
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


-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
--- tema2-Estructuras de control. 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
-- en el texto es en el que tienes que poner las comillas, en el caso de que sea un entero,entonces no hace falta tener las 
-- comillas, esto a la hora de pedir valores por parámetro, pero lo que pasa es que el usar las comillas para pedir datos, 
--funciona en los dos tipos de datos. 


--probar que pasa con este código en el que el valor de las variable no se establece y entonces toman un valor NULL. 
declare 
    num1 number;
    num2 number; 
begin
    if num1 < num2 then
        dbms_output.put_line ('el segundo es mayor. ');
    else
        dbms_output.put_line ('el primero es mayor. ');
    end if;
end;



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
declare
    num1 integer; 
    num2 integer; 
begin
    num1 := &num1;
    num2 := &num2; 
    if num1 > num2 then
        dbms_output.put_line ('el numero 1 es mayor. ');
    elsif num2 > num1 then
        dbms_output.put_line ('el número 2 es mayor. ');
    else
        dbms_output.put_line ('los dos números son los mismos');
    end if;
end;



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

-- indicar cuál de estos tres números es el mayor y cual es el menor, Parte1. 

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

-- indicar cuál de estos tres números es el mayor y cual es el menor, Parte2. 

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


--ejercicios de sintaxis. Práctica02. Ejercicio calcular el día de nacimiento de la semana. 

declare
    v_dia integer; v_mes integer; v_ano integer;
    v_mesauxlinaruno integer;
    v_anoauxiliaruno integer; v_anoauxiliardos integer; v_anoauxiliartres integer; 
    v_auxiliar_sumas_cinco integer;
    v_auxiliar_paso_6 integer;
    v_auxiliar_paso_7 integer; 
begin
    v_dia := '&dia'; v_mes := '&mes'; v_ano := '&ano';
    dbms_output.put_line ('Estos son los datos: ' || v_dia || ' - ' || v_mes || ' - ' || v_ano);
    --paso1. 
    v_mesauxlinaruno := (((v_mes+1)*3)/5);
    dbms_output.put_line ('paso1: '  || v_mesauxlinaruno);
    --paso2. 
    v_anoauxiliaruno := trunc(v_ano/4);
    dbms_output.put_line ('paso 2: ' || v_anoauxiliaruno);
    --paso3
    v_anoauxiliardos := trunc (v_ano/100);
    dbms_output.put_line ('paso 3: ' || v_anoauxiliardos);
    --paso4 
    v_anoauxiliartres := trunc (v_ano/400);
    dbms_output.put_line ('paso 4: '  || v_anoauxiliartres);
    --paso5.
    v_auxiliar_sumas_cinco := v_dia + (v_mes * 2) + v_ano + v_mesauxlinaruno + v_anoauxiliaruno - v_anoauxiliardos + v_anoauxiliartres + 2;
    dbms_output.put_line ('paso 5: ' || v_auxiliar_sumas_cinco);
    --paso6.
    v_auxiliar_paso_6 := trunc (v_auxiliar_sumas_cinco / 7);
    dbms_output.put_line ('paso 6: ' || v_auxiliar_paso_6);
    --paso7.
    v_auxiliar_paso_7 := v_auxiliar_sumas_cinco - (v_auxiliar_paso_6*7);
    dbms_output.put_line ('paso 7: ' || v_auxiliar_paso_7);
    --paso8. 
    if (v_auxiliar_paso_7 = 0) then
        dbms_output.put_line ('el día es el sábado. ');
    else
        if (v_auxiliar_paso_7 = 1) then
            dbms_output.put_line ('el día es el domingo. ');
        else
            if (v_auxiliar_paso_7 = 2) then
                dbms_output.put_line ('el día es lunes .');
            else
                if (v_auxiliar_paso_7 = 3) then
                    dbms_output.put_line ('el día es martes. ');
                else
                    if (v_auxiliar_paso_7 = 4) then
                        dbms_output.put_line ('el día es miércoles. ');
                    else
                        if (v_auxiliar_paso_7 = 5) then
                            dbms_output.put_line ('el día es jueves.');
                        else
                            if (v_auxiliar_paso_7 = 6) then
                                dbms_output.put_line (' el día es viernes.');
                            else
                                dbms_output.put_line ('No se sabe que día es...');
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end if; 
end;


-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
---  21/4/2025   tema3:bucles. 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
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

-- las etiquetas se puenden usar también como documentación del código, en este 
--ejemplo, no vale absolutamente para nada en la ejecución. 
declare
    i integer;
    suma real;
begin
    suma:=0;
    i:=1;
    dbms_output.put_line ('paso 1');
    --<<mi_bucle>>
    dbms_output.put_line ('paso 2');
    while i<=10 loop
        dbms_output.put_line ('paso 3()--- valor de la suma: ' || suma);
        suma:=suma+i; 
        i:=i+1;
    end loop;
    --end loop mi_bucle;
    dbms_output.put_line ('paso 4()--- valor de la suma:  ' || suma);
end;

---  uso del NULL 
declare 
    miSuma integer;
begin 
    miSuma := &suma;
    if (miSuma > 10) then 
        dbms_output.put_line ('es mayor de 10');
    else
        -- esto es la misma forma que en Pyhon se hacía el None.
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
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
--tema4:cursores. 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
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
-- atributos:  %isopen, %notfound, %found, %rowcount,   sql%rowcount(este sólo lo he probado update, delete e insert que para hacer esto no hace falta cursor), 
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


-- este ejercicio es lo mismo que el anerior, sólo que con un bucle while. 
declare
    miArrayDept dept%rowtype;
    cursor miCursor is select * from dept;
begin
    open miCursor; 
    -- solamente después del primer fetch es cuando se puede hace el found. 
    fetch miCursor into miArrayDept;    
    while (miCursor%found) loop
        dbms_output.put_line ('este es el valor de dept_no: ' || miArrayDept.DEPT_NO);
        fetch miCursor into miArrayDept;
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
        update dept set dnombre = v_dnombre, loc =v_loc  where dept_no = v_dept_noleido;
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


---prueba para ver el uso del rowcount. 
--mostra sólo 5 empleados.
select * from emp;
declare
    miCursorTablaEmp emp%rowtype;
    cursor miCursor is select * from emp;
begin
    dbms_output.put_line ('comienza la prueba mostrar sólo los 5 primeros empleados. ');
    open miCursor;
    loop 
        fetch miCursor into miCursorTablaEmp;
        dbms_output.put_line ('estos son los datos: ' ||miCursorTablaEmp.emp_no);
        exit when miCursor%rowcount = 5;
    end loop;
    dbms_output.put_line ('fin de la ejecución.');
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


declare
    cursor cursordoctorhospital is select salario, doctor_no from doctor inner join hospital 
    on doctor.hospital_cod = hospital.hospital_cod where hospital.nombre = 'la paz';
    cursor cursordoctorhospital2 is select salario, doctor_no from doctor inner join hospital 
    on doctor.hospital_cod = hospital.hospital_cod where hospital.nombre = 'la paz';
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


-- esto es un ejemplo de cursor explícito pero con un bucle for, esto me permite el no tener que hacer el open, el fetch y tampoco el %notfound. 
declare 
    miArrayEmp emp%rowtype;
    cursor miCursor is select * from emp;
begin
    dbms_output.put_line ('comienza el ejemplo de cursor explícito con el bucle for. ');
    for i in miCursor loop 
        dbms_output.put_line ('estos son los datos del empleado: ' || i.emp_no || ' - ' || i.apellido);
    end loop;
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


-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
---  24/4/2025  tema5: control de exceptions. ??? que es lo que pasaba con el pragma exception_init , ¿para qué era esto? 
--al parecer esto vale para establecer códigos de error a las exception que nosotos creemos ¿podría modificar el código elementos
-- mensaje a una exception que implícita, es decir, que sea predefinida por Oracle? 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------



--Tipos de exception más comunes: no_data_found, zero_divide, TOO_MANY_ROWS
declare
    miNumeroUno number := 444;
    miNumeroDos number := 0;
    miNumeroTres number;
begin
    dbms_output.put_line ('Comienza el programa. ');
    miNumeroTres := miNumeroUno / miNumeroDos;
    -- a partir de aquí ya no se ejecuta ya que ha caido en la exception. 
    dbms_output.put_line (miNumeroTres);
    exception
        when zero_divide then
            dbms_output.put_line ('ha saltado la exception  de dividir por cero. ');
            dbms_output.put_line (to_char (SQLCODE));
            dbms_output.put_line (SQLERRM);
end;


--definir una exception.  En el momento en el que los empleados tengan una comisón de Cero, entonces devolver exception. 
-- habra una tabla en la que tendremos a los que tenga una comision mayor de cero. 
-- En este caso de que no se usa PRAGMA  para la especificación de nuestra exception (se estudia más adelante)  lo que pasa es que se 
--establece un valor por defecto del código SQL y lo mismo para el mensaje, es decir, se ha creado una exception, pero no se le ha dado 
-- código ni tampoco mensaje de error  con pragma, por lo tanto el código va a ser 1 y el mensje va a ser "User-Defined Exception" 
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
            dbms_output.put_line (to_char (SQLCODE));
            dbms_output.put_line (SQLERRM);
end;


select * from emp_comision;
select * from dept;
describe dept;



--con PRAGMA se puede cambiar el nombre a una exception predeterrminada de Oracle, pero nunca se va a poder personalizar su mensaja de error que se
-- alamcena en SQLERRM. 
DECLARE
    ERROR_NULOS EXCEPTION;
    PRAGMA EXCEPTION_INIT(ERROR_NULOS,-1400);
BEGIN
    INSERT INTO DEPT VALUES (null,'ventas88','MADRID88');
    COMMIT;
EXCEPTION
    WHEN ERROR_NULOS THEN
    DBMS_OUTPUT.PUT_LINE('UNA COLUMNA NO ADMITE NULOS');
    dbms_output.put_line (to_char (SQLCODE));
    dbms_output.put_line (SQLERRM);
 END;



-- el pragma también se usa para  personaliar los mensajes que devueven las exceptions creadas por el usuario, esto sólo 
--se puede hacer para las exception  que van desde la    -20.000 hasa la -29.999  todas los códigos que ven desde -19.999 
-- hasta -1, tienen mensajes preestabecidos de Oracle que no se pueden modificar. 
declare
    miExceptionNulos exception;
    pragma exception_init (miExceptionNulos, -20001);
begin
    dbms_output.put_line ('comienza');
    insert into dept values (null, 'departe', 'pragma');
    
    exception
        when others then
            if SQLCODE = -1400 then 
                RAISE_APPLICATION_ERROR (-20001, 'mensaje  de error personalizado: no se puede insertar null en clave primaria');
            end if;
        WHEN miExceptionNulos THEN
            DBMS_OUTPUT.PUT_LINE('🎯 SQLERRM personalizado (-20001): ' || SQLERRM);
end;


--  este ejemplo tiene que ver con el código anterior en el que va a saltar la exception de que no se puede insertar NULL en la clave privada, sólo 
-- que sacando los menajes de error que tiene Oracle por defecto. 
declare
begin
    dbms_output.put_line ('comienza');
    insert into dept values (null, 'departe', 'pragma');
    -- a partir de aquí no se va a ejecutar ya que el código ha creado la exception -1400 (no se puede inserta null en clave primaria) y
    -- la continuación de la ejecución se va a la parte del exception. 
    dbms_output.put_line ('fin de la ejecución, esto no se ejecuta. ');
    -- en este caso se están tendiendo en cuenta TODAS las exception. 
    exception
        when others then 
            dbms_output.put_line ('fin de la ejecución. ');
            null;
end;


select * from dept;
declare 
    v_id number;
begin
    dbms_output.put_line ('comienza');
    select dept_no into v_id from dept;
    exception 
        when TOO_MANY_ROWS then
            dbms_output.put_line ('demasiadas filas en el cursor. ');
end;

declare 
    v_id number;
begin
    dbms_output.put_line ('comienza');
    RAISE_APPLICATION_ERROR (-20400, ' esto es un error de aplicacion');
    dbms_output.put_line ('esto no se llega a ejecutar nunca. ');
end;



-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
--- tema6: procedimientos almacenados. 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
--en los procedieitos no se puede hacer  DROP. 
--  sp es por Store Procedore. 
drop procedure storeProcedureMiProcedimiento;
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
    v_division number;
begin
    dbms_output.put_line ('comeinza miProcedimientoEjemploTres');
    begin
        v_division := parametro_uno / parametro_dos;
        dbms_output.put_line (v_division);
        exception 
            when ZERO_DIVIDE then
                dbms_output.put_line ('miProcedimientoEjemploTres()--- INNER.  error se ha dividido por cero. o ');
            
    end;
    dbms_output.put_line ('fin  del procedimiento:  miProcedimientoEjemploTres');
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


create or replace procedure sp_insertaDoctorImprimirID (p_hospital_cod doctor.hospital_cod%type, p_apellido doctor.apellido%type, 
p_especialidad doctor.especialidad%type, p_salario doctor.salario%type)
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

create or replace procedure sp_insertaDoctorImprimirID (p_hospital_nombre hospital.nombre%type, p_apellido doctor.apellido%type, 
p_especialidad doctor.especialidad%type,
p_salario doctor.salario%type)
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


--- necesito un proc para incrementar en 1 el salario de los empleados de un deaprtamento. 
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

-- este es un ejemplo de procedimiento con parámetros opcionales, en este caso el valor de la variable por defecto va a ser 2.  
create or replace procedure multiplicaNumero (p_numeroA number, p_numeroB number := 2)
as
begin
    dbms_output.put_line ('comienza, multiplicaNumero... ');
    dbms_output.put_line ('multiplicaNumero... el resultado es: ' || p_numeroA*(p_numeroB);
end;


begin
    multiplicaNumero (3);
end;


begin
    multiplicaNumero (3,4);
end;

-- lo recomendable es dejar los parámetros opcionales al final, para que de esta forma a la hora de llamar al procedimiento almacenado, 
-- no tengamos que explicar cual es el valor que toma cada uno de nuestros parametros. 
-- cuidado porque en el caso de que tengamos un parametro opcional en el medio de los parámetros, hay que aclarar que valor es el que va a tener el del medio. 
create or replace procedure multipicaTresNumeros (pNumeroA number, pNumeroB number := 2, pNumeroC number) 
as 
begin
    dbms_output.put_line ('multipicatresNumeros.... ');
    dbms_output.put_line ('este es el resultado: ' || pNumeroA*pNumeroB*pNumeroC);
end;


execute multipicaTresNumeros (3, pNumeroC => 4);
-- este da error. 
execute multipicaTresNumeros (3, 4);


-- esta es la forma para ver la lista de mis procedimientos creados: 
SELECT object_name, created, last_ddl_time, status
FROM user_objects 
WHERE object_type = 'PROCEDURE'
ORDER BY object_name;

--- en el caso de que un precidimiento tenga un error de creación, por ejemplo "error de sintaxis", con este comando se puede ver el error que tiene ese código. 
show errors;

--05/05/2025.
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
---tema7: funciones
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
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

-- esto es una forma para devolver el resultado en forma de tabla. 
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

-- esta es la forma para ver la lista de mis funciones  creadas: 
SELECT object_name, created, last_ddl_time, status
FROM user_objects 
WHERE object_type = 'FUNCTION'
ORDER BY object_name;


-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
--- tema8: vistas. 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
-- quiero una vista para tener todos los datos de los empleados SIN EL SLARIO. 
create or replace view vistaEmpleados
as
    select emp_no, apellido from emp;
    
--- todas estas operaciones sí estan permitidas en esta vista, ya que es una vista sencilla, es decir, sólo 
-- saca columnas de una tabla, en el caso de que se saque columnas de dos tablas con JOIN, entonces la consulta 
-- se hace más compleja y no permite hacer el insert, no update, ni deleta, cómo veremosen otro ejercicio más
-- adelante. 
select * from vistaEmpleados;
select * from vistaEmpleados order by emp_no;
insert into vistaEmpleados values (8001, 'pablo');
update vistaEmpleados set apellido = 'pabloApellido' where emp_no = 8001;
delete from vistaEmpleados where emp_no = 8001;
    
-- esta es la misma vista, pero sólo con read only, para que la tabla original no pueda ser modificada. 
create or replace view vistaEmpleados
as
    select emp_no, apellido from emp
with read only;
    
select * from vistaEmpleados where emp_no = 7839;
-- esto no funciona poque le estoy diciendo que es read only. 
insert into vistaEmpleados values (8001, 'pablo');
update vistaEmpleados set apellido = 'pabloApellido' where emp_no = 7839;
delete from vistaEmpleados where emp_no = 7839;

select * from emp;
select * from  vistaEmpleados;

--las vitas simlican las consultas. 
create or replace view vistaEmpleadosDepartamentos
as
    select emp.apellido, emp.emp_no, emp.oficio, emp.salario, dept.dnombre, dept.loc from emp  inner join dept on emp.dept_no = dept.dept_no;

select * from vistaEmpleadosDepartamentos where loc='MADRID';


select * from dept;
select * from emp;

-- eliminamos al empleados con id = 7917. 
select * from vistaEmpleadosDepartamentos where emp_no = 7917;
delete from vistaEmpleadosDepartamentos where emp_no = 7917;

--modificar el salario de los empleados de MADRID.
update vistaEmpleadosDepartamentos set salario = salario + 1 where loc='MADRID';
select * from vistaEmpleadosDepartamentos where loc='MADRID';

--  (en el update o insert) en el caso de que la consullta afecte  a dos tablas no deja. 
-- en el caso del delete si que borra la fila, pero cuidado que borra la fila de la primera tabla (eso se ve en este ejemplo, que 
-- además coincide que la primera tabla es la entidad débil).
select * from doctor;
select * from hospital;

create or replace view miVistaHospitalDoctor 
as
    select doctor.doctor_no as doctor__doctor_no, doctor.apellido as doctor__apellido, hospital.hospital_cod as hospital__hospital_cod, 
    hospital.nombre as hospital__nombre from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod; 
select * from miVistaHospitalDoctor;

-- esto sí que está permitido. 
insert into hospital(hospital_cod, nombre) values (501, 'gregorio marañon');
insert into doctor(doctor_no, hospital_cod, apellido) values (701, 501, 'Fernandez');
insert into doctor(doctor_no, hospital_cod, apellido) values (702, 501, 'Perez');

--Esto da ERROR, ya que aunque se esé inserando en una sola tabla, al ser un join, Oracle no va a saber en que tabla se quiere insertar, aunque
-- se lo especifiques. 
insert into miVistaHospitalDoctor(hospital__hospital_cod, hospital__nombre) values (502, 'gregorio marañon502');

-- esto también da error, porque aunque se especifique las columnas de forma exacta de la visa, no va a funcionar. 
insert into miVistaHospitalDoctor values (702, 'fernandez702', 502, 'gregorio marañon502');

-- el update SÍ está permitido. 
update  miVistaHospitalDoctor set doctor__apellido = 'galindo' where doctor__doctor_no = 701;

--el delete también está permitido. 
delete from miVistaHospitalDoctor where doctor_no = 701;

-- esta sí que funciona, pero no borra de la tabla hospital, si no que borra de la tabla nueva que se ha hecho con el JOIN, de tal 
-- forma que como el JOIN se contrstruye con una entidad débil y otra fuere, lo que hace es borrar de la tabla de la entidad débil, 
-- por lo tanto todas las acciones se realizan sobre la tabla doctor. Por todo esto lo que sucede en este sentencia, es que se borra 
-- a un registro de la tabla doctor y en el caso de que haya varios doctores a los que esté asociados a ese hospital, se borra a 
-- todos los doctores. 
delete from miVistaHospitalDoctor where hospital__hospital_cod = 501;


-- with check option.  veriifica que la vista no se quede inutil. 
-- en el caso de que vaya a moificar el whwre de una vista, que no le ddeje. 
create or replace view V_VENDEDORES 
as
    select emp_no, apellido, oficio, salario, dept_no  from emp where oficio = 'VENDEDOR' with check option;
--vamos a mofificar el salario de los vendedores para probar la vista.  
update V_VENDEDORES set salario = salario + 1;

update V_VENDEDORES set salario = salario + 1 where emp_no = 7499;
--- en este caso esta consulta va a dar eror mediante el check option, ya que está modificando para ese resgistro el creiterio que se le dio en la
-- creación de l vista. 
update V_VENDEDORES set oficio = 'vendedores veteranos' where emp_no = 7499;
select * from V_VENDEDORES;

rollback;

select * from emp;
update into emp;  

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

-- de esta forma es como se ve que vistas tiene este usuario, ademas muestra las consultas que ejecuta esa vistaa. 
select * from user_views;

--6/5/2025. 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
-- tema9: paquetes. 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
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


--un paquete para realizar update, insert y delete. 
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
    pk_departamentos.eliminiar (101);
end;


-- se pide una funcion que devuelva el apellido , el trabajo el salario y el lugar de trabajo de 
-- todas las personas de la BBDD. de las tablas dept y hospital 
--1) el select 
--2) ponerlo en una vista. 
--3) paquete con dos procedimeintos. 
--3A) procedimitnro para devolver todos los datos en un cursor. 
--3B) procedimiento para devolver todos los datos en un cursor por salario. 
select * from emp;
select apellido, oficio, salario  from emp; 
select emp.apellido, emp.oficio, emp.salario, dept.loc  from emp inner join dept on emp.dept_no = dept.dept_no; 
select * from plantilla;
select apellido, funcion, salario from plantilla;
select plantilla.apellido, plantilla.funcion, plantilla.salario, hospital.direccion from plantilla inner join hospital 
on plantilla.hospital_cod = hospital.hospital_cod;
select * from doctor;
select apellido, especialidad, salario from doctor;
select doctor.apellido, doctor.especialidad, doctor.salario, hospital.direccion from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod;

select emp.apellido, emp.oficio, emp.salario, dept.loc  from emp inner join dept on emp.dept_no = dept.dept_no
union
select plantilla.apellido, plantilla.funcion, plantilla.salario, hospital.direccion from plantilla inner join hospital 
on plantilla.hospital_cod = hospital.hospital_cod
union
select doctor.apellido, doctor.especialidad, doctor.salario, hospital.direccion from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod;

create or replace view vistaTresTablas
as
    select emp.apellido, emp.oficio, emp.salario, dept.loc  from emp inner join dept on emp.dept_no = dept.dept_no
    union
    select plantilla.apellido, plantilla.funcion, plantilla.salario, hospital.direccion from plantilla inner join hospital 
    on plantilla.hospital_cod = hospital.hospital_cod
    union
    select doctor.apellido, doctor.especialidad, doctor.salario, hospital.direccion from doctor inner join hospital 
    on doctor.hospital_cod = hospital.hospital_cod;


--- hay que ponerlo en una vista para que despues se pueda filtrar por determinados valores de los que devuelva la vista. 

select * from vistaTresTablas;


--Parte 1, voy a poner los procedimientos en fuera de paquetes. 
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

--Parte 2: voy a poner los procedimientos dentro de un package. 
create or replace package myPackage_mostrarTodosLosEmpleados
as
    procedure mostrarTodosLosEmpleadosParteUno;
    procedure mostrarTodosLosEmpleadosParteDos;
end myPackage_mostrarTodosLosEmpleados;


create or replace package body myPackage_mostrarTodosLosEmpleados
as
    procedure mostrarTodosLosEmpleadosParteUno
    as 
        cursor cursorPrueba is select * from vistaTresTablas;
    begin 
        for i in cursorPrueba loop
            dbms_output.put_line ('estos son los datos: ' || i.apellido || ' - ' || i.oficio || ' - ' || i.salario || ' - ' || i.loc);
        end loop;
    end;
    
    procedure mostrarTodosLosEmpleadosParteDos
    as
        cursor cursorPrueba is select * from vistaTresTablas where salario > 200000;
    begin
        for i in cursorPrueba loop
            dbms_output.put_line ('estos son los datos: ' || i.apellido || ' - ' || i.oficio || ' - ' || i.salario || ' - ' || i.loc);
        end loop;
    end;
end myPackage_mostrarTodosLosEmpleados;

    
execute myPackage_mostrarTodosLosEmpleados.mostrarTodosLosEmpleadosParteUno;
execute myPackage_mostrarTodosLosEmpleados.mostrarTodosLosEmpleadosParteDos;

-----este es un ejemplo de genreación de números RANDOM. 
select round(dbms_random.value(1,50), 0) from dual;


--Necesitamos un paquete con un procedimiento para modificar el salario de cada doctor de forma individual. 
-- La modificacion de los datos de cada doctor sera de forma aleatoria. 
-- debemos comprobr el salario de cada doctor para ajustar el numero aleatorio del incremento. 

--1) doctor con menos de 200.000 incremento aleatorio de 500. 
--2) doctor entre 200.000 y 300.000 incremento de 300.
--3) doctor mayor de 300.000 incremento de 50.
--dentro de este paquete tiene que haber una fuincion y un procedure, la funcion reotorna el RANDOM y el procedure aplica 
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

--este es un ejemplo para simular el uso de variables compartidas entre distintos procedimientos mediante 
-- el uso de  paquetes.

create or replace package miPaqueteVariablesCompartidas
as 
    miVariableGlobalEntero integer;
end;

create or replace package body miPaqueteVariablesCompartidas
as 
begin
    miVariableGlobalEntero := 22;
end;

create or replace procedure miProcedimientoPruebaVariablesGlobales
as
begin
    dbms_output.put_line ('miProcedimientoPruebaVariablesGlobales()--- ');
    dbms_output.put_line ('este es el valor actual:  ' || miPaqueteVariablesCompartidas.miVariableGlobalEntero);
    miPaqueteVariablesCompartidas.miVariableGlobalEntero := 25; 
    dbms_output.put_line ('este  es el valor que le he asignado: ' || miPaqueteVariablesCompartidas.miVariableGlobalEntero);
end;

-- en este anonymous block voy a  probar si puedo hacer uso de la variable. 
begin
    dbms_output.put_line ('pruba de la variable que está dentro de un paquete llamada desde  un anonymous block ');
    dbms_output.put_line (miPaqueteVariablesCompartidas.miVariableGlobalEntero);
    miPaqueteVariablesCompartidas.miVariableGlobalEntero := 66; 
    dbms_output.put_line (miPaqueteVariablesCompartidas.miVariableGlobalEntero);
end;


create or replace procedure miProcedimientoPruebaVariablesGlobalesParte2
as
begin
    dbms_output.put_line ('miProcedimientoPruebaVariablesGlobalesParte2()--- ');
    dbms_output.put_line ('este es el valor actual:  ' || miPaqueteVariablesCompartidas.miVariableGlobalEntero);
    miPaqueteVariablesCompartidas.miVariableGlobalEntero := 34; 
    dbms_output.put_line ('este  es el valor que le he asignado: ' || miPaqueteVariablesCompartidas.miVariableGlobalEntero);
end;

execute miProcedimientoPruebaVariablesGlobales;
execute miProcedimientoPruebaVariablesGlobalesParte2;

-- de esta forma es como se ve todos los paquetes que tiene la base de datos. 
SELECT object_name, created, last_ddl_time, status
FROM user_objects 
WHERE object_type = 'PACKAGE'
ORDER BY object_name;

-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
--- AQUÍ se sedá el tema10 registros. 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
--- el tipo record se suele utilizar para comparir varables entre varios procedimientos. 
declare
    Type tipoEmpleados is record (campo1 varchar2 (50), campo2 varchar2 (50), campo3 int);
    miEstructura tipoEmpleados;
begin
    dbms_output.put_line ('hola, empieza, ejercicio 1 tema 10.  ');
    select apellido, oficio, salario into miEstructura from emp where emp_no = 7839;
    dbms_output.put_line (miEstructura.campo1 || ' - ' || miEstructura.campo2 || ' - ' || miEstructura.campo3);
end;

-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
-- tema11: arrays. 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
--por un lado esta la declaracion del tippo. Por otro la variable de dicho tipo. 
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
    for i in 1..miArray.count loop
        dbms_output.put_line (miArray(i));
    end loop;
end;

--guardamos un tipo fila de departamento. 
declare
    type arrayDeFilas is table of dept%rowtype index by binary_integer;
    miArrayPrueba arrayDeFilas;
begin
    dbms_output.put_line ('comienza');
    select * into miArrayPrueba(1) from dept where dept_no = 10;
    select * into miArrayPrueba(2) from dept where dept_no =20;
    select * into miArrayPrueba(3) from dept where dept_no =30;
    -- en este caso el prior devuelve el ínice que existe antes del que se haya solitado, en este caso, 
    -- el anterior del 2 es el (1). 
    dbms_output.put_line ('Este es el índice anterior al 2: ' || miArrayPrueba.prior(2));
    -- en este caso estoy consultando cual es el siguiente índice que se está usando en el array. 
    for i in 1..miArrayPrueba.count loop 
        dbms_output.put_line ('este es dept_no: ' ||miArrayPrueba(i).dept_no || ' y esto dnombre: ' || miArrayPrueba(i).dnombre);
    end loop;
end;


-- este es el mismo ejemplo pero con NEXT. 
declare
    type arrayDeFilas is table of dept%rowtype index by binary_integer;
    miArrayPrueba arrayDeFilas;
begin
    dbms_output.put_line ('comienza');
    select * into miArrayPrueba(1) from dept where dept_no = 10;
    select * into miArrayPrueba(2) from dept where dept_no =20;
    -- hay que darse cuenta de que en este caso, lo que estoy haciendo es saltarme los índices 3 y 4. 
    select * into miArrayPrueba(5) from dept where dept_no =30;
    -- en este caso el prior devuelve el ínice que existe antes del que se haya solitado, en este caso, 
    -- el anterior del 2 es el (1). 
    dbms_output.put_line ('Este es el índice siguiente al 2: ' || miArrayPrueba.next(2));
end;

-- este es un ejemplo de index by varchar(50) o tmbién llamado String. 
declare
    TYPE tablaNumeros is table of number index by varchar(50);
    miArray tablaNumeros;
begin
    dbms_output.put_line ('EMPIEZAAA. el indexado por string. ');
    miArray ('uno') := 101;
    miArray ('dos') := 999;
    miArray ('tres') := 123;
    dbms_output.put_line (miArray('uno'));
    dbms_output.put_line (miArray('dos'));
    dbms_output.put_line (miArray('tres'));
end;

--arrays estaticos. 
declare
    cursor cursorEmpelado is select apellido from emp;
    --  en este caso aunque se le está diciendo que es de tamaño máximo 20, después para el uso de cada índice, hay que usar 
    --la paabra reservada extends.  recordar que  esto es obligatorio para los varray pero que no es necesario para los table. 
    type miTipoArrayEstatico is varray (20) of emp.apellido%type;
    miArrayEmpleados miTipoArrayEstatico := miTipoArrayEstatico ();
    contador integer := 0;
begin
    dbms_output.put_line ('array estatico. ');
    dbms_output.put_line ('este es el tamaño maximo: ' || miArrayEmpleados.limit);
    for i in cursorEmpelado loop
        contador := contador + 1;
        miArrayEmpleados.extend;
        miArrayEmpleados (contador) := i.apellido;
        dbms_output.put_line ('empleado: ' || contador || ' - ' || miArrayEmpleados(contador));
    end loop;
end;

--este es el mismo ejemplo que el anteior, perinicilizando el array por completo.
declare
    cursor cursorEmpelado is select apellido from emp;
    --  en este caso aunque se le está diciendo que es de tamaño máximo 20, después para el uso de cada índice, hay que usar 
    --la paabra reservada extends.  recordar que  esto es obligatorio para los varray pero que no es necesario para los table. 
    type miTipoArrayEstatico is varray (20) of emp.apellido%type;
    miArrayEmpleados miTipoArrayEstatico := miTipoArrayEstatico ();
    contador integer := 0;
begin
    dbms_output.put_line ('array estatico. ejemplo 2. ');
    dbms_output.put_line ('este es el tamaño maximo: ' || miArrayEmpleados.limit);
    miArrayEmpleados.extend(20);
    for i in cursorEmpelado loop
        contador := contador + 1;
        miArrayEmpleados (contador) := i.apellido;
        dbms_output.put_line ('empleado: ' || contador || ' - ' || miArrayEmpleados(contador));
    end loop;
end;


-- este es un ejemplo de un array de estructuras, mezclando conceptos del tema 10 y 11.  
declare
    type tipoEmpleado is record (
        campo1 varchar2 (50), campo2 varchar2 (50), campo3 int
    );
    -- en este caso el aray lo loy a hacer con TABLE, ya que me parece más sencillo que el VARRAY. 
    type miTipoArrayDeRegistros is table of tipoEmpleado index by binary_integer;
    miArrayDeRegistros miTipoArrayDeRegistros;
    cursor cursorEmpelado is select apellido, oficio, salario from emp;
    miEntero integer := 0;

begin
    dbms_output.put_line ('hola, empieza, ejercicio 2, tema 10. ');
    for i in cursorEmpelado loop
        miEntero := miEntero + 1;
        miArrayDeRegistros (miEntero).campo1 := i.apellido;
        miArrayDeRegistros (miEntero).campo2 := i.oficio;
        miArrayDeRegistros (miEntero).campo3 := i.salario;
    end loop;
    
    dbms_output.put_line ('y aquí están los datos: ');
    
    for j in 1..miArrayDeRegistros.count loop
        dbms_output.put_line ('este es el apellido: ' || miArrayDeRegistros(j).campo1);
    end loop;
end;

-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
---tema12: trigger. 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
--1) ejemplo básico de trigger. 
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

---2) Esto va a dar ERROR, ya que el :new  y el :old, sólo se puede usar cuando el trigger tiene la sentencia for each row. 
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

-- 3) este es un ejemplo de uso del WHEN con los trigger. 
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
    dbms_output.put_line ('trigger_before_update_doctor ()---  aquí está el nuevo y viejo salario: ');
    dbms_output.put_line (:old.salario || '  -  ' || :new.salario);
end;

update doctor set salario = 350000 where doctor_no = 386;

-- 4) este es otro ejemploparecido al WHEN, pero se hace sólo con IF. 
select * from dept;
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
        --raise_application_error (-20003, 'Exception: No se admiten departamentos de Barcelona. ');
    end if;
end;

-- es mas eficiente usar el WHEN. 
insert into dept values (790, 'ventas333', 'Barcelona');

-- 5).  este ejemplo es el mismo que el anerior "trigger_before_insert_dept_controlBarcelona" sólo que se hace para comprobar que sí
-- que se puede poner 2 trigger del mismo tipo en la misma tabla, de tal forma que los dos trigger se ejecutan. 
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
        --raise_application_error (-20003, 'Exception: No se admiten departamentos de Barcelona. ');
    end if;
end;

-- 6) este es un primer ejemplo sencillo de trigger afer insert. 
drop trigger trigger_after_insert_dept_controlLocalidades;
create or replace trigger trigger_after_insert_dept_controlLocalidades
after insert
on dept
for each row
declare
begin
    dbms_output.put_line ('trigger_after_insert_dept_controlLocalidades ()---');
    dbms_output.put_line ('este es el viejo (que debería de ser NULL): ' || :old.dept_no || ' y este es el nuevo: ' || :new.dept_no); 
end;

---8/5/2025
select * from dept;

-- 7)  este es un ejemplo en el que se puede ver el uso de un SELECT dentro de un trigger, ya que esto SÍ se puede hacer cuando 
-- el trigger es BEFORE INSERT, pero es algo que no se puede hacer cuando es AFTER INSERT (esto se 
--muestra con el siguiente ejemplo). Por otro lado lo que se intenta restringir es el que dentro de la tabla dept, no 
-- existan dos filas que tengan la misma localidad. 
drop trigger tr_bi_dept_control_localidades;
create or replace trigger tr_bi_dept_control_localidades
before insert 
on DEPT
for each row
declare
    v_num number;
begin
    dbms_output.put_line('tr_bi_dept_control_localidades()--- este es el dato insertado: ' || :new.dept_no);
    dbms_output.put_line ('este es el valor del OLD, el cual debería de ser NULL:   ' || :old.dept_no);
	dbms_output.put_line (' esta es la localidad de ese departamento: ' || :new.loc);
    select count(DEPT_NO) into v_num from DEPT where UPPER(LOC)=UPPER(:new.loc);
	dbms_output.put_line ('estoy antes de insertar, esta es la cantidad de registros que tienen ese nombre de localidad: ' || v_num);
	
    if (v_num > 0) then
        dbms_output.put_line ('va a saltar a la exception. ');
        RAISE_APPLICATION_ERROR(-20001, 'Solo un departamento por ciudad ' || :new.LOC);
    end if;
end;

insert into DEPT values (121, 'MILANA', 'TERUEL');
insert into DEPT values (122, 'ventas121', 'TERUEL');
delete from dept where dept_no = '121';
delete from dept where dept_no = '122';

-- 8) este trigger hace lo mismo que el anterior, (modificar sólo la localidad) pero con update, por lo tanto es su complemento, 
--es decir, hace falta que este trigger exista, por que sino va a haber dos registros en la tabla con el mismo nombre de ciudad. 
---esto da ERROR, al parecer en esta caso también da el error de "table mutating", de la misma forma 
-- que el after insert, en el cual no se puede hacerun select dentro del trigger.  
drop trigger tr_bu_dept_controlLocalidades;
create or replace trigger tr_bu_dept_controlLocalidades
before update 
on DEPT
for each row
declare
    v_num number;
begin
    dbms_output.put_line('tr_bu_dept_controlLocalidades()--- esta es la loc vieja: ' || :old.loc || ' y este es la loc nueva: ' || :new.loc);
    select count(DEPT_NO) into v_num from DEPT  where UPPER(LOC)=UPPER(:new.loc);
    if (v_num > 0) then
        -- esto nunca se llega a ejecutar. 
        RAISE_APPLICATION_ERROR(-20001, 'Solo un departamento por ciudad ' || :new.LOC);
    end if;
end;

update dept set loc = 'Valladolid' where dept_no = 10;
update dept set loc = 'Lugo' where dept_no = 10;
update dept set loc = 'MADRID' where DEPT_NO = 10;

-- 9)  en el caso de que sea AFTER, no se puede hacer consultas sobre las tablas. 
drop trigger tr_ai_dept_control_localidades;
create or replace trigger tr_ai_dept_control_localidades
after insert 
on DEPT
for each row
declare
    v_num number;
begin
    dbms_output.put_line('tr_ai_dept_control_localidades()---');
    select count(DEPT_NO) into v_num from DEPT where UPPER(LOC)=UPPER(:new.loc);
    if (v_num > 0) then
        RAISE_APPLICATION_ERROR(-20001
        , 'Solo un departamento por ciudad ' || :new.LOC);
    end if;
end;

insert into DEPT values (121, 'MILANA', 'TERUEL');


--- 10) ejemplo de integridad referencial o relacional. 
select * from emp;
select * from dept;
drop trigger tr_bu_dept_cascade;
create or replace trigger tr_bu_dept_cascade before update on dept for each row
    when (new.dept_no <> old.dept_no)
declare
begin
    dbms_output.put_line ('tr_bu_dept_cascade()---');
    update emp set dept_no = :new.dept_no where dept_no = :old.dept_no;
end;
update dept set dept_no = 5538490 where dept_no = 30;

-- en el caso de que elimine el trigger anterior e intente ejecutarseta sentencia, lo que va a pasar es que 
-- no me va a dejar ejecutarla, ya que va a dar error de integridad. FK violated. 
update dept set dept_no = 330 where dept_no = 5538490;

--- 11) no se puede insertar un nuevo PRESIDENTE si ya existe en la tabla emp;
-- este es otro ejemplo para prácticar lógica de programación, ya que no enseña nada nuevo. 
select * from emp;
drop trigger trigger_bi_emp_noAnadirMasDeUnPresidente;
create or replace trigger trigger_bi_emp_noAnadirMasDeUnPresidente  before insert on emp for each row
declare
    miCantidadPresidentes number;
begin
    dbms_output.put_line ('trigger_bi_emp_noAnadirMasDeUnPresidente()---');
    select count (*)into miCantidadPresidentes from emp where oficio = 'PRESIDENTE';
    if (miCantidadPresidentes >= 1) and (:new.oficio = 'PRESIDENTE')then
        dbms_output.put_line ('trigger_bi_emp_noAnadirMasDeUnPresidente()--- se va a saltar  a la exception. ');
        raise_application_error (-20003, 'Exception: No se puede haber más de un presidente. ');
    end if;
end;

INSERT INTO EMP (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, COMISION, DEPT_NO)
VALUES (8000, 'Gomez', 'PRESIDENTE', NULL, TO_DATE('08-05-2025', 'DD-MM-YYYY'), 600000, NULL, 10);

INSERT INTO EMP (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, COMISION, DEPT_NO)
VALUES (8123, 'Gomez', 'PRESIDENTEAAA', NULL, TO_DATE('08-05-2025', 'DD-MM-YYYY'), 600000, NULL, 10);

INSERT INTO EMP (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, COMISION, DEPT_NO)
VALUES (8124, 'Gomez', 'PRESIDENTEAAA', NULL, TO_DATE('08-05-2025', 'DD-MM-YYYY'), 600000, NULL, 10);

delete  from emp where oficio = 'PRESIDENTE';

select * from dept;
insert into dept values (161, 'ventas161', 'MADRID');

--12) En este caso el trigger también da error de table is mutating, ya que no se puede hacer un select dentro de un trigger after update. 
drop trigger trigger_au_dept_controlLocalidades;
create or replace trigger trigger_au_dept_controlLocalidades 
after update
on dept
for each row 
declare 
    miCantidadDeLocalidades integer;
begin
    dbms_output.put_line ('trigger_au_dept_controlLocalidades ()--- esta es la vieja: ' || :old.loc || ' y esta es la nueva: ' || :new.loc);
    select count (dept_no) into miCantidadDeLocalidades from dept where upper(loc) = upper(:new.loc); 
end;


update dept set loc = 'Valladolid' where dept_no = 10;
update dept set loc = 'Lugo' where dept_no = 10;
update dept set loc = 'MADRID' where DEPT_NO = 10;

--13) jhonjames: hacer aquí el trigger bd en ela tabla dept, junto con el select, para probar el table is mutating. 
-- este trigger da error de tabla is mutating. 
drop trigger trigger_bd_emp_borrarEmpleado;
create or replace trigger trigger_bd_emp_borrarEmpleado
before delete
on emp
for each row
declare
    miCantidadAnalistas integer;
begin
    dbms_output.put_line ('trigger_bd_emp_borrarEmpleado()--- no se pueden borrar todos los analista, tiene que haber al menos uno.');
    dbms_output.put_line ('este es el que se va a borrar: ' || :old.emp_no);
    select count(emp_no) into miCantidadAnalistas from emp where oficio = 'ANALISTA';
end;

-- la solución es hacer dos trigger, uno before update y otro before update for each row, además de usar una variable global para 
--los dos trigger. 
CREATE OR REPLACE PACKAGE pkg_control_analistas AS
    v_cantidad_antes NUMBER;
END;

drop trigger trigger_bds_emp_borrarEmpleado;
CREATE OR REPLACE TRIGGER trigger_bds_emp_borrarEmpleado
    BEFORE DELETE ON emp
DECLARE
BEGIN
    dbms_output.put_line ('trigger_bds_emp_borrarEmpleado()--- ');
    SELECT COUNT(*) INTO pkg_control_analistas.v_cantidad_antes FROM   emp WHERE  oficio = 'ANALISTA';
END;

drop trigger trigger_bd_emp_borrarEmpleado;
CREATE OR REPLACE TRIGGER trigger_bd_emp_borrarEmpleado
BEFORE DELETE 
ON emp
FOR EACH ROW
BEGIN
    dbms_output.put_line ('trigger_bd_emp_borrarEmpleado()---');
    DBMS_OUTPUT.PUT_LINE('Se intenta borrar al empleado: ' || :OLD.emp_no);
    IF :OLD.oficio = 'ANALISTA' THEN
        -- Después de borrar este analista, ¿queda al menos uno?
        IF pkg_control_analistas.v_cantidad_antes - 1 = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 
                'No se puede borrar el último ANALISTA. Debe quedar al menos uno.');
        END IF;
    END IF;
END;

select * from emp where oficio = 'ANALISTA';
delete from emp where emp_no = 7902;
delete from emp where emp_no = 7907;
delete from emp where emp_no = 7914;
INSERT INTO emp VALUES('7902', 'fernandez', 'ANALISTA', 7566, TO_DATE('03-12-1995', 'DD-MM-YYYY'), 390000, 0, 20);
INSERT INTO emp VALUES('7907', 'campayo', 'ANALISTA', 7919, TO_DATE('04-06-1994', 'DD-MM-YYYY'), 251000, 25000, 20);
INSERT INTO emp VALUES('7914', 'gutierrez', 'ANALISTA', 7919, TO_DATE('20-10-1986', 'DD-MM-YYYY'), 258500, 50000, 20);
select * from emp where oficio = 'ANALISTA';

--14)En este ejercicio se ve el table is mutating, pero para el afer delete. 
-- esto da eror. 
drop trigger trigger_ad_emp_borrarEmpleado;
create or replace trigger trigger_ad_emp_borrarEmpleado
after delete 
on emp
for each row
declare
    miCantidadAnalistas integer;
begin
    dbms_output.put_line ('trigger_ad_emp_borrarEmpleado()--- ');
    dbms_output.put_line ('este es el que se va a borrar: ' || :old.emp_no);
    select count(emp_no) into miCantidadAnalistas from emp where oficio = 'ANALISTA';
end;

-- esto sí que funciona. 
drop trigger trigger_ads_emp_control_analistas;
CREATE OR REPLACE TRIGGER trigger_ads_emp_control_analistas
AFTER DELETE 
ON emp
DECLARE
    v_cantidad_actual NUMBER;
BEGIN
    dbms_output.put_line ('trigger_ads_emp_control_analistas()---');
    SELECT COUNT(*) INTO v_cantidad_actual FROM   emp WHERE  oficio = 'ANALISTA';
    IF v_cantidad_actual = 0 THEN
        dbms_output.put_line ('se va a saltar al error. ');
        RAISE_APPLICATION_ERROR(-20002, 'OPERACIÓN CANCELADA: no puede quedar la empresa sin ANALISTAS');
    END IF;
END;



-- ESTE ES EL ORDEN DE EJECUCION DE LOS TRIGGERS 
-- trigger before
-- trigger before row
-- trigger after row
-- trigger after

-- jhonjames: estos son los tipos de trigger en los que tengo que estudiar el "table is mutating" ya que hay 
-- algunos en los que da este error y en otros no (recordar que esto es por hacer select dentro del trigger): 
--before insert: sí se puede. 
--after insert: NO. 
--before update: NO. 
--afeter update: NO. 
--before delete:  No.
--before delete statement: Sí. 
--after delete: No
--after delete statmente: Sí. 

--15) uso del instead of. Este es un ejemplo básico para que en vez de insetar, se imprima un mensaje.  
-- recordar en donde se pone el mensaje por consola, se puede poner otro código que se quiera ejecutar, ya que 
-- dependiendo de la ógica que se necesite se puede realizar una u otra serie de instrucciones. 
select * from dept;
create or replace view vistaDepartmentos
as
    select * from dept;
    
-- ahora se trabaja sólo con la vista. 
select * from vistaDepartmentos;

insert into vistaDepartmentos values (748, 'ventas748', 'huelva');


-- 16) este es otro ejemplo para instead of.
drop trigger trigger_insteadOfInsert_vista_dept;
create or replace trigger trigger_insteadOfInsert_vista_dept 
instead of insert  
on vistaDepartmentos 
declare
begin
    dbms_output.put_line ('trigger_insteadOfInsert_vista_dept()--- en vez de insertar, se imprime este mensaje. ');
    dbms_output.put_line ('estos son los valores:  ' || :new.dept_no || ' con: ' || :new.dnombre || ' y ' || :new.loc);
end;

insert into vistaDepartmentos values (801, 'ventas801', 'madrid801');

--- 16) crear una vista de los empleados, pero sin sus datos sensibles. 
select * from dept;
select * from emp;
create or replace view vistaEmpleadosParaElTrigger
as
    select * from emp;
    
select * from  vistaEmpleadosParaElTrigger;

insert into vistaEmpleadosParaElTrigger values (54334, 'el nuevo', 'becario', 656, '08/04/2025', 1234456, 123, 20);

drop trigger trigger_insteadof_vistaEmpleadosParaElTrigger_cancelaDatosSensibles;
create or replace trigger trigger_insteadof_vistaEmpleadosParaElTrigger_cancelaDatosSensibles
instead of insert 
on vistaEmpleadosParaElTrigger
declare
begin
    dbms_output.put_line ('trigger_insteadof_vistaEmpleadosParaElTrigger_cancelaDatosSensibles');
    INSERT INTO EMP VALUES (:NEW.EMP_NO, :NEW.APELLIDO, :NEW.OFICIO, :NEW.DIR, :new.fecha_alt, NULL, NULL, :NEW.DEPT_NO);
end;



--17) este ejercicio se complementa con otro ejercicio realizado en el tema de vistas,  en el que una vez se tenía la vista
-- miVistaHospitalDoctor, se intentaba esta consulta  insert into miVistaHospitalDoctor(hospital.hospital_cod, hospital.nombre) 
-- values (502, 'gregorio marañon502'); pero daba eror. Por lo tanto se va a usar un trigger instead of para poder insertar el registro
-- en la tabla 
select * from doctor;
select * from hospital;
select * from miVistaHospitalDoctor;

drop trigger trigger_ii_miVistaHospitalDoctor_insertarHospital;
create or replace trigger trigger_ii_miVistaHospitalDoctor_insertarHospital
instead of insert
on miVistaHospitalDoctor
declare
begin
    dbms_output.put_line ('trigger_ii_miVistaHospitalDoctor_insertarHospital()--- ');
    if (:new.doctor__doctor_no is null) then   
        dbms_output.put_line ('se va a insertar sólo en la tabla Hospital');
        insert into hospital (hospital_cod, nombre) values (:new.hospital__hospital_cod, :new.hospital__nombre);
    else
        dbms_output.put_line ('se va a insertar en las dos tablas hospital y doctor. ');
        insert into hospital (hospital_cod, nombre) values (:new.hospital__hospital_cod, :new.hospital__nombre);
        insert into doctor (doctor_no, hospital_cod, apellido) values (:new.doctor__doctor_no, :new.hospital__hospital_cod, :new.doctor__apellido);
    end if;
end;

insert into miVistaHospitalDoctor(hospital__hospital_cod, hospital__nombre) values (502, 'gregorio marañon502');
insert into miVistaHospitalDoctor values (703, 'fernandez703', 503, 'gregorio marañon503');

--- de esta forma es como se ven todos los trigger que tiene ese (¿usuario?¿base de datos?)
SELECT object_name, created, last_ddl_time, status
FROM user_objects 
WHERE object_type = 'TRIGGER'
ORDER BY object_name;

-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
--tema13: sql dinámico. 
-----+++++++++++++++++++++++++++++++++++++++++++++---------------------------
create or replace procedure miPruebaSQLinjection (parametroA varchar) as
    miSting varchar(100) := parametroA;
begin
    dbms_output.put_line ('vamos con el PLSL dinámico. ');
    execute immediate (miSting);
    dbms_output.put_line (sql%rowcount);
    dbms_output.put_line ('fin de la ejecución.');
end;


begin
    miPruebaSQLinjection ('update emp set salario = salario + 10 where dept_no = 10');
end;


select * from emp;



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

-- cosas a repasar: Type tipoEmpleados is record (campo1 varchar2 (50), campo2 varchar2 (50), campo3 int);
--type arrayDeFilas is table of dept%rowtype index by binary_integer;
--type miTipoArrayEstatico is varray (20) of emp.apellido%type;


-- así es como se comprueba en un bucle loop si el cursor explícito tiene o no más contenido:  exit when miCursor%notfound;

--- ejemplo con varray. Recordar que a la hora de inicializar una variable con este tipo, hay que ponerle como
-- el constructor, ya que si no se pone, lo que va a pasar es que cuando se intente insertar un nuevo dato (con .extend)
-- no va a dejar insertarlo, este es el ejemplo: type miTypeArrayVarray is varray(10) of integer;
-- miVariableArrayVarray miTypeArrayVarray := miTypeArrayVarray();


-- ejecutando Oracle recien instalado, esto es lo que tiene en cuenta al formato de la fecha: Formato actual de fecha (NLS_DATE_FORMAT): DD-MON-RR
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
ALTER SESSION SET plsql_warnings='ENABLE:ALL';


-- ESTE ES EL ORDEN DE EJECUCION DE LOS TRIGGERS, ya sea insert, update o delete. 
-- trigger before
-- trigger before row
-- trigger after row
-- trigger after

-- jhonjames: estos son los tipos de trigger en los que tengo que estudiar el "table is mutating" ya que hay 
-- algunos en los que da este error y en otros no (recordar que esto es por hacer select dentro del trigger): 
--before insert for each row: sí se puede. 
--after insert for each row: NO. 
--before update for each row: NO. 
--afeter update for each row: NO. 
--before delete for each row:  No.
--before delete statement: Sí. 
--after delete for each row: No
--after delete statmente: Sí. 


-- este es un ejemplo de como se tiene que usar las comillas simples cuando ya se están ocupando otras comillas simples. 
create or replace procedure miProcedureSQLdinamico (a varchar)
as 
	miNuevoString varchar(100) := a;
BEGIN
	dbms_output.put_line ('miProcedureSQLdinamico()--- este es el varchar: ' || a);
	execute immediate (miNuevoString);
	dbms_output.put_line ('esta es la cantidad de registros afectadsos. ');
	dbms_output.put_line (SQL%rowcount);
end;

BEGIN
	miProcedureSQLdinamico ('insert into dept values (125, ''ventas125'', ''madrid125'')');
end;

--- esto es un ejemplo de cómo una función sí que puede ser llamada desde  un SELECT. 
CREATE OR REPLACE FUNCTION f_suma_iva (p_importe NUMBER) 
  RETURN NUMBER 
IS
BEGIN
  RETURN p_importe * 1.21;
END;
SELECT f_suma_iva(100) FROM dual;






-- esto esun ejemplo de como funciona ACCESSIBLE BY. 
create or replace function f_calculo_impuesto  return integer ACCESSIBLE BY (pkg_finanzas)
is
begin
    dbms_output.put_line ('f_calculo_impuesto, Cálculo de impuestos...');
    return 22;
end;    

CREATE OR REPLACE PROCEDURE p_calculo_impuesto
ACCESSIBLE BY (pkg_finanzas)  -- ✅ Solo el paquete finanzas
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('p_calculo_impuesto, Cálculo de impuestos...');
END;
CREATE OR REPLACE PACKAGE pkg_finanzas IS
    PROCEDURE procesar_nomina;
END pkg_finanzas;
CREATE OR REPLACE PACKAGE BODY pkg_finanzas IS
    PROCEDURE procesar_nomina IS
        miVariable integer;
    BEGIN
        dbms_output.put_line ('pkg_finanzas, procesar_nomina()--- ');
        p_calculo_impuesto;  -- ✅ FUNCIONA
        miVariable := f_calculo_impuesto;
        dbms_output.put_line ('pkg_finanzas, procesar_nomina()--- este es el valor: ' || miVariable);
    END;
END;
--- este es el ejemplo en el que da error, y es que sólo el package es el que tiene el privilegio de 
--ejecutar la function y el procedure. 
declare
    miVariable integer; 
BEGIN
    --p_calculo_impuesto;  -- Error: PLS-00904: insufficient privilege
    miVariable := f_calculo_impuesto;
    dbms_output.put_line ('este es el valor de miVarible: ' || miVariable);
END;
-- este sí que funciona. 
begin
    pkg_finanzas.procesar_nomina;
end;



