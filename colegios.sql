

---tabla de profesores. 

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

create sequence seq_colegios increment by 1 start with 1;


---??? en este puento para insertar en Colegio, hay que insertat en regiones. Porque uno de esos campos es clave foranea de regiones. 
INSERT INTO emp VALUES('7917', 'nino', 'VENDEDOR', 7919, TO_DATE('06-02-2004', 'DD-MM-YYYY'), 171000, 0, 20);

CREATE TABLE alumnos
  (dni VARCHAR2 (9),
  nombre VARCHAR2(50),
  apellidos VARCHAR2(50),
  fecha_ingreso date,
  fecha_naac date,
  localidad VARCHAR2 (15),
  provincia VARCHAR2 (30),
  cod_colegio integer
);


CREATE TABLE regiones
  (cod_region integer,
  regiones VARCHAR2(20)
);

create sequence seq_regiones increment by 1 start with 1000;

--restricciones relacion. 
alter table colegios add constraint pk_colegios primary key (cod_colegio);
alter table profesores add constraint fk_profesores_colegios foreign key (cod_colegio) references colegios (cod_colegio);
alter table alumnos add constraint fk_alumnos_colegios foreign key (cod_colegio) references colegios (cod_colegio);

--- valores únicos. 
alter table profesores add constraint unique_profesores_dni unique  (dni);
alter table profesores add constraint ch_profesores_dni_validacionpropiadni check (dni = '_________'); 
alter table colegios add constraint unique_colegios_unico unique  (unico);


---1.
alter table regiones add constraint pk_regiones primary key (cod_region);
alter table colegios add constraint fk_colegios_regiones foreign key (cod_region) references regiones (cod_region);

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

--8.  Queremos rellenar los datos de las tablas creadas, para ello vamos a introducir a tres alumnos en los colegios. Los datos son los siguientes:
INSERT INTO regiones (cod_region, regiones) VALUES (seq_regiones.nextval, 'Andalucía');
INSERT INTO regiones (cod_region, regiones) VALUES (seq_regiones.nextval, 'Cataluña');
INSERT INTO regiones (cod_region, regiones) VALUES (seq_regiones.nextval, 'Madrid');

select * from regiones;

INSERT INTO colegios (cod_colegio, nombre, localidad, provincia, ano_construccion, coste_onstruccion, cod_region, unico)
VALUES (seq_colegios.nextval, 'Colegio Santa María', 'Madrid', 'Madrid', TO_DATE('1980-09-01', 'YYYY-MM-DD'), 2500000, 1003, 777);

INSERT INTO colegios (cod_colegio, nombre, localidad, provincia, ano_construccion, coste_onstruccion, cod_region, unico)
VALUES (seq_colegios.nextval, 'Colegio Media', 'Alicante', 'Alicante', TO_DATE('1995-03-15', 'YYYY-MM-DD'), 1800000, 1004, 777);

INSERT INTO colegios (cod_colegio, nombre, localidad, provincia, ano_construccion, coste_onstruccion, cod_region, unico)
VALUES (seq_colegios.nextval, 'Colegio Mont', 'Barcelona', 'Barcelona', TO_DATE('2005-11-20', 'YYYY-MM-DD'), 3000000, 1005, 7777);

select * from colegios;

