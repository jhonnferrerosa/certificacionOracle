--SUBCONSULTAS
--Son consultas que necesitan del resultado de otra consulta para poder ser 
--ejecutadas.  No son autonomas, necesitan de algún valor.
--No importa el nivel de anidamiento de subconsultas, aunque pueden ralentizar la respuesta.
--Generan bloqueos en consultas select, lo que también ralentiza las respuestas.
--DEBEMOS INTENTAR EVITARLAS EN LA MEDIDA DE LO POSIBLE CON SELECT
--QUIERO VISUALIZAR LOS DATOS DEL EMPLEADO QUE MAS COBRA DE LA EMPRESA (EMP)
select max(SALARIO) from EMP;
--650000
select * from EMP where SALARIO=650000;
--SE EJECUTAN LAS DOS CONSULTAS A LA VEZ Y, SE ANIDA EL RESULTADO DE UNA CONSULTA 
--CON LA IGUALDAD DE LA RESPUESTA DE OTRA CONSULTA
--LAS SUBCONSULTAS VAN ENTRE PARENTESIS.
select * from EMP where SALARIO=(select max(SALARIO) from EMP);
--MOSTRAR LOS EMPLEADOS QUE TIENEN EL MISMO OFICIO QUE EL EMPLEADO gil
--Y QUE COBREN MENOS QUE jimenez
select * from EMP where OFICIO=
(select OFICIO from EMP where APELLIDO='gil')
and SALARIO < (select SALARIO from EMP where APELLIDO='jimenez');
select * from EMP where OFICIO=
(select OFICIO from EMP where APELLIDO='gil');
--MOSTRAR LOS EMPLEADOS QUE TIENEN EL MISMO OFICIO QUE EL EMPLEADO gil
--Y EL MISMO OFICIO QUE jimenez
--SI UNA SUBCONSULTA DEVUELVE MAS DE UN VALOR, SE UTILIZA EL OPERADOR IN
select * from EMP where OFICIO in
(select OFICIO from EMP where APELLIDO='gil' or APELLIDO='jimenez');
--POR SUPUESTO, PODEMOS UTILIZAR SUBCONSULTAS PARA OTRAS TABLAS
--MOSTRAR EL APELLIDO Y EL OFICIO DE LOS EMPLEADOS DEL DEPARTAMENTO DE MADRID
--EVITAR HACER ESTO SIEMPRE SI TIENEN RELACION LAS TABLAS.
select APELLIDO, OFICIO from EMP where DEPT_NO=
(select DEPT_NO from DEPT where LOC='MADRID');
--EFICIENCIA COMPLETA
select EMP.APELLIDO, EMP.OFICIO 
from EMP
inner join DEPT
on EMP.DEPT_NO=DEPT.DEPT_NO
where DEPT.LOC='MADRID';
--CONSULTAS UNION
--MUESTRAN, EN UN MISMO CURSOR, UN MISMO CONJUNTO DE RESULTADOS
--ESTAS CONSULTAS SE UTILIZAN COMO CONCEPTO, NO COMO RELACION
--DEBEMOS SEGUIR TRES NORMAS:
--1) LA PRIMERA CONSULTA ES LA JEFA
--2) TODAS LAS CONSULTAS DEBEN TENER EL MISMO NUMERO DE COLUMNAS
--3) TODAS LAS COLUMNAS DEBEN TENER EL MISMO TIPO DE DATO ENTRE SI
--EN NUESTRA BASE DE DATOS, TENEMOS DATOS DE PERSONAS EN DIFERENTES TABLAS
--EMP, PLANTILLA Y DOCTOR
select APELLIDO, OFICIO, SALARIO as SUELDO from EMP
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA
union 
select APELLIDO, ESPECIALIDAD, SALARIO from DOCTOR;
--POR SUPUESTO, PODEMOS ORDENAR SIN PROBLEMAS
--EN LAS CONSULTAS UNION DEBERIAMOS UTILIZAR SIEMPRE NUMERANDO
--COMO RECOMENDACION.  SI PONEMOS UN ALIAS, NO FUNCIONA
select APELLIDO, OFICIO, SALARIO from EMP
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA
union 
select APELLIDO, ESPECIALIDAD, SALARIO from DOCTOR
order by 2;
--order by 3;
--POR SUPUESTO, PODEMOS PERFECTAMENTE FILTRAR LOS DATOS
--DE LA CONSULTA.
--POR EJEMPLO, MOSTRAR LOS DATOS DE LAS PERSONAS QUE 
--COBREN MENOS DE 300.000
--CADA FILTRO ES AFECTADO A CADA UNA DE LAS CONSULTAS
--CADA WHERE ES INDEPENDIENTE DEL UNION
select APELLIDO, OFICIO, SALARIO from EMP
where SALARIO < 300000
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA
where SALARIO < 300000
union 
select APELLIDO, ESPECIALIDAD, SALARIO from DOCTOR
where SALARIO < 300000
order by 1;
--UNION ELIMINA LOS RESULTADOS REPETIDOS
--SI QUEREMOS REPETIDOS, DEBEMOS UTILIZAR union all
select APELLIDO, OFICIO from EMP
union all
select APELLIDO, OFICIO from EMP;
--SELECT TO SELECT
--ES UNA CONSULTA SOBRE UN CURSOR (SELECT)
--CUANDO HACEMOS UN SELECT, EN REALIDAD ESTAMOS RECUPERANDO
--DATOS DE UNA TABLA.
--ESTE TIPO DE CONSULTAS NOS PERMITEN RECUPERAR DATOS DE UN SELECT YA 
--REALIZADO, LOS WHERE Y DEMAS SE HACEN SOBRE EL CURSOR.
--SINTAXIS:
select * from 
(SELECT TABLA1.CAMPO1 as ALIAS, TABLA1.CAMPO2 from TABLA1
union
select TABLA2.CAMPO1, TABLA2.CAMPO2 from TABLA2) CONSULTA
where CONSULTA.ALIAS = 'VALOR';
--QUEREMOS MOSTRAR LOS DATOS DE TODAS LAS PERSONAS DE MI BBDD (EMP, DOCTOR, PLANTILLA)
--SOLAMENTE QUEREMOS LOS QUE COBREN MENOS SUELDO DE 300.000
select * from
(select APELLIDO, OFICIO, SALARIO as SUELDO from EMP
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA
union
select APELLIDO, ESPECIALIDAD, SALARIO from DOCTOR) CONSULTA
where CONSULTA.SUELDO < 300000;
--CONSULTAS A NIVEL DE FILA
--SON CONSULTAS CREADAS PARA DAR FORMATO A LA SALIDA DE DATOS.
--NO MODIFICAN LOS DATOS DE LA TABLA, LOS MUESTRAN DE OTRA FORMA
--SEGUN YO LO NECESITE
--VAN CON PREGUNTAS EN LA CONSULTA
--1) SINTAXIS EVALUANDO UN CAMPO IGUALDAD:
select CAMPO1, CAMPO2
, case CAMPO3
    when 'dato1' then 'valor1'
    when 'dato2' then 'valor2'
    else 'valor3'
