

select * from peliculas;
select * from pedidos;
select * from clientes;

drop table Pedidos;
drop table Clientes;
drop  table Peliculas;
drop table Distribuidoras;
drop table Generos;
drop table Nacionalidad;



create table Peliculas (
    idPelicula number, 
    idDistribuidor number,
    idGenero number,
    titulo varchar(50),
    idNacionalidad number, 
    argumento varchar(200),
    foto varchar(50),
    fecha_estreno date,
    actores varchar (50),
    director varchar (50),
    duracion varchar (50),
    precio number
);

create table Distribuidoras (  
    idDistribuidor number,
    distribuidor varchar(50),
    direccion varchar (50),
    email varchar (100),
    paginaWeb varchar(100),
    telefono varchar(50),
    contacto varchar (50),
    logo varchar (50)
);

create table Pedidos (
    idPedido number,
    idCliente number,
    idPelicula number, 
    cantidad number, 
    fecha date,
    precio number
);

create table Clientes (
    idCliente number, 
    nombre varchar(50),
    direccion varchar (50),
    email varchar (100),
    CPostal number,
    paginaWeb varchar(50),
    imagen_cliente varchar(50)
);

create table Generos (
    idGenero number,
    genero varchar(50)
);

create table Nacionalidad (
    idNacionalidad number,
    nacionalidad varchar(50),
    bandera varchar (50)
);


ALTER TABLE Peliculas    
ADD CONSTRAINT PK_Peliculas
PRIMARY KEY (idPelicula);

ALTER TABLE Distribuidoras
ADD CONSTRAINT PK_idDistribuidor
PRIMARY KEY (idDistribuidor);

ALTER TABLE Pedidos
ADD CONSTRAINT PK_idPedido
PRIMARY KEY (idPedido);

ALTER TABLE Clientes  
ADD CONSTRAINT PK_idCliente
PRIMARY KEY (idCliente);

ALTER TABLE Generos    
ADD CONSTRAINT PK_idGenero
PRIMARY KEY (idGenero);

ALTER TABLE Nacionalidad   
ADD CONSTRAINT PK_idNacionalidad
PRIMARY KEY (idNacionalidad);

--- aqui faltan las constrains del email, es decir los check. 


alter table Peliculas add constraint fk_Peliculas_Distribuidoras foreign key (idDistribuidor) references Distribuidoras (idDistribuidor);
alter table Peliculas add constraint fk_Peliculas_Generos foreign key (idGenero) references Generos (idGenero);
alter table Peliculas add constraint fk_Peliculas_Nacionalidad foreign key (idNacionalidad) references Nacionalidad (idNacionalidad);

alter table Pedidos add constraint fk_Pedidos_Peliculas foreign key (idPelicula) references Peliculas (idPelicula);
alter table Pedidos add constraint fk_Pedidos_Clientes foreign key (idCliente) references Clientes (idCliente);

insert into Distribuidoras values (1, 'fox', 'calle veinitres', 'www.fox.com', 'fox@gmai.com', '+1 777-666-555', 'fox SL. ', 'www.logo12345.com');
insert into Generos values (10, 'MISTERIO');
insert into Nacionalidad values (100, 'EEUU. ', 'EEUUbandera. ');

insert into peliculas values (1000, 1, 10, 'pelicula ET el marciano. ', 100, 'pelicula de extraterrestres', 'www.foto23.com', to_date('16/05/90', 'dd/mm/rr'), 'brat pit', 'brat pit', '50 minutos. ', 50);

insert into Clientes values (2000, 'ferndando ', 'calle Serrano.', 'ferndando@gmail.com', 28500, 'www.fernando33.com', 'www.fotoFernando.com');
insert into Pedidos values (3000, 2000, 1000, 3, to_date('6/05/2025','dd/mm/rr'), 100);

--ejercicio3. 
create or replace procedure procedimientoNuevoCliente (p1 number,  p2 varchar, p3 varchar,p4 varchar, p5 number, p6 varchar,p7 varchar)
as
begin
    dbms_output.put_line ('procedimientoNuevoCliente()--- ');
    insert into Clientes values (p1, p2, p3, p4, p5, p6, p7);
    dbms_output.put_line ('procedimientoNuevoCliente()--- cliente insertado. ');
end; 

insert into Clientes values (2000, 'ferndando ', 'calle Serrano.', 'ferndando@gmail.com', 28500, 'www.fernando33.com', 'www.fotoFernando.com');
begin
    procedimientoNuevoCliente (2001, 'fernando2001', 'calle serrano2001', 'ferndando@gmail.com2001', 28500, 'www.fernando.com2001', 'www.fotoFernando.com2001');
end;
--- ejercicio 4. 
create or replace function f_obtenerPrecioPeliculaPorIdPeicula (p1 number) return number
as
    v_precio number;
