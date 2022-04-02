
-- Temporales

DROP TABLE IF EXISTS ComprasTemp;
DROP TABLE IF EXISTS VentasTemp;

CREATE TABLE ComprasTemp (
    Fecha           VARCHAR(200),
    CodProveedor    VARCHAR(200),
    NombreProveedor  VARCHAR(200),
    DireccionProveedor  VARCHAR(200),
    NumeroProveedor  VARCHAR(200),
    WebProveedor    VARCHAR(200),
    CodProduct      VARCHAR(200),
    NombreProducto  VARCHAR(200),
    MarcaProducto   VARCHAR(200),
    Categoria       VARCHAR(200),
    CodSucursal     VARCHAR(200),
    NombreSucursal  VARCHAR(200),
    DireccionSucursal   VARCHAR(200),
    Region          VARCHAR(200),
    Departamento    VARCHAR(200),
    Unidades        VARCHAR(200),
    CostoU          VARCHAR(200)
);

CREATE TABLE VentasTemp (
    Fecha               VARCHAR(200),
    CodigoCliente       VARCHAR(200),
    NombreCliente       VARCHAR(200),
    TipoCliente         VARCHAR(200),
    DireccionCliente    VARCHAR(200),
    NumeroCliente       VARCHAR(200),
    CodVendedor         VARCHAR(200),
    NombreVendedor      VARCHAR(200),
    Vacacionista        VARCHAR(200),
    CodProducto         VARCHAR(200),
    NombreProducto      VARCHAR(200),
    MarcaProducto       VARCHAR(200),
    Categoria           VARCHAR(200),
    SodSuSursal         VARCHAR(200),
    NombreSucursal      VARCHAR(200),
    DireccionSucursal   VARCHAR(200),
    Region              VARCHAR(200),
    Departamento        VARCHAR(200),
    Unidades            VARCHAR(200),
    PrecioUnitario      VARCHAR(200)
);

-- Datawarehouse 
DROP TABLE IF EXISTS Venta;
DROP TABLE IF EXISTS Compra;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Vendedor;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Tiempo;
DROP TABLE IF EXISTS Region;
DROP TABLE IF EXISTS Sucursal;
DROP TABLE IF EXISTS Proveedor;

CREATE TABLE Cliente (
    IdCliente   INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1), 
    Codigo      VARCHAR (150) NOT NULL , 
    Nombre      VARCHAR (200) NOT NULL , 
    Tipo        VARCHAR (150) NOT NULL , 
    Direccion   VARCHAR (150) NOT NULL , 
    Numero      INTEGER NOT NULL 
);


CREATE TABLE Vendedor (
    IdVendedor     INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1), 
    Codigo         VARCHAR (150) NOT NULL , 
    Nombre         VARCHAR (150) NOT NULL , 
    Vacacionista   INTEGER NOT NULL 
); 


CREATE TABLE Producto (
    IdProducto  INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1), 
    Codigo      VARCHAR (100) NOT NULL , 
    Nombre      VARCHAR (150) NOT NULL , 
    Marca       VARCHAR (150) NOT NULL , 
    Categoria   VARCHAR (150) NOT NULL 
);

CREATE TABLE Tiempo (
    IdFecha INTEGER NOT NULL  PRIMARY KEY IDENTITY(1,1), 
    Año     INTEGER, 
    Mes     INTEGER, 
    Dia     INTEGER
);

CREATE TABLE Region (
    IdRegion        INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1), 
    Region          VARCHAR (150) NOT NULL , 
    Departamento    VARCHAR (150) NOT NULL 
);



CREATE TABLE Sucursal (
    IdSucursal  INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1), 
    Codigo      VARCHAR (150) NOT NULL , 
    Nombre      VARCHAR (150) NOT NULL , 
    Direccion   VARCHAR (150) NOT NULL 
);


CREATE TABLE Proveedor (
    IdProveedor     INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1), 
    Codigo          VARCHAR (100) NOT NULL , 
    Nombre          VARCHAR (150) NOT NULL , 
    Direccion       VARCHAR (200) NOT NULL , 
    Numero          INTEGER NOT NULL , 
    Web             VARCHAR (150) NOT NULL 
);



CREATE TABLE Venta (
    IdVenta         INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1), 
    Unidades        INTEGER NOT NULL , 
    PrecioUnitario  FLOAT (2) NOT NULL , 
    Cliente_IdCliente   INTEGER NOT NULL , 
    Tiempo_IdFecha      INTEGER NOT NULL , 
    Vendedor_IdVendedor INTEGER NOT NULL , 
    Sucursal_IdSucursal INTEGER NOT NULL , 
    Producto_IdProducto INTEGER NOT NULL , 
    Region_IdRegion     INTEGER NOT NULL,
    CONSTRAINT FK_Venta_Cliente FOREIGN KEY (Cliente_IdCliente) REFERENCES Cliente(IdCliente),
    CONSTRAINT FK_Venta_Tiempo FOREIGN KEY (Tiempo_IdFecha) REFERENCES Tiempo(IdFecha),
    CONSTRAINT FK_Venta_Vendedor FOREIGN KEY (Vendedor_IdVendedor) REFERENCES Vendedor(IdVendedor),
    CONSTRAINT FK_Venta_Sucursal FOREIGN KEY (Sucursal_IdSucursal) REFERENCES Sucursal(IdSucursal),
    CONSTRAINT FK_Venta_Producto FOREIGN KEY (Producto_IdProducto) REFERENCES Producto(IdProducto),
    CONSTRAINT FK_Venta_Region FOREIGN KEY (Region_IdRegion) REFERENCES Region(IdRegion)
);

CREATE TABLE Compra (
    IdCompra    INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1), 
    Unidades    INTEGER NOT NULL , 
    Costo       FLOAT (2) NOT NULL , 
    Sucursal_IdSucursal     INTEGER NOT NULL , 
    Producto_IdProducto     INTEGER NOT NULL , 
    Proveedor_IdProveedor   INTEGER NOT NULL , 
    Tiempo_IdFecha  INTEGER NOT NULL , 
    Region_IdRegion INTEGER NOT NULL,
    CONSTRAINT FK_Compra_Sucursal FOREIGN KEY (Sucursal_IdSucursal) REFERENCES Sucursal(IdSucursal),
    CONSTRAINT FK_Compra_Producto FOREIGN KEY (Producto_IdProducto) REFERENCES Producto(IdProducto),
    CONSTRAINT FK_Compra_Proveedor FOREIGN KEY (Proveedor_IdProveedor) REFERENCES Proveedor(IdProveedor),
    CONSTRAINT FK_Compra_Tiempo FOREIGN KEY (Tiempo_IdFecha) REFERENCES Tiempo(IdFecha),
    CONSTRAINT FK_Compra_Region FOREIGN KEY (Region_IdRegion) REFERENCES Region(IdRegion)
);