end as ALIAS
from TABLA;
select * from PLANTILLA;
--MOSTRAMOS LOS APELLIDO DE LA PLANTILLA, PERO CON SU TURNO QUE SE VEA BIEN
--(MAÑANA, TARDE, NOCHE)
select APELLIDO, FUNCION, SALARIO
, case TURNO
    when 'T' then 'TARDE'
    when 'M' then 'MAÑANA'
    else 'NOCHE'
end as FORMATO
from PLANTILLA;

select CONSULTA.FORMATO, SUM(CONSULTA.SALARIO) from
(select APELLIDO, FUNCION, SALARIO
, case TURNO
    when 'T' then 'TARDE'
    when 'M' then 'MAÑANA'
    else 'NOCHE'
end as FORMATO
from PLANTILLA) CONSULTA
where CONSULTA.FORMATO IN ('TARDE', 'NOCHE')
GROUP BY FORMATO;
--2) EVALUAR POR UN OPERADOR (RANGO, MAYOR O MENOR, DISTINTO)
select CAMPO1, CAMPO2
, case
    when CAMPO3 <= 800 then 'RESULTADO1'
    when CAMPO3 > 800 then 'RESULTADO2'
    else 'RESULTADO3'
end as FORMATO
from TABLA;
--SALARIOS DE LA PLANTILLA
select APELLIDO, FUNCION, SALARIO
, case 
    when SALARIO >= 250000 then 'SALARIO CORRECTO'
    when SALARIO >= 170000 and SALARIO < 250000 then 'MEDIA SALARIAL'
    else 'BECARIO'
end as RANGO_SALARIAL
from PLANTILLA;

select APELLIDO, FUNCION, SALARIO
, case TURNO
    when 'T' then 'TARDE'
    when 'M' then 'MAÑANA'
end as FORMATO, TURNO
from PLANTILLA;

--1) MOSTRAR LA SUMA SALARIAL DE LOS EMPLEADOS POR SU NOMBRE DE DEPARTAMENTO
select sum(EMP.SALARIO) as SUMASALARIAL, DEPT.DNOMBRE as DEPARTAMENTO
from EMP
inner join DEPT
on EMP.DEPT_NO= DEPT.DEPT_NO
group by DEPT.DNOMBRE;
--2) MOSTRAR LA SUMA SALARIAL DE LOS DOCTORES POR SU NOMBRE DE HOSPITAL
select sum(DOCTOR.SALARIO) as SUMASALARIAL, HOSPITAL.NOMBRE as HOSPITAL
from DOCTOR
inner join HOSPITAL
on DOCTOR.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD
group by HOSPITAL.NOMBRE;
--3) ME GUSTARIA PODER VER TODO JUNTO EN UNA MISMA CONSULTA
--MOSTRAR LA SUMA SALARIAL POR HOSPITAL/DEPARTAMENTO DE TODAS LAS PERSONAS DE LA BBBDD
select sum(EMP.SALARIO) as SUMASALARIAL, DEPT.DNOMBRE as DEPARTAMENTO
from EMP
inner join DEPT
on EMP.DEPT_NO= DEPT.DEPT_NO
group by DEPT.DNOMBRE
union
select sum(DOCTOR.SALARIO), HOSPITAL.NOMBRE
from DOCTOR
inner join HOSPITAL
on DOCTOR.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD
group by HOSPITAL.NOMBRE;



































