


----- ejercicios 3. consultas de combinacion.  esto es un comentrio. 
--1
select * from dept;
select * from emp;
select * from emp where salario >= 300000;
select emp.apellido, emp.oficio, emp.salario, emp.dept_no, dept.dnombre from emp inner join dept on emp.dept_no = dept.dept_no where  emp.salario >= 300000;

--2.
select sala.nombre, hospital.nombre from sala inner join hospital on sala.hospital_cod = hospital.hospital_cod;
select sala.nombre as nombreSala, hospital.nombre as nombreHospital from sala inner join hospital on sala.hospital_cod = hospital.hospital_cod;

--3. 
select * from dept;
select * from emp;
select  count (*), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc;
--- en este punto hace falya que sea RIGHT porque si no no sale granada
select  count (emp.apellido), dept.loc from emp right join dept on emp.dept_no = dept.dept_no group by dept.loc;
-- puede ser que haya un apellido que sea NULL, por lo tanto hay que contar con la clave primaria. 
select  count (emp.emp_no), dept.loc from emp right join dept on emp.dept_no = dept.dept_no group by dept.loc;


---4
select  count(dept.dnombre), dept.dnombre, emp.oficio from emp inner join dept on emp.dept_no = dept.dept_no group by dept.dnombre, emp.oficio;
-- en este caso vuelve a ser mejor contar por dept_no ya que es una clve primaria la cual no puede ser nunca NULL. 
select  count(dept.dept_no), dept.dnombre, emp.oficio from emp inner join dept on emp.dept_no = dept.dept_no group by dept.dnombre, emp.oficio;

---5
select * from hospital;
select * from sala;
select count (sala.nombre), sala.nombre, hospital.nombre from sala inner join hospital on sala.hospital_cod = hospital.hospital_cod group by sala.nombre, hospital.nombre;

--6.  
select * from dept;
select * from emp;
select count (*), dept.dnombre from emp inner join dept on emp.dept_no = dept.dept_no group by dept.dnombre;
select count (*), dept.dnombre, emp.fecha_alt from emp inner join dept on emp.dept_no = dept.dept_no group by dept.dnombre;

select count (*), dept.dnombre from emp inner join dept on emp.dept_no = dept.dept_no group by dept.dnombre having emp.fecha_alt between '01/01/97' and '01/01/98';
select count (*), dept.dnombre from emp inner join dept on emp.dept_no = dept.dept_no group by dept.dnombre where emp.fecha_alt between '01/01/97' and '01/01/98';
-- recondar no hacer el COUNT (*)
select count (dept.dnombre), dept.dnombre from emp inner join dept on emp.dept_no = dept.dept_no where emp.fecha_alt >= '01/01/97' and emp.fecha_alt <= '31/12/98' group by dept.dnombre;

--7.
select * from dept;
select * from emp;
select count (*), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc;
select count (*), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc having count (*) >= 4;
select count (dept.loc), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc having count (*) >= 4;

select count (*), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc where count (*) > 4;
select count (*) as totalPersonas, dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc where totalPersonas > 4;
select count (*) as totalPersonas, dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc having totalPersonas > 4;

--8.
select avg (emp.salario), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc;
select avg (emp.salario), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no where dept.loc = 'MADRID' or dept.loc = 'SEVILLA' group by dept.loc;
select avg (emp.salario), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no where dept.loc  in ('MADRID','SEVILLA') group by dept.loc;


--9. 
select * from hospital;
select * from doctor;
select doctor.apellido, hospital.nombre, hospital.direccion, hospital.telefono from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod;


-- 10. donde ponga elche, poner sevilla. 
select * from hospital;
select * from plantilla;
select hospital.nombre, plantilla.salario from plantilla inner join hospital on plantilla.hospital_cod = hospital.hospital_cod;
select hospital.nombre, max (plantilla.salario) from plantilla inner join hospital on plantilla.hospital_cod = hospital.hospital_cod group by hospital.nombre;

--11 . SALTARSELO. 
select * from hospital;
select * from sala;
select * from plantilla;
select plantilla.apellido, plantilla.funcion, plantilla.turno, hospital.nombre, hospital.telefono from plantilla inner join hospital on plantilla.hospital_cod = hospital.hospital_cod;



