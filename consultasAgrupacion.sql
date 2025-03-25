
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






