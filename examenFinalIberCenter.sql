
--drop  table Peliculas;
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

drop table Distribuidoras;
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

--drop table Pedido;
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

--- aqui faltan las constrains del email, es decir los check. asdf 


alter table Peliculas add constraint fk_Peliculas_Distribuidoras foreign key (idDistribuidor) references Distribuidoras (idDistribuidor);
alter table Peliculas add constraint fk_Peliculas_Generos foreign key (idGenero) references Generos (idGenero);
alter table Peliculas add constraint fk_Peliculas_Nacionalidad foreign key (idNacionalidad) references Nacionalidad (idNacionalidad);

alter table Pedidos add constraint fk_Pedidos_Peliculas foreign key (idPelicula) references Peliculas (idPelicula);
alter table Pedidos add constraint fk_Pedidos_Clientes foreign key (idCliente) references Clientes (idCliente);

insert into Distribuidoras values (1, 'fox', 'calle veinitres', 'www.fox.com', 'fox@gmai.com', '+1 777-666-555', 'fox SL. ', 'www.logo12345.com');
insert into Generos values (10, 'MISTERIO');
insert into Nacionalidad values (100, 'EEUU. ', 'EEUUbandera. ');

insert into peliculas values (1000, 1, 10, 'pelicula ET el marciano. ', 100, 'pelicula de extraterrestres', 'www.foto23.com', '16/05/1990', 'brat pit', 'brat pit', '50 minutos. ', 50);

insert into Clientes values (2000, 'ferndando ', 'calle Serrano.', 'ferndando@gmail.com', 28500, 'www.fernando33.com', 'www.fotoFernando.com');
insert into Pedidos values (3000, 2000, 1000, 3, '6/05/2025', 100);


--ejercicio3. 
create or replace procedure procedimientoNuevoCliente (p1 number,  p2 varchar, p3 varchar,p4 varchar, p5 number, p6 varchar,p7 varchar)
as
begin
    dbms_output.put_line ('procedimientoNuevoCliente()--- ');
    insert into Clientes values (p1, p2, p3, p4, p5, p6, p7);
    dbms_output.put_line ('procedimientoNuevoCliente()--- cliente insertado. ');
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


select * from regiones;
select * from colegios;
select * from profesores;
select * from alumnos;
delete from colegios where cod_colegio = 10;
delete from alumnos;
select * from emp;
select * from emp where dept_no = 30;
select * from emp where dept_no = 5538490;
select * from emp where oficio = 'VENDEDOR';
select * from dept;
select * from emp_comision;


delete from dept where dept_no = 30;
update dept set dept_no = 5538490 where dept_no = 30;

select object_name from user_objects where object_type = 'TRIGGER';








