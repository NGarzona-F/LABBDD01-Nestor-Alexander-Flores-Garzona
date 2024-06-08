CREATE DATABASE IF NOT EXISTS ComercialDB;
USE ComercialDB;

-- Tabla Marcas
CREATE TABLE Marcas (
    idMarcas INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45)
);

-- Tabla Categorias
CREATE TABLE Categorias (
    idCategorias INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45)
);

-- Tabla Proveedores
CREATE TABLE Proveedores (
    idProveedores INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45),
    Direccion VARCHAR(45),
    Email VARCHAR(45),
    Tel VARCHAR(45)
);

-- Tabla Producto
CREATE TABLE Producto (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45),
    Descripcion VARCHAR(45),
    Precio VARCHAR(5),
    NumerodeModelo VARCHAR(45),
    idProveedores INT,
    idMarca INT,
    idCategoria INT,
    FOREIGN KEY (idProveedores) REFERENCES Proveedores(idProveedores),
    FOREIGN KEY (idMarca) REFERENCES Marcas(idMarcas),
    FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategorias)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombres VARCHAR(80),
    Apellidos VARCHAR(80),
    Genero ENUM('M', 'F'),
    DUI CHAR(10),
    Direccion VARCHAR(100)
);

-- Tabla Empleados
CREATE TABLE Empleados (
    idEmpleados INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45),
    Apellido VARCHAR(45),
    Cargo VARCHAR(45),
    Email VARCHAR(45),
    Tel VARCHAR(45)
);

-- Tabla Pedidos
CREATE TABLE Pedidos (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idProducto INT,
    Cantidad VARCHAR(45),
    FechaPedido DATE,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- Tabla DetallesPedido
CREATE TABLE DetallesPedido (
    idDetallePedido INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT,
    idProducto INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- Tabla Ventas
CREATE TABLE Ventas (
    idVentas INT AUTO_INCREMENT PRIMARY KEY,
    idEmpleados INT,
    idCliente INT,
    idProducto INT,
    Cantidad VARCHAR(45),
    MontoTotal VARCHAR(45),
    FechaVenta VARCHAR(45),
    FOREIGN KEY (idEmpleados) REFERENCES Empleados(idEmpleados),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- Tabla Pagos
CREATE TABLE Pagos (
    idPagos INT AUTO_INCREMENT PRIMARY KEY,
    idVenta INT,
    MetodoPago VARCHAR(45),
    Monto VARCHAR(45),
    Fecha DATE,
    FOREIGN KEY (idVenta) REFERENCES Ventas(idVentas)
);

-- Tabla Inventario
CREATE TABLE Inventario (
    idInventario INT AUTO_INCREMENT PRIMARY KEY,
    idProducto INT,
    CantidadDisponible INT,
    UbicacionAlmacen VARCHAR(100),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- Tabla RolesUsuario
CREATE TABLE RolesUsuario (
    idRol INT AUTO_INCREMENT PRIMARY KEY,
    NombreRol VARCHAR(50),
    Descripcion VARCHAR(200),
    PermisosAsignados TEXT
);

-- Tabla UsuariosRoles
CREATE TABLE UsuariosRoles (
    idUsuario INT,
    idRol INT,
    FechaAsignacion DATE,
    FOREIGN KEY (idRol) REFERENCES RolesUsuario(idRol)
);
