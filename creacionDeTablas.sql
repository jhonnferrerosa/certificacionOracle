


select * from dept;
select * from emp;
select * from enfermo;
select * from doctor;
select * from hospital;
select * from sala;
select * from plantilla;

-- el varchar es de tamaño dinámico. 
create table prueba (identificador integer, texto10 varchar2(10), textoChar char(5));

describe prueba;
describe prueba2;
insert into prueba values (1, 'abcdefghij', 'aeiou');
insert into prueba values (2, 'aaaaaaaaaa', 'aeiou');
insert into prueba values (1, 'abcdefghijholaaaa', 'aeiou');
--bajo nivel, tipado null o not null y longitud. 

select * from prueba;

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


