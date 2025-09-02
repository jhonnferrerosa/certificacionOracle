
/*  
esto es un comentarioo 
*/


--DDL: Data Definition Language.  Create, alter y drop. 
--DCL: Data control Language. Grant, deny y revoke. 
--DML: Data Manipulation Language. Select, insert, update y delete. 
--Los nombres de variables deben empezar siempre por letras y además sólo pueden tener _#$

-- el having sólo puede buscar por las columnas que se agrupa (es decitr, sólo las que mete en el group by), o sólo puede
--buscar por consultas de agrupacion (es decir count, max, min.. )
-- el where puede buscar por el resto de columnas por las que no se agrupa, pero no puede buscar por consultas de agrupación.

-- No olvidarse de como se hace un inner join: select * from emp inner join dept on emp.dept_no = dept.dept_no;


DECLARE
  v_guid VARCHAR2(32); -- Para almacenar el GUID como una cadena hexadecimal
BEGIN
  -- Generar un identificador único usando SYS_GUID()
  v_guid := SYS_GUID();
  
  -- Mostrar el GUID generado
  DBMS_OUTPUT.PUT_LINE('Identificador único generado: ' || v_guid);
  v_guid := 333;
  DBMS_OUTPUT.PUT_LINE('Identificador único generado: ' || v_guid);
END;
/

declare
BEGIN
    dbms_output.put_line ('hola mundo');
end;


--- esto es la creación de las tablas únicamente con la clave primaria como restricción. 
DROP TABLE DEPT;
DROP TABLE EMP;
DROP TABLE HOSPITAL;
DROP TABLE SALA;
DROP TABLE DOCTOR;
DROP TABLE PLANTILLA;
DROP TABLE ENFERMO;
DROP TABLE OCUPACION;

CREATE TABLE DEPT
  (DEPT_NO NUMBER(9)
  ,DNOMBRE VARCHAR2(50)
  ,LOC VARCHAR2(50)
);

CREATE TABLE EMP
  (EMP_NO NUMBER(9)
  ,APELLIDO VARCHAR2(50)
  ,OFICIO VARCHAR2(50)
  ,DIR NUMBER(9)
  ,FECHA_ALT DATE
  ,SALARIO NUMBER(9)
  ,COMISION NUMBER(9)
  ,DEPT_NO NUMBER(9)
);

CREATE TABLE HOSPITAL(
  HOSPITAL_COD NUMBER(9)
  ,NOMBRE VARCHAR2(50)
  ,DIRECCION VARCHAR2(100),
  TELEFONO VARCHAR2(9),
  NUM_CAMA NUMBER(9)
);

CREATE TABLE SALA(
  HOSPITAL_COD NUMBER(9)
  ,SALA_COD NUMBER(9)
  ,NOMBRE VARCHAR2(60)
  ,NUM_CAMA NUMBER(9)
);

CREATE TABLE DOCTOR(
  HOSPITAL_COD NUMBER(9)
  ,DOCTOR_NO NUMBER(9)
  ,APELLIDO VARCHAR2(60)
  ,ESPECIALIDAD VARCHAR2(60),
  SALARIO NUMBER(9)
);

CREATE TABLE PLANTILLA(
  HOSPITAL_COD NUMBER(9)
  ,SALA_COD NUMBER(9)
  ,EMPLEADO_NO NUMBER(9)
  ,APELLIDO VARCHAR2(60)
  ,FUNCION VARCHAR2(60)
  ,TURNO VARCHAR2(1)
  ,SALARIO NUMBER(9)
);

CREATE TABLE ENFERMO(
  INSCRIPCION NUMBER(9)
  ,APELLIDO VARCHAR2(60)
  ,DIRECCION VARCHAR2(100)
  ,FECHA_NAC DATE
  ,SEXO VARCHAR2(1)
  ,NSS NUMBER(9)
);

CREATE TABLE OCUPACION(
  INSCRIPCION NUMBER(9)
  ,HOSPITAL_COD NUMBER(9)
  ,SALA_COD NUMBER(9)
  ,CAMA NUMBER(9)
);

ALTER TABLE EMP
ADD CONSTRAINT PK_EMP
PRIMARY KEY (EMP_NO);

ALTER TABLE DEPT
ADD CONSTRAINT PK_DEPT
PRIMARY KEY (DEPT_NO);

ALTER TABLE HOSPITAL
ADD CONSTRAINT PK_HOSPITAL
PRIMARY KEY (HOSPITAL_COD);

ALTER TABLE DOCTOR
ADD CONSTRAINT PK_DOCTOR
PRIMARY KEY (DOCTOR_NO);

ALTER TABLE PLANTILLA
ADD CONSTRAINT PK_PLANTILLA
PRIMARY KEY (EMPLEADO_NO);

ALTER TABLE ENFERMO
ADD CONSTRAINT PK_ENFERMO
PRIMARY KEY (INSCRIPCION);

