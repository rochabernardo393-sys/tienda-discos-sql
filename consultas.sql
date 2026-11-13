--1. Todos los discos desde el mas económico al mas caro 
SELECT titulo, anio, precio, stock
FROM discos
ORDER BY precio ASC;

--2. Discos posteriores a 1980 que cuestan menos de 22 
SELECT titulo , anio, precio
FROM discos
WHERE anio >= 1980 AND precio < 22 
ORDER BY anio;

-- 3. Cada disco con el nombre de su artista y su genero 
SELECT d.titulo,
       a.nombre AS artista,
       g.nombre AS genero,
       d.anio
FROM discos d
JOIN artistas a ON a.id = d.artista_id
JOIN generos g ON g.id = d.genero_id
ORDER BY a.nombre, d.anio;

--4. Resumen por genero : cuantos discos , precio medio y unidades en stock
SELECT g.nombre AS genero,
       COUNT(d.id) AS total_discos,
       ROUND(AVG(d.precio),2) AS precio_medio,
       SUM(d.stock) AS total_stock
FROM discos d
JOIN generos g ON g.id = d.genero_id
GROUP BY g.id, g.nombre
ORDER BY total_discos DESC;

--5. Artistas con mas de un disco en el catalogo 
SELECT a.nombre AS artista,
       COUNT(d.id) AS discos
FROM artistas a
JOIN discos d ON d.artista_id = a.id
GROUP BY a.id, a.nombre
HAVING COUNT(d.id) > 1;

-- 6. Cuanto ha gastado cada cliente 
SELECT c.nombre AS cliente,
       c.ciudad,
       COUNT(DISTINCT v.id) AS compras,
       ROUND(SUM(dv.cantidad * dv.precio_unitario),2) AS gasto_total
FROM clientes c
JOIN ventas v ON v.cliente_id = c.id
JOIN detalle_venta dv ON dv.venta_id = v.id
GROUP BY c.id, c.nombre, c.ciudad
ORDER BY gasto_total DESC;

--7. Discos que no se han vendido nunca
SELECT d.titulo,
       d.stock
FROM discos d
LEFT JOIN detalle_venta dv ON dv.disco_id = d.id
WHERE dv.disco_id IS NULL;

--8. Ingresos y número de venta de cada mes 
SELECT strftime('%Y-%m', v.fecha) AS mes,
       COUNT(DISTINCT v.id) AS ventas,
       ROUND(SUM(dv.cantidad * dv.precio_unitario),2) AS ingresos
FROM ventas v
JOIN detalle_venta dv ON dv.venta_id = v.id
GROUP BY mes
ORDER BY mes;

--9. ¿Que clientes estan registrados pero aún no han comprado nada?

SELECT c.nombre,
       c.ciudad,
       c.fecha_alta
FROM clientes c
LEFT JOIN ventas v ON v.cliente_id = c.id
WHERE v.id IS NULL 