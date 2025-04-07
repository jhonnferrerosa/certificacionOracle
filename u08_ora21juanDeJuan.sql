
--1.
select * from user_tables;

--2.
select * from all_tables;

--3
select * from user_tab_columns where table_name = 'EMPLOYEES' order by column_id;


--4
select * from user_constraints where table_name='EMPLOYEES';

--5
comment on table emp  is ' esto es un comentario de prueba';

--6
DROP TABLE dept2 PURGE;
DROP TABLE EMP2 PURGE;
CREATE TABLE dept2
       (id NUMBER(7),
        name VARCHAR2(25));
INSERT INTO dept2
      SELECT  department_id, department_name
      FROM    departments;
      
CREATE TABLE  emp2
  (id           NUMBER(7),
   last_name     VARCHAR2(25),
   first_name    VARCHAR2(25),
   dept_id       NUMBER(7));
ALTER TABLE emp2
      MODIFY (last_name   VARCHAR2(50));
ALTER TABLE    emp2
      ADD CONSTRAINT my_emp_id_pk PRIMARY KEY (id);
ALTER TABLE    dept2
     ADD CONSTRAINT my_dept_id_pk PRIMARY KEY(id);
ALTER TABLE emp2
      ADD CONSTRAINT my_emp_dept_id_fk
      FOREIGN KEY (dept_id) REFERENCES dept2(id);

--7
select * from user_tables;

--8 no sé porque no salen las restricciones. 
select * from user_constraints where table_name='EMP2';
select * from user_constraints where table_name='DEPT2';


--9
select * from user_objects;
SELECT * FROM all_objects WHERE object_name = 'DEPT2';
SELECT * FROM all_objects WHERE object_name = 'EMP2';



---tema 13 secuencias.   (Ya las vimos)
--como accedemos a los objetos de otros usuarios. 
--- con esto lo que se hace es acceder a tablas de otros usuarios. 
select * from u00_ora21.e;
select * from dba_users;
select * from user_sequences;


---SINONIMOS.  el hecho de que se cree un sinonimo hacia esa tabla como he hecho en el código de abajo, en el caso de que esté 
--autorizando otros usuarios acceder a mis privilegios, estos terceros usuario deben de tener permiso a los privilegios que me ha 
-- dado el segundo usuario, porque si no, no se se va a poder acceder a lo que accede el sinonimo. 
select * from u00_ora21.e;
create synonym nombreTabla for u00_ora21.e;
select * from nombreTabla;
--- es un sinonomo de nuestro esquema. 
SELECT * FROM user_synonyms;
SELECT * FROM all_synonyms;



---??? que es lo de DUAL. 
select * from sys.dual;

-- los sinonimos se usa tanbien para vistas, procedimientos, ETC.   Tambien se puede eliminar.
drop synonym nombreTabla;

-- que son los INDICES.  
select * from user_indexes;
select * from user_ind_columns;

/*
tablespace;
datafiles
segments
extends 
block
*/


--   toda fila de la tabla tiene un ROW_ID.  La estructura es la siguiente: primeros 15 caracteres  indice el data file y el número de bloque. 
select rowid, employee_id from employees;


-- hay que entender para que nos valen los rowid. 








