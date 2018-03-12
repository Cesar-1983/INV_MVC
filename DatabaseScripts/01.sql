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
	Nombre NVARCHAR(200),
	DesCategoria NVARCHAR(200),
	FechaCreación DATETIME,
	UsuarioCrea INT,
	CONSTRAINT FK_Unidades_Usuarios FOREIGN KEY (UsuarioCrea) REFERENCES dbo.Usuarios (Id),

	CONSTRAINT PK_Categoria PRIMARY KEY NONCLUSTERED (Id)

)
GO
CREATE TABLE Unidades
(
	Id INT IDENTITY(1,1),
	DesUnidades NVARCHAR(200),
	Codigo NVARCHAR(10) UNIQUE,
	UsuarioCrea INT,
	CONSTRAINT FK_Unidades_Usuarios FOREIGN KEY (UsuarioCrea) REFERENCES dbo.Usuarios (Id),
	CONSTRAINT PK_Unidades PRIMARY KEY NONCLUSTERED (Id)
)
GO	
CREATE TABLE Producto
(
	Id INT IDENTITY(1,1),
	IdCategoria INT,
	IdUnidad INT,
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
	CONSTRAINT FK_Producto_Usuarios FOREIGN KEY (UsuarioCrea) REFERENCES dbo.Usuarios (Id)
)
GO	
CREATE TABLE ProductoImages
(
	Id INT IDENTITY(1,1),
	IdProducto INT,
	Image VARBINARY(MAX)
)