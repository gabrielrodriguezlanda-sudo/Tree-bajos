
-- 1. Crear y seleccionar la base de datos
USE taller_carpinteria;

-- 2. Tabla Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(100)
) ENGINE=InnoDB;

-- 3. Tabla Productos
CREATE TABLE IF NOT EXISTS Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    existencia INT NOT NULL,
    categoria VARCHAR(50)
) ENGINE=InnoDB;

-- 4. Tabla Servicios
CREATE TABLE IF NOT EXISTS Servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio_base DECIMAL(10,2)
) ENGINE=InnoDB;

-- 5. Tabla Pedidos
CREATE TABLE IF NOT EXISTS Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    estado VARCHAR(30),
    FOREIGN KEY (id_cliente)
        REFERENCES Clientes(id_cliente)
) ENGINE=InnoDB;

-- 6. Tabla Detalles_pedido
CREATE TABLE IF NOT EXISTS Detalles_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido)
        REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto)
        REFERENCES Productos(id_producto)
) ENGINE=InnoDB;


-- 6. Tabla Proveedores
CREATE TABLE IF NOT EXISTS Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(100),
    direccion VARCHAR(200),
    material_suministrado VARCHAR(100)
) ENGINE=InnoDB;


-- 7. Mostrar las tablas creadas
SHOW TABLES;


