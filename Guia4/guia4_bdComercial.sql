use comercialdb;

-- Ejercicio 1
-- Marcas
INSERT INTO Marcas (Nombre) VALUES
('Samsung'),
('Apple'),
('Nike'),
('Adidas'),
('Sony');

-- Categorías
INSERT INTO Categorias (Nombre) VALUES
('Electrónicos'),
('Calzado'),
('Ropa'),
('Accesorios'),
('Hogar');

-- Proveedores
INSERT INTO Proveedores (Nombre, Direccion, Email, Tel) VALUES
('ElectroTech', '123 Calle Principal, Ciudad', 'info@electrotech.com', '123-456-7890'),
('FashionWholesale', '456 Avenida Park, Pueblo', 'ventas@fashionwholesale.com', '456-789-0123'),
('SportsGear Inc.', '789 Calle Elm, Villa', 'contacto@sportsgear.com', '789-012-3456'),
('TechSuppliers', '321 Calle Roble, Condado', 'soporte@techsuppliers.com', '987-654-3210'),
('HomeEssentials', '555 Calle Pino, País', 'hola@homeessentials.com', '654-321-0987');

-- Producto
INSERT INTO Producto (Nombre, Descripcion, Precio, NumerodeModelo, idProveedores, idMarca, idCategoria) VALUES
('Smartphone Galaxy S22', 'Smartphone potente', '799.99', 'GS22', 1, 1, 1),
('iPhone 14 Pro', 'Último modelo de iPhone', '999.99', 'IP14', 2, 2, 1),
('Zapatillas Air Max 2024', 'Zapatillas deportivas', '129.99', 'AM2024', 3, 3, 2),
('Camiseta de algodón Premium', 'Camiseta de manga corta', '24.99', 'COT123', 4, 4, 3),
('Smart TV 4K 55"', 'Televisor inteligente', '699.99', 'TV4K55', 5, 5, 1);


-- Cliente
INSERT INTO Cliente (Nombres, Apellidos, Genero, DUI, Direccion) VALUES
('Juan', 'Gómez', 'M', '1234567890', '456 Calle Roble'),
('María', 'López', 'F', '0987654321', '789 Avenida Arce'),
('Carlos', 'Martínez', 'M', '5678901234', '321 Calle Olivo'),
('Ana', 'Rodríguez', 'F', '4321098765', '654 Calle Cedro'),
('Pedro', 'Sánchez', 'M', '9012345678', '987 Calle Pino');

-- Empleados
INSERT INTO Empleados (Nombre, Apellido, Cargo, Email, Tel) VALUES
('Luis', 'Pérez', 'Gerente de Ventas', 'luis.perez@example.com', '111-222-3333'),
('Laura', 'González', 'Asistente de Tienda', 'laura.gonzalez@example.com', '444-555-6666'),
('Juan', 'Martínez', 'Especialista en Marketing', 'juan.martinez@example.com', '777-888-9999'),
('María', 'Hernández', 'Cajera', 'maria.hernandez@example.com', '123-456-7890'),
('Carlos', 'Díaz', 'Gerente de Almacén', 'carlos.diaz@example.com', '987-654-3210');

-- Pedidos
INSERT INTO Pedidos (idCliente, idProducto, Cantidad, FechaPedido) VALUES
(1, 1, '2', '2024-04-20'),
(2, 2, '1', '2024-04-19'),
(3, 3, '3', '2024-04-18'),
(4, 4, '2', '2024-04-17'),
(5, 5, '1', '2024-04-16');

-- DetallesPedido
INSERT INTO DetallesPedido (idPedido, idProducto, Cantidad, PrecioUnitario) VALUES
(1, 1, 2, 799.99),
(2, 2, 1, 999.99),
(3, 3, 3, 129.99),
(4, 4, 2, 24.99),
(5, 5, 1, 699.99);

-- Ventas
INSERT INTO Ventas (idEmpleados, idCliente, idProducto, Cantidad, MontoTotal, FechaVenta) VALUES
(1, 1, 1, '2', '1599.98', '2024-04-20'),
(2, 2, 2, '1', '999.99', '2024-04-19'),
(3, 3, 3, '3', '389.97', '2024-04-18'),
(4, 4, 4, '2', '49.98', '2024-04-17'),
(5, 5, 5, '1', '699.99', '2024-04-16');

-- Pagos
INSERT INTO Pagos (idVenta, MetodoPago, Monto, Fecha) VALUES
(1, 'Tarjeta de Crédito', '1599.98', '2024-04-20'),
(2, 'Efectivo', '999.99', '2024-04-19'),
(3, 'Transferencia Bancaria', '389.97', '2024-04-18'),
(4, 'Efectivo', '49.98', '2024-04-17'),
(5, 'Tarjeta de Débito', '699.99', '2024-04-16');

-- Inventario
INSERT INTO Inventario (idProducto, CantidadDisponible, UbicacionAlmacen) VALUES
(1, 50, 'Bodega A'),
(2, 30, 'Bodega B'),
(3, 40, 'Bodega C'),
(4, 60, 'Bodega D'),
(5, 20, 'Bodega E');



-- Ejercicio 2

SELECT Nombre, Descripcion, Precio
FROM Producto
WHERE Nombre = 'Smartphone Galaxy S22';


SELECT Nombre, Descripcion, Precio
FROM Producto
WHERE idCategoria = 1;



-- Ejercicio 3

UPDATE Producto
SET Descripcion = CONCAT(Descripcion, ' - Modelo actualizado')
WHERE idMarca = 3;


UPDATE Producto
SET Descripcion = 'Modelo premium de última generación'
WHERE idMarca = 2;


-- Ejercicio 4
DELETE DetallesPedido
FROM DetallesPedido
INNER JOIN Producto ON DetallesPedido.idProducto = Producto.idProducto
WHERE Producto.idMarca = 1;


DELETE FROM Producto
WHERE idMarca = 2 AND Precio < 100;
