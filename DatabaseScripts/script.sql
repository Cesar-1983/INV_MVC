USE [BDDIRMED]
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarProductos]    Script Date: 25/7/2018 15:01:31 ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ListarProductos]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertaOperacion]    Script Date: 25/7/2018 15:01:31 ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_InsertaOperacion]
GO
/****** Object:  StoredProcedure [dbo].[usp_ins_Lista_CategoriaPerfil]    Script Date: 25/7/2018 15:01:31 ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ins_Lista_CategoriaPerfil]
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteAllPerfiles_CategoriaTipoPerfil_by_PerfilId]    Script Date: 25/7/2018 15:01:31 ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_deleteAllPerfiles_CategoriaTipoPerfil_by_PerfilId]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsUpdTelefonos_Direccion]    Script Date: 25/7/2018 15:01:31 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_InsUpdTelefonos_Direccion]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsUpdDirecciones]    Script Date: 25/7/2018 15:01:31 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_InsUpdDirecciones]
GO
/****** Object:  StoredProcedure [dbo].[sp_DelTelefonos_Direccion]    Script Date: 25/7/2018 15:01:31 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_DelTelefonos_Direccion]
GO
/****** Object:  StoredProcedure [dbo].[sp_DelDirecciones]    Script Date: 25/7/2018 15:01:31 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_DelDirecciones]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operacion]') AND type in (N'U'))
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT IF EXISTS [CK_Operacion_Estado]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT IF EXISTS [FK_Usuarios_PerfilSeguridad]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT IF EXISTS [FK_Usuarios_EstadoUsuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND type in (N'U'))
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT IF EXISTS [FK_Unidades_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Telefonos_Direccion]') AND type in (N'U'))
ALTER TABLE [dbo].[Telefonos_Direccion] DROP CONSTRAINT IF EXISTS [FK_Telefonos_Direccion_Direcciones]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[RolesUsuarios] DROP CONSTRAINT IF EXISTS [FK_RolesUsuarios_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[RolesUsuarios] DROP CONSTRAINT IF EXISTS [FK_RolesUsuarios_Roles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesAcciones]') AND type in (N'U'))
ALTER TABLE [dbo].[RolesAcciones] DROP CONSTRAINT IF EXISTS [FK_RolesAcciones_Roles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesAcciones]') AND type in (N'U'))
ALTER TABLE [dbo].[RolesAcciones] DROP CONSTRAINT IF EXISTS [FK_RolesAcciones_Acciones]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductoImages]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductoImages] DROP CONSTRAINT IF EXISTS [FK_ProductoImages_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductoImages]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductoImages] DROP CONSTRAINT IF EXISTS [FK_ProductoImages_Product]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT IF EXISTS [FK_Producto_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT IF EXISTS [FK_Producto_Unidades]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT IF EXISTS [FK_Producto_Monedas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT IF EXISTS [FK_Producto_Categoria]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]') AND type in (N'U'))
ALTER TABLE [dbo].[Perfiles_CategoriaTipoPerfil] DROP CONSTRAINT IF EXISTS [FK_Perfiles_CategoriaTipoPerfil_Perfil]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]') AND type in (N'U'))
ALTER TABLE [dbo].[Perfiles_CategoriaTipoPerfil] DROP CONSTRAINT IF EXISTS [FK_Perfiles_CategoriaTipoPerfil_CategoriaTipoPerfil]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles]') AND type in (N'U'))
ALTER TABLE [dbo].[Perfiles] DROP CONSTRAINT IF EXISTS [FK_Perfiles_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles]') AND type in (N'U'))
ALTER TABLE [dbo].[Perfiles] DROP CONSTRAINT IF EXISTS [FK_Perfiles_TipoPerfil]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operacion]') AND type in (N'U'))
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT IF EXISTS [FK_Operacion_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operacion]') AND type in (N'U'))
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT IF EXISTS [FK_Operacion_TipoOperacion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operacion]') AND type in (N'U'))
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT IF EXISTS [FK_Operacion_Cliente]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Direcciones]') AND type in (N'U'))
ALTER TABLE [dbo].[Direcciones] DROP CONSTRAINT IF EXISTS [FK_Direcciones_Perfiles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]') AND type in (N'U'))
ALTER TABLE [dbo].[DetalleOperacion] DROP CONSTRAINT IF EXISTS [FK_DetalleOperacion_Producto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]') AND type in (N'U'))
ALTER TABLE [dbo].[DetalleOperacion] DROP CONSTRAINT IF EXISTS [FK_DetalleOperacion_Operacion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CodigoValidacionUsuario]') AND type in (N'U'))
ALTER TABLE [dbo].[CodigoValidacionUsuario] DROP CONSTRAINT IF EXISTS [Fk_CodigoValidacionUsuario_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]') AND type in (N'U'))
ALTER TABLE [dbo].[CategoriaTipoPerfil] DROP CONSTRAINT IF EXISTS [FK_CategoriaTipoPerfil_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]') AND type in (N'U'))
ALTER TABLE [dbo].[CategoriaTipoPerfil] DROP CONSTRAINT IF EXISTS [FK_CategoriaTipoPerfil_TipoPerfil]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]') AND type in (N'U'))
ALTER TABLE [dbo].[CategoriaTipoPerfil] DROP CONSTRAINT IF EXISTS [FK_CategoriaTipoPerfil_CategoriaParentId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND type in (N'U'))
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT IF EXISTS [FK_Categoria_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND type in (N'U'))
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT IF EXISTS [FK_Categoria_CategoriaParentId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT IF EXISTS [DF__Usuarios__IdPerf__2D27B809]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT IF EXISTS [DF__Usuarios__IdEsta__2C3393D0]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT IF EXISTS [DF__Usuarios__Intent__2B3F6F97]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT IF EXISTS [DF__Usuarios__FechaC__2A4B4B5E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT IF EXISTS [DF__Usuarios__TwoFac__29572725]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT IF EXISTS [DF__Usuarios__PhoneN__286302EC]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT IF EXISTS [DF__Usuarios__EmailC__276EDEB3]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operacion]') AND type in (N'U'))
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT IF EXISTS [DF__Operacion__Fecha__267ABA7A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Monedas]') AND type in (N'U'))
ALTER TABLE [dbo].[Monedas] DROP CONSTRAINT IF EXISTS [DF__Monedas__IsLocal__25869641]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstadoUsuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[EstadoUsuarios] DROP CONSTRAINT IF EXISTS [DF__EstadoUsu__CanLo__24927208]
GO
/****** Object:  Index [PK_Usuarios]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT IF EXISTS [PK_Usuarios]
GO
/****** Object:  Index [UQ__Unidades__06370DAC21B6055D]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND type in (N'U'))
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT IF EXISTS [UQ__Unidades__06370DAC21B6055D]
GO
/****** Object:  Index [CK_Unidades_CodigoUnique]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND type in (N'U'))
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT IF EXISTS [CK_Unidades_CodigoUnique]
GO
/****** Object:  Index [PK_Unidades]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND type in (N'U'))
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT IF EXISTS [PK_Unidades]
GO
/****** Object:  Index [PK_TipoPerfil]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoPerfil]') AND type in (N'U'))
ALTER TABLE [dbo].[TipoPerfil] DROP CONSTRAINT IF EXISTS [PK_TipoPerfil]
GO
/****** Object:  Index [PK_TipoOperacion]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoOperacion]') AND type in (N'U'))
ALTER TABLE [dbo].[TipoOperacion] DROP CONSTRAINT IF EXISTS [PK_TipoOperacion]
GO
/****** Object:  Index [PK_Telefonos_Direccion]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Telefonos_Direccion]') AND type in (N'U'))
ALTER TABLE [dbo].[Telefonos_Direccion] DROP CONSTRAINT IF EXISTS [PK_Telefonos_Direccion]
GO
/****** Object:  Index [PK_RolesUsuarios]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[RolesUsuarios] DROP CONSTRAINT IF EXISTS [PK_RolesUsuarios]
GO
/****** Object:  Index [PK_RolesAcciones]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesAcciones]') AND type in (N'U'))
ALTER TABLE [dbo].[RolesAcciones] DROP CONSTRAINT IF EXISTS [PK_RolesAcciones]
GO
/****** Object:  Index [PK_Roles]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT IF EXISTS [PK_Roles]
GO
/****** Object:  Index [PK_ProductoImages]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductoImages]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductoImages] DROP CONSTRAINT IF EXISTS [PK_ProductoImages]
GO
/****** Object:  Index [PK_Producto]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT IF EXISTS [PK_Producto]
GO
/****** Object:  Index [PK_PerfilSeguridad]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PerfilSeguridad]') AND type in (N'U'))
ALTER TABLE [dbo].[PerfilSeguridad] DROP CONSTRAINT IF EXISTS [PK_PerfilSeguridad]
GO
/****** Object:  Index [PK_Perfiles_CategoriaTipoPerfil]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]') AND type in (N'U'))
ALTER TABLE [dbo].[Perfiles_CategoriaTipoPerfil] DROP CONSTRAINT IF EXISTS [PK_Perfiles_CategoriaTipoPerfil]
GO
/****** Object:  Index [PK_Perfiles]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles]') AND type in (N'U'))
ALTER TABLE [dbo].[Perfiles] DROP CONSTRAINT IF EXISTS [PK_Perfiles]
GO
/****** Object:  Index [PK_Monedas]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Monedas]') AND type in (N'U'))
ALTER TABLE [dbo].[Monedas] DROP CONSTRAINT IF EXISTS [PK_Monedas]
GO
/****** Object:  Index [PK_EstadoUsuarios]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstadoUsuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[EstadoUsuarios] DROP CONSTRAINT IF EXISTS [PK_EstadoUsuarios]
GO
/****** Object:  Index [PK_Direcciones]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Direcciones]') AND type in (N'U'))
ALTER TABLE [dbo].[Direcciones] DROP CONSTRAINT IF EXISTS [PK_Direcciones]
GO
/****** Object:  Index [PK_DetalleOperacion]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]') AND type in (N'U'))
ALTER TABLE [dbo].[DetalleOperacion] DROP CONSTRAINT IF EXISTS [PK_DetalleOperacion]
GO
/****** Object:  Index [Pk_CodigoValidacionUsuario]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CodigoValidacionUsuario]') AND type in (N'U'))
ALTER TABLE [dbo].[CodigoValidacionUsuario] DROP CONSTRAINT IF EXISTS [Pk_CodigoValidacionUsuario]
GO
/****** Object:  Index [PK_Cliente]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
ALTER TABLE [dbo].[Cliente] DROP CONSTRAINT IF EXISTS [PK_Cliente]
GO
/****** Object:  Index [PK_CategoriaTipoPerfil]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]') AND type in (N'U'))
ALTER TABLE [dbo].[CategoriaTipoPerfil] DROP CONSTRAINT IF EXISTS [PK_CategoriaTipoPerfil]
GO
/****** Object:  Index [PK_Categoria]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND type in (N'U'))
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT IF EXISTS [PK_Categoria]
GO
/****** Object:  Index [PK_Acciones]    Script Date: 25/7/2018 15:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Acciones]') AND type in (N'U'))
ALTER TABLE [dbo].[Acciones] DROP CONSTRAINT IF EXISTS [PK_Acciones]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[Unidades]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Unidades]
GO
/****** Object:  Table [dbo].[TipoPerfil]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[TipoPerfil]
GO
/****** Object:  Table [dbo].[TipoOperacion]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[TipoOperacion]
GO
/****** Object:  Table [dbo].[Telefonos_Direccion]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Telefonos_Direccion]
GO
/****** Object:  Table [dbo].[TasaCambios]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[TasaCambios]
GO
/****** Object:  Table [dbo].[RolesUsuarios]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[RolesUsuarios]
GO
/****** Object:  Table [dbo].[RolesAcciones]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[RolesAcciones]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Roles]
GO
/****** Object:  Table [dbo].[ProductoImages]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[ProductoImages]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Producto]
GO
/****** Object:  Table [dbo].[PerfilSeguridad]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[PerfilSeguridad]
GO
/****** Object:  Table [dbo].[Perfiles_CategoriaTipoPerfil]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Perfiles_CategoriaTipoPerfil]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Perfiles]
GO
/****** Object:  Table [dbo].[Operacion]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Operacion]
GO
/****** Object:  Table [dbo].[Monedas]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Monedas]
GO
/****** Object:  Table [dbo].[EstadoUsuarios]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[EstadoUsuarios]
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Direcciones]
GO
/****** Object:  Table [dbo].[DetalleOperacion]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[DetalleOperacion]
GO
/****** Object:  Table [dbo].[CodigoValidacionUsuario]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[CodigoValidacionUsuario]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Cliente]
GO
/****** Object:  Table [dbo].[CategoriaTipoPerfil]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[CategoriaTipoPerfil]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Categoria]
GO
/****** Object:  Table [dbo].[Acciones]    Script Date: 25/7/2018 15:01:31 ******/
DROP TABLE IF EXISTS [dbo].[Acciones]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_listofCategoriaTipoPerfilId]    Script Date: 25/7/2018 15:01:31 ******/
DROP TYPE IF EXISTS [dbo].[udt_listofCategoriaTipoPerfilId]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_DetalleOperacion]    Script Date: 25/7/2018 15:01:31 ******/
DROP TYPE IF EXISTS [dbo].[udt_DetalleOperacion]
GO
USE [master]
GO
/****** Object:  Database [BDDIRMED]    Script Date: 25/7/2018 15:01:31 ******/
--DROP DATABASE IF EXISTS [BDDIRMED]
--GO
--/****** Object:  Database [BDDIRMED]    Script Date: 25/7/2018 15:01:31 ******/
--IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'BDDIRMED')
--BEGIN
--CREATE DATABASE [BDDIRMED] ON  PRIMARY 
--( NAME = N'BDDIRMED', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BDDIRMED.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
-- LOG ON 
--( NAME = N'BDDIRMED_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BDDIRMED_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
--END

--GO
--ALTER DATABASE [BDDIRMED] SET COMPATIBILITY_LEVEL = 100
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [BDDIRMED].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
--ALTER DATABASE [BDDIRMED] SET ANSI_NULL_DEFAULT OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET ANSI_NULLS OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET ANSI_PADDING OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET ANSI_WARNINGS OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET ARITHABORT OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET AUTO_CLOSE ON 
--GO
--ALTER DATABASE [BDDIRMED] SET AUTO_SHRINK OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET AUTO_UPDATE_STATISTICS ON 
--GO
--ALTER DATABASE [BDDIRMED] SET CURSOR_CLOSE_ON_COMMIT OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET CURSOR_DEFAULT  GLOBAL 
--GO
--ALTER DATABASE [BDDIRMED] SET CONCAT_NULL_YIELDS_NULL OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET NUMERIC_ROUNDABORT OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET QUOTED_IDENTIFIER OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET RECURSIVE_TRIGGERS OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET  DISABLE_BROKER 
--GO
--ALTER DATABASE [BDDIRMED] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET DATE_CORRELATION_OPTIMIZATION OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET TRUSTWORTHY OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET ALLOW_SNAPSHOT_ISOLATION OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET PARAMETERIZATION SIMPLE 
--GO
--ALTER DATABASE [BDDIRMED] SET READ_COMMITTED_SNAPSHOT OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET HONOR_BROKER_PRIORITY OFF 
--GO
--ALTER DATABASE [BDDIRMED] SET RECOVERY SIMPLE 
--GO
--ALTER DATABASE [BDDIRMED] SET  MULTI_USER 
--GO
--ALTER DATABASE [BDDIRMED] SET PAGE_VERIFY CHECKSUM  
--GO
--ALTER DATABASE [BDDIRMED] SET DB_CHAINING OFF 
--GO
USE [BDDIRMED]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_DetalleOperacion]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_DetalleOperacion' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_DetalleOperacion] AS TABLE(
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio] [decimal](18, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[udt_listofCategoriaTipoPerfilId]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_listofCategoriaTipoPerfilId' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_listofCategoriaTipoPerfilId] AS TABLE(
	[CategoriaTipoPerfilId] [int] NULL
)
GO
/****** Object:  Table [dbo].[Acciones]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Acciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Acciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Accion] [nvarchar](100) NULL,
	[Controlador] [nvarchar](100) NULL,
	[Area] [nvarchar](100) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoriaParentId] [int] NULL,
	[Nombre] [nvarchar](200) NULL,
	[DesCategoria] [nvarchar](200) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCrea] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CategoriaTipoPerfil]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CategoriaTipoPerfil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoriaParentId] [int] NULL,
	[TipoPerfilId] [int] NOT NULL,
	[Nombre] [nvarchar](200) NULL,
	[DesCategoria] [nvarchar](500) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCrea] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Apellido] [nvarchar](150) NOT NULL,
	[Direccion] [nvarchar](250) NULL,
	[Telefono] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[Identificaion] [nvarchar](19) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CodigoValidacionUsuario]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CodigoValidacionUsuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CodigoValidacionUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuariosId] [int] NULL,
	[Tipo] [char](3) NULL,
	[Codigo] [varchar](max) NULL,
	[FechaExpiracion] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DetalleOperacion]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DetalleOperacion](
	[Id] [int] NOT NULL,
	[IdOperacion] [int] NOT NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio] [decimal](18, 2) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Direcciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Direcciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PerfilId] [int] NOT NULL,
	[Direccion] [nvarchar](500) NULL,
	[latitud] [float] NULL,
	[longitud] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EstadoUsuarios]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstadoUsuarios]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EstadoUsuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesEstadoUsuario] [nvarchar](100) NULL,
	[Codigo] [nvarchar](10) NULL,
	[CanLogin] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Monedas]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Monedas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Monedas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Simbolo] [nvarchar](10) NULL,
	[Codigo] [nvarchar](10) NULL,
	[Numero] [int] NULL,
	[IsLocal] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Operacion]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operacion]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Perfiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TipoPerfilId] [int] NULL,
	[UsuariosId] [int] NULL,
	[Nombre] [nvarchar](100) NULL,
	[Apellido] [nvarchar](100) NULL,
	[DescPerfil] [nvarchar](500) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Perfiles_CategoriaTipoPerfil]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Perfiles_CategoriaTipoPerfil](
	[CategoriaTipoPerfilId] [int] NOT NULL,
	[PerfilesId] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PerfilSeguridad]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PerfilSeguridad]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
BEGIN
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
	[UsuarioCrea] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductoImages]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductoImages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductoImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Image] [varbinary](max) NULL,
	[UsuarioCrea] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RolesAcciones]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesAcciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RolesAcciones](
	[IdRol] [int] NOT NULL,
	[IdAcciones] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RolesUsuarios]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RolesUsuarios](
	[IdRol] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TasaCambios]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TasaCambios]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Telefonos_Direccion]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Telefonos_Direccion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Telefonos_Direccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DireccionId] [int] NULL,
	[Telefono] [nvarchar](30) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TipoOperacion]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoOperacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoOperacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TipoPerfil]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoPerfil]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoPerfil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DescTipoPerfil] [nvarchar](100) NULL,
	[Factura] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Unidades]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Unidades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesUnidades] [nvarchar](200) NULL,
	[Codigo] [nvarchar](10) NULL,
	[UsuarioCrea] [int] NULL,
	[FechaCreacion] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
BEGIN
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
END
GO
SET IDENTITY_INSERT [dbo].[Acciones] ON 

INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (1, N'Index', N'Home', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (2, N'OperacionesListar', N'Operaciones', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (3, N'Entrada', N'Operaciones', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (4, N'GetPrecioProducto', N'Operaciones', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (5, N'TasaCambiosListar', N'TasaCambios', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (6, N'TasaCambiosAdd', N'TasaCambios', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (7, N'TasaCambiosEdit', N'TasaCambios', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (8, N'TasaCambiosEliminar', N'TasaCambios', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (9, N'GuardarTasaCambios', N'TasaCambios', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (10, N'TasaCambiosEliminarById', N'TasaCambios', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (11, N'Login', N'Cuenta', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (12, N'Registrarse', N'Cuenta', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (13, N'Logoff', N'Cuenta', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (14, N'ClienteListar', N'Cliente', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (15, N'ClienteAdd', N'Cliente', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (16, N'ClienteEdit', N'Cliente', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (17, N'GuardarCliente', N'Cliente', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (18, N'ClienteEliminarById', N'Cliente', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (19, N'ClienteEliminar', N'Cliente', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (20, N'EstadosUsuariosListar', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (21, N'EstadosUsuariosAdd', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (22, N'EstadosUsuariosEdit', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (23, N'GuardarEstadosUsuarios', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (24, N'EstadosUsuariosEliminar', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (25, N'EstadosUsuariosEliminarById', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (26, N'CategoriasListar', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (27, N'CategoriaAdd', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (28, N'CategoriaEdit', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (29, N'CategoriaEliminar', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (30, N'GuardarCategoria', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (31, N'CategoriaEliminarById', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (32, N'ProductosAll', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (33, N'UnidadesListar', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (34, N'UnidadAdd', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (35, N'UnidadEdit', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (36, N'UnidadEliminar', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (37, N'GuardarUnidad', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (38, N'UnidadEliminarById', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (39, N'MonedasListar', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (40, N'MonedaAdd', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (41, N'MonedaEdit', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (42, N'GuardarMoneda', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (43, N'MonedaEliminar ', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (44, N'MonedaEliminarById', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (45, N'ProductosListar', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (46, N'ProductoAdd', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (47, N'ProductoEdit', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (48, N'GuardarProducto', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (49, N'ProductImageAdd', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (50, N'ProductImageEdit', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (51, N'GuardarProductoImages', N'Catalogos', NULL)
INSERT [dbo].[Acciones] ([Id], [Accion], [Controlador], [Area]) VALUES (52, N'ProductImageCarousel', N'Catalogos', NULL)
SET IDENTITY_INSERT [dbo].[Acciones] OFF
SET IDENTITY_INSERT [dbo].[CategoriaTipoPerfil] ON 

INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (2, NULL, 2, N'Especialidades clínicas', N'Las especialidades médicas se corresponden con la figura tradicional de "médico": asisten personalmente al paciente con actividades preventivas, diagnósticas y terápéuticas, generalmente sin utilizar técnicas quirúrgicas.', CAST(N'2018-07-16T14:18:15.087' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (3, NULL, 2, N'Especialidades quirúrgicas', N'Las especialidades quirúrgicas se corresponden con la figura de cirujano, y utilizan medios invasivos para tratar, modificar o extirpar físicamente la estructura patológica. Se dividen por sistemas. ', CAST(N'2018-07-16T14:18:46.463' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (4, NULL, 2, N'Especialidades médico-quirúrgicas', N'Son las que habitualmente usan tanto técnicas invasivas (quirúrgicas) como no invasivas (farmacológicas, etc). ', CAST(N'2018-07-16T14:19:14.083' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (5, NULL, 2, N'Especialidades de laboratorio o diagnósticas', N'De apoyo a los demás médicos, realizan diagnósticos y sugieren tratamientos a los clínicos, por lo que en ellas la relación con el paciente es reducida. ', CAST(N'2018-07-16T14:19:38.697' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (6, 2, 2, N'Alergología', N'Alergología', CAST(N'2018-07-16T14:29:14.820' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (7, 2, 2, N'Anestesiología y reanimación', N'Anestesiología y reanimación', CAST(N'2018-07-16T14:29:14.850' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (8, 2, 2, N'Cardiología', N'Cardiología', CAST(N'2018-07-16T14:29:14.850' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (9, 2, 2, N'Gastroenterología', N'Gastroenterología', CAST(N'2018-07-16T14:29:14.943' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (10, 2, 2, N'Endocrinología', N'Endocrinología', CAST(N'2018-07-16T14:29:14.943' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (11, 2, 2, N'Geriatría', N'Geriatría', CAST(N'2018-07-16T14:29:14.957' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (12, 2, 2, N'Hematología y hemoterapia', N'Hematología y hemoterapia', CAST(N'2018-07-16T14:29:14.960' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (13, 2, 2, N'Infectología', N'Infectología', CAST(N'2018-07-16T14:29:14.967' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (14, 2, 2, N'Medicina aeroespacial', N'Medicina aeroespacial', CAST(N'2018-07-16T14:29:15.177' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (15, 2, 2, N'Medicina del deporte', N'Medicina del deporte', CAST(N'2018-07-16T14:29:15.177' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (16, 2, 2, N'Medicina del trabajo', N'Medicina del trabajo', CAST(N'2018-07-16T14:29:15.177' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (17, 2, 2, N'Medicina de urgencias', N'Medicina de urgencias', CAST(N'2018-07-16T14:29:15.180' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (18, 2, 2, N'Medicina familiar y comunitaria', N'Medicina familiar y comunitaria', CAST(N'2018-07-16T14:29:15.210' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (19, 2, 2, N'Medicina física y rehabilitación', N'Medicina física y rehabilitación', CAST(N'2018-07-16T14:29:15.230' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (20, 2, 2, N'Medicina intensiva', N'Medicina intensiva', CAST(N'2018-07-16T14:29:15.230' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (21, 2, 2, N'Medicina interna', N'Medicina interna', CAST(N'2018-07-16T14:29:15.230' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (22, 2, 2, N'Medicina legal y forense', N'Medicina legal y forense', CAST(N'2018-07-16T14:29:15.230' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (23, 2, 2, N'Medicina preventiva y salud pública', N'Medicina preventiva y salud pública', CAST(N'2018-07-16T14:29:15.230' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (24, 2, 2, N'Medicina veterinaria', N'Medicina veterinaria', CAST(N'2018-07-16T14:29:15.230' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (25, 2, 2, N'Nefrología', N'Nefrología', CAST(N'2018-07-16T14:29:15.230' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (26, 2, 2, N'Neumología', N'Neumología', CAST(N'2018-07-16T14:29:15.233' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (27, 2, 2, N'Neurología', N'Neurología', CAST(N'2018-07-16T14:29:15.233' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (28, 2, 2, N'Nutriología', N'Nutriología', CAST(N'2018-07-16T14:29:15.280' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (29, 2, 2, N'Oftalmología', N'Oftalmología', CAST(N'2018-07-16T14:29:15.287' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (30, 2, 2, N'Oncología médica', N'Oncología médica', CAST(N'2018-07-16T14:29:15.287' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (31, 2, 2, N'Oncología radioterápica', N'Oncología radioterápica', CAST(N'2018-07-16T14:29:15.317' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (32, 2, 2, N'Pediatría', N'Pediatría', CAST(N'2018-07-16T14:29:15.317' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (33, 2, 2, N'Psiquiatría', N'Psiquiatría', CAST(N'2018-07-16T14:29:15.347' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (34, 2, 2, N'Rehabilitación', N'Rehabilitación', CAST(N'2018-07-16T14:29:15.347' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (35, 2, 2, N'Reumatología', N'Reumatología', CAST(N'2018-07-16T14:29:15.350' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (36, 2, 2, N'Toxicología', N'Toxicología', CAST(N'2018-07-16T14:29:15.350' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (37, 2, 2, N'Urología', N'Urología', CAST(N'2018-07-16T14:29:15.850' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (38, 3, 2, N'Cirugía cardiovascular', N'Cirugía cardiovascular', CAST(N'2018-07-16T14:29:15.850' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (39, 3, 2, N'Cirugía general y del aparato digestivo', N'Cirugía general y del aparato digestivo', CAST(N'2018-07-16T14:29:15.850' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (40, 3, 2, N'Cirugía oral y maxilofacial', N'Cirugía oral y maxilofacial', CAST(N'2018-07-16T14:29:15.850' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (41, 3, 2, N'Cirugía ortopédica y traumatología', N'Cirugía ortopédica y traumatología', CAST(N'2018-07-16T14:29:15.850' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (42, 3, 2, N'Cirugía pediátrica', N'Cirugía pediátrica', CAST(N'2018-07-16T14:29:15.850' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (43, 3, 2, N'Cirugía plástica, estética y reparadora', N'Cirugía plástica, estética y reparadora', CAST(N'2018-07-16T14:29:15.853' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (44, 3, 2, N'Cirugía torácica', N'Cirugía torácica', CAST(N'2018-07-16T14:29:15.863' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (45, 3, 2, N'Neurocirugía', N'Neurocirugía', CAST(N'2018-07-16T14:29:15.867' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (46, 3, 2, N'Proctología', N'Proctología', CAST(N'2018-07-16T14:29:15.867' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (47, 4, 2, N'Angiología y cirugía vascular', N'Angiología y cirugía vascular', CAST(N'2018-07-16T14:29:15.867' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (48, 4, 2, N'Dermatología médico-quirúrgica y venereología', N'Dermatología médico-quirúrgica y venereología', CAST(N'2018-07-16T14:29:15.867' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (49, 4, 2, N'Odontología', N'Odontología', CAST(N'2018-07-16T14:29:15.867' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (50, 4, 2, N'Ginecología y obstetricia o tocología', N'Ginecología y obstetricia o tocología', CAST(N'2018-07-16T14:29:15.867' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (51, 4, 2, N'Oftalmología', N'Oftalmología', CAST(N'2018-07-16T14:29:15.867' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (52, 4, 2, N'Otorrinolaringología', N'Otorrinolaringología', CAST(N'2018-07-16T14:29:15.867' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (53, 4, 2, N'Urología', N'Urología', CAST(N'2018-07-16T14:29:15.870' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (54, 4, 2, N'Traumatología', N'Traumatología', CAST(N'2018-07-16T14:29:15.870' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (55, 5, 2, N'Análisis clínicos', N'Análisis clínicos', CAST(N'2018-07-16T14:29:15.870' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (56, 5, 2, N'Anatomía patológica', N'Anatomía patológica', CAST(N'2018-07-16T14:29:15.870' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (57, 5, 2, N'Bioquímica clínica', N'Bioquímica clínica', CAST(N'2018-07-16T14:29:15.870' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (58, 5, 2, N'Farmacología clínica', N'Farmacología clínica', CAST(N'2018-07-16T14:29:15.870' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (59, 5, 2, N'Genética médica', N'Genética médica', CAST(N'2018-07-16T14:29:15.870' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (60, 5, 2, N'Inmunología', N'Inmunología', CAST(N'2018-07-16T14:29:15.933' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (61, 5, 2, N'Medicina nuclear', N'Medicina nuclear', CAST(N'2018-07-16T14:29:15.937' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (62, 5, 2, N'Microbiología y parasitología', N'Microbiología y parasitología', CAST(N'2018-07-16T14:29:15.937' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (63, 5, 2, N'Neurofisiología clínica', N'Neurofisiología clínica', CAST(N'2018-07-16T14:29:15.937' AS DateTime), 32)
INSERT [dbo].[CategoriaTipoPerfil] ([Id], [CategoriaParentId], [TipoPerfilId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (64, 5, 2, N'Radiodiagnóstico o radiología', N'Radiodiagnóstico o radiología', CAST(N'2018-07-16T14:29:15.937' AS DateTime), 32)
SET IDENTITY_INSERT [dbo].[CategoriaTipoPerfil] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellido], [Direccion], [Telefono], [email], [Identificaion]) VALUES (1, N'Cesar', N'Rivera', N'NA', N'(+222)-2222-2222', N'cesari@xn--jklj-jqa.col', N'204-300483-0000N')
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellido], [Direccion], [Telefono], [email], [Identificaion]) VALUES (2, N'Luis', N'Dogy', N'NA', N'(+222)-2222-2222', N'dogy@doghouse.com', N'000-000000-0000P')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[CodigoValidacionUsuario] ON 

INSERT [dbo].[CodigoValidacionUsuario] ([Id], [UsuariosId], [Tipo], [Codigo], [FechaExpiracion]) VALUES (28, 32, N'CAE', N'eQap0cvXrlsAHUIH2MrG3Q==', CAST(N'2018-07-06T20:52:47.920' AS DateTime))
INSERT [dbo].[CodigoValidacionUsuario] ([Id], [UsuariosId], [Tipo], [Codigo], [FechaExpiracion]) VALUES (29, 33, N'CAE', N'inYEsbgca8GQO1zGjK42pA==', CAST(N'2018-07-06T21:04:16.997' AS DateTime))
INSERT [dbo].[CodigoValidacionUsuario] ([Id], [UsuariosId], [Tipo], [Codigo], [FechaExpiracion]) VALUES (30, 34, N'CAE', N'Jy3tbKoDfHuIC6XOl4nw+A==', CAST(N'2018-07-07T01:23:08.483' AS DateTime))
SET IDENTITY_INSERT [dbo].[CodigoValidacionUsuario] OFF
SET IDENTITY_INSERT [dbo].[Direcciones] ON 

INSERT [dbo].[Direcciones] ([Id], [PerfilId], [Direccion], [latitud], [longitud]) VALUES (1, 1, N'Centro Financia', 12.1099121, -86.2703378)
INSERT [dbo].[Direcciones] ([Id], [PerfilId], [Direccion], [latitud], [longitud]) VALUES (2, 1, N'Parque Ruben Dario 3c. al norte. Diriomo, Granada', 12.1099121, -86.2703378)
SET IDENTITY_INSERT [dbo].[Direcciones] OFF
SET IDENTITY_INSERT [dbo].[EstadoUsuarios] ON 

INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo], [CanLogin]) VALUES (1, N'Estado Inicial cuando se crea una cuenta', N'ALTA', 1)
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo], [CanLogin]) VALUES (2, N'Estado Activo de un usuario', N'ACT', 1)
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo], [CanLogin]) VALUES (3, N'Estado Usuario Baja', N'BAJA', 0)
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo], [CanLogin]) VALUES (4, N'Estado Usuario Bloqueado', N'BLOQ', 0)
INSERT [dbo].[EstadoUsuarios] ([Id], [DesEstadoUsuario], [Codigo], [CanLogin]) VALUES (5, N'Estado Usuario Bloqueado Temporal', N'BLOQTEMP', 0)
SET IDENTITY_INSERT [dbo].[EstadoUsuarios] OFF
SET IDENTITY_INSERT [dbo].[Monedas] ON 

INSERT [dbo].[Monedas] ([Id], [Nombre], [Simbolo], [Codigo], [Numero], [IsLocal]) VALUES (1, N'Cordoba', N'C$', N'NIO', 558, 1)
INSERT [dbo].[Monedas] ([Id], [Nombre], [Simbolo], [Codigo], [Numero], [IsLocal]) VALUES (2, N'Dolares', N'$', N'USD', 840, 0)
SET IDENTITY_INSERT [dbo].[Monedas] OFF
SET IDENTITY_INSERT [dbo].[Perfiles] ON 

INSERT [dbo].[Perfiles] ([Id], [TipoPerfilId], [UsuariosId], [Nombre], [Apellido], [DescPerfil]) VALUES (1, 2, 32, N'César Augusto', N'Rivera Rivas', N'Médico internista de mas de 20 años de experiencia.')
INSERT [dbo].[Perfiles] ([Id], [TipoPerfilId], [UsuariosId], [Nombre], [Apellido], [DescPerfil]) VALUES (2, 2, 32, N'César Augusto', N'Rivera Rivas', N'Perfil Medico de Prueba, Test API(Modificado)')
INSERT [dbo].[Perfiles] ([Id], [TipoPerfilId], [UsuariosId], [Nombre], [Apellido], [DescPerfil]) VALUES (5, 2, 34, N'César Augusto', N'Rivera Campos', N'Con mas de 20 años de experiencia')
SET IDENTITY_INSERT [dbo].[Perfiles] OFF
INSERT [dbo].[Perfiles_CategoriaTipoPerfil] ([CategoriaTipoPerfilId], [PerfilesId]) VALUES (6, 1)
INSERT [dbo].[Perfiles_CategoriaTipoPerfil] ([CategoriaTipoPerfilId], [PerfilesId]) VALUES (7, 1)
INSERT [dbo].[Perfiles_CategoriaTipoPerfil] ([CategoriaTipoPerfilId], [PerfilesId]) VALUES (10, 1)
INSERT [dbo].[Perfiles_CategoriaTipoPerfil] ([CategoriaTipoPerfilId], [PerfilesId]) VALUES (11, 1)
INSERT [dbo].[Perfiles_CategoriaTipoPerfil] ([CategoriaTipoPerfilId], [PerfilesId]) VALUES (6, 5)
INSERT [dbo].[Perfiles_CategoriaTipoPerfil] ([CategoriaTipoPerfilId], [PerfilesId]) VALUES (7, 5)
INSERT [dbo].[Perfiles_CategoriaTipoPerfil] ([CategoriaTipoPerfilId], [PerfilesId]) VALUES (8, 5)
INSERT [dbo].[Perfiles_CategoriaTipoPerfil] ([CategoriaTipoPerfilId], [PerfilesId]) VALUES (9, 5)
INSERT [dbo].[Perfiles_CategoriaTipoPerfil] ([CategoriaTipoPerfilId], [PerfilesId]) VALUES (10, 5)
INSERT [dbo].[Perfiles_CategoriaTipoPerfil] ([CategoriaTipoPerfilId], [PerfilesId]) VALUES (11, 5)
SET IDENTITY_INSERT [dbo].[PerfilSeguridad] ON 

INSERT [dbo].[PerfilSeguridad] ([Id], [Nombre], [DesPerfilSeguridad], [IntentosPermitidos], [DiasExpiraClave], [LenMinPass], [CantLetrasMin], [CantLetrasMayMin], [CantNumeroMin], [CantCharEspecialMin]) VALUES (1, N'Default', N'Perfil de Seguridad por defecto', 3, 30, 10, 4, 1, 3, 1)
INSERT [dbo].[PerfilSeguridad] ([Id], [Nombre], [DesPerfilSeguridad], [IntentosPermitidos], [DiasExpiraClave], [LenMinPass], [CantLetrasMin], [CantLetrasMayMin], [CantNumeroMin], [CantCharEspecialMin]) VALUES (2, N'Default', N'Perfil de Seguridad por defecto', 3, 30, 10, 4, 1, 3, 1)
INSERT [dbo].[PerfilSeguridad] ([Id], [Nombre], [DesPerfilSeguridad], [IntentosPermitidos], [DiasExpiraClave], [LenMinPass], [CantLetrasMin], [CantLetrasMayMin], [CantNumeroMin], [CantCharEspecialMin]) VALUES (3, N'Default', N'Perfil de Seguridad por defecto', 3, 30, 10, 4, 1, 3, 1)
SET IDENTITY_INSERT [dbo].[PerfilSeguridad] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (2, N'Caja')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (3, N'Seguridad')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (4, N'Invitado')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[TasaCambios] ON 

INSERT [dbo].[TasaCambios] ([IdTasaCambio], [IdMonedaLocal], [IdMonedaExtranjera], [Fecha], [TCoficial], [TCventa], [TCcompra], [IdUsuarioReg], [FechaReg], [IdUsuarioUpd], [FechaUpd]) VALUES (3, 1, 2, CAST(N'2018-03-23T00:00:00.000' AS DateTime), CAST(30.5000 AS Decimal(18, 4)), CAST(31.5000 AS Decimal(18, 4)), CAST(30.5000 AS Decimal(18, 4)), 2, CAST(N'2018-03-22T16:17:23.387' AS DateTime), 2, CAST(N'2018-03-22T16:17:23.387' AS DateTime))
SET IDENTITY_INSERT [dbo].[TasaCambios] OFF
SET IDENTITY_INSERT [dbo].[TipoOperacion] ON 

INSERT [dbo].[TipoOperacion] ([Id], [Nombre]) VALUES (1, N'Entrada')
INSERT [dbo].[TipoOperacion] ([Id], [Nombre]) VALUES (2, N'Salida')
SET IDENTITY_INSERT [dbo].[TipoOperacion] OFF
SET IDENTITY_INSERT [dbo].[TipoPerfil] ON 

INSERT [dbo].[TipoPerfil] ([Id], [DescTipoPerfil], [Factura]) VALUES (1, N'Solo busqueda', 0)
INSERT [dbo].[TipoPerfil] ([Id], [DescTipoPerfil], [Factura]) VALUES (2, N'Médicos', 1)
SET IDENTITY_INSERT [dbo].[TipoPerfil] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Email], [UserName], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [FechaCreacion], [FechaActualizacion], [IntentosFallidos], [FechaUltimoIngreso], [IdEstadoUsuario], [IdPerfilSeguridad], [ImageUser]) VALUES (32, N'cesariverarivas@gmail.com', N'cesariverarivas@gmail.com', 1, N'Z+jFi3mJNAWPQ7kkk1LuWg==', NULL, 0, 0, CAST(N'2018-07-06T00:00:00.000' AS DateTime), NULL, 0, CAST(N'2018-07-25T09:26:49.810' AS DateTime), 1, 1, NULL)
INSERT [dbo].[Usuarios] ([Id], [Email], [UserName], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [FechaCreacion], [FechaActualizacion], [IntentosFallidos], [FechaUltimoIngreso], [IdEstadoUsuario], [IdPerfilSeguridad], [ImageUser]) VALUES (33, N'crivera@versatecenlinea.net', N'crivera@versatecenlinea.net', 1, N'Z+jFi3mJNAWPQ7kkk1LuWg==', NULL, 0, 0, CAST(N'2018-07-06T00:00:00.000' AS DateTime), NULL, 0, NULL, 1, 1, NULL)
INSERT [dbo].[Usuarios] ([Id], [Email], [UserName], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [FechaCreacion], [FechaActualizacion], [IntentosFallidos], [FechaUltimoIngreso], [IdEstadoUsuario], [IdPerfilSeguridad], [ImageUser]) VALUES (34, N'cesariverarivas@hotmail.com', N'cesariverarivas@hotmail.com', 1, N'Z+jFi3mJNAWPQ7kkk1LuWg==', NULL, 0, 0, CAST(N'2018-07-06T00:00:00.000' AS DateTime), NULL, 0, CAST(N'2018-07-20T10:50:27.123' AS DateTime), 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
/****** Object:  Index [PK_Acciones]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Acciones]') AND name = N'PK_Acciones')
ALTER TABLE [dbo].[Acciones] ADD  CONSTRAINT [PK_Acciones] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Categoria]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND name = N'PK_Categoria')
ALTER TABLE [dbo].[Categoria] ADD  CONSTRAINT [PK_Categoria] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_CategoriaTipoPerfil]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]') AND name = N'PK_CategoriaTipoPerfil')
ALTER TABLE [dbo].[CategoriaTipoPerfil] ADD  CONSTRAINT [PK_CategoriaTipoPerfil] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Cliente]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND name = N'PK_Cliente')
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [PK_Cliente] PRIMARY KEY NONCLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Pk_CodigoValidacionUsuario]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CodigoValidacionUsuario]') AND name = N'Pk_CodigoValidacionUsuario')
ALTER TABLE [dbo].[CodigoValidacionUsuario] ADD  CONSTRAINT [Pk_CodigoValidacionUsuario] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_DetalleOperacion]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]') AND name = N'PK_DetalleOperacion')
ALTER TABLE [dbo].[DetalleOperacion] ADD  CONSTRAINT [PK_DetalleOperacion] PRIMARY KEY NONCLUSTERED 
(
	[IdOperacion] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Direcciones]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Direcciones]') AND name = N'PK_Direcciones')
ALTER TABLE [dbo].[Direcciones] ADD  CONSTRAINT [PK_Direcciones] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_EstadoUsuarios]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EstadoUsuarios]') AND name = N'PK_EstadoUsuarios')
ALTER TABLE [dbo].[EstadoUsuarios] ADD  CONSTRAINT [PK_EstadoUsuarios] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Monedas]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Monedas]') AND name = N'PK_Monedas')
ALTER TABLE [dbo].[Monedas] ADD  CONSTRAINT [PK_Monedas] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Perfiles]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles]') AND name = N'PK_Perfiles')
ALTER TABLE [dbo].[Perfiles] ADD  CONSTRAINT [PK_Perfiles] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Perfiles_CategoriaTipoPerfil]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]') AND name = N'PK_Perfiles_CategoriaTipoPerfil')
ALTER TABLE [dbo].[Perfiles_CategoriaTipoPerfil] ADD  CONSTRAINT [PK_Perfiles_CategoriaTipoPerfil] PRIMARY KEY NONCLUSTERED 
(
	[PerfilesId] ASC,
	[CategoriaTipoPerfilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PerfilSeguridad]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PerfilSeguridad]') AND name = N'PK_PerfilSeguridad')
ALTER TABLE [dbo].[PerfilSeguridad] ADD  CONSTRAINT [PK_PerfilSeguridad] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Producto]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND name = N'PK_Producto')
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [PK_Producto] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ProductoImages]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ProductoImages]') AND name = N'PK_ProductoImages')
ALTER TABLE [dbo].[ProductoImages] ADD  CONSTRAINT [PK_ProductoImages] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Roles]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND name = N'PK_Roles')
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [PK_Roles] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_RolesAcciones]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RolesAcciones]') AND name = N'PK_RolesAcciones')
ALTER TABLE [dbo].[RolesAcciones] ADD  CONSTRAINT [PK_RolesAcciones] PRIMARY KEY NONCLUSTERED 
(
	[IdRol] ASC,
	[IdAcciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_RolesUsuarios]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]') AND name = N'PK_RolesUsuarios')
ALTER TABLE [dbo].[RolesUsuarios] ADD  CONSTRAINT [PK_RolesUsuarios] PRIMARY KEY NONCLUSTERED 
(
	[IdRol] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Telefonos_Direccion]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Telefonos_Direccion]') AND name = N'PK_Telefonos_Direccion')
ALTER TABLE [dbo].[Telefonos_Direccion] ADD  CONSTRAINT [PK_Telefonos_Direccion] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_TipoOperacion]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TipoOperacion]') AND name = N'PK_TipoOperacion')
ALTER TABLE [dbo].[TipoOperacion] ADD  CONSTRAINT [PK_TipoOperacion] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_TipoPerfil]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TipoPerfil]') AND name = N'PK_TipoPerfil')
ALTER TABLE [dbo].[TipoPerfil] ADD  CONSTRAINT [PK_TipoPerfil] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Unidades]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND name = N'PK_Unidades')
ALTER TABLE [dbo].[Unidades] ADD  CONSTRAINT [PK_Unidades] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CK_Unidades_CodigoUnique]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND name = N'CK_Unidades_CodigoUnique')
ALTER TABLE [dbo].[Unidades] ADD  CONSTRAINT [CK_Unidades_CodigoUnique] UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Unidades__06370DAC21B6055D]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND name = N'UQ__Unidades__06370DAC21B6055D')
ALTER TABLE [dbo].[Unidades] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Usuarios]    Script Date: 25/7/2018 15:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND name = N'PK_Usuarios')
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [PK_Usuarios] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EstadoUsu__CanLo__24927208]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EstadoUsuarios] ADD  DEFAULT ((0)) FOR [CanLogin]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Monedas__IsLocal__25869641]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Monedas] ADD  DEFAULT ((0)) FOR [IsLocal]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Operacion__Fecha__267ABA7A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Operacion] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__EmailC__276EDEB3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [EmailConfirmed]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__PhoneN__286302EC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [PhoneNumberConfirmed]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__TwoFac__29572725]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [TwoFactorEnabled]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__FechaC__2A4B4B5E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__Intent__2B3F6F97]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [IntentosFallidos]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__IdEsta__2C3393D0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [IdEstadoUsuario]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__IdPerf__2D27B809]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [IdPerfilSeguridad]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Categoria_CategoriaParentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Categoria]'))
ALTER TABLE [dbo].[Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_CategoriaParentId] FOREIGN KEY([CategoriaParentId])
REFERENCES [dbo].[Categoria] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Categoria_CategoriaParentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Categoria]'))
ALTER TABLE [dbo].[Categoria] CHECK CONSTRAINT [FK_Categoria_CategoriaParentId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Categoria_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Categoria]'))
ALTER TABLE [dbo].[Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_Usuarios] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuarios] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Categoria_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Categoria]'))
ALTER TABLE [dbo].[Categoria] CHECK CONSTRAINT [FK_Categoria_Usuarios]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoriaTipoPerfil_CategoriaParentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[CategoriaTipoPerfil]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaTipoPerfil_CategoriaParentId] FOREIGN KEY([CategoriaParentId])
REFERENCES [dbo].[CategoriaTipoPerfil] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoriaTipoPerfil_CategoriaParentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[CategoriaTipoPerfil] CHECK CONSTRAINT [FK_CategoriaTipoPerfil_CategoriaParentId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoriaTipoPerfil_TipoPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[CategoriaTipoPerfil]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaTipoPerfil_TipoPerfil] FOREIGN KEY([TipoPerfilId])
REFERENCES [dbo].[TipoPerfil] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoriaTipoPerfil_TipoPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[CategoriaTipoPerfil] CHECK CONSTRAINT [FK_CategoriaTipoPerfil_TipoPerfil]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoriaTipoPerfil_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[CategoriaTipoPerfil]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaTipoPerfil_Usuarios] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuarios] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoriaTipoPerfil_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[CategoriaTipoPerfil] CHECK CONSTRAINT [FK_CategoriaTipoPerfil_Usuarios]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_CodigoValidacionUsuario_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[CodigoValidacionUsuario]'))
ALTER TABLE [dbo].[CodigoValidacionUsuario]  WITH CHECK ADD  CONSTRAINT [Fk_CodigoValidacionUsuario_Usuarios] FOREIGN KEY([UsuariosId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_CodigoValidacionUsuario_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[CodigoValidacionUsuario]'))
ALTER TABLE [dbo].[CodigoValidacionUsuario] CHECK CONSTRAINT [Fk_CodigoValidacionUsuario_Usuarios]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleOperacion_Operacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]'))
ALTER TABLE [dbo].[DetalleOperacion]  WITH CHECK ADD  CONSTRAINT [FK_DetalleOperacion_Operacion] FOREIGN KEY([IdOperacion])
REFERENCES [dbo].[Operacion] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleOperacion_Operacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]'))
ALTER TABLE [dbo].[DetalleOperacion] CHECK CONSTRAINT [FK_DetalleOperacion_Operacion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleOperacion_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]'))
ALTER TABLE [dbo].[DetalleOperacion]  WITH CHECK ADD  CONSTRAINT [FK_DetalleOperacion_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleOperacion_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]'))
ALTER TABLE [dbo].[DetalleOperacion] CHECK CONSTRAINT [FK_DetalleOperacion_Producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direcciones_Perfiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direcciones]'))
ALTER TABLE [dbo].[Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Direcciones_Perfiles] FOREIGN KEY([PerfilId])
REFERENCES [dbo].[Perfiles] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direcciones_Perfiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direcciones]'))
ALTER TABLE [dbo].[Direcciones] CHECK CONSTRAINT [FK_Direcciones_Perfiles]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operacion_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operacion]'))
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operacion_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operacion]'))
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_Cliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operacion_TipoOperacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operacion]'))
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_TipoOperacion] FOREIGN KEY([IdTipoOperacion])
REFERENCES [dbo].[TipoOperacion] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operacion_TipoOperacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operacion]'))
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_TipoOperacion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operacion_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operacion]'))
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Usuarios] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuarios] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operacion_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operacion]'))
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_Usuarios]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfiles_TipoPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfiles]'))
ALTER TABLE [dbo].[Perfiles]  WITH CHECK ADD  CONSTRAINT [FK_Perfiles_TipoPerfil] FOREIGN KEY([TipoPerfilId])
REFERENCES [dbo].[TipoPerfil] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfiles_TipoPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfiles]'))
ALTER TABLE [dbo].[Perfiles] CHECK CONSTRAINT [FK_Perfiles_TipoPerfil]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfiles_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfiles]'))
ALTER TABLE [dbo].[Perfiles]  WITH CHECK ADD  CONSTRAINT [FK_Perfiles_Usuarios] FOREIGN KEY([UsuariosId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfiles_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfiles]'))
ALTER TABLE [dbo].[Perfiles] CHECK CONSTRAINT [FK_Perfiles_Usuarios]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfiles_CategoriaTipoPerfil_CategoriaTipoPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[Perfiles_CategoriaTipoPerfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfiles_CategoriaTipoPerfil_CategoriaTipoPerfil] FOREIGN KEY([CategoriaTipoPerfilId])
REFERENCES [dbo].[CategoriaTipoPerfil] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfiles_CategoriaTipoPerfil_CategoriaTipoPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[Perfiles_CategoriaTipoPerfil] CHECK CONSTRAINT [FK_Perfiles_CategoriaTipoPerfil_CategoriaTipoPerfil]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfiles_CategoriaTipoPerfil_Perfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[Perfiles_CategoriaTipoPerfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfiles_CategoriaTipoPerfil_Perfil] FOREIGN KEY([PerfilesId])
REFERENCES [dbo].[Perfiles] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfiles_CategoriaTipoPerfil_Perfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[Perfiles_CategoriaTipoPerfil] CHECK CONSTRAINT [FK_Perfiles_CategoriaTipoPerfil_Perfil]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Monedas]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Monedas] FOREIGN KEY([IdMoneda])
REFERENCES [dbo].[Monedas] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Monedas]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Monedas]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Unidades]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Unidades] FOREIGN KEY([IdUnidad])
REFERENCES [dbo].[Unidades] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Unidades]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Unidades]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Usuarios] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuarios] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Usuarios]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoImages_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductoImages]'))
ALTER TABLE [dbo].[ProductoImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductoImages_Product] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoImages_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductoImages]'))
ALTER TABLE [dbo].[ProductoImages] CHECK CONSTRAINT [FK_ProductoImages_Product]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoImages_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductoImages]'))
ALTER TABLE [dbo].[ProductoImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductoImages_Usuarios] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuarios] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoImages_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductoImages]'))
ALTER TABLE [dbo].[ProductoImages] CHECK CONSTRAINT [FK_ProductoImages_Usuarios]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesAcciones_Acciones]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesAcciones]'))
ALTER TABLE [dbo].[RolesAcciones]  WITH CHECK ADD  CONSTRAINT [FK_RolesAcciones_Acciones] FOREIGN KEY([IdAcciones])
REFERENCES [dbo].[Acciones] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesAcciones_Acciones]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesAcciones]'))
ALTER TABLE [dbo].[RolesAcciones] CHECK CONSTRAINT [FK_RolesAcciones_Acciones]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesAcciones_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesAcciones]'))
ALTER TABLE [dbo].[RolesAcciones]  WITH CHECK ADD  CONSTRAINT [FK_RolesAcciones_Roles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesAcciones_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesAcciones]'))
ALTER TABLE [dbo].[RolesAcciones] CHECK CONSTRAINT [FK_RolesAcciones_Roles]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesUsuarios_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]'))
ALTER TABLE [dbo].[RolesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_RolesUsuarios_Roles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesUsuarios_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]'))
ALTER TABLE [dbo].[RolesUsuarios] CHECK CONSTRAINT [FK_RolesUsuarios_Roles]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesUsuarios_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]'))
ALTER TABLE [dbo].[RolesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_RolesUsuarios_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesUsuarios_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]'))
ALTER TABLE [dbo].[RolesUsuarios] CHECK CONSTRAINT [FK_RolesUsuarios_Usuarios]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Telefonos_Direccion_Direcciones]') AND parent_object_id = OBJECT_ID(N'[dbo].[Telefonos_Direccion]'))
ALTER TABLE [dbo].[Telefonos_Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Telefonos_Direccion_Direcciones] FOREIGN KEY([DireccionId])
REFERENCES [dbo].[Direcciones] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Telefonos_Direccion_Direcciones]') AND parent_object_id = OBJECT_ID(N'[dbo].[Telefonos_Direccion]'))
ALTER TABLE [dbo].[Telefonos_Direccion] CHECK CONSTRAINT [FK_Telefonos_Direccion_Direcciones]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Unidades_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Unidades]'))
ALTER TABLE [dbo].[Unidades]  WITH CHECK ADD  CONSTRAINT [FK_Unidades_Usuarios] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuarios] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Unidades_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Unidades]'))
ALTER TABLE [dbo].[Unidades] CHECK CONSTRAINT [FK_Unidades_Usuarios]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_EstadoUsuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_EstadoUsuarios] FOREIGN KEY([IdEstadoUsuario])
REFERENCES [dbo].[EstadoUsuarios] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_EstadoUsuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_EstadoUsuarios]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_PerfilSeguridad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_PerfilSeguridad] FOREIGN KEY([IdPerfilSeguridad])
REFERENCES [dbo].[PerfilSeguridad] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_PerfilSeguridad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_PerfilSeguridad]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Operacion_Estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operacion]'))
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [CK_Operacion_Estado] CHECK  (([Estado]='ANU' OR [Estado]='PEN' OR [Estado]='ACT'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Operacion_Estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operacion]'))
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [CK_Operacion_Estado]
GO
/****** Object:  StoredProcedure [dbo].[sp_DelDirecciones]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DelDirecciones]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_DelDirecciones] AS' 
END
GO
ALTER PROC [dbo].[sp_DelDirecciones]
@Id INT ,
@PerfilId INT
AS 
BEGIN
	SET NOCOUNT ON
	DECLARE @starttrancount BIT
	DECLARE @NoError BIT = 0
	DECLARE @Mensaje NVARCHAR(MAX)=''
	DECLARE @UltReg INT
	DECLARE @vi_UltCod INT

	BEGIN TRY
		SELECT @starttrancount = @@TRANCOUNT

		IF @starttrancount = 0				-- VERIFICAR SI NO EXISTE TRX SQL ABIERTA 
			BEGIN TRANSACTION MiTrx	-- SI NO EXISTE TRX SQL INICIAR UNA TRX SQL

		DELETE FROM dbo.Direcciones WHERE Id=@Id AND PerfilId=@PerfilId
		
		SET @Mensaje = 'La dirección se elimino exitosamente'

		SELECT @vi_UltCod = MAX(Id) 
        FROM dbo.Direcciones

		IF ISNULL(@vi_UltCod,0) = 0
            SET @vi_UltCod = 0
            
        DBCC CHECKIDENT ('dbo.Direcciones', RESEED, @vi_UltCod) 

		IF @starttrancount = 0				-- VERIFICAR SI NO EXISTE TRX SQL ABIERTA 
			COMMIT TRANSACTION MiTrx	-- SI NO EXISTE TRX SQL INICIAR UNA TRX SQL

	END TRY
	BEGIN CATCH
		SET @NoError = 1
		
		SET @Mensaje = CAST(ERROR_NUMBER() AS VARCHAR) + ERROR_MESSAGE()
		IF XACT_STATE() <> 0 AND @starttrancount = 0 -- Si se inició con una nueva transacción --
			ROLLBACK TRANSACTION MiTrx

	END CATCH
	SELECT @NoError response,@Mensaje mensaje
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DelTelefonos_Direccion]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DelTelefonos_Direccion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_DelTelefonos_Direccion] AS' 
END
GO
ALTER PROC [dbo].[sp_DelTelefonos_Direccion]
@Id INT ,
@DireccionId INT
AS 
BEGIN
	SET NOCOUNT ON
	DECLARE @starttrancount BIT
	DECLARE @NoError BIT = 0
	DECLARE @Mensaje NVARCHAR(MAX)=''
	DECLARE @UltReg INT
	DECLARE @vi_UltCod INT

	BEGIN TRY
		SELECT @starttrancount = @@TRANCOUNT

		IF @starttrancount = 0				-- VERIFICAR SI NO EXISTE TRX SQL ABIERTA 
			BEGIN TRANSACTION MiTrx	-- SI NO EXISTE TRX SQL INICIAR UNA TRX SQL

		DELETE FROM dbo.Telefonos_Direccion WHERE Id=@Id AND DireccionId=@DireccionId
		
		SET @Mensaje = 'El teléfono se eliminó exitosamente'

		SELECT @vi_UltCod = MAX(Id) 
        FROM dbo.Telefonos_Direccion

		IF ISNULL(@vi_UltCod,0) = 0
            SET @vi_UltCod = 0
            
        DBCC CHECKIDENT ('dbo.Telefonos_Direccion', RESEED, @vi_UltCod) 

		IF @starttrancount = 0				-- VERIFICAR SI NO EXISTE TRX SQL ABIERTA 
			COMMIT TRANSACTION MiTrx	-- SI NO EXISTE TRX SQL INICIAR UNA TRX SQL

	END TRY
	BEGIN CATCH
		SET @NoError = 1
		
		SET @Mensaje = CAST(ERROR_NUMBER() AS VARCHAR) + ERROR_MESSAGE()
		IF XACT_STATE() <> 0 AND @starttrancount = 0 -- Si se inició con una nueva transacción --
			ROLLBACK TRANSACTION MiTrx

	END CATCH
	SELECT @NoError response,@Mensaje mensaje
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsUpdDirecciones]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsUpdDirecciones]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_InsUpdDirecciones] AS' 
END
GO
ALTER PROC [dbo].[sp_InsUpdDirecciones]
@Id INT = NULL,
@PerfilId INT,
@Direccion NVARCHAR(500),
@latitud FLOAT =NULL,
@longitud FLOAT =NULL
AS	
BEGIN
	SET NOCOUNT ON	
	DECLARE @starttrancount BIT
	DECLARE @NoError BIT = 0
	DECLARE @Mensaje NVARCHAR(MAX)=''
	

	BEGIN TRY
		SELECT @starttrancount = @@TRANCOUNT

		IF @starttrancount = 0				-- VERIFICAR SI NO EXISTE TRX SQL ABIERTA 
			BEGIN TRANSACTION MiTrx	-- SI NO EXISTE TRX SQL INICIAR UNA TRX SQL

		IF @Id IS NULL OR @Id = 0
		BEGIN

			INSERT INTO dbo.Direcciones
			        

			        ( 
			          PerfilId ,
			          Direccion ,
			          latitud ,
			          longitud
			        )
			VALUES  ( 
			          @PerfilId , -- PerfilId - int
			          @Direccion , -- Dirección - nvarchar(500)
			          @latitud , -- latitud - float
			          @longitud  -- longitud - float
			        )
			SET @Mensaje = 'La dirección se agrego exitosamente'

		END
		ELSE
		BEGIN
			UPDATE dbo.Direcciones
			SET Direccion=@Direccion,latitud = @latitud,longitud=@longitud
			WHERE Id=@Id AND PerfilId=@PerfilId
			SET @Mensaje = 'La dirección se actualizo exitosamente'
		END
		IF @starttrancount = 0				-- VERIFICAR SI NO EXISTE TRX SQL ABIERTA 
			COMMIT TRANSACTION MiTrx	-- SI NO EXISTE TRX SQL INICIAR UNA TRX SQL

	END TRY
	BEGIN CATCH
		SET @NoError = 1
		DECLARE @vi_UltCod INT

		SET @Mensaje = CAST(ERROR_NUMBER() AS VARCHAR) + ERROR_MESSAGE()
		IF XACT_STATE() <> 0 AND @starttrancount = 0 -- Si se inició con una nueva transacción --
			ROLLBACK TRANSACTION MiTrx

		SELECT @vi_UltCod = MAX(Id) 
          FROM dbo.Direcciones
         
          IF ISNULL(@vi_UltCod,0) = 0
            SET @vi_UltCod = 0
            
          DBCC CHECKIDENT ('dbo.Direcciones', RESEED, @vi_UltCod) 

	END CATCH
	SELECT @NoError response,@Mensaje mensaje
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsUpdTelefonos_Direccion]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsUpdTelefonos_Direccion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_InsUpdTelefonos_Direccion] AS' 
END
GO
ALTER PROC [dbo].[sp_InsUpdTelefonos_Direccion]
@Id INT = NULL,
@DireccionId INT,
@Telefono NVARCHAR(30)
AS	
BEGIN
	SET NOCOUNT ON	
	DECLARE @starttrancount BIT
	DECLARE @NoError BIT = 0
	DECLARE @Mensaje NVARCHAR(MAX)=''
	

	BEGIN TRY
		SELECT @starttrancount = @@TRANCOUNT

		IF @starttrancount = 0				-- VERIFICAR SI NO EXISTE TRX SQL ABIERTA 
			BEGIN TRANSACTION MiTrx	-- SI NO EXISTE TRX SQL INICIAR UNA TRX SQL

		IF @Id IS NULL OR @Id = 0
		BEGIN
			INSERT INTO dbo.Telefonos_Direccion
			        ( DireccionId, Telefono )
			VALUES  ( @DireccionId, -- DireccionId - int
			          @Telefono  -- Telefono - nvarchar(30)
			          )
			
			SET @Mensaje = 'El teléfono se agregó exitosamente'

		END
		ELSE
		BEGIN
			UPDATE Telefonos_Direccion
			SET Telefono = @Telefono
			WHERE Id=@Id AND DireccionId=@DireccionId
			SET @Mensaje = 'La teléfono se actualizó exitosamente'
		END
		IF @starttrancount = 0				-- VERIFICAR SI NO EXISTE TRX SQL ABIERTA 
			COMMIT TRANSACTION MiTrx	-- SI NO EXISTE TRX SQL INICIAR UNA TRX SQL

	END TRY
	BEGIN CATCH
		SET @NoError = 1
		DECLARE @vi_UltCod INT

		SET @Mensaje = CAST(ERROR_NUMBER() AS VARCHAR) + ERROR_MESSAGE()
		IF XACT_STATE() <> 0 AND @starttrancount = 0 -- Si se inició con una nueva transacción --
			ROLLBACK TRANSACTION MiTrx

		SELECT @vi_UltCod = MAX(Id) 
          FROM dbo.Telefonos_Direccion
         
          IF ISNULL(@vi_UltCod,0) = 0
            SET @vi_UltCod = 0
            
          DBCC CHECKIDENT ('dbo.Telefonos_Direccion', RESEED, @vi_UltCod) 

	END CATCH
	SELECT @NoError response,@Mensaje mensaje
END

GO
/****** Object:  StoredProcedure [dbo].[usp_deleteAllPerfiles_CategoriaTipoPerfil_by_PerfilId]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_deleteAllPerfiles_CategoriaTipoPerfil_by_PerfilId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_deleteAllPerfiles_CategoriaTipoPerfil_by_PerfilId] AS' 
END
GO
ALTER PROCEDURE [dbo].[usp_deleteAllPerfiles_CategoriaTipoPerfil_by_PerfilId]
@PerfilId int
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM dbo.Perfiles_CategoriaTipoPerfil WHERE PerfilesId=@PerfilId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ins_Lista_CategoriaPerfil]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ins_Lista_CategoriaPerfil]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_ins_Lista_CategoriaPerfil] AS' 
END
GO
ALTER PROCEDURE [dbo].[usp_ins_Lista_CategoriaPerfil]
@PerfilId INT,
@listofCategoriaTipoPerfilId udt_listofCategoriaTipoPerfilId READONLY
AS
BEGIN
	DECLARE @tempCategoriaPerfiles AS TABLE (CategoriaTipoPerfilId INT,PerfilesId INT)
	DECLARE @starttrancount BIT

	BEGIN TRY

		INSERT INTO	 @tempCategoriaPerfiles
		SELECT CategoriaTipoPerfilId,@PerfilId FROM @listofCategoriaTipoPerfilId		 
		

		SELECT @starttrancount = @@TRANCOUNT
		IF @starttrancount = 0				-- VERIFICAR SI NO EXISTE TRX SQL ABIERTA 
			BEGIN TRANSACTION MiTran	-- SI NO EXISTE TRX SQL INICIAR UNA TRX SQL


		MERGE dbo.Perfiles_CategoriaTipoPerfil target 
		USING @tempCategoriaPerfiles source ON source.CategoriaTipoPerfilId=target.CategoriaTipoPerfilId AND source.PerfilesId=target.PerfilesId
		WHEN NOT MATCHED THEN
		INSERT ( CategoriaTipoPerfilId ,PerfilesId)
		VALUES  ( source.CategoriaTipoPerfilId,source.PerfilesId)
		WHEN NOT MATCHED BY SOURCE AND target.PerfilesId=@PerfilId
			THEN DELETE
		;


		IF @starttrancount = 0 	   
			COMMIT TRANSACTION  MiTran  ---  APLICAR LA TRX SQL ---

	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0 AND @starttrancount = 0 -- Si se inició con una nueva transacción --
			ROLLBACK TRANSACTION MiTran

	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertaOperacion]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsertaOperacion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_InsertaOperacion] AS' 
END
GO
ALTER PROCEDURE [dbo].[usp_InsertaOperacion]
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
/****** Object:  StoredProcedure [dbo].[usp_ListarProductos]    Script Date: 25/7/2018 15:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ListarProductos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_ListarProductos] AS' 
END
GO
ALTER PROCEDURE [dbo].[usp_ListarProductos]
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
ALTER DATABASE [BDDIRMED] SET  READ_WRITE 
GO
