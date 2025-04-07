
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

--mejor no usar autoincrement.  es mejor no usar un campo identidad.  identity(1,1).   
---SECUENCIA PARA DEPARAMENTOS. 
select * from dept;
delete from dept where dept_no = 70;
create sequence seq_dept increment by 10 start with 40;

--Una secuenci no se puede modificar. 
select seq_dept.nextval as siguiente from dual;
-- no se puede acceder al current val hasta que no hemos ejecutado nextval. 
select seq_dept.currval as siguiente from dual;
-- en e caso de que lo queramos utilizar hay que llamarlo. 
insert into dept values (seq_dept.nextval, 'Recursos humano', 'avila');

SELECT TABLE_NAME
FROM USER_TABLES;

select * from hospital;
insert into hospital values (20, 'ramanCajal', 'esquerdo', '964-4264', seq_dept.nextval);


--1) una pk en hospital. 
select * from hospital;
desc hospital;
delete from hospital where num_cama = 150;
alter table hospital add constraint pk_hospital_cod primary key (hospital_cod);
create sequence seq_hospital increment by 10 start with 50;
--2) pk en doctor 
select * from doctor;
desc doctor;
alter table doctor add constraint pk_doctor_doctor_no primary key (doctor_no);
--3) relacionar doctores con hospital 
alter table doctor add constraint fk_doctor_hospital foreign key (hospital_cod) references hospital (hospital_cod) on delete cascade;
alter table doctor add constraint fk_doctor_hospital foreign key (hospital_cod) references hospital (hospital_cod);
alter table doctor drop constraint fk_doctor_hospital;
--4) las personas de la plantilla solo pueden trabajar mañana tarde o noche .
select * from plantilla;
alter table plantilla add constraint ch_plantilla_turno_solotresturno check (turno = 'T' or turno = 'M' or turno = 'N'); 
insert into plantilla values(17,2,8519,'chuko c.','ENFERMERO','T',252200);
insert into plantilla values(17,2,8519,'chuko c.','ENFERMERO','S',252200);




