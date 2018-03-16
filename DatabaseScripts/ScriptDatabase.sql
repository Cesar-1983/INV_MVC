USE [BDINV]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_PerfilSeguridad]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_EstadoUsuarios]
GO
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT [FK_Unidades_Usuarios]
GO
ALTER TABLE [dbo].[ProductoImages] DROP CONSTRAINT [FK_ProductoImages_Usuarios]
GO
ALTER TABLE [dbo].[ProductoImages] DROP CONSTRAINT [FK_ProductoImages_Product]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Usuarios]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Unidades]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT [FK_Categoria_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__IdPerf__300424B4]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__IdEsta__2F10007B]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__Intent__2E1BDC42]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__TwoFac__2D27B809]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__PhoneN__2C3393D0]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__EmailC__2B3F6F97]
GO
/****** Object:  Index [PK_Usuarios]    Script Date: 16/03/2018 13:58:01 ******/
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [PK_Usuarios]
GO
/****** Object:  Index [UQ__Unidades__06370DAC38996AB5]    Script Date: 16/03/2018 13:58:01 ******/
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT [UQ__Unidades__06370DAC38996AB5]
GO
/****** Object:  Index [PK_Unidades]    Script Date: 16/03/2018 13:58:01 ******/
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT [PK_Unidades]
GO
/****** Object:  Index [PK_ProductoImages]    Script Date: 16/03/2018 13:58:01 ******/
ALTER TABLE [dbo].[ProductoImages] DROP CONSTRAINT [PK_ProductoImages]
GO
/****** Object:  Index [PK_Producto]    Script Date: 16/03/2018 13:58:01 ******/
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [PK_Producto]
GO
/****** Object:  Index [PK_PerfilSeguridad]    Script Date: 16/03/2018 13:58:01 ******/
ALTER TABLE [dbo].[PerfilSeguridad] DROP CONSTRAINT [PK_PerfilSeguridad]
GO
/****** Object:  Index [PK_EstadoUsuarios]    Script Date: 16/03/2018 13:58:01 ******/
ALTER TABLE [dbo].[EstadoUsuarios] DROP CONSTRAINT [PK_EstadoUsuarios]
GO
/****** Object:  Index [PK_Categoria]    Script Date: 16/03/2018 13:58:01 ******/
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT [PK_Categoria]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 16/03/2018 13:58:01 ******/
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[Unidades]    Script Date: 16/03/2018 13:58:01 ******/
DROP TABLE [dbo].[Unidades]
GO
/****** Object:  Table [dbo].[ProductoImages]    Script Date: 16/03/2018 13:58:01 ******/
DROP TABLE [dbo].[ProductoImages]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 16/03/2018 13:58:01 ******/
DROP TABLE [dbo].[Producto]
GO
/****** Object:  Table [dbo].[PerfilSeguridad]    Script Date: 16/03/2018 13:58:01 ******/
DROP TABLE [dbo].[PerfilSeguridad]
GO
/****** Object:  Table [dbo].[EstadoUsuarios]    Script Date: 16/03/2018 13:58:01 ******/
DROP TABLE [dbo].[EstadoUsuarios]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 16/03/2018 13:58:01 ******/
DROP TABLE [dbo].[Categoria]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 16/03/2018 13:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](200) NULL,
	[DesCategoria] [nvarchar](200) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCrea] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EstadoUsuarios]    Script Date: 16/03/2018 13:58:02 ******/
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
/****** Object:  Table [dbo].[PerfilSeguridad]    Script Date: 16/03/2018 13:58:02 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 16/03/2018 13:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NULL,
	[IdUnidad] [int] NULL,
	[barcode] [nvarchar](100) NULL,
	[Nombre] [nvarchar](100) NULL,
	[DesProducto] [nvarchar](250) NULL,
	[Inventario_Min] [int] NULL,
	[precio_in] [decimal](18, 2) NULL,
	[precio_out] [decimal](18, 2) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCrea] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductoImages]    Script Date: 16/03/2018 13:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoImages](
	[Id] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Image] [varbinary](max) NULL,
	[UsuarioCrea] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unidades]    Script Date: 16/03/2018 13:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesUnidades] [nvarchar](200) NULL,
	[Codigo] [nvarchar](10) NULL,
	[UsuarioCrea] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 16/03/2018 13:58:02 ******/
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
SET IDENTITY_INSERT [dbo].[EstadoUsuarios] ON 

INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (1, N'Estado Inicial del Usuario cuando se crea una cuenta', N'ALTA')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (2, N'Estado Activo de un usuario', N'ACT')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (3, N'Estado Usuario Baja', N'BAJA')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (4, N'Estado Usuario Bloqueado', N'BLOQ')
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo]) VALUES (5, N'Estado Usuario Bloqueado Temporal', N'BLOQTEMP')
SET IDENTITY_INSERT [dbo].[EstadoUsuarios] OFF
SET IDENTITY_INSERT [dbo].[PerfilSeguridad] ON 

INSERT [dbo].[PerfilSeguridad] ([Id], [Nombre], [DesPerfilSeguridad], [IntentosPermitidos], [DiasExpiraClave], [LenMinPass], [CantLetrasMin], [CantLetrasMayMin], [CantNumeroMin], [CantCharEspecialMin]) VALUES (1, N'Default', N'Perfil de Seguridad por defecto', 3, 30, 10, 4, 1, 3, 1)
SET IDENTITY_INSERT [dbo].[PerfilSeguridad] OFF
/****** Object:  Index [PK_Categoria]    Script Date: 16/03/2018 13:58:02 ******/
ALTER TABLE [dbo].[Categoria] ADD  CONSTRAINT [PK_Categoria] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_EstadoUsuarios]    Script Date: 16/03/2018 13:58:02 ******/
ALTER TABLE [dbo].[EstadoUsuarios] ADD  CONSTRAINT [PK_EstadoUsuarios] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PerfilSeguridad]    Script Date: 16/03/2018 13:58:02 ******/
ALTER TABLE [dbo].[PerfilSeguridad] ADD  CONSTRAINT [PK_PerfilSeguridad] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Producto]    Script Date: 16/03/2018 13:58:02 ******/
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [PK_Producto] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ProductoImages]    Script Date: 16/03/2018 13:58:02 ******/
ALTER TABLE [dbo].[ProductoImages] ADD  CONSTRAINT [PK_ProductoImages] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Unidades]    Script Date: 16/03/2018 13:58:02 ******/
ALTER TABLE [dbo].[Unidades] ADD  CONSTRAINT [PK_Unidades] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Unidades__06370DAC38996AB5]    Script Date: 16/03/2018 13:58:02 ******/
ALTER TABLE [dbo].[Unidades] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Usuarios]    Script Date: 16/03/2018 13:58:02 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [PK_Usuarios] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_Usuarios] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Categoria] CHECK CONSTRAINT [FK_Categoria_Usuarios]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
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