SELECT 
    PLANTILLA.APELLIDO, 
    PLANTILLA.FUNCION, 
    PLANTILLA.TURNO, 
    HOSPITAL.NOMBRE AS NOMBRE_HOSPITAL, 
    HOSPITAL.TELEFONO, 
    SALA.NOMBRE AS NOMBRE_SALA
FROM 
    PLANTILLA
INNER JOIN 
    HOSPITAL ON PLANTILLA.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD
INNER JOIN 
    SALA ON PLANTILLA.HOSPITAL_COD = SALA.HOSPITAL_COD AND PLANTILLA.SALA_COD = SALA.SALA_COD;
    
    
    

--12.   ???
select * from dept;
select * from emp;
select emp.apellido, emp.oficio, emp.salario, emp.dept_no, dept.dnombre from emp inner join dept on emp.dept_no = dept.dept_no;
select count (emp.emp_no), max (emp.salario),   min (emp.salario), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no where oficio='DIRECTOR' group by dept.loc;


--13. 
select * from hospital;
select * from sala;
select  hospital.nombre, sala.nombre from sala cross join hospital;






----  8/4/2025
select * from emp;
select * from emp where oficio = 'ANALISTA';
select * from emp where LOWER(oficio) = 'analista';

--estamos poniendo valores estatios:   analista. 
-- tambien podriamos incluir valores dinámicos , por lo que tendríamos que convertir las dos comparaciones. 
select * from emp where upper (oficio) = upper ('&dato');

-- esta la posibilidad de concatenr textos en una sola columna.   con este carcter:  |||  
select apellido || oficio as descripcionapellidooficio from emp;

-- el initcap  hace que se muestre la primera letra en mayusculas. 
select apellido from emp;
select initcap(apellido) as oficioconmayuscula from emp;
select initcap(apellido || '' || oficio) from emp;
select concat ('Nuestro empleado es... ', apellido) from emp;

--- el substr    extrae una cadena de carateres
select * from emp;
select * from dual;
select substr ('florero', 1, 4) as dato from dual;
select substr ('florero', 4) as dato from dual;

select * from emp where apellido like 's%';
select substr (apellido, 1, 1) as unaletra from emp;
---  este es más eficiente que LIKE. 
select * from emp where substr (apellido, 1, 1) = 's';
select length('libro') from dual;

---mostrar los apellidos que tengan sólo 4 letras. 
select * from emp where apellido like '____';
--  este es más eficiente. 
select * from emp where length(apellido) = 4;

--- te dice el infice en el que esta ese caracter o texto dentro de la columna. 
select instr ('benito', 'n') from dual;
select * from dual where instr ('hola@gmail.com', '@') > 0;

select lpad (dept_no, 5, '$') from emp;
select rpad (dept_no, 5, '$') from emp;

select round (3.1415, 2) from dual;
select round (3.9415) from dual;
select trunc (3.9415) from dual;

-- resto, averiguar si el número es par.
SELECT MOD(99, 2) FROM dual;
SELECT MOD(88, 2) FROM dual;

--mostrar empledos cuto salario sea par. 
select * from emp;
SELECt * FROM emp where mod (salario, 2) = 0;
SELECt * FROM emp where mod (emp_no, 2) = 0;
SELECt * FROM emp where mod (emp_no, 2) = 1;

select sysdate from dual;
select sysdate + 10 from dual;
SELECT TO_DATE('08/04/25', 'DD/MM/RR') + 10 FROM DUAL;

SELECT Apellido, MONTHS_BETWEEN(SYSDATE,fecha_alt) as Meses FROM emp;

--agrega N  meses a la fecha que le digamos. 
select  add_months (sysdate, 5) from dual;

SELECT  NEXT_DAY(sysdate,'LUNES') FROM dual;
SELECT  NEXT_DAY(sysdate,2) FROM dual;

SELECT Apellido, Fecha_alt, LAST_DAY(fecha_alt) as "Último día del mes" FROM EMP;

--empleados redondeados la fecha al mes. 
select apellido, fecha_alt, round(fecha_alt, 'MM')  from emp;

select apellido, fecha_alt, trunc(fecha_alt, 'MM')  from emp;
select apellido, fecha_alt, trunc(fecha_alt, 'YY')  from emp;

--- Con esto se puede hacer el CAST a los datos. 
SELECT FECHA_ALT,TO_CHAR (FECHA_ALT, 'DD=MM=YYYY') as FORMATO from emp;
SELECT FECHA_ALT,TO_CHAR (FECHA_ALT, 'YYYY=DD=MM') as FORMATO from emp;

