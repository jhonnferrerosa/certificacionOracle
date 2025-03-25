

--- Datos de prueba mios. 
INSERT INTO DEPT (DEPT_NO, DNOMBRE, LOC)
VALUES (50, 'INVESTIGACIÓN', 'MADRID');

--- estas son  unas consultas de pruebaa. 
select * from dept;
select * from emp;
select * from enfermo;
select * from doctor;
select * from hospital;
select * from sala;
select * from plantilla;

-- lo menjor es poner el nombre de las columnas. 

select apellido, oficio from emp;

--puede ser descendente con des. 
select apellido, oficio from emp order by apellido asc;  

select * from emp order by apellido, oficio;  

--filtrado de registros con los operadores de comparación. 
select * from emp where emp_no > 7800;

--Oracle diferencia entre Mayuscúlas y minuscúlas en sus textos.
--Todo lo que no sea un número se escribe entre comillas simples. 
--mostrar todos los empleados cuyo oficio sea director. 
select * from emp where oficio = 'DIRECTOR';
select * from emp where oficio <> 'DIRECTOR';
select * from emp where oficio != 'DIRECTOR';

--operadores relacionales. Con esto se puede hacer más de una pregunta dentro de una consulta. 
--or, and, not. 
select * from emp where dept_no = 10 and oficio = 'DIRECTOR';
select * from emp where dept_no = 10 or oficio = 'DIRECTOR';

--mostrar los empleados del departamento 10 y del 20. 
select * from emp where dept_no = 10 or dept_no =20;

--el operador between  muestra los datos entre un rango. Pero se puede usar >= y <=. 
--mostrar los empleados entre 251000 y 390000. 
select * from emp where salario between 251000 and 390000;

--mostrar todos los empleados cuyo oficio no sea el de director.  Muchas veces es mejor no usar el not para SELECT, 
-- es útil pero para los IF o sentencias de control. 
select * from emp where not oficio = 'DIRECTOR';

--aquí se muestra operadores para filtar caracteres para la búsqueda en textos.  _ un caracter cualquiera. 
--%  con esto se piede que comienze por determinado caracter. 
-- ? un caracter numérico. 
-- Mostrar los empleados cuyo apellido se comienza en s y acaben por a. 
select * from emp where APELLIDO like 's%a';

--- mostrar  todos los empleados que tengan un apellido de sólo 4 letras. 
select * from emp where APELLIDO like '____';

--para mostrar conincidencia de igualdad. 
--mostrar los empleados del departamento 10 y del 20.
select * from emp where dept_no in (10, 20);
select * from emp where not dept_no in (10, 20);   
select * from emp where dept_no not in (10, 20);  -- este es más eficiente. 

--un campo calculado es una herramienta en una consulta, sirve para generar capos que 
-- existan  en una tabla y los podemos calcular. Todos los campos calculados siempre tinen que tener ALIAS.
select (salario + comision) as total from emp;

-- en esta parte "(SALARIO + COMISION) >= 344500;"   hay que poner el cálculo no vale con el alias.  
select (salario + comision) as total from emp where (SALARIO + COMISION) >= 344500;

-- se le llama cursor al resultado de la consulta.
-- order by puede filtar sobre total, porque lo hace sobre el resultado que extrea el where, que es la difereicia 
-- entre buscar el total en el where. 
select (salario + comision) as total from emp where (SALARIO + COMISION) >= 344500 order by total;

-- la clausula distinct. se utiliza para el select. Elimina repetidos de la consulta. 
--- mostrar el oficio de los empleados. 
select distinct oficio from emp

--Ejercicios. desde el 6 hasta el 13. 
select * from enfermo where fecha_nac < '11/01/70';
select * from enfermo where fecha_nac < '11/01/70' order by inscripcion;
select * from plantilla where turno = 'T';
select * from plantilla where turno = 'N';
select *   from doctor where (salario*12) > 3000000;
--select (salario * 12) salarioTotal from plantilla;
select salario  from plantilla where salario between 200000 and 225000;
--select * from emp;
select * from emp where fecha_alt < '01/01/80' or fecha_alt > '12/12/82';
--select * from dept;
--desc dept;
select distinct DNOMBRE from dept where LOC in ('MADRID', 'BARCELONA');
--select  DNOMBRE from dept where LOC in ('MADRID', 'BARCELONA');













