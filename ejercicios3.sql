


----- ejercicios 3. consultas de combinacion. 
--1
select * from dept;
select * from emp;
select * from emp where salario >= 300000;
select emp.apellido, emp.oficio, emp.salario, emp.dept_no, dept.dnombre from emp inner join dept on emp.dept_no = dept.dept_no where  emp.salario >= 300000;

--2.
select sala.nombre, hospital.nombre from sala inner join hospital on sala.hospital_cod = hospital.hospital_cod;
select sala.nombre as nombreSala, hospital.nombre as nombreHospital from sala inner join hospital on sala.hospital_cod = hospital.hospital_cod;

--3. 
select * from dept;
select * from emp;
select  count (*), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc;
--- en este punto hace falya que sea RIGHT porque si no no sale granada
select  count (emp.apellido), dept.loc from emp right join dept on emp.dept_no = dept.dept_no group by dept.loc;
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
select * from dept;
select * from emp;
select count (*), dept.dnombre from emp inner join dept on emp.dept_no = dept.dept_no group by dept.dnombre;
select count (*), dept.dnombre, emp.fecha_alt from emp inner join dept on emp.dept_no = dept.dept_no group by dept.dnombre;

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

select count (*), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc where count (*) > 4;
select count (*) as totalPersonas, dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc where totalPersonas > 4;
select count (*) as totalPersonas, dept.loc from emp inner join dept on emp.dept_no = dept.dept_no group by dept.loc having totalPersonas > 4;

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

--11 . SALTARSELO. 
select * from hospital;
select * from sala;
select * from plantilla;
select plantilla.apellido, plantilla.funcion, plantilla.turno, hospital.nombre, hospital.telefono from plantilla inner join hospital on plantilla.hospital_cod = hospital.hospital_cod;



SELECT 
    PLANTILLA.APELLIDO, 
    PLANTILLA.FUNCION, 
    PLANTILLA.TURNO, 
    HOSPITAL.NOMBRE AS NOMBRE_HOSPITAL, 
    HOSPITAL.TELEFONO, 
    SALA.NOMBRE AS NOMBRE_SALA
FROM 
    PLANTILLA
INNER JOIN 
    HOSPITAL ON PLANTILLA.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD
INNER JOIN 
    SALA ON PLANTILLA.HOSPITAL_COD = SALA.HOSPITAL_COD AND PLANTILLA.SALA_COD = SALA.SALA_COD;
    
    
    

--12.   ???
select * from dept;
select * from emp;
select emp.apellido, emp.oficio, emp.salario, emp.dept_no, dept.dnombre from emp inner join dept on emp.dept_no = dept.dept_no;
select count (emp.emp_no), max (emp.salario),   min (emp.salario), dept.loc from emp inner join dept on emp.dept_no = dept.dept_no where oficio='DIRECTOR' group by dept.loc;


--13. 
select * from hospital;
select * from sala;
select  hospital.nombre, sala.nombre from sala cross join hospital;







