CREATE DATABASE bdventas;
USE bdventas;

CREATE TABLE LineaProducto(
   CvLinea INT PRIMARY KEY,
   Nombre CHAR(15)UNIQUE
);
/*CREATE RULE Nombre
AS 
@Descripcion IN ('Abarrotes', 'Farmaceuticos', 'Articulos Domesticos')

	
create rule rlinea as    
 @descrip in('jabon','lacteos') 
 create table lineas (  idlinea varchar(4) primary key,  
linea varchar(20) unique not null  ) 
 //ejecutar regla// 
exec  sp_bindrule rlinea, 'lineas.linea'
 drop rule rlinea 
*/

CREATE TABLE Proveedor(
   CvProv INT PRIMARY KEY,
   Nombre CHAR(30)NOT NULL,
   Empresa CHAR(20) NOT NULL,
   Direccion CHAR(30) DEFAULT 'NO APLICA',
   Ciudad CHAR(15) DEFAULT 'HEJUTLA',
   Telefono INT NOT NULL	
);

CREATE TABLE Cliente(
   CvCliente INT PRIMARY KEY,
   Nombre CHAR(30)NOT NULL,
   Direccion CHAR(30) DEFAULT 'NO APLICA',
   Ciudad CHAR(15) DEFAULT 'HEJUTLA',
   Telefono INT NOT NULL	
);
/*MODIFICA LA TABLA VENTA PRODUCTO PARA AGREGAR LA CLAVE DEL CLIENTE A QUIEN SE LE HACE LA VENTA
ALTER TABLE VentaProducto
ADD CvCliente INT FOREIGN KEY(CvCliente)REFERENCES Cliente(CvCliente) 
DEFAULT 0
MODIFICA LA TABLA COMPRAPRODUCTO PARA AGREGAR LA CLAVE DEL PROVEEDOR A QUIEN SE LE HACE LA VENTA
ALTER TABLE CompraProducto
ADD CvProv INT FOREIGN KEY(CvProv)REFERENCES Cliente(CvProv) 
DEFAULT 0
Crea una regla sobre el campo Empresa de la tabla Proveedor donde solo permite introducir tres EMpresas

CREATE RULE Empresa
AS 
@Descripcion IN ('Mega Basa', 'Su Bodega', 'tiendas el puente')
*/

CREATE TABLE Venta(
   CvVenta INT PRIMARY KEY,
   Fecha DATETIME NOT NULL,
   Total FLOAT(15)NOT NULL 
);

CREATE TABLE lineas(
  clvlinea CHAR(3) PRIMARY KEY,
  linea CHAR(20) NOT NULL UNIQUE 
);

CREATE TABLE Productos(
   CvProd INT PRIMARY KEY,
   Nombre CHAR(15) NOT NULL,
   Descripcion CHAR(20) NOT NULL,
   Existencias NUMERIC (7,2) CHECK (VALUE >=0.0),
   clvlinea CHAR(3) NOT NULL,
   precio_venta NUMERIC (7,2) CHECK (VALUE >=0.0),
   tipo CHAR (10) CHECK( VALUE IN ('menudeo','mayoreo')),
   FOREIGN KEY (clvlinea)REFERENCES lineas(clvlinea)ON DELETE CASCADE
   ON UPDATE CASCADE
);


CREATE TABLE Compra(
   CvCompra INT PRIMARY KEY,
   Fecha DATETIME NOT NULL,
   Total FLOAT(15)NOT NULL 
);

CREATE TABLE CompraProducto(
   PrecioC FLOAT(8) NOT NULL,
   Cantidad INT DEFAULT NULL,
   CvProd INT NOT NULL, FOREIGN KEY(CvProd)REFERENCES Productos(CvProd),
   CvCompra INT, FOREIGN KEY(CvCompra) REFERENCES Compra(CvCompra)
);

CREATE TABLE VentaProducto(
   CvVtaProd INT PRIMARY KEY,
   PrecioV FLOAT(8) NOT NULL,
   Cantidad INT NOT NULL,
   CvProd INT NOT NULL, FOREIGN KEY(CvProd)REFERENCES Productos(CvProd),
   CvVenta INT, FOREIGN KEY(CvVenta) REFERENCES Venta(CvVenta),
   CvCliente INT, FOREIGN KEY(CvCliente)REFERENCES Cliente(CvCliente) 
);



CREATE TABLE Devolucion(
   CvDev INT PRIMARY KEY,
   Cantidad INT NOT NULL,
   CvProd INT NOT NULL, FOREIGN KEY(CvProd)REFERENCES Productos(CvProd),
   CvVtaProd INT, FOREIGN KEY(CvVtaProd)REFERENCES ventaproducto(CvVtaProd)
);

CREATE TABLE VentaCredito(
   CvVtaC INT PRIMARY KEY,
   PrecioV FLOAT NOT NULL,
   Cantidad INT NOT NULL,
   CvProd INT NOT NULL,FOREIGN KEY(CvProd)REFERENCES Productos(CvProd),
   CvCliente INT NOT NULL,FOREIGN KEY(CvCliente)REFERENCES Cliente(CvCliente), 
   Total FLOAT(8)NOT NULL
);
CREATE TABLE Abonos(
   CvAbono INT PRIMARY KEY,
   CvVtaC INT NOT NULL, FOREIGN KEY(CvVtaC)REFERENCES VentaCredito(CvVtaC),
   Abono FLOAT(8)NOT NULL
);