begin
    dbms_output.put_line ('f_obtenerPrecioPeliculaPorIdPeicula()---');
    select precio into v_precio from  Peliculas where idPelicula = p1;
    return v_precio;
end;

declare 
    miPrecio number;
begin 
    miPrecio := f_obtenerPrecioPeliculaPorIdPeicula (1000);
    dbms_output.put_line (miPrecio);
end;

--ejercicio 5. 
select * from Clientes;
create or replace procedure modificarEmailYdireccionTablaCliente
as
    v_idCliente Clientes.idCliente%TYPE;
    v_email Clientes.email%TYPE;
    v_direccion Clientes.direccion%TYPE;
begin
    dbms_output.put_line ('modificarEmailYdireccionTablaCliente ()---');
    v_idCliente := '&v_idCliente';
    v_email := '&v_email;';
    v_direccion := '&v_direccion';
    UPDATE Clientes SET email = v_email, direccion = v_direccion WHERE idCliente = v_idCliente;    
    dbms_output.put_line ('modificarEmailYdireccionTablaCliente ()--- cleite modificado. ');
end;

begin
    modificarEmailYdireccionTablaCliente;
end;


-- ejercicio 6. 
select * from Peliculas;
create or replace function f_obtenerDuracionPeliculaPorTitulo (p1 varchar) return varchar
as
    miVariable varchar(50);
begin
    dbms_output.put_line ('f_obtenerDuracionPeliculaPorTitulo()---');
    select duracion into miVariable from  Peliculas where titulo = p1;
    return miVariable;
end;

declare 
    miDuracion varchar(50);
begin 
    miDuracion := f_obtenerDuracionPeliculaPorTitulo ('pelicula ET el marciano. ');
    dbms_output.put_line (miDuracion);
end;

--- ejercicio 7. 
select * from peliculas;
create or replace view vistaPeliculas
as
    select peliculas.titulo, peliculas.fecha_estreno, peliculas.actores, peliculas.argumento, Generos.genero, Nacionalidad.nacionalidad from peliculas inner join Generos on peliculas.idGenero = Generos.idGenero
    inner join Nacionalidad on  peliculas.idNacionalidad = Nacionalidad.idNacionalidad;

select * from vistaPeliculas;

--ejercicio 8. 

declare 
    cursor miCursor is select * from  vistaPeliculas;
begin
       dbms_output.put_line ('empieza el cursor. '); 
       for i in miCursor loop 
            dbms_output.put_line ('Datos: ' || i.titulo || ' - ' || i.genero || ' - ' || i.nacionalidad);
       end loop;
end;



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

--ver todas la PDB que existen: 
SELECT name, open_mode FROM v$pdbs;

-- esta es la forma en la que puedo ver a todos los usuarios. 
SELECT username FROM dba_users ORDER BY 1;


-- Verificar PDB actual y que usuario eres . 
SELECT 
    SYS_CONTEXT('USERENV', 'CON_NAME') AS pdb_actual,
    SYS_CONTEXT('USERENV', 'SESSION_USER') AS usuario_actual
FROM dual;
-- esto es otra forma de hacerlo. 
SHOW USER
SHOW CON_NAME

-- de esta forma es como yo me conecto a una PDB específica: 
ALTER SESSION SET CONTAINER = MIORACLEPDBUNO;
ALTER SESSION SET CONTAINER = MIORACLEPDBDOS;

----+++++++++++++++++++++++++++
----+++++++++++++++++++++++++++
-- COMO SE CREA UNA NUEVA PDB Y COMO SE PUEDE USAR. INICIO. 
----+++++++++++++++++++++++++++
----+++++++++++++++++++++++++++
-- PASO1. Conéctate como SYS o como SYSTEM. 
-- la forma de conectarse como SYSTEM, es la habitual:  SYSTEM  Oracle11!! 
-- desde la consola, esta es la forma en la puedo acceder a la PLSQL como usuario "sys" en vez del clásico SYSTEM.
-- la contraseña es Oracle11!!  
sqlplus sys as sysdba

-- PASO2, así se crea la PDB. 
CREATE PLUGGABLE DATABASE MIORACLEPDBUNO
    ADMIN USER mipdbadminuno IDENTIFIED BY Oracle123
    FILE_NAME_CONVERT = ('pdbseed', 'MIORACLEPDBUNO');
CREATE PLUGGABLE DATABASE MIORACLEPDBDOS
    ADMIN USER mipdbadmindos IDENTIFIED BY Oracle123
    FILE_NAME_CONVERT = ('pdbseed', 'MIORACLEPDBDOS');
	
	