INSERT INTO alumnos (dni, nombre, apellidos, fecha_ingreso, fecha_naac, localidad, provincia, cod_colegio)
VALUES ('11111111A', 'Ana', 'Ortiz Ortega', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2005-01-15', 'YYYY-MM-DD'), 'Madrid', 'Madrid', 1);
INSERT INTO alumnos (dni, nombre, apellidos, fecha_ingreso, fecha_naac, localidad, provincia, cod_colegio)
VALUES ('22222222B', 'Javier', 'Chuko Palomo', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2006-05-20', 'YYYY-MM-DD'), 'Arenalesl', 'Alicante', 1);
INSERT INTO alumnos (dni, nombre, apellidos, fecha_ingreso, fecha_naac, localidad, provincia, cod_colegio)
VALUES ('33333333C', 'Miguel', 'Torres Tormo', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2007-11-10', 'YYYY-MM-DD'), 'Llobregat', 'Barcelona', 1);

INSERT INTO alumnos (dni, nombre, apellidos, fecha_ingreso, fecha_naac, localidad, provincia, cod_colegio)
VALUES ('11111111d', 'Ana', 'Ortiz Ortega', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2005-01-15', 'YYYY-MM-DD'), 'Madrid', 'Madrid', 3);
INSERT INTO alumnos (dni, nombre, apellidos, fecha_ingreso, fecha_naac, localidad, provincia, cod_colegio)
VALUES ('22222222e', 'Javier', 'Chuko Palomo', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2006-05-20', 'YYYY-MM-DD'), 'Arenalesl', 'Alicante', 3);
INSERT INTO alumnos (dni, nombre, apellidos, fecha_ingreso, fecha_naac, localidad, provincia, cod_colegio)
VALUES ('33333333f', 'Miguel', 'Torres Tormo', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2007-11-10', 'YYYY-MM-DD'), 'Llobregat', 'Barcelona', 3);


INSERT INTO alumnos (dni, nombre, apellidos, fecha_ingreso, fecha_naac, localidad, provincia, cod_colegio)
VALUES ('11111111g', 'Ana', 'Ortiz Ortega', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2005-01-15', 'YYYY-MM-DD'), 'Madrid', 'Madrid', 4);
INSERT INTO alumnos (dni, nombre, apellidos, fecha_ingreso, fecha_naac, localidad, provincia, cod_colegio)
VALUES ('22222222h', 'Javier', 'Chuko Palomo', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2006-05-20', 'YYYY-MM-DD'), 'Arenalesl', 'Alicante', 4);
INSERT INTO alumnos (dni, nombre, apellidos, fecha_ingreso, fecha_naac, localidad, provincia, cod_colegio)
VALUES ('33333333i', 'Miguel', 'Torres Tormo', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2007-11-10', 'YYYY-MM-DD'), 'Llobregat', 'Barcelona', 4);

select * from alumnos;

delete from regiones;
-- no deja borrar nada de la tabla regiones.  porque colegios tiene una forenea de regiones. 
-- para solucionarlo habria que borrar todos los colegios.
--

delete from colegios;
delete from alumnos;




--jhonjames.   7/4/2025. aqui hemos visto los diccionarios de datos. 
--CLASE DE JUAN DE JUAN. 






select * from user_tables;


--hay tablas que son del diccionario de datos. 

--??? como se hace una vista de una tabla?. 

select * from user_tables;
select * from all_tables;
select * from dba_tables;

--- el diccionario de datos est formado por tres prefijos. 
---USER  los objetos del usurario. 
---ALL   lo mismo que antes más  algunas ptras tablas en las que se tiene algún priviegio. 
---DBA  todos los objetos de la instancia. 

--- que es el muti tenant. 
--- que es la capa     CDB.    container data base. 
--- CDB  todos los objetoos de todos los contenedores si la sesion esta en el contenedor cdb$root. 
--- DBA  todos los objetos  del conteneedor en el que se encuentra la sesion. 


select * from dictionary;
select count (*) from dictionary;


-- esto lo que muestra son los índices de las tablas. 
select * from  dict  where table_name like '%IND%';

--tablas principales para consultas de desarrollo. 
--  *_objects   todos los objetos. 
-- *_tables             las tablas. 
--  *_tab_columns         colunas de las tablas.
--  *_cons_columns    columnas de restriccion. 
--   *views    vistas. 
--   *_indexes    indices  
---   *_ind_columns       
---  *_synonimus 
---   *_seqeuence

--- *_constrains    esto me permite ver las claves foraneas. 
---  *



-- en ves de describe, se puede usar  esto. 
select * from user_tab_columns where table_name = 'emp' order by column_id;

select * from user_objects;

select * from emp;

select * from user_constrains where table_name = 'emp';

select * from user_cons_columns where table_name = 'emp';

---una vista es un nobre asociado a un select. 

--  V$   esto son vistas de rendimiento. 
select * from v$session;
select * from v$instance;
select * from v$database;
select * from v$sql;


--- comentarios 
comment on table emp  is ' esto es un comentario de prueba';
select * from user_tab_comments where table_name = 'emp';




----

----------------------------------------------------------------------------------------------------------------------------------------------------------- TEMA 12
-- Diccionario de datos



select * from user_tables;

select * from employees;
select * from departments;


select * from employees;
select * from employees where employee_id=100;
select * from user_tables;
select * from all_tables;
select * from dba_tables; -- Error para un usuario no administrador
select * from cdb_tables; -- Error para un usuario no administrador

select count(*) from dba_tables;

/* Prefijos

USER_   - Los objetos del esquema (= usuario)
ALL_    - Los objetos del esqema/usuario y de otros esquemas en los que el usuario tiene algún privilegio
DBA_    - Todos los objetos de la instancia (sólo visible por los DBAs)

-- Multitenant

CDB_    - Todos los objetos de todos los contenedores si la sesión está en el contenedor: cdb$root
          Todos los objetos del contenedor en el que se encuentra la sesión, si es una PDB (Pluggable Database)
DBA_    - Todos los objetos del contenedor en el que se encuentra la sesión

Contenedor 1 > cdb$root
Contenedor 2 > pdb$seed
Contenedores 3+ > PDBs

show con_id
show con_name

-- TABLAS PRINCIPALES PARA CONSULTA/DESARROLLO
*_objects      - Toodos los objetos
*_tables       - Las tablas
*_tab_columns  - Columnas de las tablas
*_constraints  - Restricciones
*_cons_columns - Columnas de las restricciones
*_views        - Vistas
*_indexes      - Índices
*_ind_columns  - Columnas de los índices
*_synonyms     - Sinónimos
*_sequences    - Secuencias
*_tab_comments - Comentarios de las tablas
*_col_comments - Comentarios de las columnas de las tablas

*/

select * from dictionary;
select * from dict;
select * from user_objects;
select * from user_tables;
select * from user_tab_columns;
select * from user_tab_columns where table_name = 'EMPLOYEES' order by column_id;


select * from dict where table_name like '%IND%';

select * from user_tab_comments;
select * from user_col_comments;

select * from user_views;

select * from employees;
select * from user_constraints where table_name='EMPLOYEES';

select * from user_cons_columns where table_name='EMPLOYEES';

describe employees;


-- V$
-- Son vistas de rendimiento

select * from v$session;
  -- Los usuarios sin privilegios no pueden verlas


-- Comentarios

create table t1 (c1 number(3));
comment on table t1 is 'Es una tabla de prueba';
comment on column t1.c1 is 'Es la columna c1 de la tabla de prueba';

select * from user_tab_comments where table_name='T1';
select * from user_col_comments where table_name='T1';


-- como hacer la conexion a BBDD en remoto. 
--baseinfo.es
--puerto:  43657
--service name:  pdb_24029 
-- u08_ora21:   jhon james ferrerosa truque. 


--- ejercicios
--1.
select * from user_tables;

--2.
select * from all_tables;

--3
select * from user_tab_columns where table_name = 'EMPLOYEES' order by column_id;
select * from user_tab_columns where table_name = 'emp';

--4
select * from user_constraints where table_name='emp';

--5
comment on table emp  is ' esto es un comentario de prueba';

--6
-- ??? hay que correr un script que nos tiene que dar. 

--7

--8


--9



drop database baseDatosPrueba;





