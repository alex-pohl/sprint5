-- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
select apellido1, apellido2, nombre from persona where tipo = 'alumno' order by apellido1, apellido2, nombre;
-- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
select apellido1, apellido2, nombre, telefono from persona where tipo = 'alumno' and telefono is null order by apellido1, apellido2, nombre;
-- Retorna el llistat dels alumnes que van néixer en 1999.
select * from persona where tipo = 'alumno'and fecha_nacimiento between '1999-01-01' and '1999-12-31';
-- Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
select * from persona where tipo = 'profesor' and telefono is null and nif like '%k';
-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
select * from asignatura where cuatrimestre = 1 and curso = 3 and id_grado = 7;
-- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
select p.apellido1, p.apellido2, p.nombre, d.nombre as departamento from profesor pf join persona p on pf.id_profesor = p.id join departamento d on pf.id_departamento = d.id order by apellido1, apellido2, nombre;
-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
select p.nif, a.nombre, ce.anyo_inicio, ce.anyo_fin from alumno_se_matricula_asignatura ama join persona p on ama.id_alumno = p.id join asignatura a on ama.id_asignatura = a.id join curso_escolar ce on ama.id_curso_escolar = ce.id where p.nif = '26902806M';
-- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
select distinct d.nombre as departamento from asignatura a join grado g on a.id_grado = g.id join profesor p on a.id_profesor = p.id_profesor join departamento d on p.id_departamento = d.id where g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
select distinct p.apellido1, p.apellido2, p.nombre from curso_escolar ce join alumno_se_matricula_asignatura ama on ce.id = ama.id_curso_escolar join persona p on p.id = ama.id_alumno where ce.anyo_fin = 2019 order by p.apellido1, p.apellido2, p.nombre;
-- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
select d.nombre as departamento, pe.apellido1, pe.apellido2, pe.nombre from profesor p left join departamento d on p.id_departamento = d.id join persona pe on p.id_profesor = pe.id order by d.nombre;
-- Retorna un llistat amb els professors/es que no estan associats a un departament.
select pe.apellido1, pe.apellido2, pe.nombre, d.nombre as departamento from persona pe join profesor pr on pr.id_profesor = pe.id left join departamento d on pr.id_departamento = d.id where d.nombre is null;
-- Retorna un llistat amb els departaments que no tenen professors/es associats.
select  d.nombre as departamento, pe.apellido1, pe.apellido2, pe.nombre from persona pe join profesor pr on pr.id_profesor = pe.id right join departamento d on pr.id_departamento = d.id where pe.nombre is null;
-- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
select a.nombre as asignatura, pe.apellido1, pe.apellido2, pe.nombre from persona pe join profesor pf on pe.id = pf.id_profesor right join asignatura a on a.id_profesor = pf.id_profesor where a.id_profesor is null;
-- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
select a.nombre as asignatura, pf.id_profesor as profesor from asignatura a left join profesor pf on a.id_profesor = pf.id_profesor where a.id_profesor is null;
-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
select d.nombre as deartamento from departamento d join profesor pf on pf.id_departamento = d.id left join asignatura a on a.id_profesor = pf.id_profesor where a.nombre is null;
-- Retorna el nombre total d'alumnes que hi ha.
select count(nombre) from persona pe where tipo = 'alumno';
-- Calcula quants alumnes van néixer en 1999.
select count(nombre) from persona pe where fecha_nacimiento like '1999%';
-- Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
select dp.nombre, count(pf.id_profesor) as num_profesores from profesor pf join departamento dp on pf.id_departamento = dp.id group by dp.id order by num_profesores desc;
-- Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
select dp.nombre, count(pf.id_profesor) as num_profesores from profesor pf right join departamento dp on pf.id_departamento = dp.id group by dp.id order by num_profesores desc;
-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
select g.nombre as grado, count(a.nombre) as num_asignaturas from grado g left join asignatura a on a.id_grado = g.id group by g.nombre order by num_asignaturas desc;
-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
select g.nombre as grado, count(a.nombre) as num_asignaturas from grado g left join asignatura a on a.id_grado = g.id group by g.nombre having count(a.nombre) >= 40;
-- Retorna totes les dades de l'alumne/a més jove.
select * from persona where tipo = 'alumno' order by fecha_nacimiento desc limit 1;

