--el hecho de crear una nueva PDB, no significa que ya se pueda usar, si no que además hay que abirla, para que de esta forma podamos ejecutar consultas
-- sobre esta PDB. Para hacer esto es mejor estar como sys y en la pdb: CDB$ROOT, ya que este usuario sí que puede hacer esta modificación. 
--1º necesitamos verificar el estado, es decir, el open_mode de la PDB. Recordar que este comando localiza todas las PDB y su estado. 
-- en el caso de que sea mounted o closed, habrá que abrirla. 
SELECT name, open_mode FROM v$pdbs;
--2º así se abre, de tal forma que el open_mode (o también llamado estado) queda así: READ WRITE 
ALTER PLUGGABLE DATABASE MIORACLEPDBUNO OPEN;
ALTER PLUGGABLE DATABASE MIORACLEPDBDOS OPEN;
--3º para probar que la BBDD ya se puede usar, voy  crear esta tabla y voy a inserta un dato. 
CREATE TABLE mioraclepdbunotabla
  (dni NUMBER(9)
);
insert into mioraclepdbunotabla values (000000001);

CREATE TABLE mioraclepdbdostabla
  (dni NUMBER(9)
);
insert into mioraclepdbdostabla values (000000001);

----+++++++++++++++++++++++++++
----+++++++++++++++++++++++++++
-- COMO SE CREA UNA NUEVA PDB Y COMO SE PUEDE USAR. FIN. 
----+++++++++++++++++++++++++++
----+++++++++++++++++++++++++++

--en este punto se explica cómo puedo ekiiminarla: 
ALTER PLUGGABLE DATABASE MIORACLEPDBUNO CLOSE IMMEDIATE;
ALTER PLUGGABLE DATABASE MIORACLEPDBDOS CLOSE IMMEDIATE;
DROP PLUGGABLE DATABASE MIORACLEPDBUNO INCLUDING DATAFILES;
DROP PLUGGABLE DATABASE MIORACLEPDBDOS INCLUDING DATAFILES;

-- de desa forma es la que se crea un nuevo usuario: 
create user miusuariouno identified by miusuariounopassword;
-- de esta forma es como veo todos los usuarios. 
SELECT USERNAME FROM DBA_USERS ORDER BY USERNAME;
SELECT USERNAME, ACCOUNT_STATUS, DEFAULT_TABLESPACE FROM DBA_USERS ORDER BY USERNAME;

-- el hecho de que dos usuarios accedan a una misma PDB (base de datos), no significa que los dos puedan ver las tablas que están
-- en esa base de datos.
-- con este comando veo de todas las tablas del usuario. 
SELECT  TABLE_NAME FROM USER_TABLES order by TABLE_NAME;
-- con eso veo todas las tablas de la PDB????
SELECT TABLE_NAME FROM ALL_TABLES order by TABLE_NAME;
--- con esto veo todas las tablas de todas las bases de datos. 
SELECT table_name FROM dba_tables  order by table_name;

--si yo como usuario sys quiero ver cual es el cotenido de la tabla dept, la consulta tendría que se esta: 
select * from SYSTEM.dept;

-- ?????  de esa forma como system le puedo dar permisos a sys para que acceda a la tabla: 
GRANT SELECT ON DEPT TO SYS;
REVOKE SELECT ON DEPT FROM SYS;

--???? de esta forma le doy todos los permisos. 
GRANT ALL ON DEPT TO SYS;
REVOKE ALL ON DEPT TO SYS;

--?? ver que desde una nueva PDB no se pueden ver las tablas de otra PDB. 


--?? he visto que el usuario sys y el usuario system no tiene los mismos provilegios para crear y poner en marcha una PDB nueva, ¿pero, 
--pueden los dos hacer modificaciones de la misma forma una vez se haya creado la PDB? 


--??????????????????
-- ahora lo que quiero ver es que es lo que pasa con los usuarios y las PDB. 

--¿puedo crear y borrar usuarios desde cualquier PDB o incluso desde la CDB? 

--¿cómo puedo dar permisos a otros usuarios a una nueva PDB? debería de probar esto direcamente con las tablas.  



-- me estoy dando cuenta de que las PDB nuevas creadas, en el momento que apago y enciendo el ordenador ya cambian su estado de "read write" 
--a "mounted"


--cuidado porque dentro de una PDB, no se puede crear otra PDB. ni sys ni SYSTEM. Sól desde CDB. 


CREATE TABLE CDB$ROOTtabla
  (dni NUMBER(9)
);
insert into CDB$ROOTtabla values (000000100);
insert into CDB$ROOTtabla values (000000101);

??? jhonjames: ver  con distintos PDB e inclus con distintos propietarios cual es la diferencia entre  dba_tables y ALL_TABLES
SELECT owner, table_name FROM dba_tables  WHERE table_name = 'CDB$ROOTTABLA' ORDER BY owner;v
SELECT OWNER, TABLE_NAME FROM ALL_TABLES WHERE TABLE_NAME = 'CDB$ROOTTABLA';
SELECT  TABLE_NAME FROM USER_TABLES WHERE TABLE_NAME = 'CDB$ROOTTABLA';





