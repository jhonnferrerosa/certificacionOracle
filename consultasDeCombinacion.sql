


--- tablas que tengan relacion entre sí.
--Primero)  Necesitamos la columna de relación entre las tablas. 
--Segundo) Se debe poner el nombre de cada tabla y columna en la consulta. 
-- select tabla1.campo1, tabla1.campo2, tabla2.campo1, tabla2.campo2  from tabla1 inner join  tabla2 on  tabla1.columnaRelacion = tabla2.campoRelacion. 

--motrar el apellido, el oficio de empleados junto a su nombre de departamento y localidad. (Esta es más eficiente)
select emp.apellido, emp.oficio, dept.dnombre, dept.loc from emp  inner join dept  on emp.dept_no = dept.dept_no;

-- propia de oracle SQL.  No usar esta. 
select emp.apellido, emp.oficio, dept.dnombre, dept.loc from emp, dept where emp.dept_no = dept.dept_no;

-- podemos hacer nuestro porpio where. 
select emp.apellido, emp.oficio, dept.dnombre, dept.loc from emp  inner join dept  on emp.dept_no = dept.dept_no  where loc = 'MADRID';

-- no es obligatorio incluir el nombre de la tabla antes del campor a mostrar. 
select apellido, oficio, dnombre, loc from emp  inner join dept  on emp.dept_no = dept.dept_no;

-- se puede poner alias a las columnas. Cuando se pone alias, la tabla se llama así para toda la consulta. 
select e.apellido, e.oficio, d.dnombre, d.loc from emp e inner join dept d on e.dept_no = d.dept_no;

-- tenemos varios JOIN. 
-- inner: combina los resultados de las dos. 
-- left:  combina las dos tablas y tambien la tabla izquierda. 
-- right: combina las dos tablas y tambien la tabla derecha. 
-- full:  combina las dots tablas y fuerza las dos. 
-- cross:  que es el producto cartesiona,que es combinar cada registro de una tabla con cada uno de los de la otra

select distinct dept_no from emp;
select * from emp;
select * from dept;


INSERT INTO EMP (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, COMISION, DEPT_NO)
VALUES (8000, 'Garcia', 'EMPLEADO', NULL, TO_DATE('26-03-2025', 'DD-MM-YYYY'), 200000, NULL, NULL);

INSERT INTO EMP (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, COMISION, DEPT_NO)
VALUES (8001, 'Garcia', 'EMPLEADO', NULL, TO_DATE('26-03-2025', 'DD-MM-YYYY'), 200000, NULL, 50);

select e.apellido, e.oficio, d.dnombre, d.loc from emp e inner join dept d on e.dept_no = d.dept_no order by d.loc;

---
select emp.apellido, dept.dnombre, dept.loc from emp  inner join dept  on emp.dept_no = dept.dept_no;
-- es el de la izquierda 
select emp.apellido, dept.dnombre, dept.loc from emp  left join dept  on emp.dept_no = dept.dept_no;
-- este es el de la derecha. 
select emp.apellido, dept.dnombre, dept.loc from emp  right join dept  on emp.dept_no = dept.dept_no;
---  full. 
select emp.apellido, dept.dnombre, dept.loc from emp  full join dept  on emp.dept_no = dept.dept_no;
-----  cross. 
select emp.apellido, dept.dnombre, dept.loc from emp  cross join dept;

rollback;

--mostrar la media salarial de los doctores por hostpital.
---mostrar el nombre del hostpital. 
select * from doctor;
select avg (doctor.salario) as miMedia, hospital.nombre from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod group by hospital.nombre; 


-- quiero mostrar el numero de empleados por cada localidad. 
select * from emp;
select * from dept;

select count(*), dept.loc from emp  inner join dept  on emp.dept_no = dept.dept_no group by dept.loc;
select count(*), dept.loc from emp  right join dept  on emp.dept_no = dept.dept_no group by dept.loc;

-- lo mejor es no usar el count (*), porue cuenta tambien los null .. Pregunta de examen . 
select count(emp.emp_no), dept.loc from emp  right join dept  on emp.dept_no = dept.dept_no group by dept.loc;