insert into hospital values(19,'provincial','o donell 50','964-4264',502);
insert into hospital values(18,'general','Atocha s/n','595-3111',987);
insert into hospital values(22,'la paz','castellana 1000','923-5411',412);
insert into hospital values(45,'san carlos','ciudad universitaria','597-1500',845);
insert into hospital values(17,'ruber','juan bravo 49','914027100',217);
/
insert into sala values(19,3,'cuidados intensivos',21);
insert into sala values(19,6,'psiquiatria',67);
insert into sala values(18,3,'cuidados intensivos',10);
insert into sala values(18,4,'cardiologia',53);
insert into sala values(22,1,'recuperacion',10);
insert into sala values(22,6,'psiquiatria',118);
insert into sala values(22,2,'maternidad',34);
insert into sala values(45,4,'cardiologia',55);
insert into sala values(45,1,'recuperacion',17);
insert into sala values(45,2,'maternidad',24);
insert into sala values(17,2,'maternidad',19);
insert into sala values(17,6,'psiquiatria',20);
insert into sala values(17,3,'cuidados intensivos',21);
/
insert into plantilla values(19,6,3754,'diaz b.','ENFERMERO','T',226200);
insert into plantilla values(19,6,3106,'hernandez j.','ENFERMERO','T',275500);
insert into plantilla values(18,4,6357,'karplus w.','INTERINO','T',337900);
insert into plantilla values(22,6,1009,'higueras d.','ENFERMERA','T',200500);
insert into plantilla values(22,6,8422,'bocina g.','ENFERMERO','M',163800);
insert into plantilla values(22,2,9901,'nuñez c.','INTERINO','M',221000);
insert into plantilla values(22,1,6065,'rivera g.','ENFERMERA','N',162600);
insert into plantilla values(22,1,7379,'carlos r.','ENFERMERA','T',211900);
insert into plantilla values(45,4,1280,'amigo r.','INTERINO','N',221000);
insert into plantilla values(45,1,8526,'frank h.','ENFERMERO','T',252200);
insert into plantilla values(17,2,8519,'chuko c.','ENFERMERO','T',252200);
insert into plantilla values(17,6,8520,'palomo c.','INTERINO','M',219210);
insert into plantilla values(17,6,8521,'cortes v.','ENFERMERA','N',221200);

