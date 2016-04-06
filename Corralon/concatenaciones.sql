SELECT cliente.nombre, cliente.domicilio, localidad.nombre, cliente.localidad
FROM 
	cliente 
	INNER JOIN localidad
		ON cliente.localidad = localidad.codigo
ORDER BY cliente.nombre
;


SELECT cliente.nombre, cliente.domicilio, localidad.nombre, cliente.localidad
FROM 
	cliente 
	LEFT JOIN localidad
		ON cliente.localidad = localidad.codigo
ORDER BY cliente.nombre
;


SELECT cliente.nombre, cliente.domicilio, localidad.nombre, cliente.localidad
FROM 
	cliente , localidad
WHERE cliente.localidad = localidad.codigo
ORDER BY localidad.nombre
;


SELECT p.nombre, p.precio, v.cantidad, p.precio * v.cantidad AS monto
FROM producto p
	INNER JOIN venta v
	ON p.tipo = v.tipo_producto AND p.codigo = v.codigo_producto;

SELECT p.nombre, COUNT (*) as cant_ventas, SUM (v.cantidad) AS cant_unidades, 
       SUM (p.precio * v.cantidad) AS total_ventas
FROM producto p
	INNER JOIN venta v
	ON p.tipo = v.tipo_producto AND p.codigo = v.codigo_producto
GROUP BY p.nombre
ORDER BY p.nombre;

