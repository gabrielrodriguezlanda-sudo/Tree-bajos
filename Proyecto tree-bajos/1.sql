USE taller_carpinteria;

SELECT * FROM Clientes;

INSERT INTO Clientes (nombre, telefono, correo)
VALUES
('Juan Perez', '2281234567', 'juan@gmail.com'),
('Maria Lopez', '2287654321', 'maria@gmail.com'),
('Carlos Hernandez', '2289876543', 'carlos@gmail.com'),
('Ana Martinez', '2284567890', 'ana@gmail.com'),
('Pedro Garcia', '2286543210', 'pedro@gmail.com');

INSERT INTO Productos
(nombre, descripcion, precio, existencia, categoria)
VALUES
('Tabla de pino', 'Tabla de madera de pino', 150.00, 30, 'Madera'),
('Martillo', 'Martillo para trabajos de carpinteria', 120.00, 15, 'Herramientas'),
('Barniz', 'Barniz para proteger madera', 95.00, 20, 'Acabados'),
('Lija', 'Lija para pulir madera', 15.00, 100, 'Materiales'),
('Triplay', 'Lamina de madera contrachapada', 280.00, 12, 'Madera');

INSERT INTO Servicios
(nombre, descripcion, precio_base)
VALUES
('Reparacion de muebles', 'Reparacion de mesas, sillas y muebles', 300.00),
('Fabricacion de puertas', 'Fabricacion de puertas de madera', 800.00),
('Corte de madera', 'Corte de madera a medida', 50.00),
('Fabricacion de mesas', 'Elaboracion de mesas personalizadas', 600.00),
('Restauracion de muebles', 'Restauracion de muebles antiguos', 450.00);

INSERT INTO Proveedores
(nombre, telefono, correo, direccion, material_suministrado)
VALUES
('Maderas del Bosque', '2281234567', 'ventas@maderas.com', 'Misantla, Veracruz', 'Pino y cedro'),
('Herramientas El Carpintero', '2287654321', 'contacto@herramientas.com', 'Misantla, Veracruz', 'Herramientas'),
('Materiales La Sierra', '2289876543', 'ventas@lasierra.com', 'Misantla, Veracruz', 'Triplay, barniz y lijas'),
('Distribuidora Forestal', '2284567890', 'contacto@forestal.com', 'Martinez de la Torre, Veracruz', 'Madera'),
('Suministros de Carpinteria', '2286543210', 'ventas@suministros.com', 'Xalapa, Veracruz', 'Materiales');

INSERT INTO Pedidos
(id_cliente, fecha, total, estado)
VALUES
(1, '2026-11-19', 270.00, 'Entregado'),
(2, '2026-11-19', 120.00, 'Pendiente'),
(3, '2026-11-19', 375.00, 'En proceso'),
(4, '2026-11-19', 295.00, 'Entregado'),
(5, '2026-11-19', 450.00, 'Pendiente');

INSERT INTO Detalles_pedido
(id_pedido, id_producto, cantidad, precio_unitario)
VALUES
(1, 1, 1, 150.00),
(1, 2, 1, 120.00),
(2, 2, 1, 120.00),
(3, 3, 1, 95.00),
(3, 5, 1, 280.00),
(4, 3, 1, 95.00),
(4, 5, 1, 200.00),
(5, 1, 3, 150.00);

SELECT * FROM Productos;
SELECT * FROM Servicios;
SELECT * FROM Proveedores;
SELECT * FROM Pedidos;
SELECT * FROM Detalles_pedido;
SELECT * FROM clientes;

SELECT
    Clientes.nombre AS Cliente,
    Pedidos.id_pedido AS Pedido,
    Pedidos.fecha,
    Pedidos.total,
    Pedidos.estado
FROM Clientes
INNER JOIN Pedidos
ON Clientes.id_cliente = Pedidos.id_cliente;

SELECT
    Pedidos.id_pedido,
    Productos.nombre AS Producto,
    Detalles_pedido.cantidad,
    Detalles_pedido.precio_unitario
FROM Detalles_pedido
INNER JOIN Pedidos
ON Detalles_pedido.id_pedido = Pedidos.id_pedido
INNER JOIN Productos
ON Detalles_pedido.id_producto = Productos.id_producto;


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