/
insert into doctor values(19,435,'Lopez A.','Cardiologia',350000);
insert into doctor values(18,585,'Miller G.','Ginecologia',250000);
insert into doctor values(18,982,'Cajal R','Cardiologia',290000);
insert into doctor values(22,453,'Galo C.','Pediatria',250000);
insert into doctor values(22,398,'Best K.','Urologia',150000);
insert into doctor values(22,386,'Cabeza D.','Psiquiatria',125000);
insert into doctor values(45,607,'Niqo P.','Pediatria',240000);
insert into doctor values(45,522,'Adams C.','Neurologia',450000);
insert into doctor values(17,521,'Nino P.','Neurologia',390000);
insert into doctor values(17,120,'Curro F.','Urologia',250000);
/
INSERT INTO ENFERMO VALUES(10995, 'Languia M.', 'Goya 20', TO_DATE('16-05-1956', 'DD-MM-YYYY'), 'M', 280862482);
INSERT INTO ENFERMO VALUES(18004, 'Serrano V.', 'Alcala 12', TO_DATE('21-05-1960', 'DD-MM-YYYY'), 'F', 284991452);
INSERT INTO ENFERMO VALUES(14024, 'Fernandez N.', 'Recoletos 5', TO_DATE('23-07-1967', 'DD-MM-YYYY'), 'F', 321790059);
INSERT INTO ENFERMO VALUES(36658, 'Domin S.', 'Mayor 71', TO_DATE('01-01-1942', 'DD-MM-YYYY'), 'M', 160657471);
INSERT INTO ENFERMO VALUES(38702, 'Neal R.', 'Orense 21', TO_DATE('18-07-1940', 'DD-MM-YYYY'), 'F', 380010217);
INSERT INTO ENFERMO VALUES(39217, 'Cervantes M.', 'Perón 38', TO_DATE('29-02-1952', 'DD-MM-YYYY'), 'M', 440294390);
INSERT INTO ENFERMO VALUES(59076, 'Miller G.', 'Lopez de Hoyos 2', TO_DATE('16-09-1945', 'DD-MM-YYYY'), 'F', 311969044);
INSERT INTO ENFERMO VALUES(63827, 'Ruiz P.', 'Esquerdo 103', TO_DATE('26-12-1980', 'DD-MM-YYYY'), 'M', 200973253);
INSERT INTO ENFERMO VALUES(64882, 'Fraser A.', 'Soto 3', TO_DATE('10-07-1980', 'DD-MM-YYYY'), 'F', 285201776);
INSERT INTO ENFERMO VALUES(74835, 'Benitez E.', 'Argentina 5', TO_DATE('05-10-1956', 'DD-MM-YYYY'), 'M', 154811767);
/
INSERT INTO OCUPACION VALUES(10995,19,6,1);
INSERT INTO OCUPACION VALUES(18004,19,3,2);
INSERT INTO OCUPACION VALUES(14024,19,6,3);
INSERT INTO OCUPACION VALUES(36658,18,4,1);
INSERT INTO OCUPACION VALUES(38702,18,4,2);
INSERT INTO OCUPACION VALUES(39217,22,1,1);
INSERT INTO OCUPACION VALUES(59076,22,6,2);
INSERT INTO OCUPACION VALUES(63827,22,6,3);
INSERT INTO OCUPACION VALUES(64882,22,2,1);
/
insert into dept values(10,'CONTABILIDAD','SEVILLA');
insert into dept values(20,'INVESTIGACIÓN','MADRID');
insert into dept values(30,'VENTAS','BARCELONA');
insert into dept values(40,'PRODUCCIÓN','GRANADA');
/
INSERT INTO emp VALUES('7839', 'rey', 'PRESIDENTE', NULL, TO_DATE('17-11-1995', 'DD-MM-YYYY'), 650000, NULL, 10);
INSERT INTO emp VALUES('7698', 'negro', 'DIRECTOR', 7839, TO_DATE('01-05-1995', 'DD-MM-YYYY'), 370500, 0, 30);
INSERT INTO emp VALUES('7566', 'jimenez', 'DIRECTOR', 7839, TO_DATE('02-04-1995', 'DD-MM-YYYY'), 386750, 0, 20);
INSERT INTO emp VALUES('7782', 'cerezo', 'DIRECTOR', 7839, TO_DATE('09-06-1995', 'DD-MM-YYYY'), 318500, 0, 10);
INSERT INTO emp VALUES('7499', 'arroyo', 'VENDEDOR', 7698, TO_DATE('20-02-1994', 'DD-MM-YYYY'), 208000, 39000, 30);
INSERT INTO emp VALUES('7521', 'sala', 'VENDEDOR', 7698, TO_DATE('22-02-1995', 'DD-MM-YYYY'), 162500, 65000, 30);
INSERT INTO emp VALUES('7654', 'martin', 'VENDEDOR', 7698, TO_DATE('29-07-1995', 'DD-MM-YYYY'), 162500, 182000, 30);
INSERT INTO emp VALUES('7844', 'tovar', 'VENDEDOR', 7698, TO_DATE('08-07-1995', 'DD-MM-YYYY'), 195000, 0, 30);
INSERT INTO emp VALUES('7900', 'jimeno', 'EMPLEADO', 7698, TO_DATE('03-12-1995', 'DD-MM-YYYY'), 123500, 0, 30);
INSERT INTO emp VALUES('7902', 'fernandez', 'ANALISTA', 7566, TO_DATE('03-12-1995', 'DD-MM-YYYY'), 390000, 0, 20);
INSERT INTO emp VALUES('7788', 'gil', 'ANALISTA', 7566, TO_DATE('09-11-1995', 'DD-MM-YYYY'), 390000, 0, 20);
INSERT INTO emp VALUES('7369', 'sanchez', 'EMPLEADO', 7902, TO_DATE('17-12-1994', 'DD-MM-YYYY'), 104000, 0, 20);
INSERT INTO emp VALUES('7876', 'alonso', 'EMPLEADO', 7788, TO_DATE('23-07-1995', 'DD-MM-YYYY'), 143000, 0, 20);
INSERT INTO emp VALUES('7934', 'muñoz', 'EMPLEADO', 7782, TO_DATE('23-01-1996', 'DD-MM-YYYY'), 169000, 0, 10);
INSERT INTO emp VALUES('7919', 'serra', 'DIRECTOR', 7839, TO_DATE('11-12-1997', 'DD-MM-YYYY'), 395000, 0, 20);
INSERT INTO emp VALUES('7907', 'campayo', 'ANALISTA', 7919, TO_DATE('04-06-1994', 'DD-MM-YYYY'), 251000, 25000, 20);
INSERT INTO emp VALUES('7917', 'nino', 'VENDEDOR', 7919, TO_DATE('06-02-1995', 'DD-MM-YYYY'), 171000, 0, 20);
INSERT INTO emp VALUES('7904', 'ford', 'EMPLEADO', 7907, TO_DATE('04-04-1996', 'DD-MM-YYYY'), 162500, 0, 20);
INSERT INTO emp VALUES('7914', 'gutierrez', 'ANALISTA', 7919, TO_DATE('20-10-1986', 'DD-MM-YYYY'), 258500, 50000, 20);
commit;

<<<<<<< HEAD

=======
>>>>>>> 7212cfea905fc3adf8e90b5195dda20382738e63
--En este apartado voy a poner las restricciones de clave foranea para que exista integridad referencial entre las tablas, de tal forma 
-- que queden como parece en el dibujo del modelo entidad - relación.
alter table emp add constraint fk_emp_dept foreign key (dept_no) references dept (dept_no);
alter table doctor add constraint fk_doctor_hospital foreign key (hospital_cod) references hospital (hospital_cod);
alter table sala add constraint fk_sala_hospital foreign key (hospital_cod) references hospital (hospital_cod);
alter table plantilla add constraint fk_plantilla_hospital foreign key (hospital_cod) references hospital (hospital_cod);

