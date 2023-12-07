-- Llista el nom de tots els productes que hi ha en la taula producto.
select nombre from producto;
-- Llista els noms i els preus de tots els productes de la taula producto.
select nombre, precio from producto;
-- Llista totes les columnes de la taula producto.
select * from producto;
-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
select nombre, concat(precio, '€') as EUR, concat(precio,'$') as USD from producto;
-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
select nombre as 'nom de producto', concat(precio, '€') as euros, concat(precio, '$') as dòlars from producto;
-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
select UPPER(nombre) as nombre, precio from producto;
-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
select LOWER(nombre) as nombre, precio from producto;
-- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
select nombre, upper(substring(nombre, 1,2)) as iniciales from fabricante;
-- Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
select nombre, round(precio, 0) as 'Preu Arrodonit' from producto;
-- Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
select nombre, cast(precio as unsigned) as 'Preu Truncat' from producto;
-- Llista el codi dels fabricants que tenen productes en la taula producto.
select codigo_fabricante from producto;
-- Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
select distinct codigo_fabricante from producto;
-- Llista els noms dels fabricants ordenats de manera ascendent.
select nombre from fabricante order by nombre;
-- Llista els noms dels fabricants ordenats de manera descendent.
select nombre from fabricante order by nombre desc;
-- Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
select nombre, precio from producto order by nombre, precio desc;
-- Retorna una llista amb les 5 primeres files de la taula fabricante.
select * from fabricante limit 5;
-- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
select * from fabricante limit 2 offset 3;
-- Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
select nombre, precio from producto order by precio limit 1;
-- Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
select nombre, precio from producto order by precio desc limit 1;
-- Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
select nombre from producto where codigo_fabricante = 2;
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
select p.nombre, p.precio, f.nombre as nombre_fabricante from producto p join fabricante f on p.codigo_fabricante = f.codigo;
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
select p.nombre, p.precio, f.nombre as nombre_fabricante from producto p join fabricante f on p.codigo_fabricante = f.codigo order by f.nombre;
-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
select p.codigo as codigo_producto, p.nombre, f.codigo as codigo_fabricante, f.nombre as nombre_fabricante from producto p join fabricante f on p.codigo_fabricante = f.codigo;
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
select p.nombre, p.precio, f.nombre as fabricante from producto p join fabricante f on p.codigo_fabricante = f.codigo order by p.precio limit 1;
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
select p.nombre, p.precio, f.nombre as fabricante from producto p join fabricante f on p.codigo_fabricante = f.codigo order by precio desc limit 1;
-- Retorna una llista de tots els productes del fabricant Lenovo.
select p.codigo as cod_producto, p.nombre, p.precio, f.nombre as fabricante from producto p join fabricante f on p.codigo_fabricante = f.codigo where f.nombre = 'Lenovo';
-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
select * from producto p join fabricante f on p.codigo_fabricante = f.codigo where f.nombre = 'Crucial' and p.precio > 200;
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.
select p.codigo as codigo_producto, p.nombre, p.precio, f.nombre as fabricante from producto p join fabricante f on p.codigo_fabricante = f.codigo where p.codigo_fabricante = 1 or p.codigo_fabricante = 3 or p.codigo_fabricante = 5;
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Fent servir l'operador IN.
select p.codigo as codigo_producto, p.nombre, p.precio, f.nombre as fabricante from producto p join fabricante f on p.codigo_fabricante = f.codigo where p.codigo_fabricante in (1,3,5);
-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
select p.nombre, p.precio, f.nombre as fabricante from producto p join fabricante f on p.codigo_fabricante = f.codigo where f.nombre like '%e';
-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
select p.nombre, p.precio, f.nombre as fabricante from producto p join fabricante f on p.codigo_fabricante = f.codigo where f.nombre like '%w%';
-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
select p.nombre, p.precio, f.nombre as fabricante from producto p join fabricante f on p.codigo_fabricante = f.codigo where p.precio >= 180 order by p.precio desc, p.nombre;
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
select distinct f.nombre as fabricantes from producto p left join fabricante f on f.codigo = p.codigo_fabricante;
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
select f.nombre as fabricante, p.nombre as producto from fabricante f left join producto p on f.codigo = p.codigo_fabricante;
-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
select f.nombre as fabricante, p.nombre as producto from fabricante f left join producto p on f.codigo = p.codigo_fabricante where p.nombre is null;
-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
select p.nombre as producto, f.nombre as fabricante from fabricante f left join producto p on f.codigo = p.codigo_fabricante where f.nombre = 'Lenovo';
-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
select * from fabricante f left join producto p on f.codigo = p.codigo_fabricante where precio = (select max(precio) from producto where f.nombre = 'Lenovo');
-- Llista el nom del producte més car del fabricant Lenovo.
select * from fabricante f left join producto p on f.codigo = p.codigo_fabricante where f.nombre = 'Lenovo' order by p.precio desc limit 1;
-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
select p.nombre, p.precio, f.nombre as fabricante from fabricante f left join producto p on f.codigo = p.codigo_fabricante where f.nombre = 'Hewlett-Packard' order by p.precio limit 1;
-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
select * from producto where precio >= (select max(precio) from producto where codigo_fabricante = 2);
-- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
select * from producto where precio > (select avg(precio) from producto where codigo_fabricante = 1) and codigo_fabricante = 1;






















