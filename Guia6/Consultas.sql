use ComercialDB;
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