select * from dept;
select * from emp;
select * from hospital;
select * from sala;
select * from doctor;
select * from enfermo;
select * from ocupacion;

-- Tema 1. ejercicios 1. consultas de selección. 
--1. 
select * from emp;
--2.
select apellido, oficio, (salario * 14) from emp where comision > 100000;
--3.
select apellido, oficio, (salario * 14) from emp where (salario * 14) > 750000;
--4 
select apellido, oficio, (salario * 14) from emp where ((salario * 14)+nvl(comision,0)) > 1000000;
--5
select * from emp order by dept_no, oficio;
--6
select * from enfermo;
select * from enfermo where fecha_nac < '11/01/1970';
--7
select * from enfermo where fecha_nac < '11/01/1970' order by inscripcion;
--8
select * from plantilla;
select * from plantilla where turno = 'M';
--9
select * from plantilla where turno = 'N';
--10
select * from doctor;
select * from doctor where (salario * 12) > 3000000;
--11
select * from plantilla;
select * from plantilla where (salario*12) > 2000000 and (salario*12) < 2250000;
select * from plantilla where turno = 'M' and salario > 2000000 and salario < 2250000;
--12
select * from emp;
select * from emp where not((fecha_alt > '01/01/1980') and (fecha_alt < '12/12/1982'));
--13
select dnombre from dept where (loc = 'BARCELONA') or (loc = 'MADRID');

-- Tema1. ejercicios 2. consulta de agrupación. 
--count (*):  cuenta el número de registros incluyendo los NULL. 
--count (campo):  cuenta el número de registros sin NULL. 
--sum (numero)
--avg (numero)
--max(campo)
--min(campo)
-- HAVING es mucho mejor cuando en la tabla hay 1 millon de registros, en lugar de where. 
--mostrar cuantos empleados tenemos por cada oficio  y que sean analista o vendedor. 
-- si queremos filtarr por una funcion de agrupacion, hay que hacerlo con Having. 
select count(*), oficio from emp where salario > 200000 group by oficio having oficio in ('ANALISTA', 'VENDEDOR');
select count(*), oficio from emp where salario > 200000 and oficio in ('ANALISTA', 'VENDEDOR') group by oficio;
--mostrar cuantos empleados tenemos por cada oficio solamente donde tengamos 2 o más empleados del mismo oficio. 
select count (*)  as empleados, oficio from emp group by oficio having count(*) > 2;
-- Uso óptimo de la palabra clave IN. 
--para mostrar conincidencia de igualdad. 
--mostrar los empleados del departamento 10 y del 20.
select * from emp where dept_no in (10, 20);
select * from emp where not dept_no in (10, 20);   
select * from emp where dept_no not in (10, 20);  -- este es más eficiente. 
--1
select * from emp;
select * from emp where oficio = 'ANALISTA';
select avg (salario) from emp where oficio = 'ANALISTA';
select count (*) from emp where oficio = 'ANALISTA'; 
select avg (salario), count (*) from emp where oficio = 'ANALISTA';
select avg (salario), count (*), oficio from emp where oficio = 'ANALISTA' group by oficio;
select avg (salario), count (*), oficio from emp group by oficio having oficio = 'ANALISTA';
--2
select * from emp;
select * from emp where oficio = 'EMPLEADO';
select max(salario) as salarioMaximo, min(salario) as salarioMinimo, (max(salario) - min(salario)) as diferenciaDeSalarios  from emp where oficio = 'EMPLEADO';
select max(salario) as salarioMaximo, min(salario) as salarioMinimo, (max(salario) - min(salario)) as diferenciaDeSalarios  from emp group by oficio having oficio = 'EMPLEADO';
--3
select * from emp;
select max(salario), oficio from emp group by oficio;
--4 
select count (oficio), oficio from emp group by oficio;
--5
select * from emp;
select count (dept_no) as numeroEmpeadosDepartamento from emp group by dept_no having count (dept_no) >= 4;
--6
select * from emp;
select count (emp_no), dept_no from emp  where oficio = 'DIRECTOR' group by dept_no;
--7
select * from plantilla;
select count (empleado_no), funcion from plantilla group by funcion order by funcion;
--8
select * from emp;
select count (emp_no), oficio from emp group by oficio having count (oficio) >= 2;
select count (emp_no), oficio, dept_no from emp group by oficio, dept_no having count (oficio) >= 2;
--9
select * from emp;
select avg (salario), oficio from emp group by oficio;
select avg (salario),  max (salario) - min(salario) as difrencia, max (salario), min(salario), oficio, count (oficio)  from emp group by oficio;
--10
select * from sala;
select count (num_cama), avg(num_cama), nombre from sala group by nombre;
--11
select * from plantilla;
select avg(salario), funcion, count (empleado_no) from plantilla where sala_cod = 6 group by funcion;
--12
select * from emp;
select max (fecha_alt) as fechaReciente, oficio from emp group by oficio;
select max (fecha_alt) as fechaReciente, oficio from emp group by oficio order by max (fecha_alt) desc;
--13
select * from enfermo;
select count (sexo), sexo from enfermo group by sexo; 
--14
select * from plantilla;
select count (empleado_no), turno, avg(salario)*count(empleado_no) as sumaTotalSalario from plantilla group by turno;
select count (empleado_no), turno, funcion, avg(salario)*count(empleado_no) as sumaTotalSalario from plantilla group by turno, funcion;
select count (empleado_no), turno, funcion, sum(salario) as sumaTotalSalario from plantilla group by turno, funcion;
--15
select * from sala;
select * from hospital;
select count (sala_cod) as cantidadDeSalas, hospital_cod from sala group by hospital_cod; 
--16
select * from plantilla;
select count (empleado_no), sala_cod from plantilla group by sala_cod;
select count (empleado_no), sala_cod from plantilla where funcion = 'ENFERMERA' group by sala_cod;

