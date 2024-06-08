USE ComercialDB;
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
INSERT INTO Roles (nombre) VALUES 
('Admin'), 
('Usuario'), 
('Moderador');

-- Insertar datos en Opciones
INSERT INTO Opciones (nombre) VALUES 
('Crear'), 
('Leer'), 
('Actualizar'), 
('Eliminar');

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
INSERT INTO Usuarios (nombre, rol_id) VALUES 
('Alice', 1), 
('Bob', 2), 
('Charlie', 3);

-- Insertar datos en Ventas
INSERT INTO Ventas (idClientes, idUsuarios, Monto) VALUES
(1, 1, 1200.00), -- Venta realizada por Alice a Juan Perez
(2, 2, 1500.00); -- Venta realizada por Bob a Maria Lopez
