
---- este tipo de consultas nos permiten mostrar algún resumen sobre un grupo  determinado de los datos. 
--las funciones deben d tener ALIAS.  Devuelven la información de un grupo. 

--count (*):  cuanta el número de registros incluyendo los NULL. 
--count (campo):  cuenta el número de registros sin NULL. 
--sum (numero)
--avg (numero)
--max(campo)
--min(campo)

select * from dept;
select * from emp;
select * from enfermo;
select * from doctor;
select * from hospital;
select * from sala;
select * from plantilla;

select count (*) as numeroDoctores from doctor;

--queremos el número de doáctores  y el máximo salario. 
select count(*) as doctores, max (salario) as maximo from doctor;

--los datos resultantes de las funciones podemos agruparlos.   Cuando quereos agrupar utilizamos group by despues del from. 
--truco: denenos agrupar por cada campo que no sea una función. 
--mostra cuantos doctores existen por cada espacialidad. 
select count (*) as doctores, especialidad
from doctor
group by especialidad;

--mostrar numero de peronas y máximo salario de los empleados por cada departamento y oficio. 
select count (*) as personas, max(salario), dept_no, oficio as maximoSalario from emp group by dept_no, oficio;

--filtrando en consultas de agrupacion tenemos dos posibilidades: 
--
--where: antes del group by
--having: despues del group by y para filtrar sobre el conjunto y que sean analistas o vendedores.  

--mostrar cuantos empleados tenemos por cada oficio. 
select count(*), oficio from emp group by oficio;
select count(*), oficio from emp where salario > 200000 group by oficio;


-- HAVING es mucho mejor cuando en la tabla hay 1 millon de registros, en lugar de where. 
--mostrar cuantos empleados tenemos por cada oficio  y que sean analista o vendedor. 

-- si queremos filtarr por una funcion de agrupacion, hay que hacerlo con Having. 

select count(*), oficio from emp where salario > 200000 group by oficio having oficio in ('ANALISTA', 'VENDEDOR');
select count(*), oficio from emp where salario > 200000 and oficio in ('ANALISTA', 'VENDEDOR') group by oficio;


--mostrar cuantos empleados tenemos por cada oficio solamente donde tengamos 2 o más empleados del mismo oficio. 
select count (*)  as empleados, oficio from emp group by oficio having count(*) > 2;


---Ejercicios punto 2. 
select * from emp;
--2
select max (SALARIO) as salarioMaximo, min (SALARIO) as salarioMinimo, max (SALARIO) - min (SALARIO) as diferenciaEntreSalarioMaximoYminimo from emp group by oficio having oficio ='EMPLEADO';
--4
select count (oficio), oficio from emp group by oficio;
-- 5
select count (dept_no) as numeroEmpeadosDepartamento from emp group by dept_no;
select count (dept_no) as numeroEmpeadosDepartamento from emp group by dept_no having count (dept_no) >= 4;

--7
select count (funcion), funcion from plantilla group by funcion order by funcion;
select count (*), funcion from plantilla group by funcion having funcion in('ENFERMERO', 'ENFERMERA', 'INTERINO') order by funcion;

--8
select * from emp;
select count (oficio), dept_no from emp group by dept_no;
select count (oficio), dept_no from emp group by dept_no  having count (oficio) >= 2;
select count (oficio), dept_no, oficio from emp group by dept_no, oficio having count (oficio) >= 2;

--10
select count (nombre), nombre from sala group by nombre;
select avg(num_cama), count (nombre), nombre from sala group by nombre;

--11.
select * from plantilla;
select * from plantilla where sala_cod = 6;
select avg (salario) from plantilla  where sala_cod = 6;

select  avg (salario) from plantilla group by funcion having sala_cod = 6;
select avg (salario) from plantilla group by funcion where sala_cod = 6;
select avg (salario), funcion, count(*) from plantilla group by funcion, sala_cod having sala_cod = 6;
--- en este caso ver que no hay que agrupar por sala_cod, si no que la saala tiene que ser la 6. 
select avg (salario), funcion, count(*) from plantilla  where sala_cod = 6 group by funcion;

--13.
select * from enfermo;
select count(*), sexo from enfermo group by sexo;

--15. ???
select * from sala;
select count(*), nombre  from sala group by nombre;
select count(*), hospital_cod  from sala group by hospital_cod;

---16. 
select * from plantilla;
select count (*) from plantilla group by funcion having funcion = 'ENFERMERA';
select count (*),sala_cod  from plantilla where funcion = 'ENFERMERA'   group by sala_cod;