-- Tema 1. ejercicios 3. consultas de combinacion.  esto es un comentario. 
--- tablas que tengan relacion entre sí.
--Primero)  Necesitamos la columna de relación entre las tablas. 
--Segundo) Se debe poner el nombre de cada tabla y columna en la consulta. 
-- select tabla1.campo1, tabla1.campo2, tabla2.campo1, tabla2.campo2  from tabla1 inner join  tabla2 on  tabla1.columnaRelacion = tabla2.campoRelacion. 
-- propia de oracle SQL.  No usar esta. 
select emp.apellido, emp.oficio, dept.dnombre, dept.loc from emp, dept where emp.dept_no = dept.dept_no;
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
--1
select * from dept;
select * from emp;
select * from emp where salario >= 300000;
select emp.apellido, emp.oficio, emp.salario, emp.dept_no, dept.dnombre from emp inner join dept on emp.dept_no = dept.dept_no where  emp.salario >= 300000;

--2.
select * from sala;
select sala.nombre, hospital.nombre from sala inner join hospital on sala.hospital_cod = hospital.hospital_cod;
---jhojames.practica:  en este punto voy a crear una sala con hosptal_cod = null, para demostrar que el INNER JOIN, no saca las filas en las que no coincidan la 
-- columna foranea y la columna original. 
insert into sala values(null,3,'Prueba,,cuidados intensivos',21);
select sala.nombre as nombreSala, hospital.nombre as nombreHospital from sala inner join hospital on sala.hospital_cod = hospital.hospital_cod;

---Recordar que en los JOIN.  el LEFT, es para la tabla que está en el from, y el right, es para la otra. 
--3. 
select * from dept;
select * from emp;
select  count (*), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc;
--- en este punto hace falta que sea RIGHT porque si no no sale granada
select  count (emp.apellido), dept.loc from emp right join dept on emp.dept_no = dept.dept_no group by dept.loc;
--jhonjames.practica: voy  insertar una fila en emp, de tal forma que el apellido sea NULL, para poder hacer la demostración de la siguiente linea de código. 
INSERT INTO emp VALUES('9999', null, 'ANALISTA', 7919, TO_DATE('20-10-1986', 'DD-MM-YYYY'), 258500, 50000, 20);
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

--11 .
select * from hospital;
select * from sala;
select * from plantilla;
select plantilla.apellido, plantilla.funcion, plantilla.turno, hospital.nombre, hospital.telefono from plantilla inner join hospital on plantilla.hospital_cod = hospital.hospital_cod 
inner join sala on plantilla.hospital_cod = sala.hospital_cod and plantilla.sala_cod = sala.sala_cod;
    
--12.  
select * from dept;
select * from emp;
select emp.apellido, emp.oficio, emp.salario, emp.dept_no, dept.dnombre from emp inner join dept on emp.dept_no = dept.dept_no;
select count (emp.emp_no), max (emp.salario),   min (emp.salario), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no where oficio='DIRECTOR' group by dept.loc;

--13. 
select * from hospital;
select * from sala;
select  hospital.nombre, sala.nombre from sala cross join hospital;

--- Tema 2. Ejercicos 1. Colegios.
---tabla de profesores. 

DROP TABLE regiones;
DROP TABLE colegios;
DROP TABLE profesores;
DROP TABLE alumnos;

CREATE TABLE regiones
  (cod_region integer,
  regiones VARCHAR2(20)
);

CREATE TABLE colegios
  (cod_colegio integer,
  nombre VARCHAR2(20),
  localidad VARCHAR2(15),
  provincia VARCHAR2 (15),
  ano_construccion date,   
  coste_onstruccion integer,
  cod_region integer,
  unico integer
);

CREATE TABLE profesores
  (cod_profe VARCHAR2(3),
  nombre VARCHAR2(60),
  apellido1 VARCHAR2(50),
  apellido2 VARCHAR2(50),
  dni VARCHAR2 (9),
  edad integer,
  localidad VARCHAR2 (50),
  provincia VARCHAR2 (50),
  salario integer,
  cod_colegio integer
);

