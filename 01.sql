USE BDINV
GO

CREATE TABLE EstadoUsuarios
(
	Id INT IDENTITY(1,1),
	DesEstadoUsuario NVARCHAR(100),
	Codigo NVARCHAR(10),
	CONSTRAINT PK_EstadoUsuarios PRIMARY KEY NONCLUSTERED (Id)
)
GO
INSERT INTO dbo.EstadoUsuarios VALUES  ( N'Estado Inicial cuando se crea una cuenta', N'ALTA')
INSERT INTO dbo.EstadoUsuarios VALUES  ( N'Estado Activo de un usuario', N'ACT')
INSERT INTO dbo.EstadoUsuarios VALUES  ( N'Estado Usuario Baja', N'BAJA')
INSERT INTO dbo.EstadoUsuarios VALUES  ( N'Estado Usuario Bloqueado', N'BLOQ')
INSERT INTO dbo.EstadoUsuarios VALUES  ( N'Estado Usuario Bloqueado Temporal', N'BLOQTEMP')


GO
CREATE TABLE PerfilSeguridad
(
	Id INT IDENTITY(1,1),
	Nombre NVARCHAR(100),
	DesPerfilSeguridad NVARCHAR(250),
	IntentosPermitidos INT,
	DiasExpiraClave INT,
	LenMinPass INT,
	CantLetrasMin INT,
	CantLetrasMayMin INT,
	CantNumeroMin INT,
	CantCharEspecialMin INT,
	CONSTRAINT PK_PerfilSeguridad PRIMARY KEY NONCLUSTERED (Id)
)
GO
INSERT INTO	dbo.PerfilSeguridad VALUES
        ( N'Default' , -- Nombre - nvarchar(100)
          N'Perfil de Seguridad por defecto' , -- DesPerfilSeguridad - nvarchar(250)
          3 , -- IntentosPermitidos - int
          30 , -- DiasExpiraClave - int
          10 , -- LenMinPass - int
          4 , -- CantLetrasMin - int
          1 , -- CantLetrasMayMin - int
          3 , -- CantNumberoMin - int
          1  -- CantCharEspecialMin - int
        )
GO	
CREATE TABLE Usuarios
(
	Id INT IDENTITY(1,1),
	Email NVARCHAR(256),
	UserName NVARCHAR(100),
	EmailConfirmed BIT NOT NULL DEFAULT 0,
	Password NVARCHAR(MAX),
	PhoneNumber NVARCHAR(MAX),
	PhoneNumberConfirmed BIT NOT NULL DEFAULT 0,
	TwoFactorEnabled BIT NOT NULL DEFAULT 0,
	FechaCreacion DATETIME,
	FechaActualizacion DATETIME NULL,
	IntentosFallidos INT DEFAULT 0,
	FechaUltimoIngreso DATETIME NULL,
	IdEstadoUsuario INT DEFAULT 1,
	IdPerfilSeguridad INT DEFAULT 1,
	ImageUser VARBINARY(MAX),
	CONSTRAINT PK_Usuarios PRIMARY KEY NONCLUSTERED (Id),
	CONSTRAINT FK_Usuarios_PerfilSeguridad FOREIGN KEY (IdPerfilSeguridad) REFERENCES dbo.PerfilSeguridad (Id),
	CONSTRAINT FK_Usuarios_EstadoUsuarios FOREIGN KEY (IdEstadoUsuario) REFERENCES dbo.EstadoUsuarios (Id)
)
GO


GO

