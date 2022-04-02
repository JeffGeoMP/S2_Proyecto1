
-- Counts para las tablas cargadas correctamente
-- ventas: 340
-- compras: 321
-- cliente:  299
-- vendedores: 69 
-- productos: 250 
-- tiempo: 384
-- region: 22
-- sucursal: 120 
-- proveedor: 330

SELECT COUNT(*) as Ventas FROM Venta;
SELECT COUNT(*) as Compras FROM Compra;
SELECT COUNT(*) as Clientes FROM Cliente;
SELECT COUNT(*) as Vendedores FROM Vendedor;
SELECT COUNT(*) as Productos FROM Producto;
SELECT COUNT(*) as Fechas FROM Tiempo;
SELECT COUNT(*) as Regiones FROM Region;
SELECT COUNT(*)  as Sucursales FROM Sucursal;
SELECT COUNT(*) as Proveedores FROM Proveedor;