CREATE TABLE alumnos
  (dni VARCHAR2 (9),
  nombre VARCHAR2(50),
  apellidos VARCHAR2(50),
  fecha_ingreso date,
  fecha_nac date,
  localidad VARCHAR2 (15),
  provincia VARCHAR2 (30),
  cod_colegio integer
);

create sequence seq_colegios increment by 1 start with 1;
create sequence seq_regiones increment by 1 start with 1000;

select * from regiones;
select * from colegios;
select * from profesores;
select * from alumnos;

---claves primarias. 
alter table regiones add constraint pk_regiones primary key (cod_region); 
alter table colegios add constraint pk_colegios primary key (cod_colegio);
alter table profesores add constraint pk_profesores primary key (cod_profe);
alter table alumnos add constraint pk_alumnos primary key (dni);

-- claves foraneas.
alter table colegios add constraint fk_colegios_regiones foreign key (cod_region) references regiones (cod_region);
alter table profesores add constraint fk_profesores_colegios foreign key (cod_colegio) references colegios (cod_colegio);
alter table alumnos add constraint fk_alumnos_colegios foreign key (cod_colegio) references colegios (cod_colegio);

--- valores únicos. 
alter table profesores add constraint unique_profesores_dni unique  (dni);
alter table profesores add constraint ch_profesores_dni_validacionpropiadni check (dni = '_________'); 
alter table colegios add constraint unique_colegios_unico unique  (unico);

--2 Añadir el campo Sexo, Fecha de nacimiento y Estado Civil a la tabla Profesores.
alter table profesores add (sexo VARCHAR2(1));
alter table profesores add (direccion VARCHAR2(100));
alter table profesores add (fecha_nacimiento VARCHAR2(20));

--3. eliminar l edad de los profesores. 
alter table profesores drop column edad;

--4.  Añadir el campo Sexo, Dirección y Estado Civil a la tabla Alumnos.
alter table profesores add (estado_civil VARCHAR2(20));

--5.Borrar la relación existente entre la tabla profesores y Colegios.
alter table profesores drop constraint fk_profesores_colegios;

--6.  Crear de nuevo la relación borrada en el ejercicio anterior que tenga eliminación en cascada.
alter table profesores add constraint fk_profesores_colegios foreign key (cod_colegio) references colegios (cod_colegio) on delete cascade;

--7. Agregar un valor por defecto con la fecha actual al campo Fecha_Ingreso de la tabla alumnos.
alter table alumnos modify (fecha_ingreso date default '26-03-2025');
--jhonjames.practica:  aquí voy a porbar que se establezca esa fecha por defecto, para eso tengo que insertar primero en regiones, 
--- después colegios y finalmente en alumnos. 
insert into regiones values (seq_regiones.nextVal, 'Madrid. ');
insert into colegios values (seq_colegios.nextVal, 'los ángeles', 'Villalba.', 'Madrid. ', '2-04-1994',123, 1022, 789);
--- esto es para ver el valor actual de la secuencia. 
select seq_colegios.currval as siguiente from dual;
insert into alumnos values ('123456789', 'jhon', 'ferre', '26-03-2025', 'torrelodones. ', 'Madrid', 21);
INSERT INTO alumnos (dni, nombre, apellidos, fecha_nac, localidad, provincia, cod_colegio)VALUES ('123456789', 'jhon', 'ferre', TO_DATE('26-03-2025', 'DD-MM-YYYY'), 'torrelodones', 'Madrid', 21);

--8. 
INSERT INTO regiones (cod_region, regiones) VALUES (seq_regiones.nextval, 'Andalucía');
INSERT INTO regiones (cod_region, regiones) VALUES (seq_regiones.nextval, 'Cataluña');
INSERT INTO regiones (cod_region, regiones) VALUES (seq_regiones.nextval, 'Madrid');
select * from regiones;

INSERT INTO colegios (cod_colegio, nombre, localidad, provincia, ano_construccion, coste_onstruccion, cod_region, unico)
VALUES (seq_colegios.nextval, 'Colegio Santa María', 'Madrid', 'Madrid', TO_DATE('1980-09-01', 'YYYY-MM-DD'), 2500000, 1022, 777);
INSERT INTO colegios (cod_colegio, nombre, localidad, provincia, ano_construccion, coste_onstruccion, cod_region, unico)
VALUES (seq_colegios.nextval, 'Colegio Media', 'Alicante', 'Alicante', TO_DATE('1995-03-15', 'YYYY-MM-DD'), 1800000, 1023, 778);
INSERT INTO colegios (cod_colegio, nombre, localidad, provincia, ano_construccion, coste_onstruccion, cod_region, unico)
VALUES (seq_colegios.nextval, 'Colegio Mont', 'Barcelona', 'Barcelona', TO_DATE('2005-11-20', 'YYYY-MM-DD'), 3000000, 1024, 779);
select * from colegios;