CREATE TABLE Categoria
(
	Id INT IDENTITY(1,1),
	CategoriaParentId int NULL,
	Nombre NVARCHAR(200),
	DesCategoria NVARCHAR(200),
	FechaCreacion DATETIME,
	UsuarioCrea INT,
	CONSTRAINT FK_Categoria_Usuarios FOREIGN KEY (UsuarioCrea) REFERENCES dbo.Usuarios (Id),
	CONSTRAINT FK_Categoria_CategoriaParentId FOREIGN KEY (CategoriaParentId) REFERENCES dbo.Categoria(Id),
	CONSTRAINT PK_Categoria PRIMARY KEY NONCLUSTERED (Id)
)
GO
CREATE TABLE Unidades
(
	Id INT IDENTITY(1,1),
	DesUnidades NVARCHAR(200),
	Codigo NVARCHAR(10) UNIQUE,
	UsuarioCrea INT,
	FechaCreacion DATETIME,
	CONSTRAINT FK_Unidades_Usuarios FOREIGN KEY (UsuarioCrea) REFERENCES dbo.Usuarios (Id),
	CONSTRAINT PK_Unidades PRIMARY KEY NONCLUSTERED (Id),
	CONSTRAINT CK_Unidades_CodigoUnique UNIQUE (Codigo)
)
GO	
CREATE TABLE Producto
(
	Id INT IDENTITY(1,1),
	IdCategoria INT,
	IdUnidad INT,
	IdMoneda INT,
	barcode NVARCHAR(100),
	Nombre NVARCHAR(100),
	DesProducto NVARCHAR(250),
	Inventario_Min INT,
	precio_in DECIMAL(18,2),
	precio_out DECIMAL(18,2),
	FechaCreacion DATETIME,
	UsuarioCrea INT,
	CONSTRAINT PK_Producto PRIMARY KEY NONCLUSTERED (Id),
	CONSTRAINT FK_Producto_Categoria FOREIGN KEY (IdCategoria) REFERENCES dbo.Categoria (Id),
	CONSTRAINT FK_Producto_Unidades FOREIGN KEY (IdUnidad) REFERENCES dbo.Unidades (Id),
	CONSTRAINT FK_Producto_Usuarios FOREIGN KEY (UsuarioCrea) REFERENCES dbo.Usuarios (Id),
	CONSTRAINT FK_Producto_Monedas FOREIGN KEY (IdMoneda) REFERENCES dbo.Monedas(Id)
)
GO	
CREATE TABLE ProductoImages
(
	Id INT IDENTITY(1,1) NOT NULL,
	IdProducto INT NOT NULL,
	Image VARBINARY(MAX),
	UsuarioCrea INT,
	CONSTRAINT PK_ProductoImages PRIMARY KEY NONCLUSTERED (Id,IdProducto),
	CONSTRAINT FK_ProductoImages_Usuarios FOREIGN KEY (UsuarioCrea) REFERENCES dbo.Usuarios (Id),
	CONSTRAINT FK_ProductoImages_Product FOREIGN KEY(IdProducto) REFERENCES dbo.Producto(Id)

)
GO
CREATE TABLE TipoOperacion
(
	Id INT IDENTITY(1,1),
	Nombre NVARCHAR(30),
	CONSTRAINT PK_TipoOperacion PRIMARY KEY NONCLUSTERED(Id)
)
GO
CREATE TABLE [dbo].[Cliente]
(
[IdCliente] [int] NOT NULL IDENTITY(1, 1),
[Nombre] [nvarchar] (150) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Apellido] [nvarchar] (150) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Direccion] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NULL,
[Telefono] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL,
[email] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[Identificaion] [nvarchar] (19) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente] ADD CONSTRAINT [PK_Cliente] PRIMARY KEY NONCLUSTERED ([IdCliente]) ON [PRIMARY]
GO
CREATE TABLE Operacion
(
	Id INT,
	IdCliente INT NULL,
	IdTipoOperacion INT NOT NULL,
	Total DECIMAL(18,2),
	FechaCreacion DATETIME DEFAULT GETDATE(),
	CONSTRAINT PK_Operacion PRIMARY KEY (Id),
	CONSTRAINT FK_Operacion_TipoOperacion FOREIGN KEY (IdTipoOperacion) REFERENCES dbo.TipoOperacion(Id),
	CONSTRAINT FK_Operaracion_Cliente FOREIGN KEY (IdCliente) REFERENCES dbo.Cliente(IdCliente)

)
SELECT * FROM cli
INSERT INTO	 dbo.TipoOperacion
        ( Nombre )
VALUES  ( N'Entrada'  -- Nombre - nvarchar(30)
          )
INSERT INTO	dbo.TipoOperacion
        ( Nombre )
VALUES  ( N'Salida'  -- Nombre - nvarchar(30)
          )
SELECT co.name,t.system_type_id,
'public '+CASE
	WHEN t.system_type_id IN(34,35,99,165,167,173,175,231,239) THEN	'string'
	WHEN t.system_type_id IN(56) THEN'int'
	WHEN t.system_type_id IN (61,42) AND co.is_nullable=1 THEN 'DateTime?'
	WHEN t.system_type_id IN (61,42) AND co.is_nullable=0 THEN 'DateTime'
	WHEN t.system_type_id IN (106) THEN 'decimal'
	WHEN t.system_type_id IN (104) THEN 'bool' end +' '+ co.name+'{ get; set; }',
* FROM sys.objects o 
INNER JOIN sys.columns co 
ON co.object_id = o.object_id 
INNER JOIN sys.types t ON t.system_type_id = co.system_type_id AND t.user_type_id = co.user_type_id
WHERE type='U' AND o.name='TipoOperacion'


SELECT * FROM sys.types WHERE system_type_id=231

SELECT * FROM dbo.Categoria

SELECT * FROM dbo.Usuarios
SELECT * FROM dbo.Monedas

SELECT * FROM dbo.Usuarios
SELECT * FROM dbo.Producto
DELETE FROM dbo.ProductoImages

SELECT * FROM dbo.TipoOperacion