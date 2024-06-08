-- Crear la base de datos

USE ComercialDB;

-- Tabla Marcas
CREATE TABLE IF NOT EXISTS Marcas (
    idMarcas INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45)
);

-- Tabla Categorias
CREATE TABLE IF NOT EXISTS Categorias (
    idCategorias INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45)
);

-- Tabla Proveedores
CREATE TABLE IF NOT EXISTS Proveedores (
    idProveedores INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45),
    Direccion VARCHAR(45),
    Email VARCHAR(45),
    Tel VARCHAR(45)
);

-- Tabla TiposProductos
CREATE TABLE IF NOT EXISTS TiposProductos (
    idTiposProductos INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45)
);

-- Tabla Presentaciones
CREATE TABLE IF NOT EXISTS Presentaciones (
    idPresentaciones INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45)
);

-- Tabla Roles
CREATE TABLE IF NOT EXISTS Roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES Roles(id)
);

-- Tabla Productos
CREATE TABLE IF NOT EXISTS Productos (
    idProductos INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45),
    idTiposProductos INT,
    idPresentaciones INT,
    idProveedores INT,
    FOREIGN KEY (idTiposProductos) REFERENCES TiposProductos(idTiposProductos),
    FOREIGN KEY (idPresentaciones) REFERENCES Presentaciones(idPresentaciones),
    FOREIGN KEY (idProveedores) REFERENCES Proveedores(idProveedores)
);

-- Tabla Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    idClientes INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45),
    Direccion VARCHAR(45),
    Email VARCHAR(45),
    Tel VARCHAR(45)
);

-- Tabla Opciones
CREATE TABLE IF NOT EXISTS Opciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla Ventas
CREATE TABLE IF NOT EXISTS Ventas (
    idVentas INT AUTO_INCREMENT PRIMARY KEY,
    idClientes INT,
    idUsuarios INT,
    Monto DECIMAL(10,2),
    FOREIGN KEY (idClientes) REFERENCES Clientes(idClientes),
    FOREIGN KEY (idUsuarios) REFERENCES Usuarios(id)
);

-- Tabla AsignacionRolesOpciones
CREATE TABLE IF NOT EXISTS AsignacionRolesOpciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rol_id INT,
    opcion_id INT,
    FOREIGN KEY (rol_id) REFERENCES Roles(id),
    FOREIGN KEY (opcion_id) REFERENCES Opciones(id)
);

-- Insertar datos en Marcas
INSERT INTO Marcas (Nombre) VALUES
('Samsung'),
('Apple'),
('Nike'),
('Adidas'),
('Sony');

-- Insertar datos en Categorias
INSERT INTO Categorias (Nombre) VALUES
('Electrónicos'),
('Calzado'),
('Ropa'),
('Accesorios'),
('Hogar');

-- Insertar datos en Proveedores
INSERT INTO Proveedores (Nombre, Direccion, Email, Tel) VALUES
('ElectroTech', '123 Calle Principal, Ciudad', 'info@electrotech.com', '123-456-7890'),
('FashionWholesale', '456 Avenida Park, Pueblo', 'ventas@fashionwholesale.com', '987-654-3210'),
('SonySupplier', '789 Calle Comercial, Ciudad', 'contact@sonysupplier.com', '321-654-9870');

-- Insertar datos en TiposProductos
INSERT INTO TiposProductos (Nombre) VALUES
('Smartphone'),
('Tablet'),
('Laptop'),
('Smartwatch'),
('Headphones');

-- Insertar datos en Presentaciones
INSERT INTO Presentaciones (Nombre) VALUES
('Caja'),
('Blister'),
('Bolsa'),
('Estuche'),
('Caja grande');

-- Insertar datos en Productos
INSERT INTO Productos (Nombre, idTiposProductos, idPresentaciones, idProveedores) VALUES
('Galaxy S21', 1, 1, 1),
('iPad Pro', 2, 1, 2),
('MacBook Pro', 3, 1, 2),
('Apple Watch', 4, 2, 2),
('Sony WH-1000XM4', 5, 3, 3);

-- Insertar datos en Clientes
INSERT INTO Clientes (Nombre, Direccion, Email, Tel) VALUES
('Juan Perez', 'Calle Falsa 123', 'juan.perez@mail.com', '555-1234'),
('Maria Lopez', 'Av. Siempreviva 742', 'maria.lopez@mail.com', '555-5678');