INSERT INTO alumnos (dni, nombre, apellidos, fecha_nac, localidad, provincia, cod_colegio)
VALUES ('11111111A', 'Ana', 'Ortiz Ortega', TO_DATE('2005-01-15', 'YYYY-MM-DD'), 'Madrid', 'Madrid', 21);
INSERT INTO alumnos (dni, nombre, apellidos, fecha_nac, localidad, provincia, cod_colegio)
VALUES ('22222222B', 'Javier', 'Chuko Palomo', TO_DATE('2006-05-20', 'YYYY-MM-DD'), 'Arenalesl', 'Alicante', 21);
INSERT INTO alumnos (dni, nombre, apellidos, fecha_nac, localidad, provincia, cod_colegio)
VALUES ('33333333C', 'Miguel', 'Torres Tormo', TO_DATE('2007-11-10', 'YYYY-MM-DD'), 'Llobregat', 'Barcelona', 21);

INSERT INTO alumnos (dni, nombre, apellidos, fecha_nac, localidad, provincia, cod_colegio)
VALUES ('11111111d', 'Ana', 'Ortiz Ortega', TO_DATE('2005-01-15', 'YYYY-MM-DD'), 'Madrid', 'Madrid', 23);
INSERT INTO alumnos (dni, nombre, apellidos,  fecha_nac, localidad, provincia, cod_colegio)
VALUES ('22222222e', 'Javier', 'Chuko Palomo', TO_DATE('2006-05-20', 'YYYY-MM-DD'), 'Arenalesl', 'Alicante', 23);
INSERT INTO alumnos (dni, nombre, apellidos,  fecha_nac, localidad, provincia, cod_colegio)
VALUES ('33333333f', 'Miguel', 'Torres Tormo',  TO_DATE('2007-11-10', 'YYYY-MM-DD'), 'Llobregat', 'Barcelona', 23);

INSERT INTO alumnos (dni, nombre, apellidos, fecha_nac, localidad, provincia, cod_colegio)
VALUES ('11111111g', 'Ana', 'Ortiz Ortega', TO_DATE('2005-01-15', 'YYYY-MM-DD'), 'Madrid', 'Madrid', 25);
INSERT INTO alumnos (dni, nombre, apellidos,  fecha_nac, localidad, provincia, cod_colegio)
VALUES ('22222222h', 'Javier', 'Chuko Palomo', TO_DATE('2006-05-20', 'YYYY-MM-DD'), 'Arenalesl', 'Alicante', 25);
INSERT INTO alumnos (dni, nombre, apellidos,  fecha_nac, localidad, provincia, cod_colegio)
VALUES ('33333333i', 'Miguel', 'Torres Tormo',  TO_DATE('2007-11-10', 'YYYY-MM-DD'), 'Llobregat', 'Barcelona', 25);

select * from alumnos;

--- 9. 
delete from regiones;
-- no deja borrar nada de la tabla regiones.  porque colegios tiene una forenea de regiones. 
-- para solucionarlo habria que borrar todos los colegios.


--Tema 0. Clases de otro profesor llamado Juan. 
--- Esto es para ver todas las tablas que tiene ese usuario. 
select * from user_tables;
-- este es lo mismo que el anterior, pero más concreto ya que realmente lo que más importa es el nombre de las tablas de lo que queremos saber. 
SELECT TABLE_NAME FROM USER_TABLES;
--- comentario sobre una tabla. 
comment on table emp  is ' esto es un comentario de prueba';
select table_name, comments from user_tab_comments where table_name = 'EMP';


--9/4/2025  ejercicios de SQL.   Consultas con funcioes. Tema 2. Ejercicios 2. 
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
select substr ('abcdefg', 4, 2) as dato from dual;
select substr ('florero', 4) as dato from dual;
select * from emp where apellido like 's%';
select * from emp where apellido like 's%a';
select * from emp where apellido like 's??a';
select * from emp where apellido like 's__a';
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
SELECt * FROM emp where mod (emp_no, 2) = 1;
select sysdate from dual;
select sysdate + 10 from dual;
SELECT TO_DATE('08/04/25', 'DD/MM/RR') + 10 FROM DUAL;
SELECT TO_DATE('08/04/2025', 'DD/MM/YYYY') + 10 FROM DUAL;
SELECT Apellido, MONTHS_BETWEEN(SYSDATE,fecha_alt) as Meses FROM emp;
--agrega N  meses a la fecha que le digamos. 
select  add_months (sysdate, 5) from dual;
SELECT  NEXT_DAY(sysdate,'LUNES') FROM dual;
SELECT  NEXT_DAY(sysdate,2) FROM dual;
SELECT Apellido, Fecha_alt, LAST_DAY(fecha_alt) as "Último día del mes" FROM EMP;
--empleados redondeados la fecha al mes. 
select apellido, fecha_alt, round(fecha_alt, 'MM')  from emp;
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
select to_char (next_day (sysdate, 'miércoles'), '"el dia "DD " juega el Madrid"') from dual;
select to_char (next_day(next_day (sysdate, 'miércoles')), '"el dia "DD " juega el Madrid"') from dual;
-- la clausula distinct. se utiliza para el select. Elimina repetidos de la consulta. 
--- mostrar el oficio de los empleados. 
select distinct oficio from emp;

--1.  Mostrar todos los apellidos de los empleados en Mayúsculas
select * from emp;
select upper(apellido) from emp;

