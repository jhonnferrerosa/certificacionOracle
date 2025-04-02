
select * from dept;
select * from emp;
select * from enfermo;
select * from doctor;
select * from hospital;
select * from sala;
select * from plantilla;

alter table dept add constraint pk_dept primary key (dept_no);
-- todas las restricciones del usuario .
select * from user_constraints;
--intentamos insertar un departamento repetido 
insert into dept values (10, 'repe', 'repe');
--- eliminamos la restriccion de PK de departamentos. 
alter table dept drop constraint pk_dept;

-- esto es para la prueba de UNIQUE  en el que se permite NULL.
alter table dept add constrain pk_
alter table dept add constraint unique_loc unique  (loc);


INSERT INTO DEPT (DEPT_NO, DNOMBRE, LOC) VALUES (50, 'LOGÍSTICA', 'VALENCIA');
INSERT INTO DEPT (DEPT_NO, DNOMBRE, LOC) VALUES (60, 'LOGÍSTICAaaa', 'VALENCIA');
INSERT INTO DEPT (DEPT_NO, DNOMBRE, LOC) VALUES (70, 'LOGÍSTICA', null);
INSERT INTO DEPT (DEPT_NO, DNOMBRE, LOC) VALUES (80, 'LOGÍSTICAsss', null);


--- ahora voy a ir a emleados. 
--creamos en empleado una PK para el campro emp_no
describe emp;
alter table emp add constraint pk_emp primary key (emp_no);
--crear la constraint que haga que el salario siempre sea mayor 0 igual que cero.   ch_tabla_campo. 
alter table emp add constraint ch_emp_salario_salariopositivo check (salario >= 0); 
update emp set salario = -1 where emp_no = 7782;
update emp set salario = 500 where emp_no = 7782;
alter table emp drop constraint ch_emp_salario_salariopositivo;


---ahora la tabla enfermo. 
select * from enfermo;
alter table enfermo add constraint pk_inscripcion primary key (inscripcion);
alter table enfermo drop constraint pk_inscripcion;
alter table enfermo add constraint pk_enfermo primary key (inscripcion);
alter table enfermo add constraint u_enfermo_nss unique (nss);

-- esta entra porque no se repite pk y tampoco unique. 
insert into enfermo values (666, 'fernandez', 'calle 30', '16/05/56', 'M', 1);

--- el is se usa para los valores NULL. 

--eliminamos las dos restricciones anteriores.  Porque se va a poner como PK  a inscripcion y a nss. 
alter table enfermo drop constraint pk_enfermo;
alter table enfermo drop constraint u_enfermo_nss;
alter table enfermo add constraint pk_enfermo_inscripcion_nss primary key (inscripcion, nss);
desc enfermo;



insert into enfermo values (666, 'fernandez', 'calle 30', '16/05/56', 'M', 100);

-- l foreing key va en la tabla de repetidos, es decir en el que va a muchos. 
-- creamos una relacion entre empleados y departamentos, el campo de relacion es dept_no. 
alter table emp add constraint fk_emp_dept foreign key (dept_no) references dept (dept_no);

desc dept;

select * from dept;
select * from emp;
delete from dept where loc = 'elche';
delete from emp where dept_no = 500;
alter table dept add constraint pk_dept primary key (dept_no);

insert into dept values (10, 'contabilidad', 'elche');

--insertamos en un empleado en un departamento que no existe. 
insert into emp values (111, 'nuevo', 'empleado',  7902, '02/02/95', 1,1,500);

--vamos a probar la elimincacion en cascada y set null en cascada.  El cascade es mejor no usarlo porque borra varios datos. 
delete from dept where dept_no = 10;
alter table emp drop constraint fk_emp_dept;
alter table emp add constraint fk_emp_dept foreign key (dept_no) references dept (dept_no) on delete cascade;
alter table emp add constraint fk_emp_dept foreign key (dept_no) references dept (dept_no) on delete set null;


rollback;