-- Insertar datos en Roles
INSERT INTO Roles (nombre) VALUES ('Admin'), ('Usuario'), ('Moderador');

-- Insertar datos en Opciones
INSERT INTO Opciones (nombre) VALUES ('Crear'), ('Leer'), ('Actualizar'), ('Eliminar');

-- Insertar datos en AsignacionRolesOpciones
INSERT INTO AsignacionRolesOpciones (rol_id, opcion_id) VALUES
(1, 1), -- Admin puede Crear
(1, 2), -- Admin puede Leer
(1, 3), -- Admin puede Actualizar
(1, 4), -- Admin puede Eliminar
(2, 2), -- Usuario puede Leer
(3, 2), -- Moderador puede Leer
(3, 3); -- Moderador puede Actualizar

-- Insertar datos en Usuarios
INSERT INTO Usuarios (nombre, rol_id) VALUES ('Alice', 1), ('Bob', 2), ('Charlie', 3);

-- Insertar datos en Ventas
INSERT INTO Ventas (idClientes, idUsuarios, Monto) VALUES
(1, 1, 1200.00), -- Venta realizada por Alice a Juan Perez
(2, 2, 1500.00); -- Venta realizada por Bob a Maria Lopez

-- Crear usuarios y asignar roles
CREATE USER IF NOT EXISTS 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
CREATE USER IF NOT EXISTS 'normal_user'@'localhost' IDENTIFIED BY 'user_password';
CREATE USER IF NOT EXISTS 'mod_user'@'localhost' IDENTIFIED BY 'mod_password';

-- Asignación de privilegios
GRANT ALL PRIVILEGES ON ComercialDB.* TO 'admin_user'@'localhost';
GRANT SELECT ON ComercialDB.* TO 'normal_user'@'localhost';
GRANT SELECT, UPDATE ON ComercialDB.* TO 'mod_user'@'localhost';

-- Consultas
-- Consulta para mostrar lista de productos a la venta con detalles
SELECT 
    p.idProductos AS ProductoID,
    p.Nombre AS ProductoNombre,
    t.Nombre AS TipoProducto,
    pr.Nombre AS Presentacion,
    prov.Nombre AS Proveedor
FROM 
    Productos p
JOIN 
    TiposProductos t ON p.idTiposProductos = t.idTiposProductos
JOIN 
    Presentaciones pr ON p.idPresentaciones = pr.idPresentaciones
JOIN 
    Proveedores prov ON p.idProveedores = prov.idProveedores;

-- Consulta para mostrar lista de ventas realizadas con detalles
SELECT 
    v.idVentas AS VentaID,
    c.Nombre AS ClienteNombre,
    u.nombre AS VendedorNombre,
    v.Monto AS MontoVenta,
    (v.Monto * 0.12) AS IVA,
    (v.Monto * 0.18) AS CreditoFiscal -- Ajusta el porcentaje según la tasa real de tu crédito fiscal
FROM 
    Ventas v
JOIN 
    Clientes c ON v.idClientes = c.idClientes
JOIN 
    Usuarios u ON v.idUsuarios = u.id;

-- Repetición de las consultas para mostrar lista de productos y ventas con detalles
-- Consulta 1
SELECT 
    p.idProductos AS ProductoID,
    p.Nombre AS ProductoNombre,
    t.Nombre AS TipoProducto,
    pr.Nombre AS Presentacion,
    prov.Nombre AS Proveedor
FROM 
    Productos p
JOIN 
    TiposProductos t ON p.idTiposProductos = t.idTiposProductos
JOIN 
    Presentaciones pr ON p.idPresentaciones = pr.idPresentaciones
JOIN 
    Proveedores prov ON p.idProveedores = prov.idProveedores;

-- Consulta 2
SELECT 
    v.idVentas AS VentaID,
    c.Nombre AS ClienteNombre,
    u.nombre AS VendedorNombre,
    v.Monto AS MontoVenta,
    (v.Monto * 0.12) AS IVA,
    (v.Monto * 0.18) AS CreditoFiscal -- Ajusta el porcentaje según la tasa real de tu crédito fiscal
FROM 
    Ventas v
JOIN 
    Clientes c ON v.idClientes = c.idClientes
JOIN 
    Usuarios u ON v.idUsuarios = u.id;