--2 Construir una consulta para que salga la fecha de hoy con el siguiente formato:
select to_char (sysdate, 'HH24:MI:SS') from dual;
select to_char (sysdate, 'dd-MM-YYYY') from dual;
select to_char (sysdate, 'day" "dd" de "month" del "YYYY') as fechaDeHoy from dual;
select to_char (sysdate, 'day" "dd" de "month" del "YYYY', 'nls_date_language = ITALIAN') from dual;

--3   Queremos cambiar el departamento de Barcelona y llevarlo a Tabarnia. Para ello tenemos que saber qué empleados cambiarían de localidad y cuáles no.  
--Combinar tablas y mostrar el nombre del departamento junto a los datos del empleado.1
select * from emp inner join dept on emp.dept_no = dept.dept_no;
select emp_no, loc from emp inner join dept on emp.dept_no = dept.dept_no;
select emp_no, decode (loc, 'BARCELONA', 'se va a aTabarria', 'No se cambia de localidad') from emp inner join dept on emp.dept_no = dept.dept_no;

--4 Mirar la fecha de alta del presidente. Visualizar todos los empleados dados de alta 330 días antes que el presidente. 
select * from emp;
select emp_no, oficio, fecha_alt  from emp;
select emp_no, oficio, fecha_alt, to_date ('17/11/05') - fecha_alt  from emp;
select emp_no, oficio, fecha_alt  from emp where fecha_alt <=  (select FECHA_ALT from emp where oficio = 'PRESIDENTE') - 330;

--5 Nos piden un informe como este:  ??? no entiendo el ejercicio. 
select * from emp;
select rpad(apellido, 13, '.'), rpad(oficio, 13, '.'), rpad (salario, 13, '.'), rpad(dept_no, 13, '.') from emp;

---6 Nos piden otro, en el que se muestren todos los empleados de la siguiente manera:
select * from emp;
select apellido, fecha_alt from emp;
select to_char (sysdate, '"Hoy es "DD" de "month" de "YEAR') from dual;
select to_char (sysdate, '"este es el día:   "DD') from emp;
select 'el señor  ' || initcap(apellido) || ' con cargo '  || initcap(oficio) || ' se dio de alta el ' || to_char (fecha_alt, 'day"  " dd " de " month " del " YYYY') || ' en la empresa' as titulo from emp;


-----Más pruebas con la BBDD. 
create table prueba (identificador integer, texto10 varchar2(10), textoChar char(5));

describe prueba;
insert into prueba values (1, 'abcdefghij', 'aeiou');
insert into prueba values (2, 'aaaaaaaaaa', 'aeiou');
insert into prueba values (1, 'abcdefghijholaaaa', 'aeiou');
select * from prueba;
rollback;
drop table prueba;
-- despues de los ALTER TSBLE o DROP TABLE.  ya no funcionan los rollback. 
--alter table prueba add (nuevaColumna varchar(3) not null); 
alter table prueba add (nuevaColumna varchar(3)); 
-- esta no va a adminir NULL. 
alter table prueba add (nuevaColumnaSinNull varchar(7) not null); 
alter table prueba drop column nuevaColumna;
alter table prueba modify (nuevaColumna float);
rename prueba to prueba2;
rename prueba2 to prueba;
select * from prueba2;
-- en el caso de yo quiera eliminar registros de la forma más rápida, se haría con truncate. 
truncate table prueba;

insert into prueba values (1, 'abcdefghij', 'aeiou', 3.14);

comment on table prueba is 'esto es un comentario de la taba prueba';
select * from USER_TAB_COMMENTS;
select * from USER_TAB_COMMENTS where TABLE_NAME='PRUEBA';
select * from ALL_TAB_COMMENTS where TABLE_NAME='PRUEBA';
select * from USER_TABLES;
select * from ALL_TABLES;
--- con esto se muestra lo que le pertenece a ese usuario. 
SELECT DISTINCT OBJECT_TYPE  FROM  USER_OBJECTS;
select * from cat;

--añadimos una nueva columna llamada TEST. 
alter table prueba add (test int);
-- añadimos otra COL, pero con valores por defecto. 
alter table prueba add (testColumna2 int default -1);
insert into prueba (identificador, texto10, textochar) values (3, 'aa', 'bb');
insert into prueba (identificador, texto10, textochar, testColumna2) values (3, 'aa', 'bb', 555);
insert into prueba (identificador, texto10, textochar, testColumna2) values (4, 'cc', 'cc', null);
select * from prueba;

-- todas las restricciones del usuario .
select * from user_constraints;

-- este e un ejemplo de update. 
update emp set salario = -1 where emp_no = 7782;
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



begin
    dbms_output.put_line ('hola mundo');
end;

-- esto es una prueba de commint que hago desde Windows. 


-- esto es una prueba de commit desde Ubuntu . 

--- ahora esto vuelve a ser una prueba desde Windows. 


-- ahora otra desde Windows:  son las 6:50

---desde ubuntu, son las 2.14


-- desde windows. son las 2.22