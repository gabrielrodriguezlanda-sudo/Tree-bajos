USE taller_carpinteria;

SELECT * FROM Clientes;

SELECT * FROM Productos;

SELECT * FROM Productos
WHERE categoria = 'Madera';

SELECT nombre, precio, existencia
FROM Productos
WHERE existencia > 0;

SELECT * FROM Servicios;

SELECT * FROM Proveedores;

SELECT * FROM Pedidos
WHERE estado = 'Pendiente';

SELECT
    Pedidos.id_pedido,
    Clientes.nombre AS cliente,
    Pedidos.fecha,
    Pedidos.total,
    Pedidos.estado
FROM Pedidos
INNER JOIN Clientes
ON Pedidos.id_cliente = Clientes.id_cliente;

SELECT
    Detalles_pedido.id_pedido,
    Productos.nombre AS producto,
    Detalles_pedido.cantidad,
    Detalles_pedido.precio_unitario
FROM Detalles_pedido
INNER JOIN Productos
ON Detalles_pedido.id_producto = Productos.id_producto;

SELECT SUM(total) AS total_ventas
FROM Pedidos;

SELECT nombre, existencia
FROM Productos
WHERE existencia <= 15;

SELECT
    Clientes.nombre,
    COUNT(Pedidos.id_pedido) AS cantidad_pedidos
FROM Clientes
LEFT JOIN Pedidos
ON Clientes.id_cliente = Pedidos.id_cliente
GROUP BY Clientes.id_cliente, Clientes.nombre;