--formato a números. 
select to_char (7458, '0000L') as zero from dual;
select to_char (7458, '0000$') as zero from dual;

select to_char (sysdate, 'HH24:MI:SS') from dual;

-- si queremos incluir texto entre to_char y los formatos, se realiza con "" dentrode las simples. 
select to_char (sysdate, '"Hoy es "DD" de "month" de "YEAR') from dual;

--funciones de conversion. 
select '08/04/2025' from dual;
select to_date('08/04/2025') + 2 from dual;
select '12' + 2 from dual;
select to_number('12') + 2 from dual;

--funciones generales. 
---NVL  sirve para evitar los NULL y sustituirlo. 
select * from emp;
select apellido, salario, comision from emp;
--- podemos hacer que en vez de que se quede NULL, que se escriba otro valor. 
select apellido, salario + nvl(comision,0)  as totalsalriocomision from emp;

---DECODE es solo de la BBDD de Oracle, que funciona igual que el CASE. 
--mostrar el turno en palabra de mañana tarde noche de la plantilla. 
select * from plantilla;
-- en el caso de que se encuentre un valor de la tabla al que no se asocie entonces eso es para los casos 
-- en los que no se defina nada. 
select apellido, decode (turno, 'M', 'mañana', 'N', 'noche', 'T', 'tarde', 'no se he definido') as turno from plantilla;

-- quiero saber la fecha del proximo miercles que juega el Madrid. 
select next_day (sysdate, 'miércoles') from dual;
select next_day (sysdate, 'miércoles') from dual;


to_char (sysdate, 'HH24:MI:SS');


select to_char (next_day (sysdate, 'miércoles'), '"el dia "DD " juega el Madrid"') from dual;
select to_char (next_day(next_day (sysdate, 'miércoles')), '"el dia "DD " juega el Madrid"') from dual;


--9/4/2025  ejercicios de SQL. 
--1.  Mostrar todos los apellidos de los empleados en Mayúsculas
select * from emp;
select upper(apellido) from emp;

--2 Construir una consulta para que salga la fecha de hoy con el siguiente formato:
select to_char (sysdate, 'HH24:MI:SS') from dual;
select to_char (sysdate, 'dd-MM-YYYY') from dual;
select to_char (sysdate, 'day" "dd" de "month" del "YYYY') from dual;
select to_char (sysdate, 'day" "dd" de "month" del "YYYY', 'nls_date_language = ITALIAN') from dual;

--3   Queremos cambiar el departamento de Barcelona y llevarlo a Tabarnia. Para ello tenemos que saber qué empleados cambiarían de localidad y cuáles no.  
--Combinar tablas y mostrar el nombre del departamento junto a los datos del empleado.1
select * from emp inner join dept on emp.dept_no = dept.dept_no;
select emp_no, loc from emp inner join dept on emp.dept_no = dept.dept_no;
select emp_no, decode (loc, 'BARCELONA', 'se va a aTabarria', 'No se cambia de localidad') from emp inner join dept on emp.dept_no = dept.dept_no;

--4 Mirar la fecha de alta del presidente. Visualizar todos los empleados dados de alta 330 días antes que el presidente. 
select * from emp;
select emp_no, oficio, fecha_alt  from emp;
select emp_no, oficio, to_date ('17/11/05') - fecha_alt  from emp;
select emp_no, oficio, fecha_alt  from emp where fecha_alt <=  (select FECHA_ALT from emp where oficio = 'PRESIDENTE') - 330;

--5 Nos piden un informe como este:  ??? no entiendo el ejercicio. 
select * from emp;
select rpad(apellido, 13, '.'), rpad(oficio, 13, '.'), rpad (salario, 13, '.'), rpad(dept_no, 13, '.') from emp;



---6 Nos piden otro, en el que se muestren todos los empleados de la siguiente manera:
select * from emp;
select apellido, fecha_alt from emp;
select to_char (sysdate, '"Hoy es "DD" de "month" de "YEAR') from dual;
select to_char (sysdate, '""DD') from emp;
select 'el señor  ' || initcap(apellido) || ' con cargo '  || initcap(oficio) || ' se dio de alta el ' || to_char (fecha_alt, 'day"  " dd " de " month " del " YYYY') || ' en la empresa' as titulo from emp;









