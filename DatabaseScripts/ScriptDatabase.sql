USE [BDINV]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_PerfilSeguridad]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_EstadoUsuarios]
GO
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT [FK_Unidades_Usuarios]
GO
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT [FK_Categoria_Usuarios]
GO
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT [FK_Categoria_CategoriaParentId]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__IdPerf__5070F446]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__IdEsta__4F7CD00D]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__Intent__4E88ABD4]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__TwoFac__4D94879B]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__PhoneN__4CA06362]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__EmailC__4BAC3F29]
GO
ALTER TABLE [dbo].[Monedas] DROP CONSTRAINT [DF__Monedas__IsLocal__10566F31]
GO
/****** Object:  Index [PK_Usuarios]    Script Date: 21/03/2018 8:58:47 ******/
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [PK_Usuarios]
GO
/****** Object:  Index [UQ__Unidades__06370DAC0B91BA14]    Script Date: 21/03/2018 8:58:47 ******/
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT [UQ__Unidades__06370DAC0B91BA14]
GO
/****** Object:  Index [CK_Unidades_CodigoUnique]    Script Date: 21/03/2018 8:58:47 ******/
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT [CK_Unidades_CodigoUnique]
GO
/****** Object:  Index [PK_Unidades]    Script Date: 21/03/2018 8:58:47 ******/
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT [PK_Unidades]
GO
/****** Object:  Index [PK_PerfilSeguridad]    Script Date: 21/03/2018 8:58:47 ******/
ALTER TABLE [dbo].[PerfilSeguridad] DROP CONSTRAINT [PK_PerfilSeguridad]
GO
/****** Object:  Index [PK_Monedas]    Script Date: 21/03/2018 8:58:47 ******/
ALTER TABLE [dbo].[Monedas] DROP CONSTRAINT [PK_Monedas]
GO
/****** Object:  Index [PK_EstadoUsuarios]    Script Date: 21/03/2018 8:58:47 ******/
ALTER TABLE [dbo].[EstadoUsuarios] DROP CONSTRAINT [PK_EstadoUsuarios]
GO
/****** Object:  Index [PK_Categoria]    Script Date: 21/03/2018 8:58:47 ******/
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT [PK_Categoria]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 21/03/2018 8:58:47 ******/
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[Unidades]    Script Date: 21/03/2018 8:58:47 ******/
DROP TABLE [dbo].[Unidades]
GO
/****** Object:  Table [dbo].[PerfilSeguridad]    Script Date: 21/03/2018 8:58:47 ******/
DROP TABLE [dbo].[PerfilSeguridad]
GO
/****** Object:  Table [dbo].[Monedas]    Script Date: 21/03/2018 8:58:47 ******/
DROP TABLE [dbo].[Monedas]
GO
/****** Object:  Table [dbo].[EstadoUsuarios]    Script Date: 21/03/2018 8:58:47 ******/
DROP TABLE [dbo].[EstadoUsuarios]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 21/03/2018 8:58:47 ******/
DROP TABLE [dbo].[Categoria]
GO
USE [master]
GO
/****** Object:  Database [BDINV]    Script Date: 21/03/2018 8:58:47 ******/
DROP DATABASE [BDINV]
GO
/****** Object:  Database [BDINV]    Script Date: 21/03/2018 8:58:47 ******/
CREATE DATABASE [BDINV] ON  PRIMARY 
( NAME = N'BDINV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BDINV.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDINV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BDINV_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [BDINV] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [BDINV] SET RECOVERY FULL 
GO
ALTER DATABASE [BDINV] SET  MULTI_USER 
GO
ALTER DATABASE [BDINV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDINV] SET DB_CHAINING OFF 
GO
USE [BDINV]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 21/03/2018 8:58:48 ******/
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
	[UsuarioCrea] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EstadoUsuarios]    Script Date: 21/03/2018 8:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoUsuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesEstadoUsuario] [nvarchar](100) NULL,
	[Codigo] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Monedas]    Script Date: 21/03/2018 8:58:48 ******/
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
	[IsLocal] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PerfilSeguridad]    Script Date: 21/03/2018 8:58:48 ******/
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
	[CantCharEspecialMin] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unidades]    Script Date: 21/03/2018 8:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesUnidades] [nvarchar](200) NULL,
	[Codigo] [nvarchar](10) NULL,
	[UsuarioCrea] [int] NULL,
	[FechaCreacion] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 21/03/2018 8:58:48 ******/
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
	[ImageUser] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [CategoriaParentId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (1, NULL, N'Lacteos', N'Catetoría utilizada para: leche, queso, crema, etc', CAST(N'2018-03-20T13:12:34.220' AS DateTime), 1)
INSERT [dbo].[Categoria] ([Id], [CategoriaParentId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (2, 1, N'Lecha la perfecta', N'Lecha Perfecta 1lt', CAST(N'2018-03-20T13:13:47.147' AS DateTime), 1)
INSERT [dbo].[Categoria] ([Id], [CategoriaParentId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (3, NULL, N'Tecnología', N'Productos tecnologicos ', CAST(N'2018-03-20T13:14:55.293' AS DateTime), 1)
INSERT [dbo].[Categoria] ([Id], [CategoriaParentId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (4, 3, N'Laptops', N'Computadoras portatiles', CAST(N'2018-03-20T13:15:29.087' AS DateTime), 1)
INSERT [dbo].[Categoria] ([Id], [CategoriaParentId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (5, 3, N'PC Escritorios', N'Computadoras de Escritorios', CAST(N'2018-03-20T13:16:03.913' AS DateTime), 1)
INSERT [dbo].[Categoria] ([Id], [CategoriaParentId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (6, 3, N'Monitores', N'Monitores de Computadoras', CAST(N'2018-03-20T13:16:39.107' AS DateTime), 1)
INSERT [dbo].[Categoria] ([Id], [CategoriaParentId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (7, 3, N'Perifericos', N'Mouse, teclados, etc', CAST(N'2018-03-20T13:17:07.627' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[EstadoUsuarios] ON 

INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (1, N'Estado Inicial cuando se crea una cuenta', N'ALTA')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (2, N'Estado Activo de un usuario', N'ACT')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (3, N'Estado Usuario Baja', N'BAJA')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (4, N'Estado Usuario Bloqueado', N'BLOQ')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (5, N'Estado Usuario Bloqueado Temporal', N'BLOQTEMP')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (6, N'Estado Inicial cuando se crea una cuenta', N'ALTA')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (7, N'Estado Activo de un usuario', N'ACT')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (8, N'Estado Usuario Baja', N'BAJA')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (9, N'Estado Usuario Bloqueado', N'BLOQ')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (10, N'Estado Usuario Bloqueado Temporal', N'BLOQTEMP')
SET IDENTITY_INSERT [dbo].[EstadoUsuarios] OFF
SET IDENTITY_INSERT [dbo].[Monedas] ON 

INSERT [dbo].[Monedas] ([Id], [Nombre], [Simbolo], [Codigo], [Numero], [IsLocal]) VALUES (1, N'Córdoba', N'C$', N'NIO', 558, 1)
INSERT [dbo].[Monedas] ([Id], [Nombre], [Simbolo], [Codigo], [Numero], [IsLocal]) VALUES (2, N'Dólar estadounidense', N'$', N'USD', 840, 0)
SET IDENTITY_INSERT [dbo].[Monedas] OFF
SET IDENTITY_INSERT [dbo].[PerfilSeguridad] ON 

INSERT [dbo].[PerfilSeguridad] ([Id], [Nombre], [DesPerfilSeguridad], [IntentosPermitidos], [DiasExpiraClave], [LenMinPass], [CantLetrasMin], [CantLetrasMayMin], [CantNumeroMin], [CantCharEspecialMin]) VALUES (1, N'Default', N'Perfil de Seguridad por defecto', 3, 30, 10, 4, 1, 3, 1)
INSERT [dbo].[PerfilSeguridad] ([Id], [Nombre], [DesPerfilSeguridad], [IntentosPermitidos], [DiasExpiraClave], [LenMinPass], [CantLetrasMin], [CantLetrasMayMin], [CantNumeroMin], [CantCharEspecialMin]) VALUES (2, N'Default', N'Perfil de Seguridad por defecto', 3, 30, 10, 4, 1, 3, 1)
SET IDENTITY_INSERT [dbo].[PerfilSeguridad] OFF
SET IDENTITY_INSERT [dbo].[Unidades] ON 

INSERT [dbo].[Unidades] ([Id], [DesUnidades], [Codigo], [UsuarioCrea], [FechaCreacion]) VALUES (1, N'Unidad', N'UND', 1, CAST(N'2018-03-20T15:10:22.917' AS DateTime))
INSERT [dbo].[Unidades] ([Id], [DesUnidades], [Codigo], [UsuarioCrea], [FechaCreacion]) VALUES (2, N'Libras', N'LB', 1, CAST(N'2018-03-20T15:10:35.253' AS DateTime))
INSERT [dbo].[Unidades] ([Id], [DesUnidades], [Codigo], [UsuarioCrea], [FechaCreacion]) VALUES (3, N'Kilogramos', N'Kg', 1, CAST(N'2018-03-20T15:10:47.093' AS DateTime))
INSERT [dbo].[Unidades] ([Id], [DesUnidades], [Codigo], [UsuarioCrea], [FechaCreacion]) VALUES (4, N'Docena', N'doc', 1, CAST(N'2018-03-20T15:11:35.917' AS DateTime))
INSERT [dbo].[Unidades] ([Id], [DesUnidades], [Codigo], [UsuarioCrea], [FechaCreacion]) VALUES (5, N'Litros', N'lt.', 1, CAST(N'2018-03-20T15:11:53.693' AS DateTime))
SET IDENTITY_INSERT [dbo].[Unidades] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Email], [UserName], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [FechaCreacion], [FechaActualizacion], [IntentosFallidos], [FechaUltimoIngreso], [IdEstadoUsuario], [IdPerfilSeguridad], [ImageUser]) VALUES (1, N'cesariverarivas@gmail.com', N'cesariverarivas@gmail.com', 0, N'O7/41mOkf1x9+OnFGKMWJQ==', NULL, 0, 0, CAST(N'2018-03-19T00:00:00.000' AS DateTime), NULL, 0, NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
/****** Object:  Index [PK_Categoria]    Script Date: 21/03/2018 8:58:48 ******/
ALTER TABLE [dbo].[Categoria] ADD  CONSTRAINT [PK_Categoria] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_EstadoUsuarios]    Script Date: 21/03/2018 8:58:48 ******/
ALTER TABLE [dbo].[EstadoUsuarios] ADD  CONSTRAINT [PK_EstadoUsuarios] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Monedas]    Script Date: 21/03/2018 8:58:48 ******/
ALTER TABLE [dbo].[Monedas] ADD  CONSTRAINT [PK_Monedas] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PerfilSeguridad]    Script Date: 21/03/2018 8:58:48 ******/
ALTER TABLE [dbo].[PerfilSeguridad] ADD  CONSTRAINT [PK_PerfilSeguridad] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Unidades]    Script Date: 21/03/2018 8:58:48 ******/
ALTER TABLE [dbo].[Unidades] ADD  CONSTRAINT [PK_Unidades] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CK_Unidades_CodigoUnique]    Script Date: 21/03/2018 8:58:48 ******/
ALTER TABLE [dbo].[Unidades] ADD  CONSTRAINT [CK_Unidades_CodigoUnique] UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Unidades__06370DAC0B91BA14]    Script Date: 21/03/2018 8:58:48 ******/
ALTER TABLE [dbo].[Unidades] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Usuarios]    Script Date: 21/03/2018 8:58:48 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [PK_Usuarios] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Monedas] ADD  DEFAULT ((0)) FOR [IsLocal]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [EmailConfirmed]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [PhoneNumberConfirmed]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [TwoFactorEnabled]
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
USE [master]
GO
ALTER DATABASE [BDINV] SET  READ_WRITE 
GO
