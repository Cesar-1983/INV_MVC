USE [BDINV]
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarProductos]    Script Date: 05/07/2018 13:19:02 ******/
DROP PROCEDURE [dbo].[usp_ListarProductos]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertaOperacion]    Script Date: 05/07/2018 13:19:02 ******/
DROP PROCEDURE [dbo].[usp_InsertaOperacion]
GO
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT [CK_Operacion_Estado]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_PerfilSeguridad]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_EstadoUsuarios]
GO
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT [FK_Unidades_Usuarios]
GO
ALTER TABLE [dbo].[RolesUsuarios] DROP CONSTRAINT [FK_RolesUsuarios_Usuarios]
GO
ALTER TABLE [dbo].[RolesUsuarios] DROP CONSTRAINT [FK_RolesUsuarios_Roles]
GO
ALTER TABLE [dbo].[RolesAcciones] DROP CONSTRAINT [FK_RolesAcciones_Roles]
GO
ALTER TABLE [dbo].[RolesAcciones] DROP CONSTRAINT [FK_RolesAcciones_Acciones]
GO
ALTER TABLE [dbo].[ProductoImages] DROP CONSTRAINT [FK_ProductoImages_Usuarios]
GO
ALTER TABLE [dbo].[ProductoImages] DROP CONSTRAINT [FK_ProductoImages_Product]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Usuarios]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Unidades]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Monedas]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT [FK_Operacion_Usuarios]
GO
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT [FK_Operacion_TipoOperacion]
GO
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT [FK_Operacion_Cliente]
GO
ALTER TABLE [dbo].[DetalleOperacion] DROP CONSTRAINT [FK_DetalleOperacion_Producto]
GO
ALTER TABLE [dbo].[DetalleOperacion] DROP CONSTRAINT [FK_DetalleOperacion_Operacion]
GO
ALTER TABLE [dbo].[CodigoValidacionUsuario] DROP CONSTRAINT [Fk_CodigoValidacionUsuario_Usuarios]
GO
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT [FK_Categoria_Usuarios]
GO
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT [FK_Categoria_CategoriaParentId]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__IdPerf__5165187F]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__IdEsta__5070F446]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__Intent__4F7CD00D]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__FechaC__4E88ABD4]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__TwoFac__4D94879B]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__PhoneN__4CA06362]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__EmailC__4BAC3F29]
GO
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT [DF__Operacion__Fecha__6CD828CA]
GO
ALTER TABLE [dbo].[Monedas] DROP CONSTRAINT [DF__Monedas__IsLocal__6477ECF3]
GO
ALTER TABLE [dbo].[EstadoUsuarios] DROP CONSTRAINT [DF__EstadoUsu__CanLo__251C81ED]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[Unidades]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[Unidades]
GO
/****** Object:  Table [dbo].[TipoOperacion]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[TipoOperacion]
GO
/****** Object:  Table [dbo].[TasaCambios]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[TasaCambios]
GO
/****** Object:  Table [dbo].[RolesUsuarios]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[RolesUsuarios]
GO
/****** Object:  Table [dbo].[RolesAcciones]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[RolesAcciones]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[ProductoImages]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[ProductoImages]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[Producto]
GO
/****** Object:  Table [dbo].[PerfilSeguridad]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[PerfilSeguridad]
GO
/****** Object:  Table [dbo].[Operacion]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[Operacion]
GO
/****** Object:  Table [dbo].[Monedas]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[Monedas]
GO
/****** Object:  Table [dbo].[EstadoUsuarios]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[EstadoUsuarios]
GO
/****** Object:  Table [dbo].[DetalleOperacion]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[DetalleOperacion]
GO
/****** Object:  Table [dbo].[CodigoValidacionUsuario]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[CodigoValidacionUsuario]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[Cliente]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[Categoria]
GO
/****** Object:  Table [dbo].[Acciones]    Script Date: 05/07/2018 13:19:02 ******/
DROP TABLE [dbo].[Acciones]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_DetalleOperacion]    Script Date: 05/07/2018 13:19:02 ******/
DROP TYPE [dbo].[udt_DetalleOperacion]
GO
/****** Object:  User [mvc]    Script Date: 05/07/2018 13:19:02 ******/
DROP USER [mvc]
GO
USE [master]
GO
/****** Object:  Database [BDINV]    Script Date: 05/07/2018 13:19:02 ******/
DROP DATABASE [BDINV]
GO
/****** Object:  Database [BDINV]    Script Date: 05/07/2018 13:19:02 ******/
CREATE DATABASE [BDINV] ON  PRIMARY 
( NAME = N'BDINV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BDINV.mdf' , SIZE = 14592KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDINV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BDINV_log.LDF' , SIZE = 4288KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDINV] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDINV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDINV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDINV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDINV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDINV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDINV] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDINV] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BDINV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDINV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDINV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDINV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDINV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDINV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDINV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDINV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDINV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDINV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDINV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDINV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDINV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDINV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDINV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDINV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDINV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDINV] SET  MULTI_USER 
GO
ALTER DATABASE [BDINV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDINV] SET DB_CHAINING OFF 
GO
USE [BDINV]
GO
/****** Object:  User [mvc]    Script Date: 05/07/2018 13:19:02 ******/
CREATE USER [mvc] FOR LOGIN [mvc] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [mvc]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_DetalleOperacion]    Script Date: 05/07/2018 13:19:02 ******/
CREATE TYPE [dbo].[udt_DetalleOperacion] AS TABLE(
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio] [decimal](18, 2) NULL
)
GO
/****** Object:  Table [dbo].[Acciones]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Accion] [nvarchar](100) NULL,
	[Controlador] [nvarchar](100) NULL,
	[Area] [nvarchar](100) NULL,
 CONSTRAINT [PK_Acciones] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoriaParentId] [int] NULL,
	[Nombre] [nvarchar](200) NULL,
	[DesCategoria] [nvarchar](200) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCrea] [int] NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Apellido] [nvarchar](150) NOT NULL,
	[Direccion] [nvarchar](250) NULL,
	[Telefono] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[Identificaion] [nvarchar](19) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY NONCLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CodigoValidacionUsuario]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodigoValidacionUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuariosId] [int] NULL,
	[Tipo] [char](3) NULL,
	[Codigo] [varchar](max) NULL,
	[FechaExpiracion] [datetime] NULL,
 CONSTRAINT [Pk_CodigoValidacionUsuario] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleOperacion]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleOperacion](
	[Id] [int] NOT NULL,
	[IdOperacion] [int] NOT NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio] [decimal](18, 2) NULL,
 CONSTRAINT [PK_DetalleOperacion] PRIMARY KEY NONCLUSTERED 
(
	[IdOperacion] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EstadoUsuarios]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoUsuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesEstadoUsuario] [nvarchar](100) NULL,
	[Codigo] [nvarchar](10) NULL,
	[CanLogin] [bit] NULL,
 CONSTRAINT [PK_EstadoUsuarios] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Monedas]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monedas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Simbolo] [nvarchar](10) NULL,
	[Codigo] [nvarchar](10) NULL,
	[Numero] [int] NULL,
	[IsLocal] [bit] NULL,
 CONSTRAINT [PK_Monedas] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Operacion]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[IdTipoOperacion] [int] NOT NULL,
	[Total] [decimal](18, 2) NULL,
	[CantProductos] [int] NULL,
	[Estado] [char](3) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCrea] [int] NULL,
 CONSTRAINT [PK_Operacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PerfilSeguridad]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilSeguridad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[DesPerfilSeguridad] [nvarchar](250) NULL,
	[IntentosPermitidos] [int] NULL,
	[DiasExpiraClave] [int] NULL,
	[LenMinPass] [int] NULL,
	[CantLetrasMin] [int] NULL,
	[CantLetrasMayMin] [int] NULL,
	[CantNumeroMin] [int] NULL,
	[CantCharEspecialMin] [int] NULL,
 CONSTRAINT [PK_PerfilSeguridad] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NULL,
	[IdUnidad] [int] NULL,
	[IdMoneda] [int] NULL,
	[barcode] [nvarchar](100) NULL,
	[Nombre] [nvarchar](100) NULL,
	[DesProducto] [nvarchar](250) NULL,
	[Inventario_Min] [int] NULL,
	[Stock] [int] NULL,
	[precio_in] [decimal](18, 2) NULL,
	[precio_out] [decimal](18, 2) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCrea] [int] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductoImages]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Image] [varbinary](max) NULL,
	[UsuarioCrea] [int] NULL,
 CONSTRAINT [PK_ProductoImages] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolesAcciones]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesAcciones](
	[IdRol] [int] NOT NULL,
	[IdAcciones] [int] NOT NULL,
 CONSTRAINT [PK_RolesAcciones] PRIMARY KEY NONCLUSTERED 
(
	[IdRol] ASC,
	[IdAcciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolesUsuarios]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesUsuarios](
	[IdRol] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_RolesUsuarios] PRIMARY KEY NONCLUSTERED 
(
	[IdRol] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TasaCambios]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TasaCambios](
	[IdTasaCambio] [int] IDENTITY(1,1) NOT NULL,
	[IdMonedaLocal] [int] NOT NULL,
	[IdMonedaExtranjera] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[TCoficial] [decimal](18, 4) NOT NULL,
	[TCventa] [decimal](18, 4) NOT NULL,
	[TCcompra] [decimal](18, 4) NOT NULL,
	[IdUsuarioReg] [int] NOT NULL,
	[FechaReg] [datetime] NOT NULL,
	[IdUsuarioUpd] [int] NOT NULL,
	[FechaUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_TasaCambios] PRIMARY KEY CLUSTERED 
(
	[IdTasaCambio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoOperacion]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoOperacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NULL,
 CONSTRAINT [PK_TipoOperacion] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unidades]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesUnidades] [nvarchar](200) NULL,
	[Codigo] [nvarchar](10) NULL,
	[UsuarioCrea] [int] NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Unidades] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [CK_Unidades_CodigoUnique] UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[UserName] [nvarchar](100) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[Password] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaActualizacion] [datetime] NULL,
	[IntentosFallidos] [int] NULL,
	[FechaUltimoIngreso] [datetime] NULL,
	[IdEstadoUsuario] [int] NULL,
	[IdPerfilSeguridad] [int] NULL,
	[ImageUser] [varbinary](max) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[EstadoUsuarios] ADD  DEFAULT ((0)) FOR [CanLogin]
GO
ALTER TABLE [dbo].[Monedas] ADD  DEFAULT ((0)) FOR [IsLocal]
GO
ALTER TABLE [dbo].[Operacion] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [EmailConfirmed]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [PhoneNumberConfirmed]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [TwoFactorEnabled]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [IntentosFallidos]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [IdEstadoUsuario]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [IdPerfilSeguridad]
GO
ALTER TABLE [dbo].[Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_CategoriaParentId] FOREIGN KEY([CategoriaParentId])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Categoria] CHECK CONSTRAINT [FK_Categoria_CategoriaParentId]
GO
ALTER TABLE [dbo].[Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_Usuarios] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Categoria] CHECK CONSTRAINT [FK_Categoria_Usuarios]
GO
ALTER TABLE [dbo].[CodigoValidacionUsuario]  WITH CHECK ADD  CONSTRAINT [Fk_CodigoValidacionUsuario_Usuarios] FOREIGN KEY([UsuariosId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[CodigoValidacionUsuario] CHECK CONSTRAINT [Fk_CodigoValidacionUsuario_Usuarios]
GO
ALTER TABLE [dbo].[DetalleOperacion]  WITH CHECK ADD  CONSTRAINT [FK_DetalleOperacion_Operacion] FOREIGN KEY([IdOperacion])
REFERENCES [dbo].[Operacion] ([Id])
GO
ALTER TABLE [dbo].[DetalleOperacion] CHECK CONSTRAINT [FK_DetalleOperacion_Operacion]
GO
ALTER TABLE [dbo].[DetalleOperacion]  WITH CHECK ADD  CONSTRAINT [FK_DetalleOperacion_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[DetalleOperacion] CHECK CONSTRAINT [FK_DetalleOperacion_Producto]
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_Cliente]
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_TipoOperacion] FOREIGN KEY([IdTipoOperacion])
REFERENCES [dbo].[TipoOperacion] ([Id])
GO
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_TipoOperacion]
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Usuarios] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_Usuarios]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Monedas] FOREIGN KEY([IdMoneda])
REFERENCES [dbo].[Monedas] ([Id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Monedas]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Unidades] FOREIGN KEY([IdUnidad])
REFERENCES [dbo].[Unidades] ([Id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Unidades]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Usuarios] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Usuarios]
GO
ALTER TABLE [dbo].[ProductoImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductoImages_Product] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[ProductoImages] CHECK CONSTRAINT [FK_ProductoImages_Product]
GO
ALTER TABLE [dbo].[ProductoImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductoImages_Usuarios] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[ProductoImages] CHECK CONSTRAINT [FK_ProductoImages_Usuarios]
GO
ALTER TABLE [dbo].[RolesAcciones]  WITH CHECK ADD  CONSTRAINT [FK_RolesAcciones_Acciones] FOREIGN KEY([IdAcciones])
REFERENCES [dbo].[Acciones] ([Id])
GO
ALTER TABLE [dbo].[RolesAcciones] CHECK CONSTRAINT [FK_RolesAcciones_Acciones]
GO
ALTER TABLE [dbo].[RolesAcciones]  WITH CHECK ADD  CONSTRAINT [FK_RolesAcciones_Roles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RolesAcciones] CHECK CONSTRAINT [FK_RolesAcciones_Roles]
GO
ALTER TABLE [dbo].[RolesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_RolesUsuarios_Roles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RolesUsuarios] CHECK CONSTRAINT [FK_RolesUsuarios_Roles]
GO
ALTER TABLE [dbo].[RolesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_RolesUsuarios_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[RolesUsuarios] CHECK CONSTRAINT [FK_RolesUsuarios_Usuarios]
GO
ALTER TABLE [dbo].[Unidades]  WITH CHECK ADD  CONSTRAINT [FK_Unidades_Usuarios] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Unidades] CHECK CONSTRAINT [FK_Unidades_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_EstadoUsuarios] FOREIGN KEY([IdEstadoUsuario])
REFERENCES [dbo].[EstadoUsuarios] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_EstadoUsuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_PerfilSeguridad] FOREIGN KEY([IdPerfilSeguridad])
REFERENCES [dbo].[PerfilSeguridad] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_PerfilSeguridad]
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [CK_Operacion_Estado] CHECK  (([Estado]='ANU' OR [Estado]='PEN' OR [Estado]='ACT'))
GO
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [CK_Operacion_Estado]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertaOperacion]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertaOperacion]
--DECLARE @Id INT,
	@IdCliente INT,
	@IdTipoOperacion INT ,
	@Total DECIMAL(18,2),
	@CantProductos INT ,
	@Estado CHAR(3),
	@UsuarioCrea INT,
	@detalle udt_DetalleOperacion READONLY
AS 


	
BEGIN
	SET NOCOUNT ON 
	DECLARE @Id INT
	DECLARE @NoError INT,@Mensaje NVARCHAR (250)
	SET @NoError = 0
	SET @Mensaje = 'Registro aplicado exitosamente'	
	BEGIN TRY
	
	BEGIN TRANSACTION 
	INSERT INTO Operacion
	(
		-- Id -- this column value is auto-generated
		IdCliente,
		IdTipoOperacion,
		Total,
		CantProductos,
		Estado,
		FechaCreacion,
		UsuarioCrea
	)
	VALUES
	(
		@IdCliente,@IdTipoOperacion,@Total, @CantProductos, @Estado, GETDATE(), @UsuarioCrea
	)
	
	SET @Id = SCOPE_IDENTITY()
	
	
	
	
	INSERT INTO DetalleOperacion
	SELECT row_number() OVER (ORDER BY IdProducto) Id,@Id IdOperacion, * FROM @detalle
	
	IF @IdTipoOperacion = 1
	BEGIN
		UPDATE Producto
		SET Stock = Isnull(Stock,0) + d.Cantidad
		FROM Producto AS p INNER JOIN (SELECT IdProducto,SUM(Cantidad) as Cantidad from @detalle GROUP BY IdProducto) d ON 
		p.Id = d.IdProducto	
	END
	ELSE
	BEGIN	
		UPDATE Producto
		SET Stock = Isnull(Stock,0) + d.Cantidad
		FROM Producto AS p INNER JOIN (SELECT IdProducto,SUM(Cantidad) as Cantidad from @detalle GROUP BY IdProducto) d ON 
		p.Id = d.IdProducto	
	END
	
	
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	IF @@TRANCOUNT > 0
		ROLLBACK TRAN
	SET @NoError = ERROR_NUMBER()
	SET @Mensaje = ERROR_MESSAGE()
			--SELECT
			--	ERROR_NUMBER() AS ErrorNumber,
			--	ERROR_SEVERITY() AS ErrorSeverity,
			--	ERROR_STATE() AS ErrorState,
			--	ERROR_PROCEDURE() AS ErrorProcedure,
			--	ERROR_LINE() AS ErrorLine,
			--	ERROR_MESSAGE() AS ErrorMessage
		
	END CATCH
	SELECT @NoError NoError,@Mensaje Mensaje

END
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarProductos]    Script Date: 05/07/2018 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarProductos]
AS
BEGIN
SELECT
P.Nombre,
P.DesProducto,
C.Nombre AS Categoria,
U.DesUnidades,
P.Inventario_Min,
M.Nombre Moneda,
P.precio_in,
P.precio_out
FROM  dbo.Producto P
INNER JOIN dbo.Categoria C ON C.Id = P.IdCategoria
INNER JOIN dbo.Unidades U ON U.Id = P.IdUnidad
INNER JOIN  dbo.Monedas M ON M.Id = P.IdMoneda
END 
GO
USE [master]
GO
ALTER DATABASE [BDINV] SET  READ_WRITE 
GO
