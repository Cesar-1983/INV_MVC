USE [BDINV]
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarProductos]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ListarProductos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ListarProductos]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertaOperacion]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsertaOperacion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InsertaOperacion]
GO
/****** Object:  StoredProcedure [dbo].[usp_ins_Lista_CategoriaPerfil]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ins_Lista_CategoriaPerfil]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ins_Lista_CategoriaPerfil]
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteAllPerfiles_CategoriaTipoPerfil_by_PerfilId]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_deleteAllPerfiles_CategoriaTipoPerfil_by_PerfilId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_deleteAllPerfiles_CategoriaTipoPerfil_by_PerfilId]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsUpdTelefonos_Direccion]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsUpdTelefonos_Direccion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsUpdTelefonos_Direccion]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsUpdDirecciones]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsUpdDirecciones]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsUpdDirecciones]
GO
/****** Object:  StoredProcedure [dbo].[sp_DelTelefonos_Direccion]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DelTelefonos_Direccion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_DelTelefonos_Direccion]
GO
/****** Object:  StoredProcedure [dbo].[sp_DelDirecciones]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DelDirecciones]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_DelDirecciones]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Operacion_Estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operacion]'))
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT [CK_Operacion_Estado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_PerfilSeguridad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_PerfilSeguridad]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_EstadoUsuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_EstadoUsuarios]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Unidades_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Unidades]'))
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT [FK_Unidades_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Telefonos_Direccion_Direcciones]') AND parent_object_id = OBJECT_ID(N'[dbo].[Telefonos_Direccion]'))
ALTER TABLE [dbo].[Telefonos_Direccion] DROP CONSTRAINT [FK_Telefonos_Direccion_Direcciones]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesUsuarios_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]'))
ALTER TABLE [dbo].[RolesUsuarios] DROP CONSTRAINT [FK_RolesUsuarios_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesUsuarios_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]'))
ALTER TABLE [dbo].[RolesUsuarios] DROP CONSTRAINT [FK_RolesUsuarios_Roles]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesAcciones_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesAcciones]'))
ALTER TABLE [dbo].[RolesAcciones] DROP CONSTRAINT [FK_RolesAcciones_Roles]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesAcciones_Acciones]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesAcciones]'))
ALTER TABLE [dbo].[RolesAcciones] DROP CONSTRAINT [FK_RolesAcciones_Acciones]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoImages_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductoImages]'))
ALTER TABLE [dbo].[ProductoImages] DROP CONSTRAINT [FK_ProductoImages_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoImages_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductoImages]'))
ALTER TABLE [dbo].[ProductoImages] DROP CONSTRAINT [FK_ProductoImages_Product]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Unidades]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Unidades]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Monedas]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Monedas]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Categoria]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfiles_CategoriaTipoPerfil_Perfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[Perfiles_CategoriaTipoPerfil] DROP CONSTRAINT [FK_Perfiles_CategoriaTipoPerfil_Perfil]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfiles_CategoriaTipoPerfil_CategoriaTipoPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[Perfiles_CategoriaTipoPerfil] DROP CONSTRAINT [FK_Perfiles_CategoriaTipoPerfil_CategoriaTipoPerfil]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfiles_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfiles]'))
ALTER TABLE [dbo].[Perfiles] DROP CONSTRAINT [FK_Perfiles_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfiles_TipoPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfiles]'))
ALTER TABLE [dbo].[Perfiles] DROP CONSTRAINT [FK_Perfiles_TipoPerfil]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operacion_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operacion]'))
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT [FK_Operacion_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operacion_TipoOperacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operacion]'))
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT [FK_Operacion_TipoOperacion]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operacion_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operacion]'))
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT [FK_Operacion_Cliente]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direcciones_Perfiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direcciones]'))
ALTER TABLE [dbo].[Direcciones] DROP CONSTRAINT [FK_Direcciones_Perfiles]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleOperacion_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]'))
ALTER TABLE [dbo].[DetalleOperacion] DROP CONSTRAINT [FK_DetalleOperacion_Producto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleOperacion_Operacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]'))
ALTER TABLE [dbo].[DetalleOperacion] DROP CONSTRAINT [FK_DetalleOperacion_Operacion]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_CodigoValidacionUsuario_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[CodigoValidacionUsuario]'))
ALTER TABLE [dbo].[CodigoValidacionUsuario] DROP CONSTRAINT [Fk_CodigoValidacionUsuario_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoriaTipoPerfil_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[CategoriaTipoPerfil] DROP CONSTRAINT [FK_CategoriaTipoPerfil_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoriaTipoPerfil_TipoPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[CategoriaTipoPerfil] DROP CONSTRAINT [FK_CategoriaTipoPerfil_TipoPerfil]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoriaTipoPerfil_CategoriaParentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]'))
ALTER TABLE [dbo].[CategoriaTipoPerfil] DROP CONSTRAINT [FK_CategoriaTipoPerfil_CategoriaParentId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Categoria_Usuarios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Categoria]'))
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT [FK_Categoria_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Categoria_CategoriaParentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Categoria]'))
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT [FK_Categoria_CategoriaParentId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__IdPerf__2D27B809]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__IdPerf__2D27B809]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__IdEsta__2C3393D0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__IdEsta__2C3393D0]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__Intent__2B3F6F97]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__Intent__2B3F6F97]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__FechaC__2A4B4B5E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__FechaC__2A4B4B5E]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__TwoFac__29572725]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__TwoFac__29572725]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__PhoneN__286302EC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__PhoneN__286302EC]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Usuarios__EmailC__276EDEB3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF__Usuarios__EmailC__276EDEB3]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Operacion__Fecha__267ABA7A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Operacion] DROP CONSTRAINT [DF__Operacion__Fecha__267ABA7A]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Monedas__IsLocal__25869641]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Monedas] DROP CONSTRAINT [DF__Monedas__IsLocal__25869641]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EstadoUsu__CanLo__24927208]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EstadoUsuarios] DROP CONSTRAINT [DF__EstadoUsu__CanLo__24927208]
END

GO
/****** Object:  Index [PK_Usuarios]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND name = N'PK_Usuarios')
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [PK_Usuarios]
GO
/****** Object:  Index [UQ__Unidades__06370DAC21B6055D]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND name = N'UQ__Unidades__06370DAC21B6055D')
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT [UQ__Unidades__06370DAC21B6055D]
GO
/****** Object:  Index [CK_Unidades_CodigoUnique]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND name = N'CK_Unidades_CodigoUnique')
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT [CK_Unidades_CodigoUnique]
GO
/****** Object:  Index [PK_Unidades]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND name = N'PK_Unidades')
ALTER TABLE [dbo].[Unidades] DROP CONSTRAINT [PK_Unidades]
GO
/****** Object:  Index [PK_TipoPerfil]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TipoPerfil]') AND name = N'PK_TipoPerfil')
ALTER TABLE [dbo].[TipoPerfil] DROP CONSTRAINT [PK_TipoPerfil]
GO
/****** Object:  Index [PK_TipoOperacion]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TipoOperacion]') AND name = N'PK_TipoOperacion')
ALTER TABLE [dbo].[TipoOperacion] DROP CONSTRAINT [PK_TipoOperacion]
GO
/****** Object:  Index [PK_Telefonos_Direccion]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Telefonos_Direccion]') AND name = N'PK_Telefonos_Direccion')
ALTER TABLE [dbo].[Telefonos_Direccion] DROP CONSTRAINT [PK_Telefonos_Direccion]
GO
/****** Object:  Index [PK_RolesUsuarios]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]') AND name = N'PK_RolesUsuarios')
ALTER TABLE [dbo].[RolesUsuarios] DROP CONSTRAINT [PK_RolesUsuarios]
GO
/****** Object:  Index [PK_RolesAcciones]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RolesAcciones]') AND name = N'PK_RolesAcciones')
ALTER TABLE [dbo].[RolesAcciones] DROP CONSTRAINT [PK_RolesAcciones]
GO
/****** Object:  Index [PK_Roles]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND name = N'PK_Roles')
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [PK_Roles]
GO
/****** Object:  Index [PK_ProductoImages]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ProductoImages]') AND name = N'PK_ProductoImages')
ALTER TABLE [dbo].[ProductoImages] DROP CONSTRAINT [PK_ProductoImages]
GO
/****** Object:  Index [PK_Producto]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND name = N'PK_Producto')
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [PK_Producto]
GO
/****** Object:  Index [PK_PerfilSeguridad]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PerfilSeguridad]') AND name = N'PK_PerfilSeguridad')
ALTER TABLE [dbo].[PerfilSeguridad] DROP CONSTRAINT [PK_PerfilSeguridad]
GO
/****** Object:  Index [PK_Perfiles_CategoriaTipoPerfil]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]') AND name = N'PK_Perfiles_CategoriaTipoPerfil')
ALTER TABLE [dbo].[Perfiles_CategoriaTipoPerfil] DROP CONSTRAINT [PK_Perfiles_CategoriaTipoPerfil]
GO
/****** Object:  Index [PK_Perfiles]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles]') AND name = N'PK_Perfiles')
ALTER TABLE [dbo].[Perfiles] DROP CONSTRAINT [PK_Perfiles]
GO
/****** Object:  Index [PK_Monedas]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Monedas]') AND name = N'PK_Monedas')
ALTER TABLE [dbo].[Monedas] DROP CONSTRAINT [PK_Monedas]
GO
/****** Object:  Index [PK_EstadoUsuarios]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EstadoUsuarios]') AND name = N'PK_EstadoUsuarios')
ALTER TABLE [dbo].[EstadoUsuarios] DROP CONSTRAINT [PK_EstadoUsuarios]
GO
/****** Object:  Index [PK_Direcciones]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Direcciones]') AND name = N'PK_Direcciones')
ALTER TABLE [dbo].[Direcciones] DROP CONSTRAINT [PK_Direcciones]
GO
/****** Object:  Index [PK_DetalleOperacion]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]') AND name = N'PK_DetalleOperacion')
ALTER TABLE [dbo].[DetalleOperacion] DROP CONSTRAINT [PK_DetalleOperacion]
GO
/****** Object:  Index [Pk_CodigoValidacionUsuario]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CodigoValidacionUsuario]') AND name = N'Pk_CodigoValidacionUsuario')
ALTER TABLE [dbo].[CodigoValidacionUsuario] DROP CONSTRAINT [Pk_CodigoValidacionUsuario]
GO
/****** Object:  Index [PK_Cliente]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND name = N'PK_Cliente')
ALTER TABLE [dbo].[Cliente] DROP CONSTRAINT [PK_Cliente]
GO
/****** Object:  Index [PK_CategoriaTipoPerfil]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]') AND name = N'PK_CategoriaTipoPerfil')
ALTER TABLE [dbo].[CategoriaTipoPerfil] DROP CONSTRAINT [PK_CategoriaTipoPerfil]
GO
/****** Object:  Index [PK_Categoria]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND name = N'PK_Categoria')
ALTER TABLE [dbo].[Categoria] DROP CONSTRAINT [PK_Categoria]
GO
/****** Object:  Index [PK_Acciones]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Acciones]') AND name = N'PK_Acciones')
ALTER TABLE [dbo].[Acciones] DROP CONSTRAINT [PK_Acciones]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[Unidades]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND type in (N'U'))
DROP TABLE [dbo].[Unidades]
GO
/****** Object:  Table [dbo].[TipoPerfil]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoPerfil]') AND type in (N'U'))
DROP TABLE [dbo].[TipoPerfil]
GO
/****** Object:  Table [dbo].[TipoOperacion]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoOperacion]') AND type in (N'U'))
DROP TABLE [dbo].[TipoOperacion]
GO
/****** Object:  Table [dbo].[Telefonos_Direccion]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Telefonos_Direccion]') AND type in (N'U'))
DROP TABLE [dbo].[Telefonos_Direccion]
GO
/****** Object:  Table [dbo].[TasaCambios]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TasaCambios]') AND type in (N'U'))
DROP TABLE [dbo].[TasaCambios]
GO
/****** Object:  Table [dbo].[RolesUsuarios]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]') AND type in (N'U'))
DROP TABLE [dbo].[RolesUsuarios]
GO
/****** Object:  Table [dbo].[RolesAcciones]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesAcciones]') AND type in (N'U'))
DROP TABLE [dbo].[RolesAcciones]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[ProductoImages]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductoImages]') AND type in (N'U'))
DROP TABLE [dbo].[ProductoImages]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
DROP TABLE [dbo].[Producto]
GO
/****** Object:  Table [dbo].[PerfilSeguridad]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PerfilSeguridad]') AND type in (N'U'))
DROP TABLE [dbo].[PerfilSeguridad]
GO
/****** Object:  Table [dbo].[Perfiles_CategoriaTipoPerfil]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]') AND type in (N'U'))
DROP TABLE [dbo].[Perfiles_CategoriaTipoPerfil]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles]') AND type in (N'U'))
DROP TABLE [dbo].[Perfiles]
GO
/****** Object:  Table [dbo].[Operacion]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operacion]') AND type in (N'U'))
DROP TABLE [dbo].[Operacion]
GO
/****** Object:  Table [dbo].[Monedas]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Monedas]') AND type in (N'U'))
DROP TABLE [dbo].[Monedas]
GO
/****** Object:  Table [dbo].[EstadoUsuarios]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstadoUsuarios]') AND type in (N'U'))
DROP TABLE [dbo].[EstadoUsuarios]
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Direcciones]') AND type in (N'U'))
DROP TABLE [dbo].[Direcciones]
GO
/****** Object:  Table [dbo].[DetalleOperacion]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]') AND type in (N'U'))
DROP TABLE [dbo].[DetalleOperacion]
GO
/****** Object:  Table [dbo].[CodigoValidacionUsuario]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CodigoValidacionUsuario]') AND type in (N'U'))
DROP TABLE [dbo].[CodigoValidacionUsuario]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
DROP TABLE [dbo].[Cliente]
GO
/****** Object:  Table [dbo].[CategoriaTipoPerfil]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]') AND type in (N'U'))
DROP TABLE [dbo].[CategoriaTipoPerfil]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND type in (N'U'))
DROP TABLE [dbo].[Categoria]
GO
/****** Object:  Table [dbo].[Acciones]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Acciones]') AND type in (N'U'))
DROP TABLE [dbo].[Acciones]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_listofCategoriaTipoPerfilId]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_listofCategoriaTipoPerfilId' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_listofCategoriaTipoPerfilId]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_DetalleOperacion]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_DetalleOperacion' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_DetalleOperacion]
GO
USE [master]
GO
/****** Object:  Database [BDINV]    Script Date: 3/8/2018 16:58:49 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'BDINV')
DROP DATABASE [BDINV]
GO
/****** Object:  Database [BDINV]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'BDINV')
BEGIN
CREATE DATABASE [BDINV] ON  PRIMARY 
( NAME = N'BDINV', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BDINV.mdf' , SIZE = 3328KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDINV_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BDINV_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

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
/****** Object:  UserDefinedTableType [dbo].[udt_DetalleOperacion]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_DetalleOperacion' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_DetalleOperacion] AS TABLE(
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio] [decimal](18, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[udt_listofCategoriaTipoPerfilId]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_listofCategoriaTipoPerfilId' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_listofCategoriaTipoPerfilId] AS TABLE(
	[CategoriaTipoPerfilId] [int] NULL
)
GO
/****** Object:  Table [dbo].[Acciones]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[CategoriaTipoPerfil]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[CodigoValidacionUsuario]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[DetalleOperacion]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[Direcciones]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[EstadoUsuarios]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[Monedas]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[Operacion]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[Perfiles]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[Perfiles_CategoriaTipoPerfil]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[PerfilSeguridad]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[ProductoImages]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[RolesAcciones]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[RolesUsuarios]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[TasaCambios]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[Telefonos_Direccion]    Script Date: 3/8/2018 16:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Telefonos_Direccion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Telefonos_Direccion](
	[Id] [int] NOT NULL,
	[DireccionId] [int] NOT NULL,
	[Telefono] [nvarchar](30) NULL,
	[DescTelefono] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TipoOperacion]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[TipoPerfil]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[Unidades]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 3/8/2018 16:58:49 ******/
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
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [CategoriaParentId], [Nombre], [DesCategoria], [FechaCreacion], [UsuarioCrea]) VALUES (1, NULL, N'Calzado', NULL, CAST(N'2018-08-03T16:40:41.363' AS DateTime), 34)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
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

INSERT [dbo].[CodigoValidacionUsuario] ([Id], [UsuariosId], [Tipo], [Codigo], [FechaExpiracion]) VALUES (28, 32, N'CAE', N'FajDp2j107q3fIhT8Hrrbw==', CAST(N'2018-08-04T01:03:17.160' AS DateTime))
INSERT [dbo].[CodigoValidacionUsuario] ([Id], [UsuariosId], [Tipo], [Codigo], [FechaExpiracion]) VALUES (29, 33, N'CAE', N'inYEsbgca8GQO1zGjK42pA==', CAST(N'2018-07-06T21:04:16.997' AS DateTime))
INSERT [dbo].[CodigoValidacionUsuario] ([Id], [UsuariosId], [Tipo], [Codigo], [FechaExpiracion]) VALUES (30, 34, N'CAE', N'Jy3tbKoDfHuIC6XOl4nw+A==', CAST(N'2018-07-07T01:23:08.483' AS DateTime))
SET IDENTITY_INSERT [dbo].[CodigoValidacionUsuario] OFF
SET IDENTITY_INSERT [dbo].[Direcciones] ON 

INSERT [dbo].[Direcciones] ([Id], [PerfilId], [Direccion], [latitud], [longitud]) VALUES (1, 1, N'Centro Financia, Managua Nicaragua', 12.1099121, -86.2703378)
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
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Id], [IdCategoria], [IdUnidad], [IdMoneda], [barcode], [Nombre], [DesProducto], [Inventario_Min], [Stock], [precio_in], [precio_out], [FechaCreacion], [UsuarioCrea]) VALUES (1, 1, 1, 1, NULL, N'Sandalias', N'Sandalias mujer', 40, 0, CAST(160.00 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), NULL, 34)
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[ProductoImages] ON 

INSERT [dbo].[ProductoImages] ([Id], [IdProducto], [Image], [UsuarioCrea]) VALUES (1, 1, 0x89504E470D0A1A0A0000000D494844520000006E0000005A080600000059B06340000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B0000149349444154785EEDDD05B07555D90770BA5BBA840166E892861942181A0406494941A4BB1B046925865669A4041441699092EE1ABA95EEDEDFFCD6C7FFCC7A8F94DCF7BEF76CB9CFCC9ADDFBECFDFCD793EB59FB0CD7B4943EFFFCF3D23EFAE8A3E69D77DEF9626FD33CF6D863CD76DB6DD78C38E288CD44134DD4ECBBEFBECDCB2FBFDC7CF6D967CDA79F7EDA7CF0C1075F9CD994F5DCA76DD45AE0421F7FFC71696FBFFD7673D1451735E38C334E33DE78E335C30D375C33CA28A334638C314633DD74D33537DC7043F3EF7FFFFB8BAB9AE6F5D75F2FCB41E0FA89C2D8AF62EEBBEFBE5B96A46A8925962880D56DF8E1872FCB155658A1481DAA256F10B87E22CCD6BE0E40C72FBDF4D202D0C4134F5CA48CAA1C7BECB19B31C71CB334C79E7AEAA9E6C30F3F2CC021523A085C3F510DD857B537DF7CB339EEB8E33A52165539F2C82337238D34525907E69FFEF4A772CFF7DE7BAF2C01987BB48D5A61E36A90228198AE714CECBFF8E28B0B40238C304233EEB8E396756A72F4D1476F461D75D466ACB1C66AAEBAEAAA72BFDA99C97DDB46AD724E3018589F7CF249C72909DD7FFFFDCD68A38D56808AB47154B23ED34C33354F3FFD74F3FEFBEF0F01D42070C380021CC08401EC95F537DE78A31CFFDDEF7E573C49600534605ADE71C71DE59C80FDDA6BAF75A4F57B091CE62186FEADB7DE2AEBE895575E29CBA8A5D81344D5A13A8EFA26063EF1C413CDA9A79EDA2CB5D452451D02830ADC72CB2D9B175E78A19CC3D65D7BEDB5CD020B2CD0B16DD6EFB9E79E72DC33F8CDADB6DAAA1CCB398B2EBA6873CA29A734CF3CF34CE7392D3D27A0B36E7F5475FDBC3440DE49870A916EC79C173E59CF39F188BF0B0D1589ABE32354BF504D98665F5C71643D2F1D728E38EBC5175F2C0C5D679D758AB788C9EC16D5673DED8F7FFC63B90E4330799F7DF629FB3929DB6FBF7D619070015D7EF9E5C5DE394E3A630FB529A79CB2596FBDF59A73CE39A77414CFE6DAEEF7C8FB218E0E50BC03A0507D5C670A50DE271407E9BB529F810B081ED083DD7AEBAD45753DF7DC73CDE38F3F5E9A7D6CD095575ED95C77DD75CDDFFEF6B7E228F0F24E3CF1C4E6F8E38F6F7EF39BDF347BEFBD77B3FEFAEB370B2EB860010A4851759A6D6EBE7552C79E59FEF8C73FEE481D3AEAA8A33AD7C89C849E7CF2C966A59556EAC4764023B539370DA091EAB5D75EBBD9628B2D9AFDF7DFBF39FAE8A38BD49F7BEEB9CD5FFFFAD712D47B1FEF4715DBA669802EF478FEF9E74B8779E9A5979ADB6FBFBDD3B1505FA40DF519B86420FEF5AF7F95979C628A29CA0B930A6DC209272CDBDCF13025190DDB6918956BC2580D50B6A9354001D2BE9C3FFEF8E397F37EF18B5F34279D745261E2E1871FDEB976934D36691E7CF0C1E6924B2E29E7D80FB0D842F7069EE7713FFB34BF173B69DDEFD6C7D3EA67D53C63EEAD59F71C4B2EB964E1534DE1DD77A13E0357AB911B6FBC710809996492493A3DBABB677B190D3330266068B6BDB06B30D9767DED97B5804ADAB43079AFBDF66AAEB8E28AC2E0BAB324D6AB9BDF748F48DB57B53C775AF64D30C10465DD730BFA03AAFB92CCF0AADBB47C171A2A362EF6430F3AEBACB39AC9269BACF3921AA9C010CC8A7DD1BAC1FCBAA6F76B35533104A8F57DD837EA311D880A96C3CC71E786A1C0F63C989EE39A6DF7D680DDDD71D2C9BAF7D5CF91DF70FF238F3CB2F0A79BFA62E7FA0C5C7E9C1E0FB15DF286DA6CB3CDD62CB6D8629D17C28CACA7B77A492F6EDBCB633AA676AB9D34E762A6EB720F4D0739E490439A830F3EB8F9C10F7E50CEDB6DB7DD9ADFFFFEF7C5F1C879F535F5BE6F23D95A3483D6DDF9165F7CF166FEF9E76F165E78E166BEF9E62B210AE25DB371B5B4753B3DFF0DF519B8784CC8C3F1AC122B01D5C33DFCF0C30584BC3486E6456DA7777E5D734DCEB3ACAF89445B67DF383C3946FA2EB8E082B2AE1304B478A9699E03709AF5EE6301B63ED6FDDC40E4A025048A77198D84E241273CF8AE345454E53711695C76D9658778C9A8A17A1FC678F95A22D2A3ED0B389817C7214CCD35BCBFDFFEF6B71D49E5A972EF019F7BD7F74FCB3ED701C47D5D930E97639CAD80E7787DAFB5D65AABB9E9A69BBE78EBFF8FE3FA8BFA1DB8575F7DB52CB9C37BECB147519F73CC314733D75C73755EF8CB7A3226D95FF76ADB59C7B064FD35EBEEF1EB5FFFBA39ECB0C33A8C3FF0C0039B3FFFF9CFFFA1D21CD771EA382EF6B7FBDCA9A69A6A880EE43AE72EB2C822CDB4D34E5BDEC9EFDC75D75D1D77DFB2D646439BFA1DB8F4BABC880C0BB234521D29021086D43D38CCB20C80DD52DABDCDBE1D7AE8A19D6D12C7E6929CDC03C840CD39BCDFACFFF0873F2CCB2FF33A495BF61BDF13BBD644355281546500EC2F1A26AAD2CBC410038F0DD4FEF297BF1426C4190983D2A3B38DD10158030080BBF7591E71C4116588C731E01C70C001C5C6D512AD23B83EE019B7CB31ADCED2A4F3D000B907703344A403CA7BD6E93EE49DD349FB83FA1D3899953A0504C0FA85840FBCB0300DB3307DF5D5572FB14FAD0EF5F60004DCAC636E62A8FDF6DBAFF9D5AF7ED5B966CF3DF72C990E1D0340B946D33980613F9519008174FEF9E7371B6FBC7159CFF91AEFF40F7FF84379F66E1BC6F1F0BEF6D7EFDC1F344C240E511DF1B6108FD34BEA99BCAEABAFBEBA39F6D8630B531E7AE8A18EAAE14EB323980638CC8DFDB20FB0B57AE59C1C73CC31E53C60519B400018109CABD966336BBBE97C607266C2F87BEFBDB739EFBCF3CA3DD94A5E23AD110D42D2BA3DC4EEDC6B7F50BF03478D846A639D902184516C469DC38B64726A923AAB5B9D6B0424C60BB8390AF601C8E801A9AE6D1AE0A3F6486AD266D69D9B54549E279DAE7E36DBF53B78FE6EBBD69738ED9B6898485CFD42E98DF592F4D5BDD60B9346C75C6BF9ECB3CF96D4952C0415B6EEBAEB36BBEFBE7BF1224F3BEDB4221919733BE184130A10D4E94E3BED54F639C6EB23D11C986DB6D9A68C3AACBCF2CAE51EBC5E09E2A8BF8CF1A124D211ED90730067DDF30638FBFA13B0D03053955F4501B5EECD9861BF1E5FF7EA9A2192DADD14668BE30047E264F64391A4EE4E12CAB3E43E012C40653BD7A4F30D040D3870DDF6C17050AD52318BFDDB65975D9AD5565BAD596699659A39E79CB39971C6199BE5975FBED97AEBAD3B03A5484A4962398E86EB48438096C561F78C14FCF4A73F6D7EF9CB5F369B6DB65919B7E329E6F78112559DB45E80AB9F6FA068C08143B5542560571F629CCE30513C4B362CDE639A6D15CBB7DC724B071CAACF31DEA981D1907140B9D3FA7A8DAD8CCD630B37DF7CF3A29643018AA401B4BBB30D04F5047018D1AD12495282EBDAB1883322895C870A5260013DE100CF9124219218D0DC8344F228EB8E1027459B74D2498B470BB47898C87A80FC5EABCA30214E08D0B8DD09823197AD22158008585992AA840BD75C734DE900826EDB1A55C803CCE02AD05C5B7B967E23A92FFBA699669ACEF59C1AF7AC418A8D8B4D1C081A70E06A430F444BDE22A601CC928A5C73CD354BD9C1DC73CFDD616A9D9612A30109091F481449150E20DE2380929CAE1BA024C1E79D77DE21F69346E105E06985489E67ACA57020A8275425D2ABC30C7629CC231D1C92F4EE7FFEF39FCD1A6BAC51C0749C84C411A1DA3814C0CABE789580B3AD3350C14025ADEE7DF3CD379773840B29BD70CCBD851E9C12CF57ABC8382A03453D011C86C4C671BD15FF0026126734812B1F6095D1715C76D8618792E2FAF9CF7F5EF29E71E3E52B5D071C896CA0CB70B0774057E2677057F14F728CA4CAF0D3CC33CF5CAE051A095D659555CA7114A70470FD9987FC36D413C001A4B61B0263CCA30AE39818EB4A7C979E0FECB8EA8E8599804B4E92AB1FCA75C986A423B80FE08411AED162630DC4E637BA13C9001C281A70E0BC7C025C84A99C937894BC3B4B2A931A93CE52FE46EA5098579704ECBAEBAEE51A528BF140F11BD26FC00A808894C9C690EAFC4E7E9BC4A9C344AEAB256E2041433DE19C8409D63147C68423827961206FD032FB5423B35FD25D013124C8164CABDD64B710B01276F0140DFD18811056706C382DEC623C4D366EB9E596EB8CB9B93E126AFD7B0F5C9C0E8C0893187E25002BAEB8628791240F789186B455575DB514A75267027005B80F3CF04099BD232C207132FBEC214724129CB020EBB99FD1011D44597A9E4787F24C80F39C51EB03493DA12A51A40105CCBBEFBEBBE30D6A6134F0789EF7DD775F395785F4461B6D34445920003452943135768FC363191B287EB36FF2C927EF3843EE7DE79D779667005654B9F5DA9B1C48007BC239A9D5501C80D813D9102576188DC9C0533B491A04DC2A84A5BC301C40EC5AA4B46EA428C0A445BAB24D3DCA6D26E10D309DA9B689792E54EF1FD6D413C0A11A383D39E378E9E1CAC837D8608362D3482930EB54580D1630004C052610CF31D20AA06CA76DBBEDB6656E81DF03587ED76F451344552200E6990782061CB8A821BD3C3D38B6853708C4B8EB886A0420008045120103ACA8BFEEE6BCA8CB7A9FC98E460AA85C249C4848E177F23C79C6008806E3B86F411896DEADBC21599138153CC2A84180C48ED9060EFB659E1C3B6800F5FAEBAF2F618032041E29E726A403D512D6ABD4F3C065749C0418A12669242CDE65BC446DF6D9676F76DE79E74E7D08FB687CCD920A16EB19BBFBFBDFFF5E827459112053ABFFF8C73FBEF8C5215562AF522B242E24E10B208C9600066024CD0C9DD845207032A854D2858408F28E0139C9E65CAF6C3D29B35A4DF62AF53C707A3F3BC7CE18F1A626C36C8DBA54494CC53917C3495392D0C6E6423E17955240F7A14E1342488DC58EA25E07AFE781C3409240CD09C831391E6400244928692F0968FB850F679E79664950C70B349B26F7A89D193630AE7E2F04D8DF44AD5195D4A03A134C8E53C2CE911C538F33BF1A388A8502AE1180C465EA35536E2E24003C95EB3EF3CC334FB183245B67E975EA79E0A2AE48932197789469C9A69817E75CF117B0528670FAE9A797EBA9C11D77DCB1735D1D786B86866A771FC5E6F522F53C70D456549762554C8E57597B976C158744FD25F5B8D0420B951A4AEACF44FA8006E8BA4CC152336B3544EA069D933E52ADB67C59C1840BCC17502703420A6D9BBAE5636C8026A12AC50E3AE8A092DA4A7C170905BA66DD4801A0A859BF27141804AE8F942C4A1C07D9FF59679DB50300F00CCF484823C9619297DA140E08E02299B653CE0E384544EE89025A1BA815CE09C724B9436AEC91471E2941F6F4D34FDF5C78E185E518C08CE1D5C54000036CBCC77AFA30D5EA9B25496721925A4B1A09EC55EA79E0308F144412523BC96EF116315B1AAB1E53238D40CB767D4C3984B45924D97D132A200E4AAFAB49D4F3C07527733135CE8AEF766506A9C693AC83732D000AD27D3A4A0ACC578E3831E23BF71306D41E651BD4652B5425A0C2D87CC1C01C3680C890D45EA25204EBA46EC30D376CCE3EFBEC52CA405295A91B1177DC0837F042006C43FC16EA79E0225D753A4A6D25E6C7AB045E525C3C4C9E248F923A3DF9E4938BB392E2D90CEF58AA268BEA256509D4918E3268E3FA40010EA54C4EFD088F10F3798B6C180744099F0F9F01ED673FFB5909B27D7DCFF924319E259003BA892001ACFEAD78B1BD4AAD5095B139D4199BC79B0C00090BB4D489002BFB789D886AADED5F2494EAAC5524291B744E8602616A420124DF88E1B16B912212C5F1C078A3DA24103832229C0FFB7DE222D7905640924692EC783768BD6CF35A21713570C6D500A27567428CD72193EDEDD3CE38E38CB2CF670F679861860E600150F57262B9EE4ED2CBEAB215C0450A380CEC510644491D1002046004E646070CA21A0577AD42235E64ED9824591D551AAAC3827ABDD7A8E7810B68D458C808776C54BC45201A9A31882A64E0A000C5248F7AF2A2960C8AF3A957D4FD3BBD1E1AF43C7051631962B1E4AC18AE899332CB2CB394E432927754BA67F6698676D83F1206DC04E4B6DD2340B183288ED0A057399428715CBEAE8E7CEA4969023095AC2FBDF4D2FF31CE566F9352B670EAA9A72ED5CF886469E920518F83C0F5914840404B9CC50B0C83A938DF35C9D81A6F1238000354BC4EB19EF41867C5FDEAC03E5286E29CD4F9CB5EA456485C7A7FA4024335E099851AC902549D503652A064CF67A214BD1A55E0B024DE1BE8A2D6BE502B808BA3100722DB4AC6A9BD4854B221420481B5695624E8B2CB2EEB4C0A2199D673AFB652CF0357AB2B80D98E9A33070E50C08B2322ED654E9C1100DF3B310D4B81109599B13AC545F9CA505BA935CE09D0628B02A0D9A962B2788ABCC6471F7DB40CF7D8D6547FA958765E4208FFE0587F27B98DD41AE0A8B6000734DBB2FE80E0DA53819AF2727F1AA1C095E4B18199904F950230334DEBD1EFB6516B80035A6C1BE0305DE12B20E2F2FB5E894F39C9AE70F737DD74D302A6E35429C9E471FAA25EAD82DB48ADB071B16909016C5BE729527FC0316D5865970FB629CD4B0EB356A59A759E65AFC769DF443D0F1C298B076809C83AC632BA6D4CCDA0693E6C43AA00947CA46D4B5E65BE3EE4FA367B96AD519508B3356A330DC94BE673F8751CC7934C9E92640ABEE34D767FA9A16DD47AE0D833AA1138990B9ED0405373298FE93C9FC9F0B729A654A18C7CB7915A0F1C77DF8CD34816DBE6AFC7325191F768DEB89180A84EDEA8C03C36B38DD47AE0CC79E38000449E92AB2FE9AC42595CA7F624D21727259F9F1FB471C388BE0C38C4E1E080B0633225729100F2D97A555EF57463E5EBAAC45C5B8F76B78D5A0F1C6FD2BE9FFCE42705182577BE3074DB6DB7955C254033424EE21412A136AB49D47AE002804C3F35E9F387EC5EFD4D4BCD87B3850EC8500EDB3768E386117D1970EC946526EEE70F91481A9B27F5C50E72FF33AE97D1F46462DA483D0F5C9DE1001AA092494171E9FD2370A65601CDE781259CE52B7D35C87E7F1BC6BEA54C61301C1800226549124B77014B4E52E12BC9E2392A65F0F7D466E724C12C28379F40203EA82A8701018AC485942F6486AA81515F07B24DFDC9572608E78C44C21407498B89F51212B4955A011CC00052DB246A0E500A64EB0222E4E3D8A93D09404975715CD8C378A36DA556ABCA4C0261F3D842F64F53004BDA34FF489C40DB1258012C931BDB48AD020EC3015613C9EB0EA44953BE28CB69719CBAB404B07B74DFA76DD4F3C0D5EA916469919830DF122871F7A9C51FFDE84745E204E135C5DEB9EFE008F80011C06A3B15504D56CCCC1C2579A48C5AAD3B419BD35DA8D5C0D554BBF640F2A710420052E858D46CDB5564E87F0AB81A14433BCAF0FE37816B9AFF03A88C3DDEAFF51D9B0000000049454E44AE426082, 34)
INSERT [dbo].[ProductoImages] ([Id], [IdProducto], [Image], [UsuarioCrea]) VALUES (2, 1, 0xFFD8FFE000104A46494600010101006000600000FFDB0043000201010201010202020202020202030503030303030604040305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108014D01F403012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FCAFB90151BEB91EF59D70FB9BDAB4AF4E0E3DAB36E4314EBD7DABEF1EC7E1740AB33F276D5691F3D7FCF4AB0CDF35559F95C7AD667A14D15E6395E7E6F6AA7255A94E2AAC8707FCF15323B6995E5E9F8D4721C11523FCCBDBAF1CF5A692547DD53BAA4ED8EC362FBBF8D48A1B68E69B07CABDBAD3C0C2755E9EB41326AE376EDE8D53F9EC63F2959BC9DFBC213C03819A08523A1FCA9F0C400EABC76EF5A19B96830212DCD588576AFE348AB97FF0A78C27FF00AAAA265295F41D18F9EA4C1A6A2906AC053B5BE95A44E693D48A56C62A373934F94F5E9F8D30C63CB0067777A4CA8EC2668A922815F76E60BB54919EF5191B3FA558075AB16E56245592356F981DCAC7A7A63A5411A1535322F1CD08093EF16DA3BF007402AC81C74351C71E318AB0AA42F6EFDEB433221B4F75FCA941E29D14196A7F91851D28022CF22AC403231CE4D46D10356AD9170B9DDCFA76AA899CA56761CABBBEBF5A9E18B7A853C629A14376FC6ACDBC414D49A5325572205550A02AE73B7E639EA2961B7F9F3E94E8D085CF6353222F03D79A0F46315B8E89368FAD4E8BBE355A218372E7F9D4F1441A9A348EE47141FE152C3070BF5A9638C03D0D4D15B95F5A657321B1C5C67FA55A8203EF5244BFB9DBE4C7BBFBF93BBFC2AC5BDAE73EFEB541CC887ECD93CD4D1DA006AD5B5AE38DA33FA0AB0B638723AD685F3155ADCAAE76FE9513213EB5B11D934D6F2305F961C6F391C66AA496EAC4EDC7033CD0F634835628790CCC3AF15225AE4D4E9171F77F4A7A4633F74D66510436FB462AEC16B1B5D3F97E6246A70A5946E23E82923872DD2AD5A444BF63C62832A8D1B5A06D474DA180F53C67F0AEDB418BCD23EB5C5E831EE9706BBEF0E43CAAF7E2BAB0BF11F9EF1127AB379AD0359FCABF5359F25AFCE3FBC7A1ADF921F274F1F3286CF4EF59D245E64DFE35ECC1D8FC7B35C47B3F84A91D9E2A3B98B60CD6A2DB71D2B33562620DF522B0A87CDC2AB9CC9347B9103B1CD75BE1CD537EDE6B80B5B8DA85B3C5741E18BF2EC36B571D4F84C731C1F342E7B0681A97CA2BA882F711AD79EF86EECB459CF6AEA2DB50C8FBD5F3D88F88FCCB30C2DA66D4975BAB0B5FD4301B9FBB53CBA8ED88FCD5C9F8AB58F95B6B56B85A776465F83729A39DF176B1F3336E3DFA570F7F39B92CEDF360F02B43C43A93DCCEC81BBF358F732F97BBEB5ECC2D15A1FB8709E43ED7DF9EC8A776E118E0F5159AEE43743C9E3DEAE5D1CF7AAB22FCBCE5BDBB7E35854A973F68C0E5AA8AB22ABDC61BEF63EB455AD4A2B317AFF65DD24242E0DCA0570768C8C2718CE71DE8AC4F4BEAE7CB33CBE5BF3C9ED556E8E23FC454D3DC3326C217E6604B63E6FCEAA4CC58E0D70B66D4E254B83C9AAEEDF211EFD6AC5C8C16AACFD0FD6A4F429EC5694F38A805C35B5C2C89F2B03D48CD4F2FDFFCEA9CBF3B0FAD4C8EDA647205DDC9CF39E7B534853F77B0C9A76DC1FD280067FD9E86A4E8E614C411B6EE57F753C53E2FDD8CFCADC7461914D23E76C1C827AE314E8FE6F97DF1412C982E4753F9D280A4FAFD4D2A7294FC287F9777BE6B431B840FE53FCBC7D0D4FF00EB4A93DF9A8F602579DB524630C075AA8AB23293D49146E6FC2A4DB8561F853517033ED4EB894AC7B463839FAD51CFBBD0ACFF003373F5A51D69A5773FE14AABB683617BF63F514D55DADBBEF7B5395723F8A9760FF6AB40B8800C8F9BF4A9E04DEDF534C0BF37BE6AD410EF141372CFD9BCA7DAD8CA804E3906A5D9834EB4B537126DDDB78CFE54E076F50DCF4E2B40D88DA2DC3D29AD181F9673527F0B1EE289936D04DBA9081FED6EFC2AD471E36D431A6E7AB483E6DAAA571C1CF7A39913CB790E8A224F3DB9AB9027EEC12BC62A18861BD3E9572D7E468DBFBBF3007A52E6476538243A28F002FF0077F5AB10C4A14FCBF367AFFF005A8B78891F5AB915A3045DEBB770E30739A66D1D08EDE1DF8AB91DAEDE9C7EB45BDBE0FDDCEDF5AB9043C74141A11C76FF00E7156D6DF071FAD2C70F3FFD7AB9690617E6A6889488D2DAACC16DBBFD9190327FCFD6A786D723DEB434891B4CBC598470B3282A3CC8C3A8DC083C1E3BD5C7533954B1462B7C28F719156A2833FF00EAA963B201DB68C0CF6007F2AB51591C7FF5EB423DB2294F6F95FEF301E9D7EBEF5427830D5BB35BFC9BAA8CD03349F37E9DE949D8DA954B946287279E735288369E9BBE95656DF77E14EFB3E474A835F68D90241CEEE3E956608D43AED5DA3EB9A74706455882D5B70E2830AD52C8BFA145B640D5E83E16877C83B671FD6B87D1622922F15E87E0F8B2158FA8C63F1AE8C37C67C3F114ED4A52F236EE2DFF00763BD4315B6F9338E95A17316578F5A75B5B62BD6E648FE7DCE31979D9329BDA613EB5CFF8924D90328551839E9CF35D75C2E17F0AE47C4681D9B35C52AD776471E5B539AA599936F1FF00A3B7CBE87AD5EF0ECAD1DEA81C2D431855B51EFC54DA3C8A2F1170DF377AC252B9F5D8FC2A8E1798F48F0E5E6C817BF6ADE8B541177AE2F46BC30403D8FAD5C7D5FF00DACD79BECB9A67E6389C1F3CCE8752D796388FCDEFD6B8CF146BACDB829F9BEBD2A3D575D69636C648C71ED5CFDE5D6496666DD8E2BB68C630DCFA6E1BE19957ACAEB42BDFCF86273C93CD675D5C6E3B7F0CD1732F9ACC7EA7E95014DC7352E5A9FD0994E554F0D49460BA10B8699BD87EB4D2BB3A62ACA26131FCA86419DB507D1469DB72918158F6FCE8AB2626EC3F4A29F2B35E547C9537DEFC6ABCBD7F1AB12364D53B83C9F4EBF85799CC614C867C95F5E39AAB2019FBC7E6E9F5A9A61C7E04D5794E0FE1473743BA9C7421BA4685BE6E36F06A9CBC1FC7FA5589061BF1FF001AAF8F3BAF06891D94D590CE946377F5F6A9AE6C9ADA281BA2CC864538EA3241FD411F8528EA3B7AFBD49A1160672CC7EB53AA01F75571D8D22F4E98A558F705E5BAE7155CA4F30E038A957688DBE55DCC460E4E463AF1D2A26FBC2A48070D5462D9246A7EBFD2A4030DEF4D0334F2B8FBAC4F1DEB43172244FF0055F8525D7F17F771C1F5A147C83E94C98E555B2B86E38FBC31EB41318EA47919A3702694735345D3F0A0AE61A88ACBF7B1ED483EED4BD6830E7D2AB98908E0E6B42DA3DB1E7DAAAC2A5DF8FA56BDBB4C6D3ECFBD561F33CC218E39DA17F90AA0D84B558DA070C1B7327C847634D2448D96E4FF002A922898B6193BE3839C8A925878EBC63B9CE2B466897315F6028571F33720D46FC9FF0067B1F5AB11A465BF7859570C4E17767E5C0FCEA191B003543958396C24600356617395C0DCC474AAF6C36F27AFA55B806FEF4AF72630772648887E7FFD55A3696E095E3B555B5876B56B5A43CD07628E810C381572DE3DCB4430118E3A55EB68881FED76E7A568129244715B7A71EB572DE0C2F352436DE5B05CAFCBC7CA723156D20CD26EC64AB10C700CFF00F5AADDBDA719A2DAD893D2AF41064FE3D69731152AA611418DD8E3A5588AD8B75E6A68ADB70F6ABD6F67C8ADA3A6A70D6AE8AF6B6B9FCEAE4569CD584B3C75ABB6B678FCAB438FEB497532AE2D63489B3BBA7CA7D4D65CD0E5EBA4BD8088BF0AC79ADF7C9EDEB5150F470F88525A1505B0E38A93ECA1AACC76BB4FF3A97CBFAD468692C41522B7156EDAD33F7AA48A13566D6068C00A3773DA9AB7430A988562D6976F8917F439C735DD785E1548A3DB9DFCEF39C83E98FD6B91D2ED18383FE4D771E1E831073E95D386F88F83E2DC54638496A6C5BC66E307F0ABD15B60D374E87FD1BF015A16969B9ABA3155ACAC7F36E2B10E526D9937B6F883DEB8AD6DF2ECADD79E6BD0B5F5F22D4FEBED5E79A9BF9D7722FF0078F35E753A9CD367B3902752AA2BA4605A85207CA334EB11E5DC2376E78A4961DC8A7DC0A9ACD76B3FD7FF00AFFD0D6FCC8FD1F1F49CB0BC88D48B50F262A89B579259171952A7A8AA7BC2C6DB8FD0557B9BD573F2AAAFBD44A76D8F2F29E179576A751172EB5211C457A7F5ACABAB83237CC7F3A70F31E0793F814ED39EB9AAD24CDB70A71CF3593937B9FAD65995C28454522390FCB9F53CD112863F8669A7EFE4F3CF5A711FBC634EE7D0462A3B0D0481C6DFCE9C89E63F22948DD4BE5E1FF1F4A7177D4B94BA0FB68898CFD68A7AB051CD155CC47333E379E509F95547B968C30562BB86D638ED4FBA38EF9E2ABBB64B7D335E49B538A212422B54334A01FF00EB5492B6188F5AAF21CFE741D94D5C8A46CB77EB5104C0F9BA7E75267E761475A2E756C4721DCDF80CE47B0240F6DC5AA4A685DC3D29DDFEF6DA03980283D47EB5246707F0A62F23FBD4F2BB4FF88C62AD6C66E41BAA48148CFD6A12B815623EFF0087F5A644B61EB4B8FF006BF5A6918623EF5036F70055733311DBC8FF00F5D465A9E767B52B32F99B47DDEC48C668E66086C46A750428FA52431092256CE0E7A7A54D1C5B9594BEDF94F38A684353814E3C8A7CE51D95A30CAAC0020B6EE40C75C0F4A66D27D7F2E0532B949AC972DF539AD8B52DE6C6557736EE8471597A70FDE015B16AB8C7AFAFA5681A589A1B459CCFE6EF4E32A1557AE467F4CD0E89E4ED55FDD9248E3071DB34AAA58677375C723AD2CA984F94EE1FCA8B8465633E51E5B1DDB87D3A5472C5B61E9F4AB52B81BB76E61B781BB1B4FAD46D1A82415278E3E6E953235DC8614DCD57AD2DF0DD2A18132D5AB61072091B97B8A2238E84B6769E6B0F94E6B66D6D540FBBD2AA585B7EF33F356D59C3B63C63B569CA692A964320B5C32F15760B507B76C91E952456D83F8F635A0B12B1FDDAB2C79E14B6EC7E38E6A8F3EA620AB0DB608C2FE15696DCE3A63F1AB505AF20EE65FA54B25B043F2EEE7D4E6B294998FB620B58082A3DF35A56F63F2F6A2D6D81607DAB46D6DB8A70D59C988C5A8AD465BD90C74AD0B5B20ACBC0A6DBDB963B7A6EE335A16F6AD1B6D6DB9F6E4575463767CF6273482EA247679C2E2AEC7680A8DAACDFEEA96EF83D076A7456F923D2B4B4F9D6C2E219BCB866F22459047346248E420E76B03D54FA71F5AD9533E7F119F5284F96E73BA8A2E0FE5590B6DDB1D0D747AC43E73291B7731FA565C701494861FAE6B9EB68CFAACB33052A3CE4096814E314FF00B1F1F77F5AB8210CC3FC29E6DF6F1FD2B3B9D12C7ABEE528EDB6B55AB4B705B1B4F5A923B7DCC6AE5ADB60FD6AA27356CC236D59674CB7F9D78AEAB4653F77DAB02C53CB1D3F1AE97415C81F2F38AEAA2F97DE3F2EE32CD633A5ECE0F53A1D2E0CDBFE15AD6D6FB53EB51E8D604D906C1DADC6715A1B3CA0DFECD7918EC62B9F8AE22ADE4D2399F18C9E55B49F535E75236FB87FE75DCFC40BAD906D1DCF2335C479781BB392C7A63A5560DFBBCEFA9F7DC2385725CEC475DC3F1AB1A7F942E7F7F234709386754DCCA0F5C0F5C66A1F2C2B7E19A6C92C691B6786FD2BA79BB1FAB4304E71488EEAE72CD86DDCF071D6A93B33D3DE5DE6A391B6D4C9B3EB3038254E0818EE1FDDDDD79EB4D28C531ED4E8D4B75F97F5A7F947FBDFA5347B518E962BBC6C053F6920FCA6A42154E1988F42067352212A2AF98A2358F0B4E4521E9C38A43D7D2945D81EA218998E7D68A707C0FBD451ED113CACF8AA7E7F0E6A12373373FC26A593077658671C0AAFD4FD4579C754362371E637F7722AB647CC1BAFF0E3B9A9E73F2557238FC4D4C8EAA7B0D2A339F9B9A0C436679EB4EC64600E68CFBD11358DD8D791A4550DBDB6F4F6A11321B08CDF8F4A7A2EE1F8D285507DEA84E56041F3E57F0CF6A5986E396E5BA93EB4F8C71FA531CE49A0CF9AEC694FAD4B1FF17BD2EC14B8DB5A1326EC007D7F0A70E07DD6A6A1C9F969DB98FA7E74102EDFDD6EF97AE31DE9658D63555565F9941C0EDED48233D7F1EB4F8FE74FC2810D855835588C0DA77AE49E94912FF7AA750A147D28022DBB4636F7CFCB5244AC632BFC2DC9148C06E1807E82AD456B9F555AD02E58D36D0EF271FAD6B5AC5B46E3FC3CE31D7DAA0D3A0F94FBD68DA5B1925455CEE638181C935A132D183A7CB96501BAE45413B6481F28E3B0ABB71198D99595919720A91D2A8CA33F952654649E8549554A11B18B37420F1514A3078F5C54F32FFB2DD6A1FBD27AFF00935949B3AEC896CA1F9B26B72C21651C0FBD8EB599A64625FF007B35D1DADBEC51550225248B1A65A13DBBD6D4106CA834BB32E176A8F979E9D6B521B4DEED9FCAB56CF3EBE22DA0DB6B3CFF0008EB5A16969EDF5A5B5B638FC6B423B4C2AF6A57678F5B16AE44907DDA79839C6DE9CD5A5B6D8A3DE94280D4AD73CCAD9A461B89696EA5B93FA5695A5AB0C76F7A86C40DD5AD616467039ABA71D753E6B34CFA0A9FBAF5238ED598FCA3EE9EB57ACAC19B1576CB49C0DBDBBD6CE9FA30C8F956BBE1B1F038CCE64F56CCFB4D21B2370AB93E94C2DFEED6F5A68F96AB17DA46C872DF28F6A7ED92D0F9AA999734EECF36D523DABB78F4C55686D07A56A7888B25C6D24F94BF301DB359F1B9615CB5BDE7747E9795E750860D424F5068FCBFFEBD0CA4F6CD482D99C7393FD297ECEC0F7ACE3169EA67533F9737BA25BAE09E2B46DD41507B66A0B7B43B8D69D8E9C4AEDEE3AD68ADD4E1C567F2E51F676E59860715D468766C98E9FE154747D2795AEA34AD33673FD2B97158C8C23647E7D9B660EA3F78DCD320D964AA7D3351DE4CB6F155C8944765F74715CEF89F584B485B77A67E95F255B10EA54B1F2987A6EB55B238FF001D6A9E75CB01F77AD73C8372AB7A54DA9DD1BA93731CEFE466AB2B15E3B7A57D2D06E34D40FDE38672A7468C6FD895E4DCD54666F318FA2D4B24D55DDF2DFE15A464EE7E9182C3DA298790D2AB49F36D5201214F04D3BCB19DDE9CD3448CABB771EC4F3E94F7FB86AEECF6F9924908CAA0F1D4FAD07E5A6A37CD413992AA2DD87CED8E4C13914392482ABB57BF39CD087683F5A06DDDEF4EECD63B047F3253BA1A234053A51B7FD95A0D52570C9F6FCA8A31FECAFE74506963E2968A4BAB7B868D4B2C2A24908FE052C1413FF022055553B5A9F72CAECBB776EFE227DF39FE86A276C7F9EB5C573582D009F97DF1F954278634E1260F7A8D86E607FBBFAD2B971566308CE78FC6A52307A1A6BC9BCB1C633DA9D91C7CBF377E6A8B9011EBC548220623F33671C01DE9634F34F0323193F4A554510A9DC77127202E00E98E7BD045C6282072314B1C9B4E197729A563C639A67983F2EBED45C070E946707D28A0F35774171C06F6196CE3DA9C636CF14D419FC6A61C1FA8AB899CB71B10DA7F1A7C0371033B73DFD2A25FBE7F1AB16FB76AF5DD9E6AAE89648A36FF00106A95102AF1FC439A4D8B8FBAD526011F2FA628BA2629DC1412F5721877E3FDAE3EA6AB428587E3572D202C7F8BD46077ACDB573A0D2B2877479AD3B78B722F26ABDB41B51540E335A5651281F30ABE7B9E7D6A8B6657B85007CA49E0F5ACF998A80DC63A70DF30FAFB56A5EAEC6FF67D3D2B264E09FA5293D0EAC3EC549873CF5A608B27D79F5A926524FE1440082BF5A867A0D7BA69787ADBCC7CF7F4AEA2D6D4657FC2B1BC2D6B93D339AEB2C2C3CC9578ADE279356BDB52FE956795FC39AD2B7B2C1FAD3B4FB4114272BF31E957A28F27A551F2B9966D0837DC6C30EE651FDE3561570A464FE1EB535B596FDBC1ABD0D88C6157F3AAD16A7C262B3D9B7EEE853689640AA81BA771D69B15AB13F7B15B167A22DE5C223491C2ADD647242A7B9C0271F854D67A4EC62A7B138AE7956D4F26B667392BB653D374C62FD39AEAB48D1CE07CA29BA4693E6483E5AED347D0B2ABF2FE954F15CA8F94CCB32B19961A116FE135BFA6F87B7E3AF4EF5B3A5787493F77B574DA3F860BBAE57B77A978E4A3B9F138ECE12EA6169DE1BC763F9557F1168DB2D5B8C57A559F8715176AAE303D2B07C7BA6AD959B9FBDF2E704572FF00687BD6478387CDBDA621451F3B789ACBCCD41B1EB556DF4B22B7EF6CFED3A83B7BD490699C6315BD4C4D8FD49633960918E961B579A6FF0066EE3C7E3C574074EC76A22D3B2FD2A3EB865F5DB19B69A3E6606B774ED2303EEAE735674FD28023E5EDCD6F58E9AA07DDAE5A998591E562B307D0ADA5E978C70ABEF5BB6F6DB157F0E69D6962AAA3E5A9AE645B7519E300D7CEE331FCEEC8F9BAD88751D88759BF5B0807CDDABCC7C63E236D42E5A3C7EEFA1F735ABF107C5B993ECF1B6E23AE3B570D3DD34AFCB67DEBAF29C25FF7D53E47E83C1DC3AEB4957AAB41D31DD26EF4A8DF95E7F954467F99BE94493E7AD7D0A6AE7EEB85C2A845444907CC69186EA469558FF8D28FA1FC7B568A48F629C796361546D18F4A45534679A7AF31FD69CA56D8DA228C9F7FA52E0FA50AB803F2E0D28C1EE7F3A5CD7358C5DEE2A06C7A7E14D90A82BF787AFBD3B183C35340FEF74AD11AD8744085E94480E3A1EB4F8BF8B95F97DE977648F6E7EB45CE8235FBA3E945492A999F770BED451ED181F0CCC719FA542C70FEB524C78FC2A390739FC2B8CEA86C340691BDF142A1239E285FBE3F2A7A2E07F11A0D132061866FAD390EF5CFB1A7985492DF375A238F1C7CDEF5510E643E3FBA3AF4EC69D906851B7B352EEF63546430FDEA42ABB0E572DD8E7A7E14A46E93BD057D9AB37B9698BC0A5C6E1DBF0ED4B9CF634B1AE1BD3E95A198E31843C36EC7A0A736DF294EE6DF9DB8C76FAD205C7763F534A013C76CE7F1ABE610B1479A9E24CF6344102E3BFA75AB10C79C67F1A3987CAF708141650D8C1E0E69ED16D6C751D87A52BAED1F8E39A596432E33B46D18E0628E608F616D860FE35A9611E595422A9C7539E7F5ACFB25DD5B5A7C4AA47DEDC4E0616A1CB534D96A685BA6F03B73576D932B9F422A0B18833FCBEBEB5A515B0111AA8C958F0B1127ED4CFBF3843C0FC4D674D0EDFBC0A92335A37C818EDFE754EE033B0E4B60639A7CC8F5F0BF0DCCD9D31525A478915B6EEE7A1EF52CB1865C1F4AB1616CCEFD3A7351CC9B3BAA4AD1BB3A1F08D8907773EB8ED5D969169BDF3B718ACAF09581FB3EEC73C575BA659FC8DB47CD818AEB49D8FCE7159B28AA9763C5A1DA368EBDEAED969791EBC7A5682E96542F1EE6B4AC34EDBDBB5633AEBEC9F98E333294E4E4D94ECF4DDD8F96B46DB4AE6B4AD74FF9718AD1B4D376A676E2BCFAF8BE5DCF9DC463998F1E99B472A7F0AB765A5607427EB5A9F63CF6ABF6365B40E2BCE78CE67A1C1531D2B11E85A3EF907CBEFD2BD0344F0FA8F2EB0F42B540E38AF46D1ACD562538F6AC6BE35AB23E2B39CC2571DA3E801C0F96BA8D1FC3A1241F2FE951E916EA36FF004AEA349452777F3AE39E2A7CA7E799863E7A955747088DC63F0AF3DF8BB30B0B3930467691C8AF56D46F23B5B62C59738AF0BF8CDAE2DFDF792BC823B5184AD273BC8DF86154AD8B4DEC799C161B9FF1AB42C97156ADE0C54C612457754C63EE7EAD2C43B99A6C831C67A7B54D67A7FCFD3356D2D4EFAD0B2B4C9E95C33C75918D4C4B484B0D3B6FE55B16D6AAB9CF6E7EB4DB5B7D8A6A3D57528B4987321F97AFDEAF3658C94F4478F2A92A93E5896A7956DD3D0FF2AE1BC71E3AFB3A3430BFCFEB8ACFF157C4C565923B76DDC119E98AF3EBBD664BC97E666EA739AF4B2FCADD4929D6D0FD0B84F82EA626A2AB89568AD4B97BA8FDAE49198EF66EF9C60D556930339EBD702AAADC6D6A1E4DF9AFA98C547447EE982CBE9D2828535644826F9CD38360F634C4E595AA52770E8D4CF5A9C741D1B6D6EDEBCFAD4CE4CEDB98FCC7AE05575EFD78F5A904A540FA7A55731D918BB0EC00DDF8F6A15B0AA3DEA324934E439FC28E62A3177274E0F6148C307FBD9FD2A30E588FCE9DD4FCBF77B0AD23247572B1C36F7DB4295279E2950315A7EE6DBFC3C51CC50DF2F2A3F5F7A729DA7F0E94085B3522C196FD3AD1CC80154BAE68A97C8283028A7CC82ECF8425E94C20114E6F946377E18A4CF3581DD176433003AE3DE9E0E075E7D28EB4283B871407301527F8453D199338F94370707AD26727EF7E94EAA8836069B96A751D6A89100C9C9EB4B4741D0D0791D0D4F28020CFDEEBE9520450CBC76A2489A39363AFCDDFDA9C21F97F1AA0B8D70108A74072DF8FF4A9922C8FFEB5392125BFFAD413A0E863E3EBCD59B5899F81CB1F5A4820C8FC2AD430E4D069CDD110342C0E1BD69043961EF575163561F2F1D714890EECED07D4F1D050547DD1F636D9518FD2B46DBE57F75C543041923E95A115B7929F75598ED7055B231E98FEF544B41CB53434841F2D6C18B64359BA3DBEDF97AE4F35A9237911ED1DC60F1DA9C1E87895617AA61DDA6E247B5569A2C2568C96F81F2F4F4C63155E78BE4AA3D9C3A4A16335A0C9E73F95696836ACF32AE7EF0E99EB55521FDED749E11B0F36FE351DFDAB9E4659A62234B0B39BE88ED3C3FA5797A74676919EB5D3E81A6F9972ABEBFAD2DB693F64B341FEC8CD6EF842D9566663FC22BA678AE5A7A1FCF398662E509497764B756C166C55CB4880AA57B74A6E0FFB4738A96D6EF15E57349EA7CECA327136ADE350ABFCEB422188BF2AC582F791571EF731D7958CA8E299E655A726CD184664ABB6C7A564585D83DFBD6BE9EDBE51CD7910C4EA70578B46BE953796F9F6AEEF4DD7112DD72D5C4AC5B21CD10EA322F1F8539D6E6B5CF9CC5615573D2F4FF14223001C0ADDB6F1BC7045F7D7A66BC7EDF53901AB12EA523A01B9CFAD1EDD5AC7895B21A737A9D978BFE24B49BA3571D2BCD757BA6D5AF7CC6E9EBEB57258A4B961FD6A6B7D35B3F7AA7EB508753D6C0E1A8E123EE6E674569B6AC45699FE16AD3874702AC8B38EDD32CC3F1AE3A98DBEC6D3C5AE8665BE96C4F435A16B64902E5B9A8756F11DAE996D92CABB4723D6B81F14FC60545296CC7D322B4A185C4621FB8B43AB01966331F2E4A113B0F11F8BADF4485B73AAE0FE55E57E32F88B36B323468CCAAA7800F5AC0D6BC513EAF2962CDF31CFDEACACD7D6E5F94D3A294AA2BB3F60E1BE06A5836AAE2D734BB762CCD74F73F7B3906A10C439A54E40FA629927DF3FA57AD23F54C3D351F762AC89474EC7DEA48FAFE1D2A382731C522745914A9F94371FD3EB4ABF33E76F6A398F4234EC3E197029ED3B1C7CDDEA25E7F8BF4A921FBB4731B429A2446F97EF53B77FC0AA25E5AA5446C7FF005A9731D508AB0BB9B1DBF3A947DEFA9A6C7065B9A9228F0053E62B61C1541E314E03D69D1AF1E94F58F27FFAD4B986E57109DAE00E3DAA448771FD79A746993D6A641CFE94B985CC35212466A45878CFBD4842B2852877776CD2C4BB1B028BF994208B23A51565436D1451CC07E7E4ADCFE9483A7BD4AE80B530A6D3F7BF4AD0EED01573CF4FC69768FEF1FCE8CAE07B527C9ED40844E1BF3A9157706E546D19E7BD463683F7AA42DB863F5C517107534E45209A15769EF4BF9D3E662B81EBED4BDA93F3A554DED8E68E66171635F997191CF3EF56A0CA386C2FCA73CF4349043BCF4E879CF6AB696FF2F5FD28E66293D0807009F7CF1DAA48803D695930714AABFF008EFEB47333126B75F98FD0D5D440A9BAAB5B47D4D5C0BB536FA53B9A53DC842127E82A7B2774665DCEB1C9C3AAFF00152C51EE4DDF8558B483E71DEA79FB9D0DAEA4F696F88D78AD0821C9FC2960B7D88BC66AE5A5A658D4CA57279D163498779E8C01ABD34207F79BF0E6AC69367B50354B3C1B8F4E7AE688C9A3CD9493A9A98D35B107EEB2FD4555B88B6274ADBB887737354353836A8ABE6B1DD46775632EDEDF3313D2BB8F86BA62DC6AB18C77FE55CA58DB79B2EDC71DABD0FE16D97FC4E23FCFA572D5A9EEB3E678BB15C980A89763BED7A25B1B45238ACDD33C4A2C6098E7EF600C7E34FF008B17FF00628E28D7EF6D048CD711657AF342BBBB9F5E9510D627E3581C0FB5C329CF667509AB35DCBBB27AD6F694ED21CD72FA347E6607BD76DA269E4C7FA5139460B5397307082B0465908CD43AB6AE6D2318EB5A373018D395AE4BC737AB68ACA57712BF29DD8DA7D7DFE95E2E2251A93E447160E9AAD5525B1A761E2E05C2EEDDDEBADF0F788967917E651CF426BC56CB51904CBCFBD755A0EB924532F359D6CB74F74EBCC3278F2FBA7B726A292C3D69D6F2292BCE79AF3CB1F1736DFBC7A56FD878B142F2D5E4D6C2CE2EC7C456CAEA40ECECE05615752348D7E6DB5C547E3E48171D3DCD4173F1231D194F7E95CFF52ACD9E7BCAF1137A1DF6F8A2273B57D6A1935DB6B7382C2BCC355F89B2286DADCD731A9FC40BA99C95938ED5DD47259D4F89D8EEC370BD6ABF1B3D8F57F8856B6718DB222D717E27F8CABF3470B64F4C8E95E65A8EBB737400693359A64691F3939EFC57B385C928D3D5EA7D6E55C27868497B5773A9D67C6D71AAC8DFBC6C3718CD634D33492FCDD7F4AAFF00306638DBD38A9963CB673DABD7845535EEE87EA797E0E852828D282405B278FE752020E3FDA341849EE3D326A40A0A8ED8E6AE350F629D1EC45236D1ED481B2EA3D89A1CFDDA75B9F9DB8F6A7CD73D5A3076BB1C8DC83FECD48AE08FE2E3AF35188B68C6EFD29C91F5A3991DA488762F34F8795A688B0DD2ACC51E463E6FA934B9D1501BB54AFCBF8D58890B2FE94D48B0DF7AA484F18A4EA1B465D10E1136ECF1C9CF5A922553D3F0A047C0E07E753449923EB53ED025263447C738FCEA648323A0FCA9CB1FCDF787E35388D428FBADF4ED532A9A896A431C5B7B7E95612203FF00D74B1C60D48215619A6AA6831AB16E1F7453961F99781D69D072BF81A90228EADBBD8F7A3999A06CF2F823F338FE74558FB4A07628A215639D887E51F9E4FEB453F681691F9EAC79FF00EB521CB1FF00EB52B9E7FF00AD4272D5B9D835830FFEBD27CFED5315041FC29878634E40A571A1BFD934EEFF008D20DCEE06DC8C7F0F5A5562187D688832F6B7A52E8F3C31C77B6B7DE65BC3705A01262232207F2DB7A2FCEB9DADB72320F354D4EEA728DDC64E281160F1544C989B49E94F82264727F8A9F1C38AB36F6DE6498F6ACC717A96205337CDB550B36E241FBDF4156D197CBD9E5E18B6E0DB8F0BD863D7DE960B52BDB71F7EF521B7DB1336E5EBF741C9FAD1767356C424EC529D0102A2FBA7EA7156674C9E3B5451C397F5E6AA265ED2FA97B4E81A5FF748AB0D0156E2AD691680C59C509685A4EFF7B02890FEB0A210DB945E7EB57B4DB4DECB4D16FB401B7F4AD9D1ECB76DF9142F638EB5999D6C7251105B32EDABF656ADBAA7161B9946DAD4D3B47C9E953ED2DA1C3FDA5A6A3F4EB42B052BD8B17ADAB3D331170B530D33E53C7E955ED11E6BCCA3CD7E647366C307E61DF159BAADB2B3B7FB35D65DD86C078EB58B7F659ED533A9A1EB6131DCEEE8CDD26C98BAB718CE0D7A17C2EB3F335A4E38181FAD729A6DBF968AA3030DBBA75F6AECBC0BA847A424B3B37DCE7E95E7E22A4B95D8F8FE32C5CA78774E1D742AFC62D552EFC472AA1F962C28FCAB9C86611796ABE954BC4DAE36A1AB4B2331F9DC9C9EF4DB4BAF325193F4ADA8F328AB9E6D0C0FB0C0429BE88EEFC2517DA265FAD7AB683A57EE07CBCE2BCD7E19C42E2ED7383F5AF5FD2E3F26D6BC8CDF1DEC9F29F98F11D671A9CA8C2D763585B6F4F4AF29F88F74D36ACD18FBAB5E9DE30D49609CEEED5E51E2176D4355919795EA7E95E765755D4AAE523D0E1CA6D3F692EC67D95B1665CD6ED902A176D51B48955548F9B35A36EFB1BB71CD7BF3A9A1EEE2677D0D7B276F5E95A0B33056F9BB565DA5CE2AD7DA947F17E06B8252BB3C3AB0D4B1E6799D4B74AAF2C9B1BAD46D7A10F6E954EE753DB5A536EE3A345B636F67C93D6B3A6B9C16E9D6A3BDD5727AD507BE2CDD6BD086BB9EC51C3BB16A7EC73D7A53A085249177379699F99B19DA2A9A5CB30E5BE99AB10CB95AEAE6D2C8F6B0782A8CB0FB44ADB3EE9E87FBC3D6A68E5C7E5CD5432F3EFEB5224D981BE56DD9EB59CA4EC7D36170FC85F8E555C49BA3F90E7630C82698246661D38F6A8A327DFA53C75ACEE7B54A0921CCB903EB4F8E2C74FC688620C5771A9614C6DF4C0FEB5A46A348EAE6487471305A9E2854A72CDE61E836F069A1493C54891124D1ED0AF681B5BFC9A963CA0CD22FCE78E9D78A9906474078ACFDA151D8565DE31EF52470F1C5340F602ACC413CB6055B23B83C0A3DA1A45088491F854AAB8F7F714D441BFD454D001B7B74A39AE742A7743A14C1DD5328C2E7DA98A31E869EAD81CEDFCE8358D1D093CB04D2E768A679BEEBF9D092E4FAD68B635861EE3D7F778A9525FEF7A557925C1E2944FF00250744308CB3E72D1557CF6FF268AD39515F5467C178F6350B231F6E6A76181FC7F91A596D59238D9B611226F50183719C738E87D8D741CDB10119C714723D2A5680A7DE503F0A3CAFF77F2A0772139C76A963836D2F93FEEFE5522AE4F7FC6814A56D88DE0E39FD6A58A1DA3EBD2A555F9BE6EC31C53922F6A0CA55341B04797AD1D3ED32E6AB430EE6CFA7AD6D68969E6F38A36396B623929B25787F77F5AA93298B9FC2B4F54516C157BA8C71593732F1F8D47B4BE879B464E7A95656CBD49A6425E41FED1C530A6E6F5CF5AE8BC27A1B5DDEC602E726AE3A6ACDAB5554E9B93346D2C7ECFA5F4EC3B5456963BA707D0D763A8F875ADACE35DBB7BE2A2B0F0DB796CCCA38AE3AD8B8A76B9F2FFDAAA4AF739F5B2CC9CFF2AE834AD3D8C795F419AB507874B3FDCAE934AF0CB79236A7D6B9E58D8DB73CEC6671CB1B5CC5B1D319986793F4AE8B4AF0E3CE07DEE9E95D0F877C16D2C83F77F90AEF343F006D41FBBEDE95E6D6CE214DD8F8CCCB89153D398E02D7C33341BB059778C36070453EE3C3D2471FF171ED5EB11F815B70531D52D7FC25F6684FCB8FC2A6967907A1F374F899B9A499E31AA69AD1679FD2B1274DEDFDDED8AF4AD7740C330FE95C6EADA36C9DB1DABB29E3A154FB6C9F3C9456E61197C94F7A49AF9A0D3447BBEF1A96EACCC5C1155B515C5BAFFB35BA77D8F5AA623DBD44D99172550B1E377A914CB297FD237B6D191D8628BDE14FD7FA557126DC56D1DB53E92A5352A3CBE47A8FC2ED552DEE55988CFD6BD0EE7C671DAC78DD8AF01D1BC41269EE194FB5684FE2D9A71B8B7EB5E0E3F2B9626B5DBD0FCEF30E1FFAC56E76767E2FF167DB25655618CFAD72925E7EF7EF0E6B16EB5A69377CCC7231CD571AA903FAF7AEEC360234A0A28F5B0B95AA54F951D426A5B7D3DFDAA51AE0418E2B927D49DCF0CC2A217ACFFDEFCEBABEAE99B7F66C65B9DAAF891507DE5F719A1FC4BB93EF1AE24CF213F7BF5A9127909FBC68FAAC49795535AB3AEFF848C819DDF9D55BAD7D9AB1E062CBD5B77AFA55864DC7E58F6FAF3D688D384592B094E2C91EFBCC6E78352413E57355D22C755A99318ADEEBA1D94674E05BB71F30AB4AA4255489989AB0AE71DC63D4545F43AA18FA70D8B0065AA6489891853D6ABC13E6AEC525652A87752C6464AE89603B54678E2A70DBC1EF55F218D4B6FC54FB43BA359B2688118FA55884E47E555C3AAFF11A7ACCAC3E5ED473B3B29C652D6C594FAFE94E3D2ABACB8EF4F17007F11A7AB3B29D093E85B03730CFAFAD4CE91AC31F96CECC546E0CBB707FAD678BC19FE2A905DE47FF005E9A8B3D2A7847D4B919C6DFA5486500F53D2B3C5C93DFF5A92394E3AD69186A7653C1BE8684778631F2F5C734A92AC8D8C8F4CFA5528E439EB5246D9AAE5B1DD0C1BEA5C59783DF1DE9564C37FF005AA24618FD3AD3BCC5F56FC0D1667653C19379A73D3F2A3CC6FEEB54225C74DDF89A51216FFF005D68747D5513A1C303EF4E89FEF67E5A8B78614E58F7D687453C3F725EBDFF004A28D9EFFAD14EC57B03F3961F88F23DC797F678659189D8164F2C9C7D78FD6ACC5E3E57FDDC96B3C7260E5063239CFB669750F8711CD399163599883856E83E954AD3C27706768C2DC448C700104A0FC7AD7139D54CE38C70152378A3561F1C40C9BEE239ADE35F97738CA83DBF3AD2B2D46DB5300C334331EE118647E1D6B07C4BF0B2F7EC8A5A6F323620ACB0B65147BF19CD60BF82B52D1ECDA4B7B7768C11FBF0FF00EB3DC7423A51F5BAB176685FD9F83AABF773B33D1BC95E47CB9F4A9A0504FE3E95C3E83AA5F4B1AEDBE6DDCAF961B74848FAD357E21EA163786259229D57BB0500FEB5D1F5C565738BFB1EACA4E109267A0795835205C27DDCD71DA7FC55DA17ED966D1EE5CEE8DF771DF8FF00EBD6CE99F11F49D54C6B1DD2C6F2744946D35A47110975386B6578985DB8E9DCE8218B85C773E95D368B68B0DB6E3E95CFD8289E48F6B2E3F9D6C5EEA2B6506DFBDF2E702A6A4AFB1F378C8CA52E4899FAC6A1F68BC6FE2E78E7AD5290E63F7CD2C7099261F5CD050973EDD29BB2DCE9A74795248B1A5DA7DA2E557D4D7B07C19F0249AB5F236DE33E95C1FC3AD05B51D401DB9C0F4EFDABEC2FD9EFE15FD97C3E2E1A3FE11CE2BE7B8833C8602837267E75C75C431C0E1DA4F56799F8ABC1A63B955DB90BC628B7F04F9766ABE5F2C7D6BD67C45E0F8E6D571C75A9EE3C21144D1478ED9FAD7E552E36E79692D4FCBE3C4CFD9C55CF2CD3BC0BBE45CA66BABD2FC0C1028D9F5C576363A05BDBBF2071DB8AD388DAC72AA86518AAA9C475E6B467978CCFAACD7BB729F84BC0DB9D46CC027BD7A2691E0848E31F28CE2A8786750B78BBAF5F4AECEC75385D3E5AF03199C56BDDC8FCF338CCB11295F53262F06AEFE145733E3BF0FAC109F9719AF4ED28ACCA5B81E95C5FC49183B73DF91559667155CEED9E76578EAB2C428B678C6ADA389656F96B8DD5BC3BE64AE76FE95E8FAD32C1E6126B16D2C56FA26CE39CD7D9603399AD59FAB6071B38439BA1E53ABE8BE5487E5FD2B9FD62D36C59E9DABD73C47E17CAB30CFB5799F8DE2FB045B718DDCD7DA65B9A2C46899F7194E3BDB3493385D4A4F9CFB1E954CC84BD4F7AE1A56FAD5472566C57D1732B5CFD1B0F36E3665A8A56CFEB5695C6DE4D53B75C807D6ADF455A972470D4B5F4192B75EB9CE3A53319EB4A65C8EBEF4E56DE29F3226D61D8A6AAEDE07F2A70E7FBDF8539060FB67BD2F6821020C74FD2A5863C9A0A66A5839C7B9A9956D089C9D8BB691E107D7AD5AD8B8AAF6878AB41C28FAD72CABEA79B51BB8DF2D76E69C815475A47973F4A635DEC5E3E94E3564F6215D9622600FF008D48F3E515555576F048CF354567DC4EDE82A449F0371AD633773A28602AD5768A2F5B1C1EB57239B06B2D6E801F4A747720B73472B6CFABC0E492E5F78D6170A1BAE6A45BADA3B7E7D2B245D014F4B926B485367D050CAA313556F326A48E569436D04ED1938ED5962418EF522CA12B4F667AF4703146825C165CD384E40ED5492406A50E00FF00EBD6918A47A34F03148B867A9125602AAAC831DEA40FBD7F5A3951D94F0D1B1694EE23E6A9A33835550633F4AB31B61FF5A123AA1875B22512ED3D6A68493DEA1519DBEE3353451B0AA37F62922647E7EF66A68C6FFCAA3546602A68A13C505C696800115244993F853E38722A5488826835F6688D576D4A0E17EED4BF67E7EED3C43FE7355CC6AA288BCBFF00668AB42138E9451CC1C87E77E931C9E250BE5C7340CA32EB2B84700F4C7BD581E17BE9A29523B858D93EE29739FCC7159767F19F47D45E3592D66B732300D26FE23C77CE326B7341F12D95F8F36CF50593E63E623E09DBEDDEB9E9F24F44CF95C451C5527CCA1CBF2BA316D34FD77C3F71229FB4490E7E43E6E541EFD3EBDEA45FEDD36EDE5DFB2AB1DD0441FE67C752457557F69FDB09BEDEE9372F240ED9FF00F55733E26B3D42C2E629E19A4568F2A59537707F954CE8F2EAB60C2E31D59252B2918B3EBFA832CDE6476FB647287304499C8EED8CD50BEF07CFA85A4771676ABB80C930BEEDDEE2B5E15D442EE1A7C736D42D21663904F4C0E3A7BD6B3E910B4B25C09E190B0E02B95DBEE2B2F6573D39637D935256F96A707309A25FB4B41E5F1E5F98E06E07DF9E9F5A59606D57CBC34722E02B33C7BBCB1FDE0EBDBDABBF4F0DD8EBD1B2CA6DE47E006DBE5C85BD4FAD67DCFC2D655F92E4E533B3764819F4C7D2A1E1E5BAD8E9A79E52BDAA68CA7A6EADAB6852C49A7C9747C9863692D654DD9F9464863F9F1CD755A1FC46B7D79D52E9BECD2918EB846F6E795A87C29A3DB699632C77DA84626E9963C3FD33D3EBDE9DA8F8762DE5BCB8658F6E55D7B8ADA9D3695EE7898EAD86AB3BCE3AF46B43ACB503CBDD8E7D714E5B7562C6B8198DE69F0AC36B34EB0A8FF5624C63F3ACBBBD59A0C2DC2C9B64F9118CBB8127F1AD1CB5D4E6A797AA9F06A7D4DF03F4F81AF522DC9E74D2280B9192067FC6BEF2F0E6971F84BE1A898C6549841F4EC2BF15F4CD4EFB48D4BED9A7DC4F0DD44D8496227CC423AE3047E79E2BDA346FF8280FC62D3FC20BA2AF892E2EB4F870A9F6A812E1971D01765DD8AFC87C43E11CDB3954965D563149FBDCCEC7E4FE2078418FCDEA539E0F1104935752BAFCAE7D91E34F8BAB61ADB2AAEE273F85732FF1AF50D5753DB1B2FA0C76AF8D87ED71E2C5D45A6D45ACEFD71F3892DFCBC1FF0080735E97F08FF696D12FB568D75B86E3479261F7C8F36163F51C8FA918ACF0FC15F52C3A7520A524B569DEFE870D7F0A71580C3FB474954E55BC75FF0027F81F4D691AF5F6A53069266F98F41C5761E1DD2E4B99033163FD6B88F863AB695E2BFDF58DEDADF270710481987D475AF6BF09E968B62CE229B0BD4915F9AF167143CB1FB28D27CDE963F1BE2094F0D787234FD2C3745D3DA318F7CD75DA7294B61E8A7693F5AE6D75FB5D29249259157CB52FCF4E3FFD759F69F16B4F8ED59DA755DADBF822BE13FD6CC66257BB49CBD11F0D5B0388C4EB08DCF5CD076984FCDDAB86F1FDCEFBB939002D72C9FB4059DA3B6D906DC74DDD6B80F1E7C768A5F30A1EB93C1AE9C9659DD6C5F2FB19245653C2B8D788E67113E22F88D6CC32AB2E73597E1BF162C6BB5981DDD00AF2FF00157C426D66F379276E78AC71E3992DE75DACDD6BF7CC0E515FEAE94D7BD63F67C2F0BC9E195392D4FA46EAF60B9D299DBE5651C8F4AF01F8B1AAA4D7FB236F9474C5137C50BA96C0C224C0EC2B91D6B506BB90BB1DC73CFB57BB91E06AE1ABDE6F43D2E1FE1F9E16B39D47E8519A4CF355BCFCCB4D958B06A6443E6FC462BEDD55B2B1F7D1897A0948A99E76C75A82D5323D2AC48171D6A3DB9CB3B2762BB390579353407EB4D09B4D49032AB7CD49D5761CA4BA122B1CF5A92338FCE98F731A92474EF51C97F1AAD473B7A230E56CBA4D3A3938ACC3AD61785A67F6AB337CBF2D68A32368E06ACF448DE8AF04232CC3141D5D7E6C10D8FD2B9E6BD663F7A916EF06B48E1D5B53AE8F0FD494BDF375B53691B0B425DE49DDEBDEB1C5EE69E2FF00D3B56F1A491EDE1F87611DD1B30CFB075A7ADD6EE3358F15D62A75B8674AD95148FA2C3E5F08E91469FDAB67F154915D6573EF59D1CBD2A78DF78E7E82B451B1E9430C9685E13E475152C7704F4AA71B0DD56201FD6A8EA8D048B6B3332FDE353AB75E7355221F2D5B41F7BE941D50A6B7278C9DD5320C8FC3D2A387EF7E3FD2AC4741B4629E848A39FC6AD46A07F0D3235C93EF53C317F5A9E6368C522485377E42AD471818E3BD471C3CD59821C7E34731B463D50B1C39238AB10C4481F5A2287356A287F4A4E56348C7B889163B77C54E22C85C7D2963878A9843CAD2E72B9448E339FA54891FCDFA53A3833FD6A5483E63F9D1ED03958C553B87DEFCAA60B91F8D491C3F2D3E38F6B67FAD67CC5D98C58CE3F8BF2A2AD293B471DA8A9E60B33F24AE6CB6E9B34DE5C71C65B62A8EA4D41A75D49A4DF47711FCA508623FBC3B8A2F6E1658591770727710A0ED14DB3D36FAF6D7ED096D23409D5CFCAA71EE6BCDA77DD1EA4ACE169EB73BA5F8D56B69738B6B7BC65D9B46F75423EB806BB2D37C591C9A1D9DDDDDED943F6A40E9E6305C8F43DFF4AF0BDF1349951B4F7C9E845685D6B06EF4B86D371586DCB32E4F20B633F8715D90C54A3B9E0E2B872854E55495B5D59EF77291ECF307961587241073F4359526896B7A1FCB8628DB3DC76AE37E1BFC505FB0AE9F7F346CC8498E590FDE07A027DABA497C51642568EDEFED2399D4BE4B7CABFE7D2BB956838DCF91AB966270F55D2D77DF5B35F2093C232C17B1CD0EE85F70C3C7C95FC0D6AE9F65736F03FDAEE23930DC330C102B84FED9BCBC8DAE2DFC40B22C6774C818C58E71F2F76A66A1AC6AF6D76AB1EA325C464853272D1A16E818B640CE0FE46B9D568277573BE595D6A91519CD7DCFF53BABDB3679D562920962624BA1604E31D467FF00AD56DA58E0B2897C959D631F214383C7E38FD6B0FC2B25E6A0F12C8F6F246432999503F1EBB57F535BD05B37958B6F2C4299246C2AA477EBD6BA69D44F53C7C45374DF2377B183E238619563565BA87CC3B43E06CCFD73586BF0FB528D126B6F99B247981C9C77C907A74AEC65BEBC69D53ECF1C96EC7E6050B10DDBE9F5A906A93597C82DD4C6C7E63BF6EEC8A89D353DCEAA18CAB460A304B55D4E127B6D4ACA3646DD22ACB967906D90E472073DF1DBF4AD7D37443AA595AE26B854F2CB05D8CA6161D89EF5BEDE25B3BA94AC96F346D1903E65DD8E31F51D2AF17C40A608BCC8DB00EC6E31EFEF4470F14DC97534AD9A5551B72F2BEE8E3753F0F0B6B5919CC65B1C657AD619D1373C0D651B3792774C8465E35FC074FA73ED5DF5DA5B5E0DB35BC817D47DDACF6F0BD9C57865B79AEA0938DA51B918FE758D4A3D8E8C1669C91FDE19165E18BA173F69B7BA9A112018951F6A83E9F29E48EFC54F078C75CF0C6AED12EA1AB5936EE2586E9D189F5EB8C56C689731C6AC970C57CF725D9D71E69FE40FD2B4356D358C3B644666DA007DB9C03DB247F2AE396069D456A9152F549FE818AC5D293BD58A927DD2FF00234B47FDA9BC71A3C6B6571AF7F6A43DBED79799F1FC21FAE2BB0D17F6A8B3D561DBA843796328601B66668FF1EE3F5AF17BAF0FC32DF27EFDA2F2F3F211C9FC6A54D3F36E5B798A5C9539E703DFA579F2E1DC1BBF2D351F4491E263B87B28C4454FD928B7D62AC7D08DF1AF4231EE5D72D7FE07BD0FE4C05501F102C7C405FECDA95ADC6D3F30494647E15E1F7BE11374383B1979041C0CFE15867C1F796933B21F2D4E79C924D42C8614FF0086FF0003CBA1C1B97B4DC2A34FCD23E88D475AB7B48FE6B8857FE062A8A5F1BA3B9240C3FD939AF0BB782EA351E746CEABC619473524779269D234B1C9710EC3F79495C7E038AEC865BCB1D19AC785A9C55A352EFD0F7886F19BF8B3F8FF00934EBB9C30FBDDABC874BF8BF7DA62AA4ADFDA0BD36C8BB580FF007856FD8FC6FD2EFD5774376AF8E42A6EC7E55CD2C2D484AE7056E1BC5C1F3463CCBC8ED1E65148932EF1CF4AE6ED7E21693AB1DB0DD46AC0E30E4A30FC0D5E8350121270CCA082769E1BF1AD23193D4E5FECDAD17CB28B4FCD1D143728AB92C29B71ACC4A7EF7E95CF4BA90DEDC6DE73866E9510BDDDCFCA73EF5A470AE5AB66B1C91C9DE6FF00036DF5E0C7E5EB51BEB2CE73590B70CC3AAFE54D927609D6BB234753D0A391C53F78D47D419CFDFF00D69AF7EBFEF56509B7F5FE74F8E4C2F5FD6BA2349267A10CB69C3689A4B79F2F7A77DBFF00DEACF8DF7F7A7071EF5B4628EE861E115B17BED591DE94CEC48AA9190CBF7A9FBF95F9AAB951B4628BAB2313D6A789F9FBD54237A9A3979AA2F96C6845260F5FD6AC472F1F4AA11BF1D6AC5BC9F35074D32FC52EEAB51316EF5421391D7B55987FDEA0D932FC472B56E16C1AA36EF9E2AF47D4FE141D31D8B117DDFCEADC7F316AA901C8FCC55EB65DC73EB8A97235A6AE4F0A9E3EB56E15DFF95578173B47A55CB58FE6EF47333A2105726878AB10A1C5241006156A3870B8F7ACF98D7950E850EECD5B813E5E9ED490C5C0AB5043C7E34731718B43E18FF95588A1C0FC68862F97356A3878E86A5CBB9B72DF61238D7FCF7A9D21DFB7FAD3A3878A9962C15ACE52D4B8C74D46A45B47FF005E854009E9532A6074CD3FCAF90B1E140273D863D4F6FC6A79D9631536AF3522C40F1FD2B9DF14FC56F0AF81DD975AF12E87A5BA8C98EE2F23493FEF82777E95E7FE30FDBC3E1FF861196CAF2F75F98F45B2B7210FFC0DB68FC454DD93CE96E7B424191D3F31457C83E20FF82A3DD586A6F1D8F856C52D940DA26BECC9F8ED523F5A29F315CC9F43E49B2BAF2E0552DBB8CE475A1B57BAB056481BF72C31B1C0751F81C8AC9567036AFD319A73B330DBEBDC1AE357E8774A8AB6A4FB9AE65236A166FC05319761C49BF00F248CE07B5496FA64B71672CD1C5BD211F3B74DBFE7FA525A2C90DEC6F23473B44DBA3463E62B1EC083DBDA9F5D4A490CB6BBB48B505F3E269AD636CE14ED665F4F6AEC3464F0CDF44DF67D26F1881BA40F3AB281EBB9B154FC2DE23D3ED2DAFA4BEB38AFAE9983451F920AA0EF818E3E82B0F5DD665BA9E48CA2DB46EDBBECE836A2FE1D2B4D22AE70D684ABCB92D28DBCF726D4EE6D67D45BECF1AD8AC7FBB2B103B4E3BF24F5F6E2AD5E788EFA05B78E1B9C476AB953B47CDEB9F5CF1D6B07CE257E65E3A7352797247112ADC37F0E7208ACF99F43A9D08A496FEA7A7785BE2769B3E891DADC5B476B346A4B3C67CA52C71D303BF7157353BDD696483C8BE7B08E57531095B31F3D0961FC27D45790437CCAFF0074F5E41ADB8FC77A92E9DF6159C7D963F9A38994304FF773D2B68D7D2CF43C6C46491F69ED292D5EF7D51EA9A96BBA8687E22C6A50AF9F0C581183FBBB81DB07DA9BE18F1847E2ED43ECAD0FD9EF2DE4276B29D92A7E1D0D627C39F8851F8BE75D23C40CB342E02D9C8D10530BFF00B2EBC815ADE22D1351F0BEA7B966F39B180A029607DC8E1801DC57453A9F6B747898ACBE8D36E94A369DB43A1D67484BA8B6A90B9FBC48CFE1EBF9D1A7D9CDA7DAAC2A57AEE0B8CF3EB5CEF823C77FF091B4D6D2C8CF756A73BB6F0E9CFF002C7EB5D1DBDC33371CB766C735DB4DC25AC0F9BC461EB507EC6AF4D4B11CBE5CFE6367CD5FE2C556B7F135BDEEA02D115A49DC6E00C7B5714DD4EFAE6289D6150D271B41AC30B717F3335F58C2D1AE4162046E8DE9D2A6B4ED648AC2E1E3522DCDFA1D5DBE936B712C8AD6D2095B180463F4F4A7CB25AE9D6D246D2954625941CB6CC0C9C7F9ED585A478D2C638DADA4D416D57188E6965DB2DB67A862C3257E86B2350925B19BC9FB6457818EF0B0CA092ADD1909EBDF2074CFBD651AC92378E5B566F95B76474855AFDB7C7F67BA8C80DB48C3283C8A926B39634FDDC2A87FBADF75AB95B5F107D9E39619D96D9A61E49B903E543D94FA1E9CD1A578AEF3C3B294B8B9FB6599427CC88F99E4B76049EA2A7EB14E2EF23A3FB231128B70DD6CBB9D136A114526C915A1E38DE2AB3EA76B73B956550D19C1EDD8D528FE21DA2058AF2397CC690AF98CBBE220F4C3557F126B5A4E8E86678FCE91890AA87EF62AFEB51E5E68C9333865B5A3539274E49F42E9DB70731962CBEBDF81508F36404326DC1C7AE693C2FAFC3E26689611E4B48701186D20FD7D2BB2D7FC3BA7F863C3F1DEDE5F5AA4933F9415C10037A023BD454C5D28FC4F73A69E5D8B52E55038D6D344AC1A48C3718CB77A497445923C345C67390D8AB3E1EF15D9EABAA5D5B35BB7CB931C91B0F9E8D3BC7BA386916E239ADE45E9E711823E958FD6A8BD8EE8E558E8AE668AB6F61F295917BFCA786C536F637D2265DD1CCD1B7F146E4E3EBE95CFF8BFE21CFF006E92DADC471C7C1465E4B7BD58B0F1DEA1776513486378B62A600DAB9CF5635CF571105B1EB61B29AAD5EA1A11EB731B968EDF50B85319CE1DBAFE75AD6FE38BCD3E7F2EF22F3A3619591176E7EA7A1FC2B27419EC75ED6A387CB6FB3B0769D02743D8A9F4A975CD2E6D3C6DB79985AE73B5572C1BDBD2B9E38A85F534AF94FF002A37D7C7B1A36D6B49BD32AC0D5CB2F18D8DC4AEAD2342F1F5575C7E55E7FA2F88A5D1EE36488B3C73150652DBA38C77201E57EA6BA4BDD3D4C9105B691A366C099082ABDF3D4F15DD4EA736A79388C153A52B34CEBE37120DDB958300463918A5DFB6B9BD1745974C8BCEB1BE664625BC977DC0FE07803DC56F2DDC62DA3699A2859875DE1973E83FC6BAA324D1E6568A8BF7762CACCA051E6AFBD471BEE41B59597B10734B93FECD5187B42CC328CF15207C9AA41CA1EB5279B91D4F1E95510F685D13797F77F9669F1C99FC6A923F1D5BF3A9639FFC2A83DA1A91CA05588A4CD66C7355A866A0DE353434ADDD49AB88EA3A5664337CC2AE452E7F9506B1A9A1A36B37CD57A191B3F8F3C564DB4BCD685A4DB88A991D9095F634EDB955FA9ABF6FC6DF702B36DDBE5FC3FC2AFDB9C9EBDAA4E886E6844BB7F3AD1B55C1FCEB2ED8E71FE7D2B4AD1B8FC2A1BD4EA85CBD6C46CFCAAE5B8DF54ED4E57F2AD0876A2EE6DA157924F007E3DBEB595CE8F52789738FD6AEC10715C5EB3F1F3C0FE150DF6CF13E8FBA36D8C904A6EA407B829106618F7C77C67071C8F8CBF6E9F06F8610A69716A7AFDC1194586D9A18C9E700BC9B71EF91F43437D8AF690F86E7B64307CB8AB715BB66BE36D1BF6F5F1DFF00C240B35C69BA1C9A7B038B5589B2476F9C316CFD14D7A058FF00C141A65B20D378463F3FFD9BC222FCC8CD4C799EC4CB19461F133E8F1198D49380AA3249EC0724FE40D782FC51FF008281F86FC2B3DCD9F876CE6F105F5BB32190BF956A847070D825C03DC601F515C17C68FDACB57F8CBF0FAE741B7B5B5F0DC77C71733DB5DB48D2C5FF003CF27EE83C67E95F3DDE69961E1A84F9D750B3638891871F8D572B5AC8CDE654A7EED2D59EDB6DFF000512F1D45A8472496BE1D6B657CB43F66750CBE9BB7120FB8C8AA5FB47FED8F7FF00B4178122F0FE99A2DE787D64B912DCCE9A8898DCA05C08CAAA06C6EE78278AF099F5AB5BC5F2CA99429C8894FDFF00C69B6DE28B5B5665822587D5123F31DBEACDD0FD2B3E74694DD7B5D2D46E8BF0F356867DF0C71FCADEA17F518AE8A4F055C436DE65D5F5BD9C318DCEA8A4B1FC7A547A678BED750DD1C971796B22FDD56611EF1EE6A3B8FB3F8995A12BAB4ABBB1909BF1F5C7506AE3CB6D0E1AD531539FEF6CADBD919573756EB3304B3B8BA5ED22C58DD4574B69F0F6E92DD562959630380EAE08FC28A5C93EC4FF0068E1D6971B6DE0EF0DDAEA2D035ACCB32AE713AB2EE53DC669BA85FF00877C2D6CDBACA32CBF2E1223C8FA9E2B047C5BB3D560B38B56D2BED8D6E823332CEC240BEDEDED5DA7863C4FE1BBEB78EDECAF25882A9D90DC138627A8248C7EB453E57A45D8C71342BD2B4ABF3B5E4F4FEBE470BE24F185AF89B4B8E1B3B1785E293E454200C1F60393C566C5E08D6AE1239BFB3EE3CB2BC00B838FA1AF68B5D3E6D1A091DE4D3581F9942B083F0DDCE7F2FE75565B9D47518D64B2D252485BF8D6FE32BF4E08E6ADE16FF130A79DCA9AE4C3C15BBCA5FE763C96D3C0DAC3C8DB6CE65E39594AC7FCEB2574E70FFBD915590E08E1B15E99E27F0E6A5AA5F2C927876F6464C7FAEBC0C981E9827F9D59BBF8747C4BA5EC93497D1E6880114870C5BEA3D2B078667A8B3B8C629D671F935A7E2CF32BBD391D50467CCC8EC3FA54763A725C2B169444ABC2823BFF009C575D17C15F10ADDB32FD924DC71BCC84003F2AD2D2BE085DDADFACDA95E69E91F5D89B8AB9F46C8159FD5AABE87454CF30718DE3515CE1E2F074F98CBAB6E61BF6B0D8DB7D477AB5FDA1A4E9FF00BB8F46F3A4518737374CC33DF010291FF7D1FAD769E31F1435AEB30FF68585ADC58A808CF0801DD79030412462BCDF5FD96DABCFE5EDF258978F69C80B9E29D48A8EC6D83AD531094A7B31C929867592166B7914E5595BA1ADE6F89DAF6A3A049A5CF748D6D27CA5B6FCDB7EB5CBACCA5BFA60E6A46B9DB192A7F1AC949A568EC7656A14E5655229B46CE89F6BD22F26B8D3EE1A3FB32ED591C8076B74523BF435BFE16F8B725AEAECDA84B24F0ED284226D2A7B11EB5C3C77D208CFCACCAC464E692394473337F7B919152AA4A9B5CA73D6C052AE9C6B4536D69ADAC7ADF883E2B47A65B4172B6B24D0DC0611A98F62C9DB3BAAADC7C40BAF883E1F92DB4D8265D436E378942A2AE7E63F971587E0EF1E5FC3610D8FD865BAB185D8BBC018C8A18E7031DFF1AEB35C8ECF5ED0E79B4DD48E9CD690977FB642C2445E98048CE7E84D7A1ED253576CF97A981A384A9187B3D6FA4AF74BD6C79AE99F0EAE350BE92DFCCB78DA1FF5999723EA3D7F0AD36BDD1FC2B09B076D4350911B7EE8984491B7AAE4123DFD78AC9B5D53548F5245B59D75192CF2C1FE66518EE038048FC2BD2FC1BE0D93C53A159EA3756F672799B8C8A2D115B3C77238FCEB9E11537CB15A9ECE618A7864AA625DE3D12EE799DD78AAEAEC322BCD25BA480A2C98765F4C91D4D5CD0FC65F679C5BDD47E65B170CEA0ED15D578ABE1C596A7E64D657B63657718DBF6707CB047B9271BBE86B86D4BC23A86972E6E521F9C001BCF8CAFE8C6B2AB45ADCEBC06330D5A36868CEFF004AB9B1B5BD91597ED5A7E18A29F99A376E01CFA55997C1163737B32ACECD70770837AE11881D6B82F0D786B52BABDFB3A5CC366080CE5A7550AA3F1EBED5B1796BA97C3AD5BED7751DC5DE96EC14334DBBA8EA0FAF538E95C4B0B3BB94763B162B0EE6A95D5FA0B6F2DDC32F9219216B4F99828FBC0139FE95D5DCFC4A93C5BE1BFEC9BD6F2E453F7D177799D2B220F1168F717CB71FDA36E2E238405727EFF5FBD9EE73CF5E82A8A7D9E0B986EACEE126625B21181DB9EB8F5EB51ACFDE91B7B35713CC7F0C6AB0C90F30C4DB894FE2F6A5D7AED3564FB408D7CC059B6FF7B3DCFBD59730DC5B48B347234327DD74E3637AD65DADBFD82F5B6B6E59130B9E80FA5473F434853326F34A9A078650B98D979C763E957BC3D74F7E5ED635F2DA5520027AD6F0D29AE2CDECE3DAC182E0023F7671CF3EF58F3697259AADDC7B8490C8791F32A818C038FC6A94AE572D8D8F096B9FD862784FCD33065C67D853AE7C7971676BE4E19ADE75701C7F0B13DAB36E5238E48E7561E65D392A02F4CE2AFDBDB0B0D31D2EA3F320924C0008E09F6EA054CA0AF7173219A4DACDA9992E16EADFCC899329267748ADD891C715B5A36AF71A159C16571B5377FA872DBB62E4E07D339FA5725268D79A4B4D75A6B4CF6AB2152A4EDC13EDD2B45B549EFF00C376F6EF25BCB3441F6C640F36062D9E31D47E35A52A9284EFD0E6C760E9E221CA7737B6F333467F72558853F36327D07D7FA552B8D28C8CC6295A24CE4A1395AE7D6D2E22BC9EDEF99E4F31146E51B8C7C7DE047D7FCE2ABF89AF353D28C71ADC0F2D711AC88389076CFBFAD7A94F1906ACCF91AF91D652FDDC97CCEAADE39B4B90B47745548C1403E507D47BD5787C5135D3B2ADFB2BA1DB27071BBDB8AE52EBE205C69F32EE8FCC8FCB04B28C329E955351D7648F508E6581FC899CEF563F78FB815B2AD17B18D3CA6B276AB6F23BE7D6B50B6527ED5237D40359FF00F09E6B71CEA8AB148B23055F363C126B9F3E32B69606866FB47D9C91B245F95A23FE158DAFEA8DF6D56B7B9695783BC6EE31D33FAF4AAA9595B434C2E572726AA2FBF63D1A2F8937DA7CACBA858F988BC092D8E7F4AE9746F15E9FAC0FDCCDB64C67CB90ED6AF34D0BC6245BA4378AC0A81F38EF9E95775AB3B592D9A51FBD6D870D1FDE1551AB6D51CB5B0894BD9D48F2F9AEA7AB2DCB30CAFCD9E473C1A45D4E44380AB8FF007ABCA3C17E2EBF5BE8EDD8CD17CBB9723EF7E1D0575D71E31D42EADF6DB986365E031500E7EB5D14EB465AD8E0AF46746A72B3B2835591FF00BBE873572D75391CEDFE42BCA2DBE21789F47BDD971A7DADF44C4F320CE7E8474AEBF4DF8CD67059AFDB3C377D0CDD0949A3643F424E7F4AAF6D0BDB63D15839B8A92B35E4775692DC1385C127A0615ADA741752F2CEBD7A2AD713A57C71D0E5936C9A36A508CE49578D9BF2240AE8B4FF008E5E1A4CF9D1EA50007EF346B83F4C31A7292DC2328C746CEC34DD399CA92E4F3DBAD753A478584D12E7D73D2BCB9BF688F0E5AF30D9EA937A61139FFC78FF002AA3A8FED969A36DFB2E86A7B7EFAEBE6FC947159CA49A3BA8D7A6B767D15A07852D5A75531F99F2E7815D6693E1FD3D8F97F638E423A065C923D715F20DF7EDE5AD5C69D247A5F872D6DEE3CBC09EE673246A7B9083FA9FC2BCEFC65FB48F8D3E2049359EB1AE5E2E9A23C4E96B27D8ED640DFC385E5F3EE48F6AE0AD077DCF4E38BA505A2B9F647C6DFDA23E1CFC15D2E65BA86CB54D708C45A6D94DE64AEF8EAE54911AE719279AF8C3E21FC6AF17FC5E9264D42EA4B7B191C916368BE45B203D17E5C96C0EEC7F0AE62686432F976D1C16D6F101FBD55CBC84FF00749E47E3F9D5E8EEE1B78FF7D3336D19E5B85FF3F4ADA8D250D19E663B329554B9228874EF0A6C8C2B48117D01ABCDA7DAD8C3B981E3D6B275AD5EE3515F2EC645B5B76182E01676FA761F9D505D0B50B868FCBD4666923E0975DDBBDAAB9ACFDD4797EC6553DEA9351F23764D6ED6CA525964C0FEE479FEB559FE2268F2B01299D4F6F3223CD66DC695ADE9B1132436F7916324804541A769775A9EE65D2FE8BC9FCF3CD57B4976368E170CE1CD295FD2563753C6BA4C8B8F3618194FDD742AC6BCEBC5A61D5B5F66D37CE31CDC9DE3966EF8F6AED25BB482658B52B1815B85CB67E5FC76D53D7F59874F78A3B56D3DA1273E488F2EC7DCF6FC08AE7AD2E6D19DF96A8D1939528BBBEEEE8E76DFC35FD9F6DBAE9434D270A18F4FC0735A1A27C3C9F5D904D0C696F1AF193B80FC8F26BB1D267FB7887ED1A2F96FFC326D57007D4F23F5AE8D5A38D576C7DF38C002AA9E1E327A986373DAD49F2A5697E0796EABE0E6B43E5B5D34D22FDE0CA40FD6961F096A9A318EF2CCB123E7CA3722BD4E786DB521FBF85198F56C5472E9CB6057E51E593F298C74FAD6D2C26BA1C31E219B5692BF74737A5F89F55BFB2591D6D59BA127729FC47AD15D13DAED6F963DD9E7228AD3D848F3E58CA3277F668F0ABCB078AE7236A9638C0C138A58A32772C63E58C8233562DA048A55F2D546DE18E38FCEA59EE8B467608C0523E51D6BC7F2D8FD3F99DAD2423EA3777702AC934922AFDD466C8F7FE95B1E1EF1FEAFE14842DB490AC4A0E62098CFBD61C52049C492671DC2D4926EBDBBD96AB210DD77F6AA8F35F46CE6AD87A528384E09ADF55A1AD1FC60D7A1D496E1A4926DADBBCA232A7EA2B5B4EF8FDA945396BAB585F3F7553E5DB5ABE1BF83D6771A5ACD757770D2480ED58BE40A7EA7AD43ABFC0465B5DD6774D3B8FE0986D27FE0438FCEBAD53C44573267CFD6C5649525ECA714BA6D620B9FDA0EE1258F362B1AB1F9817C363DB8A3C43F13A1F1E6942CEDF4FBA370C7208620A7E2A0FEB59BA3F821B48D555B5CD26FA6B6E143C0B9CFE3FD2BD1B47F07E9FA1DF8FECD99A09A5419B57B931F07A12A7073D78AD23ED6A2B499C78CFECCC2DA7469EBBA6B55F33CDF4CF8497179E58BAB7D4926917E5E31963EBF29E2A7D43E15E95A2CCB1DF789218A6076BA2A799B7DB8AEB3E2DFC47D4BC3B3AD9D9B35AC6C9979D78794F4C0F4AF26BAB8F3AE19E472CCDC924F358568D2849A8AB9EAE57531B8B8FB694F913FE5D4ECAFBC3FE0B5B1107DBAE1E743C4F1AFDEFAF15C1DCE9C12E7C9590C8AAC769C738ED56E1955C6CDB8507A7734F882B11DB04738C9AC67539B73D7C3519D2BA736FD4A691B451E319DBC5598916EA265917B71C6299ADDC2DBC8AD06E09D467BE6ABC5A865C2B753D4D67A753A62AEAE8DBF0778B2F7C252C8B6B3F971C84172C70323A57A8E85E34F0F6B7E1D8EEF57BA96EAEA1664303EF656E7230BDFF1AF18BD3E580CBB648DBEF2FF0074FD2AEE8D7FE4C322B337CCDC007B56B1C44A9AF74F2731CAA9621736B17DD3DFC8F4AB1F04786FE28C2ED6B0FF0063DE293FB88DF25BD1B6B66B99D4BC2BE23F0B3AFD8C6ADF678C90AF1861D31D57903FAFE1557C3BAA9D3AFDA452D18CE430E086EC735EA1A37C626B6D09BED96D25E5C4206C6523732F7CFE75A53942AFBB3F77CD1E0E2AA62F072FDD2F6907F664EF6F99E673FC4798AB7DAF49D2D75084623BB688A383FED29E189FA573BA94536BD753CD212ED21CE100500FAE300015F47D95ADAF8E7C3C97674FFB334C0953730AB32FFB58EE2BCCBE207C21D4F4C99A4B2371AAACC3748E9014209EDC673F956D5B0728C79D3BA34CA73FC34AB3A2E2A9CD69AEABFC97DE71769E1481E18A49756B2B776FBB1DC9D9BBFDA538208FC69DE32B6B586FE2B3B2D524D502A2938937AEE3D428F6A72E8B0DADF476D790B417064F9D555B78FF0079090A7F035DDE95FB3DDBDAD84B7935E5CC6F8DD1C6D68B953DB70DE463F0AC69D2A92D227AD8ACCA8E1A51A95EA7A68B57F24715A0F823526F3A6D2E3B6D41563CCEA91EED9D7A860307AF4F4AC2B986DEC53ED50CD3477D14BC294C29F51C74FA62BA7F1CEAFAB4616CEEDA38DE11F2B4518855D4F4E140CF4AC58BC2D247651CD25C43E4C855721F905BDBDAB29C12D11D985AB5250F6B26ACF6B1DE7C2DD553C43048B2796B2CCEC0DB971B81032580F4AE9BC7DF0626D1EF124B78D66D3F50884F1043B9939C62BC974FBF93E1E78823BED3CA3B43948E6701C1CF04106BB0B1F8F9AA696215BEB0536E831FE8EC43A0CE78078AF071583C42A9CF4F63DDA38AA4E3CB2DCAB6D6EF6D14F6B24932CD09FDD81FD7DEB6BC3DA75969DA55CCD3379F1A9CEC3C92E41E2B435DD261D52C1756B599511A212CAB260124FD38AE7EE5040BF688D80F370C0A9CAB1A21525BB1548F6EA53D43C2B7979A29BA8612B6F0B0559501F958F217EB5956FAC5C69D73B6E213E6AE482E3EF1F7AEB744F11BC49F659B74D6AC72F1E723D9BEA2A5F1AE9161E208E1B8B2F9A151E5950B8753EF5D11ACD4ACCC9D36B739C8B57996D84693ED889DBB7D78CD50BC453A8A35BBF93BC10ACA42B02320F3EFE955B55B2F266658DCE15C60FAF18AAA8849E4F38FFEBD746863CA9753662D6A48B55B5B999E450A4E6327E540000303D3AD5BD4754875A31ABDC48CEF36F63C6107B572937982450D236186DCB1ED53D944C27FDE2EDFE2C83C0F4AA51EA8CE514B56CD8BED3ADFC45ADC76D6F2347230C297E3CC6CE718AAB7DA6CB19937295B985CF9885B0C7DE9D04924D0C325BC8A97D6E7729EE73D055AD475ED4BC49AAA492C7E75C2604936C0AA47BD7445F4B1C3525677BAB18B793079238EE9668EDDB04B018207D2B513C1CD38C2ACC9132EE5CF391D8E7DEB5AC1ECD7568E4D4D55959008F07E56C703E95D8F86B4BB76466B06DB0B70F116F3141F6F4AE8A74949DD9E4E37339D34B917F91C77877C2979767F78ABB635C297EC2BAAD2F43FECBB758F607C6413EB5D341A0AE36ED58D7DAA54D25738C83EF5D11518BB23C5C456AD88F7E5A1CD0B086DE5F336FCC7A926A33710DB9C22C75B97BA1C3BB0CCDCF154E7D0A1518FCC95AE98DF68A3C7A92717FBC6CCF86ED19F994AFAD5830D8DCB0DD276E493D3F0A5934386252CA19B03A28AAFF65DD136D893730E37F1934A587BEA7561F1DCAACB55E654D5AF22B09921B7B7333374651DA89754B786DF75C1F2707A6EFBFF00EE8EB515D681ABDDB9F265D32DD4F51B9B77E1918A583C0A914BE64D23CD21EA5DB762B3E596C744A743494DAF93B983AB5F35F8F326CC31B7291AB15DC3B138EF58FA0C2B69A9C9BAE3CE66E563FE11F5635D87FC2B7B3BA9CB490BB7CDBC61CE335B967E1486D97F776B1A8C0070B531C3C9BBB6747F6BE1E941C63ADFA1CDA4D34B66C0229661C2A465B1F8F4ACF93C347CB6BAD419AD2DE360C227385C8EE07AD7657EE3474C476B34A4B6D5080E3F95711E3DD0358D7996410DCEE0702058C9541EB9EE6AAAD3B2EE2CBEB7B49593508BEBD7E44FA4F88175DF34450C9108C6D5918FDE3F4EF562CF4A892D0FDAE659232725E53C7D077AE220D06FB40BA8EE2F1658594FCB1672CE474CE2BB0D32799638525C4F7D32EE249F92053D3DAB1A526FE23D3C661A9D2D683BA2C5F6A30E9D67B84215586D8DA4F941F70BD4E3FAD636931EB9FDABF68B39A654C9F9E7FBA7E82B7A4B4B5D3F37136D9241F7A47E71F4A9F4AD563D6919ADC892343D8F15B7B3E6D0E18E23D941B846FDDB5746A786EEF518ADDBEDB791CD21E71E5855FF00C7707F5ADD4D4F737CC2366F50315CEA332F456AB50CE5579C7E55D34EE9599F3F8982A9AE8BD3435752B58F5BB668648536C830703E6FC0D72A9F03B4D7BB791A4BA6563F773F77F1ADB86FF6FDD26AF43ADE131F7AA9D284B59233A38AC4E1E36A32B2657B5F0A5B68D61B212E4A8014BBEEE2A45898C1B0C7B5B1C1144B7EB2BFF4AB9657884FCC467B55C69451CB3AD57E29EACCB303447F8B8F6AB16774C876E4D695EDCC0142C8A011DD7BD65DC6D91FF77F77D71CD5582351CD6A8BC36B0CED5A2B3C6F1FDEA2817B33CBBC7DAC6997AD1C3A4DA4705AC3C9911003331EBCFA0AE52D93ED5A832F3F31EB9AEE341F837A85ECA16F24FB35B28C92A0B337B63B54DE28F0248DA6C6D67A5ADAC30E559CCC159FFDA25BA7E15E1FB19C9F3B47E9B87CC30B45AA14E57F36CE0E489E2BAF25773176E40073E9FD6BDC3C15E01B1F0DE996ADF678DEEC47969029CCA4F3CFFF005EB07E1FFC3DB5D12F63BEBEBEB596F225E2149048173EA7D7E95D66A7E31B0D1C6DBCBC8A26D9B829FBC47AD7760E8F2479A67CFF00106655710E385C2DECB7E97FF805F6B4371C2F18EDD297C97B25DCCC5557924B74AE6A6F8BBA3DAFCBF69761D8843C5667887E355ADBC5B2CF75D3918CB7C8A3F9935D52C441753E7E8E4F8E9B50E4D1F7FF0032C78ABE3635A335BE932286FE29DD31B4FF00B3FE35E6FA96A9752DF7DBA4BA9A4BA2FBF7E49753FDECF5A87C59AF43ABC91CD1DB886E00DAFB642E1FDF91C55185E59F6AFF00ABFF007B38AF26AD694E57B9FA265B96D1C2D3F72367D7AFF48D8D53C5DA86A961243A84B26A119E51E4E1A33EA1BAF3E95CAB6E46FDE676D6B492C31BFEF66F976952029F98FA52CDABD9DB32FD9ED2359029F5901FAE6B1776B53D2A29417B8ADE4B633BCF20EE1F7873C1A7C5772C9F32A3376200AB369242ACBB635127727BD5AD32E4C7A96E2DB7CCE085A4A3A9B4AA24AE8AF6B6725FDF5A896166B757064181D38C7E1D6BD3BC4FF016CB55B65B8D3D92DE428188420AB0C673B474AE025B965BC9163551E57FB3D73EDF8568699E2D922D19ADED879574AFB926F3183018C11E98F6ADA9F245353573C3CC238BA9284B0F3E5B74B5EE606BBE19FF00846EFE4865BA0D2AAEF1B10B6E159969A834330F9B76DAE8751D22FF00C48935CBC924D2C6A010C304FB002A3D1268F4B95ACEF6C963DDF7D9D4AB8FC0D4F2ABEBB1EB53AFFBAB49A94BAD85B4D550C603F1EB5A367E2B5B4F976F9B0B0C107B8EF5CEEA51DAC37CFF00659249236E7F783E61488EB27CAADF3B7DD23B56138EA67530B4E6B999E8FE0DF8B737856E9566B89AE34A6C810392C61F40B9FE555BE227C65D5BC453490D8FDA34DB38C7DE53B5E4CFA91D3E95C3DB40C922B4CACC91B646CF5A7BCB26DFF4991A48D9892B9EA3D2BA235A6A3CB7D0F3E3946095755E514E5FD7CBEF43435C5EBAFDB24690B9C89031DCADEA4F5AEAB4BF19F893C3DA6AFD975AF3B7FCBE5C80C857E858572EFA8A80ABE5AB267217A702AC41ABC9693C72476EAB1E7692E7775A984B91DE373B3134D554A328A6974688BC4FE26D575CBCDFA93BC93B0DA09000E71D31FD6A9DFA0854A2DC3F9A846173B81FA62B4F5948F51921F302C6B8CE13D6B2EE6C5ECAD914B464672361F987D4D4B93DD9D14945452B5BC8864D4EE24896D66F9555F79C8E86B5D2EE2BDD25615F9E5B794123B94EE455480C8F18122ACC31C6E19C51169924F72D710F970B2F4D9F27F3353B9725167A2685E0AD17C4B6EED637D35C5BB458FB0CD29F39180E71EA3FC6B27C2B7DA9784EDEEAC24B5B5FB25BB33A4576FB64C77DBFA7E9597E05B5B683C616AD7D7125A60E44B11FE2ED9F6AF71974F86E2D764CAB2AC8BB58B004483EBFE15D50C2C7111E5B58F94CC336AD96D669B7252FC3FCFF0003C9A3F1ADB0B88D6F2CE6D356EA32D0C8CDB91FF115A16BE28D3C86861B892465393E5C64D6F78F7E1A59DD69B1C711B7B354CAA299446A09EC335E7F6DA0BE93E22FF4ABCB5568C2E434D9F357D8AE47E75E7D6C0461348F63079F53C5517383D574D4E9EDF49B0992392E16F218A66014B5BB63F1EB55353F03B4F24DF658DB6C649462A577AF63920576369A45F5C6903EC3AC4C7701B4BC6AFB47A645739AA68FE26D36EDA696FAF248410C25B60181FAA1E9F41D6BA25818A49DCF3E8F1054AB2714E29AE8EF7FC8E6CF81753B90AABA7DC481BF8B67CA3F1AB317C2DD7C2EC8E38B6372419D6BBFB5D66F2CACEDCCF7765329277BCE0C32678C0DA3A77FCEAEDD5DDF4366648ED2C6690FDCDB3B00C3D8E315D74F074ADAB3CDADC498C52E5828FF005EB6385D2BE136B0B22BC92C56B247F3248241D7EBDEBAFD0349B8D0AC368B5B49AE1F0240CEA55F1D5B1D2A187C4BA86E633686DB5724BC5386CFBF3597AB7C50BAD3A5DDFD83785738CB657FA56B1A3463AA38EB57CCB14F91D9F926BFCCD2D63C051788676967582DFCC5076DBB6EDA7F1E3F0AD8D0AC1FC39A72DAA48AD121241640A4E7D85737A6FC57B5BF0ABF61BF8E46EB98F728FA1A6EA5F11E451E5DAE9B793487A173B547BF4E7E95AF3518FBDD4E59D1CC24FD8C9D97AAFCCEBAEF541241E5F98D116E32A3A7E35C678A7E33FF00C235786DE1B7B8B868F8323B6D53EC3FC6B2A2B6F15C7AC2EA5249BE153B9A0938565FF771C1AE921F10C17B0B4ADA1DF3301F77C90F9359CA5196DA1D54683C3C939DAAF927B14FC2FF001621F14DFADB4BE7432B8F9773EE563E808AEA17731F9BA76E6B16CFC47A1DC61A4896CE46E9E7DB98CFF2ADA12DBB2B7EF612AB8E41E95BD1F7559C91E5E6108FB4BD3A7282ECF507386E38FA5229C1CED563D391515DEA1676511925B886341D4B381535B88AE6DD664C3C6E32AE0E548FAD6DED17468E1E4928DDEC38BAF92DFBBFC053C4D196FF008F65FC8D323B6F31B0A339E9815652CC646D6DD9EC3BD4AB3DCC65CA858F52441F2DAAF1EC694EBCC1F2B1AAE7A00BD2A95F68F7D7D27FA3EA16F6EA3F87C8F31B3F9D675F78575E11B797ABA824F005BAAFEB9247E14A5A2BA36A785A32694AA455FD7FC8D89F5ADDB99B6AE393C62B327F1E69F09D925F5B8DA71B4CBD3F0CD70AD716F15E4D0CB20D6AF15F97B890C70C3EBDC66ABCF69188A468F48D1773F5713BB291DB001AE5FAC3BE87D152C828C7F8927F2D8EDA7F1CE8B2DCAAFDBAD1A565EDD48F4CE2A68DB4A40D32C767F363F79F2E715E43A95AE9ECDFBE59226FE1101DC07B60E7152E897F6B630B5BCA11D6439D97511C0F70C3047F2AC238AEE8F425C3F050FDDCE4BE5FF04F5C06D753465410CA8782142B6EFA8AA97CFA7F87ED0993ECF6D1FF00B67683F402BCDD75CD26C6E646586FE19092375ADCFCA57DB233534D77E17BD8E366FED857CFF1CAAD8AD3EB5D919C723E4694A52E5F4FF827656BF10747B89B6ADDC083D5F2B9FE95A563750EACACD6F3413275F91C31AE2E1F07F867558D23B6BE916590FCBFBCF9B3F4C54DFF000A8AF342BA5B8D32F196641C07F973F88FEB5A7B69EF6BFA18D6C160AFCAA6E12FEF23B64D35A4E7E6C54F059E38D9BBD4D71D6FF13354F09B2C7AF591687385953A9FCB835D77853C5961E34466B49433AF54202BE3E9F857452AD192DF53C7C560715463CED5E3DD6A8B3FD9ABBBEF6D6C74341B2F2F92BBBD0E6B48DA291F78B7BAF4A61B360786AE8B68791EDAFD4A1E5B118F9B1EF4861C0EF5A2538FE2A60B7591FEED1A0FDB143CAFF7BF3A2B43EC23FBD8A28B0BDB23C9BC1B7DE28F105B4CD0CDFBB1F2F9D70E55B3ED8ABBAAF80BC5571A534735FC7790BF2D01959B77D3762BB9B1D2A1D22D96DED91628906028E9F8D6378D7C7F1F826C977626BA7195854F38F53E83D2B865878C69DE6CFABA79A55AF89B60E9C757A2B7EA7974FA537837548E4BCB568DC62400E577E3B673D29FE3DF11DF6B57D1EA13471428E81608D17FD5AE7F5E959BE22F16DD78C75BFB45C16DDB42803F8147414EB7B16D507EF1A668E3193CF415E67336ACB63EE6349AE5AD592E7B5BFCCAD65613EA0C59096F504D695FE9D258AF98DB3E61F78F0C6A5B2B68EC919A35655CE1496EB516A534D716D70AFB42A91B41F7A98DD6E3F6AE52F74CDF3E485C151D7A1E6AD58EB0B20639FDE3018DC38EFD2A889E45F943B6D03EEE78ABD1D8C3FD96A55959FB9279A6744A3A2B94EEE669CE64CB104606295AE91AE310EE0AC7A11D2A276E3186FAE2A194F971EE1C106A5C8D3952D116AF36AA6D5F95C1C1E2A38A47830777CDDB07BD462E1E562CCD9DDC938A91A2C26E5AA25C558B16FA933DCE7732B6319F5AB12B8531C9E71771F7862B36388994633F376A9A3BA5B4936B60C6DF781ED439333B59DD1D85E7C66BAD3FC376DA6E9B1C366D147B24B94406593273F7BA8AE4EE6F64BEFDE333492632D23312CC7EA7AD54D4CA25FED8CE222011F8D5978B3143F7B38C63A54F3392B19D0C2D2A2BDD5BBBB6416E9E6C9F3746AB715B8B59376467B669D6FA4CB2821636FDDE3AF5ADA97C3375AA431B6D8D76AED503AB1F7FCA8B36554AB05A5C8746D4BCCBC897CBF99890A49F958E39A935E9E3BBB5689612F221C9900C62B26DDA4D3AED94B6151FF7983C03D38ABD2DDAC8CCA240D191D3AD51CF3A7EF29A29E97A734D0C93A30939C6D65C1C53AF9F16EBB95A357E841E38F6A2C7FD0245DA99C9E8C4F356A1996F6458E68DC460E01423E4A0D1CBDEBF628D85E61D577B332F4CF4A9A5B292EDA468D17729E70DD6AE6B5A6AAE96DE4BEF447C64801BB53F44816EBFD608D38D990369340A556DEF24660B370377FAB753B71EB44904CCBB8FCD838E7E615A8E560CC2EC2648F3861FC3EC6A9CD318777CA7CB61B80A051ACE4528676666575F954FCDB47515D4782FC69AD596A30DBD9DCC93798362C329DC8DE8A3D3383835896D34467DCB1B48186197151CF135A5D868D9940239EEBE9F9629734A325244D6A71AB1709453F53D63FB5A216135C6AFE1FBE499B0B968372A0E841C9FD40AE6756F86FA0EBB19BBB7D423D2E26202C6C9CA9F53939FCABBCF871F1120F13F86EDA39AE2DDB5055D92C44E24931D1B07AE7DBD2A3D6752D1EE6EDA4D434BBA124670A6583729FC578FCEBD1952538A95CF85A78BAF87AF2A518B8D9F477D3D19C6E9D0F867C287CA6D52FEF5E3207EEBE454F7C8C0FD6A1D516DAE6E06EF111FB24F2EF8DBCF62F0B7BAF208FC735BFA884B2B7916C3C39BA395B01D30777D47F80AE46F7E0EEAFA85CCF70AB0DB2C8772A16DA17DBA567539F64AE7AB85AD4272752B54E5BF77177F974376CFC35E56952BC5AD4778AF92FB140327B70E0FE75474EF13C57DA69D3ECFEDD6B149FBB9A65B8E53DD5589E3D8547E1BF82F7924E0DC32D9B290C92A48245C8CE72B9FF3CD76DE12F012F8466CFDAAEA68DF25A22331927BE3A8A29D3AB27B58CB158DC2524D4AA7B47BAD2CBF0D0E26D3C0FE26D37505B9D2EEDEE61DDF23EFE9F556AF4CD3618EEAD163BC2B0DD119754CB47F866B454C71F25178E87D3F1AA77FE23823D452D63BAB74BA23FD548CA1CFD475AECA54234FE23E6F159A55C6BE5E45A5F54ADDBB103E9B6BA7C41659225DE7E5E31FCEABDEDC7D88348CCDE5A803820AE2A4F16E996BABE88DFDA51C985390114EE047718AAFE16D3FFB22CE316CD7577673265527F9B683EC464557DAB25A19D3B7B1F69296B7B5BA7DFDCCED6BC5B63A0FCC659A45604968E3665FCE961F11DAEB30C732DDC26D40C349F696478FFE038CD74D7FA758DC5B32CD6F1221FBC2455DAA3DCD60DD7843C3972446D0DBA33723CA700B7E46B3AD4E57B26AC7561EB619C6D38C93EEB5464DDF87B4DF17DBB4B6FAC4D329254FFA4B11F91AC9BBF825B391AB49B986E21D777E5CFF004AE9B58F86FA2D8E87713DBE2C563FDE171F3703D0313FCEB9AD03C11A6F89639AEFFB4CB2E76F930FEED948EE473FA563528F2BB4A27B185C6DE12A94AAC945778DFF0014667FC20DA7E94B27F686A1BDBA27948C08FAE3FAD127872CC59068751D524551C79503B7F5FE95ABA9F86A1D36CDBECF36A1B97EF37DA1C647D3041FC3158DA6EB57D6D7EF66BABCD66B9FDDF9F2108E3DCE335CB2D1E9A1EB52A952AC39E33BDBBAB2FC995EDFCBB79D634D475C8646E0196DF0BFAB574D3781752BDB5F3A3F111DEDF32891DD171F9D5D97C5375A75AC6D2DF686BCF12EE3305FA8E82AF5CEAF67AD695B6E21B7BA5C7CF25A48AF8F70AA72B5B534ADBFE279D5B198876941595F5D9FE8887C3B63AFB4189356DCD18CB2C776936EF4E36E47D0D72BE35F1EEBD6F79359CCD791C27E52BE5A2B37E205757A2F80ACE265BF864B882E30362C87CB07D338FEB5ABAADAC37567E4DE49A7AC8DCEF2C39FC5873F8569ECDF2DAF638E38FA34B10E4E2A4BD2CD3FC4F249FC3934B750BB69B3189403868B6EE07BEE5C83F8D771E12F0D683772ADBC76A7CE93A8670C14FA6339FC8575565ABC76BE4DBC6D6F33B7CA86321946077DA314DD47C2C9AACEF22DB5F58CDD4CB6F36D427FDAEFF962A63479754EE562F379565C956F05D1A6FF00233E3F8476336A2B70D3DDB5C29CEE65017E83800D67F8A3E05B6A8269E1BE91AEA41FF2D482A71D07B5694A9E24F0D2B182E23BC45E42CF20C9FF00C741FCDA93FE137D716D3CC6D30CB2A8FF0054919E7E8C188AD1AA76B4958E6A35F3252E6A35A32F2BFE879B5DFC1FD7ACDB6B5A46C14754994FE99CD624FA64DA44CD1DE5ACC98EE52BD6F4EF88D7DA85FEC9742BC8DF38C093AFE0C2AE6ADF102DF4E9D21BAD1DD4CDC012C8801FCFBFE35CDEC69CB48B3DCA79D663197B3A94949DBA357FCCF35F851E1E875AF1BDBAF98BF2FEF553B965E8315EE70D9F98DF32679AC4D2F44F0EEB862BB8E38ECEF14F0D1CC8B2A7FDF26BA8B7B468F6EDB87982F04B00D9FCABBB0B45416AF73E538833278AAAA5671B6966BF26B728DDF86ADF50B731DC429247E8EB9AC99BE12E8B70731DB9B7954E5648894653EA08AEB1C32C7F2B296F4AAF7935D44079304371FF006D02E7F3AE9953A6DDEC78987C6578BB529B5F3D3F121D3F437B5B358E4B892E597FE5A483E63E99C75FAD39B4F753FC3D78F7AA57DE2EBCD397E6D0F527E324C25645FD2AAB7C4B812CE4F3ADEEB4EBAC6505D44CA1BF100D4FB68474669F53C5D47ED3495FCD7E86AFD888451B707D31D299E46C6F7FA563D87C58B3BA2B1B346D36EDAC51884FC0915D1C57705F42ACAAADBB9C8606AA35232F84C6B51AD45DAB46C54DBF8FD051591AB8D712FDC5AC6BE4FF000FCB452F68CEA8E0EE93E7460F8AFE2259785DF6FF00C7C5C823F74A7EEFAEE3ED5E4BE3BBEFED6D65EEA491649A66C18C1C88D7B0A86E2FDAE66591A3DBBBE704F2CEDEA4F7FAD65DCC321F9BFBC73D6BC6AF5A5367EAD95E4D4B07EF4757DCB48E6C130AAACCC3D338A9B47F104960EF13AAF97300093C62ABDA2ED4CE492DF78E69B78CDB3E718F4F7158EC7B128F32B33A8B882D4DA8DD96CA0C91D09F6AC9511D90656DB2C6C7218F5F6AAFA4EA6245F224E57F809F5F4ABD7104536D27AF4CA8DB4735CE2545D376280B052ACDBD598B7207A540B273E58E7191D6AE8B55B8B80B149B598E080DC9AA57512C52B7F0ED38F7141D516DEE431AB6E65EAD9C707A1AB9FD9E864586493E627938E955F4F2AF74573F7B9CF7AB1F6E89EE1495DCBBB963417506DCE8DFD9B37964F9D8EEBDEA3951A38D5BEEE7B1EB5A927D9FF779676E3A66AB9B59A57CAB2C9193801874A19942A5F733EDDA4925F2D76E7B669C96B2DF5C88E38CB373903DAA47B39E2F33FD1B95EF4DB4D6DB4BB88E55DBE72303923803B835997AF42B4506DBB6F3B72EC3F77D315D0F87F50B6D3AED6491566484670DEB58BA9EA6BA9EA0D3C71ED56206DC7434308C412177FDE7F0F1D4D544734E4ACCEB2FFC6967A8DCB4881959B19017E5E3E95241AFAC5BBCACEEC02011F5AE0D23681BE5382DCD5EB3D56E217F9BE6F4A72958E696069EE99A97FA0CD22F991B6E3D4AFAD67D9DEFF626A07CC8436EFE026B422F11DC227EEAD9F71E327245677885A46D49669A38E2976E78A9E666B4E3F665B1D0DADBC37B7125C24A8CB20C1561F76A9EA1A035B1F3A3728AFC9CFDD15856FAACD012F1C9B4F73DCD599BC45797D1FEFA4F97D31D6AF989F6128BBC4B569A92D9C9B6E956E206391FEC9EFF00E7DA96F7545FB42C964CCCA4F2ACBC0ACD96F1447D4330E808E055FD26F9986D8D5771EB818351CD61BA36F79969159EE1B6C91FEFD73B07001A52CAEBBA6F97F84E39A8AE15BED0AD961B7A9CF229F35DC2599958005B2079785A719A2251BEC48A45B82D132B71C1C7E94AEDE7DAB3431B608C3138E4D56966780EE87E607A907FA5305C472CDB97966C6E0CBD40F4FCEAB723D9D9F332C594F2E92D1DE43279535990E8C3AAFF00FAEBDAFE1EF8D1BC65E1FF00B4B471A488FE5BAA9E0FBD78C5C4B19752C36472A103FBCA3D33563C07E35BAF0CBCB0DB5D2DBC723891A328195F1EC79FCAB6A35BD9BBB3C9CE32B58EA3EEAF7D6C7BCB5D3201F2AA37B0EB513399F8DD8359BE1AF12C5E25D1E1BB5440CC4AC9B79E456800B20F96BD6A7539B547E67568CE954719EE37ED0D1BB048F732F4F7A9C48F2C07E41149DC6734B026D23A67D68B82C89F2AB331EE074AAD0C9C93D11CAF8B3C6917852F238EFA29984A32A635E4FF004AE7EFBE26E92CCED3451DC346D98D4425597D324F35DAEB9A747ACD83D9DE3A3C320C303C633DC1AE2B55F8296B6EF1491DCB347C0914FCCCC7D88AE3ACAAAD51F5396D4C0725AB27197E0FD09AE3E365ACB608CF6BBB9CED49B0E315A1A47C6FB0D41B1F679239B3D1A455041F7C63B57217163A3787E57304905F491820DACD1EC607D73FC5FCF9ACCB6897C5F7EAB146D0CBCF20954403F8403C8AE58E22ADEC7B1FD8B82A907EEB51DEFF00F00E83E2678C6FBC411BDBB5B8B4B13F36F1B998FA671D7EB5CC78692F348BB8EEA1B88C3A1EE9BC01F435E95E1EF0CB5A699E4DD5844B6BF7CB46F867C766E39FC6AED868F6DAADB176D36D9AD594ECDEAB838EDD0114DD39C9F336634F36A185A4E8D385E2BF1FF826027C4833A7EF16DEF2351F3068D9509F500839FA66AADFF8B3C3E9A4473CDA4C33EE6E1624F2CA9E7BF6AD7D4BE1B5BDF9478ADEC6C64418318F9B77B826A5B2F84F6CCEDE642C1A6187314BB57FEF90315BF2D5EA8E5FAD65D0B4936B5BE8EC72F6F79A06A1E66EFED0D3D24E0C993853E80679AC6D5B45D3AEDD8DAEAD1DCED3822E94C7903D0D76DE20F834F28861866668D880CE63E9F539CF1F85735AF7C2AD4B4156913ECB790C99DDB3AFE00F4AE7A94E7F691EC60B1B85BFB956D7E8CC88ECBEC729FB39B79166C2986090C8C7F4C56C697E13D2F469E292F9B51D34B1E14E1467D73D6B9CB6956C2568AE3CEB16CFDDF2C32B0FEF75E0D779A3F87E0B4B463ABDC47AD2B2811C28C19A307A101B9CFD39AC6314DEA756615650497368FB6EFD1EDF7993E24F0D4B62649AC750B79AD646F947DA0EFF00C722B38784EEEEF6F9DAA42A1D72AAD26F03FC2A8F88BC2DF632D245348A9E660C3244C8C9F51D3F2AA3168325B797279E91F9870082D91EFC7D6973743A70F49A85E1535EFCBAFCDBEA75DA17C3E44955ED75DB35BE5EA840756AEAB55BABED0B4A865315ABFCA4332CE610C7B1C60E2BC8DDDAC5D8EDDCDBFE499959437BFE35A92F8DDAEF4B16B358DB00BD194B29FC70DD2B4A55B97638B13954EB558CA72538DF5BAB3FBD1DEE9BF18AC6E1D56E92E6164E3E571B73FEF75AD1B03A0EAD746459AE6D67EA226998A2FBAE0802BC8F47D166BAB98E6FB3B344CC3210E73F8727F4AF62F0F58687616B1488B6F1EE5019278C0E7BFF000835BD1A9296923C9CDB0387C22BD17257EC5C861B75B845B3BC5BB92218F2A5943F5F4C8F6F5A6EAB37F6D697324DA135D7919DAB2A8DA4FB609AB3A9F87F49B5B1676D3E091245DDBD004CFD0D727A66ADFD8F76DF67B2B8B6B1FF00968CB7C1CA0FEF052735AD4B2F43C5C3D28D75ED609F32EFA7E4D320D3EFF4DDEF6FA87866F34B6CE04A9179A83F00322B61BC0FA7DEAACD637EDB71B8AC04AB0FC3771F8D360F1FE8B6BA888575CBC9D1BA4D340AD1A1F43C67F3ABD65E3CD167B9DB1BDBEA1791FCC4C511591BFDDCF27E953168EBC43C4AF7A9426B6EED3FFC0969F79932699AB7862E964B1D62E5D339F22EC6779F4EB5BDA4FC47D42DA648EF74F8D5646C6E8EE36FD7E5619F4EF54B50F89B6B788F0E9F7904375F77C9BDB79073F51535959789B598E32F75A5DBAFAA27981FD3E520F4FC3AD691959DA0CE6AF4DD485F1908C5F77A3FC0ECF4DF10C1A822EDCC67B873B7FC6AEA3C7293B0AF5CE375718DE06B88C89AE2D347BA9BBBC4AD6ADFA1C549FD831C92C6D359DF42D9FF005B05CE71F53DEB7F6D516963C1A982C35FF7553EEFF873AAFB05B86DDF678B77AED1CFD6A230DB87388C063E9C556B2B2B70A42DE4D2B7FD347F9AA4BCD21AF20E2692365E4153D7EB5B53492D0F3E4AD2E57264C21840F9A4DA7D39A2AB8B1BC8D555AE236603A8E28AAD47CABF9CF99279E3768D9530B1F03DC5675E12F275C77A96DA276B8D9E6719F4ABB71A746600CDF3B1E326BE74FDF9FBBA14E065232D9DC3A81DE9B7CAD272AC71E9E94DBAB7F26609B8ED5E94D3298BE4EA3AD296C3891A4BE4B8FA54C35191F6AAEECE7EEFAD324972CBC524436CE1BD0D2895CB746B6A421CC2D1BAC52C20124AFDE350B697717EB9DBBB71DCC73C536297EDD348D20FB898C7AD566BB9A111AA4B22248DB36A9C015467CB6D05BB5811CAAA956071F29EA6A31210BFC38A2ED3C9FDD8FF00966E79EE6ABC121924627EB8A0D09A3D564B73D3777CB52CBAC4D75C966523A0156ECA1527122893271CD5AB9D2235B49241C6D5C8143BD88E68762D782B49BCF14C9246B750C71AA82CD2B607F9E2A9F8C7408F43D67CB122CE58E5CA74CD37ECA3C857562BC0E077C83FE14DB6B38EF6DD9D832C8A33B81EB4A328ED6D48A74EA7B5E76FDDEC49773C137841425BC71CEB26D2FDDC551B1B55B994A36E6DB57352B84B7D1E3B748942A3F99BB3C9351F87977DEC9BBE6E3AD30A7F03F52A8559E7118E3E6DA0FBD6943A4B097C96F2CB2A9FC6B36FE158275DBBBE67F5FAD5EB27924FDD991B033CD03A8A4D686A79E74CD3BC92D0AF183DE9D676D69269D334CD96E762940C5FEA7B0ACD834C5B8B5919998ED6C62A6B4B4852DEE182B068DC0E1BAE6839BD9DA2DC772ADCF87BECB236E62AA38DCA370A8E7D0CDBC3BD6649032E470437E557A4D4CF9ED22AED319DA003F2FE551C5A8C9772292230D2B0E76F4C51C83F6B35B98F7163305DEF1B2AAE0125714EB1D59B4BB966DBBB77073E95D6C699B99A363B980CE4FDDE9DC5625FDB4665B70EA183139C7CB4A51B2B9BC6AF32B316DFC4D6F2B85963F28AF01FFC69CF2C44165C7CBDB34B77A45B9D165BA8D648DA13B76EEDC0FE954F4F856E6C2690AFCC391503E58BD8B56B7EB0BB38457F94019F5A8E7958CA86253B8B06C0C7E3545E175B791C498C7602A62CD095D8DB77282DEF40FD9A366E946A9A43953B6E2DD4B919E8B5816B1B17DFBB736DC81E957D21FB032CC8CD99032303DC554D12D83CD32E4FCBC0AD16C4C7DC4DA3D43E066BACC26D37CCF94299A318CF23E53F98AF45583E5EB9AF00F08F882E341F11ACF032ABC2C31C75C9E6BE8DB422E2C6193685F3915F03F878AF4B052BC390FCD78B70FEC710AB2FB7A94D23D80D4BF36FFF0065AAD791EF4DCEC936D7772DB53E4F9D999AC5969B35BEDBC68D57D5D80C7E35497C4DA1E983C96BD8E4F46120933F9574736896FAB47E4CD1C722B7243A865FCAB92D5BE1F68304EAA74C87E7E728ECACBF4E7FA573CE4D6B1B1E8606B61AA2F675A52BF96C70FF0017B4CD0E28E2B8D3F3F6A958E551B6A81EB8C6493ED5CEB3D8DD25BDBDE5ACDA5CCA3FD7449C1F7653CF6F5AF66D0BE1B695676CC1626997EF8139126D3DB07151DEE9034DB399E431DD2E0ED49630CAB9CFAD72D4C2CBE3FC0FACC2F1051843D8D3E6938F56ECF5FCCCCF0769D2DA69AB243AE45750AA863F688FE523D8E783F8D757043FDA10164995D319DCADB97F3E95E4E7E197DBEE6D97FB426486EF2C6209F2A727A7349ADF836EBE1C5BB5E69FAC5D236F0BB36FCA41F519C514EBA8E9631C46534B113BAABEF3D57BBFE475FE25D67C456FABC7F65D3EC6E2363F2EE43BDC7D734DD53C4BAFD9A4372BA3B491ECC4E89962A7D47FF5AB8FF0BFC5CD4A6BF68D921FDE15CEDC8001EB819AE8A3F8B975F6C584DAC2CFFC32163F2FE14FDB465ADD935B2FAD4B969BA509597A10DC47677107DAEF1B50D3771DCE25674561ED9E2B7BC3977A6EBACCB6FA85BDC7F7118FCD8FE75C4788FE2BEB568F36C9E3F2B78263280AB1F5AEDFC19A77DBAD21BC985ABCD73089B70802B293EA73CD3A72F78798612A52C3F3D7D3B59DEDF80FF187C2DB3F17471BB4922C90A90AF1B0E54F6E735CE5FF00C0891515A3995F1CB7991847C7B329E7F11527C43F177F60EA31DBAD9C12283B8E0B2E7F5A8ED3E2A6A17D3C30AED8C39DB9CEEAB92A3CCEEB533C27F69C284654A778BBEE6E5B7C39861B6854DDCD74A1718B8259633FE1ED5347E1AB9D3350567F2AEEDE4C0004217637EB59BE1BF16DF9B89926984CCB3B2EEDB8057D31FD6B5F40F1F4B7FABCD6ED6EAAB10254ABE2AA30A4F44B538B10F1B072E6B3D2E54F11DC5926A31DB5C2AC786E2368D70EBFF021FD69BA6F82B457B83225BDBB6EC96429918F615D643696FE2ED21CDDDBC7245823CB71B80F707A8AA6DE08D36D07C96EAB1B020004E54FA839A7F576F648E38666943D9F34A325BDB639DB0B7F0BB5D2AC76768D2463706F2FCB3F8138AD3BBF11D8CD1E1624BC520128B11931ED5CA7C48D05B460A2DF50D4809396579F7A9FC08ADFF85A18E93234855E58895DE1154B0F7C0A9873AF75A5A9E96228C25423898CE53BEC9B2EAF8E34986C3C9B886E20857E52B240CC147BFEBD6B0EDFC21E1BD4A56BBD3F52857CE7E5182C8A4FD3008ADEF145936AD34912C8909111915CC61D8118F5AF39D47508FC3D22A9B3B59A4560E64C152C7E9923F4AC6A4945D99596E179E9B950728B7BABDD7E2745E21F02F876053248AB2C98C6CB47F2F791D720F4AE6ECACB40B3959ADE6D62D5D4E36B209141FCABB0F05F8C5B57764FB3C6B18524210ACA3E9C0AE9A15B59DE58C5A449F26491DF3551A7192BC4BFED2AB877EC6B36EDE7FA1E577FE0FD7B506FED0B59ADA58B236BC40C6401F9F35616FBC5FE158B0CD33A81BBB4B8CFA8AF47B3F0B69DA5289AD2DBECEEC777CAE78F5E3A541AF4CBFD9E24F2A33B49EBD49FAD12A4A3EF5DA23FB79546A0E0A51F3493FD4E2349F8B1E26B98E465B08EE162FBD8565C7E04D4B6BFB41DF5AB9FB4E990948F975DC548AEAB4BD6BCD4602DE08C91C9518CFD6AE8F08697AE49E75C69F6B248DC1253AD6908D492F7244D4C6E5F193FAC61D5BC8A1E1DF8ABA2F88E48F6C9F679BFB9261727D8D75D05EC261DCADEFD323F4AE5751F84DA55F43BA28C5BB2F24050CA7F0FFEBD79FF008A3C3371E16BF66B1D4AE2055190AB9C2FD3E6AAF695692F7D230C3E5384CC66E384938F93D8F705D4E103FD743FF7F00A2BC26C7C67E207B61FF138938E398F3FD68ACBFB417637FF0051EBFF00323FFFD9, 34)
SET IDENTITY_INSERT [dbo].[ProductoImages] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (2, N'Caja')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (3, N'Seguridad')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (4, N'Invitado')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[TasaCambios] ON 

INSERT [dbo].[TasaCambios] ([IdTasaCambio], [IdMonedaLocal], [IdMonedaExtranjera], [Fecha], [TCoficial], [TCventa], [TCcompra], [IdUsuarioReg], [FechaReg], [IdUsuarioUpd], [FechaUpd]) VALUES (3, 1, 2, CAST(N'2018-03-23T00:00:00.000' AS DateTime), CAST(30.5000 AS Decimal(18, 4)), CAST(31.5000 AS Decimal(18, 4)), CAST(30.5000 AS Decimal(18, 4)), 2, CAST(N'2018-03-22T16:17:23.387' AS DateTime), 2, CAST(N'2018-03-22T16:17:23.387' AS DateTime))
SET IDENTITY_INSERT [dbo].[TasaCambios] OFF
INSERT [dbo].[Telefonos_Direccion] ([Id], [DireccionId], [Telefono], [DescTelefono]) VALUES (1, 1, N'25570369', N'Convencional')
INSERT [dbo].[Telefonos_Direccion] ([Id], [DireccionId], [Telefono], [DescTelefono]) VALUES (2, 1, N'58165581', N'Operadora Claro')
INSERT [dbo].[Telefonos_Direccion] ([Id], [DireccionId], [Telefono], [DescTelefono]) VALUES (3, 1, N'76749444', N'Operadora Movistar')
SET IDENTITY_INSERT [dbo].[TipoOperacion] ON 

INSERT [dbo].[TipoOperacion] ([Id], [Nombre]) VALUES (1, N'Entrada')
INSERT [dbo].[TipoOperacion] ([Id], [Nombre]) VALUES (2, N'Salida')
SET IDENTITY_INSERT [dbo].[TipoOperacion] OFF
SET IDENTITY_INSERT [dbo].[TipoPerfil] ON 

INSERT [dbo].[TipoPerfil] ([Id], [DescTipoPerfil], [Factura]) VALUES (1, N'Solo busqueda', 0)
INSERT [dbo].[TipoPerfil] ([Id], [DescTipoPerfil], [Factura]) VALUES (2, N'Médicos', 1)
SET IDENTITY_INSERT [dbo].[TipoPerfil] OFF
SET IDENTITY_INSERT [dbo].[Unidades] ON 

INSERT [dbo].[Unidades] ([Id], [DesUnidades], [Codigo], [UsuarioCrea], [FechaCreacion]) VALUES (1, N'Par', N'Pza', 34, CAST(N'2018-08-03T16:39:36.023' AS DateTime))
INSERT [dbo].[Unidades] ([Id], [DesUnidades], [Codigo], [UsuarioCrea], [FechaCreacion]) VALUES (2, N'Libra', N'lb', 34, CAST(N'2018-08-03T16:39:50.460' AS DateTime))
SET IDENTITY_INSERT [dbo].[Unidades] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Email], [UserName], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [FechaCreacion], [FechaActualizacion], [IntentosFallidos], [FechaUltimoIngreso], [IdEstadoUsuario], [IdPerfilSeguridad], [ImageUser]) VALUES (32, N'cesariverarivas@gmail.com', N'cesariverarivas@gmail.com', 1, N'MGpm4M3ICYe/YryrloO9oQ==', NULL, 0, 0, CAST(N'2018-07-06T00:00:00.000' AS DateTime), NULL, 2, CAST(N'2018-08-03T13:13:04.060' AS DateTime), 1, 1, NULL)
INSERT [dbo].[Usuarios] ([Id], [Email], [UserName], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [FechaCreacion], [FechaActualizacion], [IntentosFallidos], [FechaUltimoIngreso], [IdEstadoUsuario], [IdPerfilSeguridad], [ImageUser]) VALUES (33, N'crivera@versatecenlinea.net', N'crivera@versatecenlinea.net', 1, N'Z+jFi3mJNAWPQ7kkk1LuWg==', NULL, 0, 0, CAST(N'2018-07-06T00:00:00.000' AS DateTime), NULL, 0, NULL, 1, 1, NULL)
INSERT [dbo].[Usuarios] ([Id], [Email], [UserName], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [FechaCreacion], [FechaActualizacion], [IntentosFallidos], [FechaUltimoIngreso], [IdEstadoUsuario], [IdPerfilSeguridad], [ImageUser]) VALUES (34, N'cesariverarivas@hotmail.com', N'cesariverarivas@hotmail.com', 1, N'Z+jFi3mJNAWPQ7kkk1LuWg==', NULL, 0, 0, CAST(N'2018-07-06T00:00:00.000' AS DateTime), NULL, 0, CAST(N'2018-07-20T10:50:27.123' AS DateTime), 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
/****** Object:  Index [PK_Acciones]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Acciones]') AND name = N'PK_Acciones')
ALTER TABLE [dbo].[Acciones] ADD  CONSTRAINT [PK_Acciones] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Categoria]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND name = N'PK_Categoria')
ALTER TABLE [dbo].[Categoria] ADD  CONSTRAINT [PK_Categoria] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_CategoriaTipoPerfil]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CategoriaTipoPerfil]') AND name = N'PK_CategoriaTipoPerfil')
ALTER TABLE [dbo].[CategoriaTipoPerfil] ADD  CONSTRAINT [PK_CategoriaTipoPerfil] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Cliente]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND name = N'PK_Cliente')
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [PK_Cliente] PRIMARY KEY NONCLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Pk_CodigoValidacionUsuario]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CodigoValidacionUsuario]') AND name = N'Pk_CodigoValidacionUsuario')
ALTER TABLE [dbo].[CodigoValidacionUsuario] ADD  CONSTRAINT [Pk_CodigoValidacionUsuario] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_DetalleOperacion]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DetalleOperacion]') AND name = N'PK_DetalleOperacion')
ALTER TABLE [dbo].[DetalleOperacion] ADD  CONSTRAINT [PK_DetalleOperacion] PRIMARY KEY NONCLUSTERED 
(
	[IdOperacion] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Direcciones]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Direcciones]') AND name = N'PK_Direcciones')
ALTER TABLE [dbo].[Direcciones] ADD  CONSTRAINT [PK_Direcciones] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_EstadoUsuarios]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EstadoUsuarios]') AND name = N'PK_EstadoUsuarios')
ALTER TABLE [dbo].[EstadoUsuarios] ADD  CONSTRAINT [PK_EstadoUsuarios] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Monedas]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Monedas]') AND name = N'PK_Monedas')
ALTER TABLE [dbo].[Monedas] ADD  CONSTRAINT [PK_Monedas] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Perfiles]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles]') AND name = N'PK_Perfiles')
ALTER TABLE [dbo].[Perfiles] ADD  CONSTRAINT [PK_Perfiles] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Perfiles_CategoriaTipoPerfil]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles_CategoriaTipoPerfil]') AND name = N'PK_Perfiles_CategoriaTipoPerfil')
ALTER TABLE [dbo].[Perfiles_CategoriaTipoPerfil] ADD  CONSTRAINT [PK_Perfiles_CategoriaTipoPerfil] PRIMARY KEY NONCLUSTERED 
(
	[PerfilesId] ASC,
	[CategoriaTipoPerfilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PerfilSeguridad]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PerfilSeguridad]') AND name = N'PK_PerfilSeguridad')
ALTER TABLE [dbo].[PerfilSeguridad] ADD  CONSTRAINT [PK_PerfilSeguridad] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Producto]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND name = N'PK_Producto')
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [PK_Producto] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ProductoImages]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ProductoImages]') AND name = N'PK_ProductoImages')
ALTER TABLE [dbo].[ProductoImages] ADD  CONSTRAINT [PK_ProductoImages] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Roles]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND name = N'PK_Roles')
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [PK_Roles] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_RolesAcciones]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RolesAcciones]') AND name = N'PK_RolesAcciones')
ALTER TABLE [dbo].[RolesAcciones] ADD  CONSTRAINT [PK_RolesAcciones] PRIMARY KEY NONCLUSTERED 
(
	[IdRol] ASC,
	[IdAcciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_RolesUsuarios]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RolesUsuarios]') AND name = N'PK_RolesUsuarios')
ALTER TABLE [dbo].[RolesUsuarios] ADD  CONSTRAINT [PK_RolesUsuarios] PRIMARY KEY NONCLUSTERED 
(
	[IdRol] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Telefonos_Direccion]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Telefonos_Direccion]') AND name = N'PK_Telefonos_Direccion')
ALTER TABLE [dbo].[Telefonos_Direccion] ADD  CONSTRAINT [PK_Telefonos_Direccion] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC,
	[DireccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_TipoOperacion]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TipoOperacion]') AND name = N'PK_TipoOperacion')
ALTER TABLE [dbo].[TipoOperacion] ADD  CONSTRAINT [PK_TipoOperacion] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_TipoPerfil]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TipoPerfil]') AND name = N'PK_TipoPerfil')
ALTER TABLE [dbo].[TipoPerfil] ADD  CONSTRAINT [PK_TipoPerfil] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Unidades]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND name = N'PK_Unidades')
ALTER TABLE [dbo].[Unidades] ADD  CONSTRAINT [PK_Unidades] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CK_Unidades_CodigoUnique]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND name = N'CK_Unidades_CodigoUnique')
ALTER TABLE [dbo].[Unidades] ADD  CONSTRAINT [CK_Unidades_CodigoUnique] UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Unidades__06370DAC21B6055D]    Script Date: 3/8/2018 16:58:49 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Unidades]') AND name = N'UQ__Unidades__06370DAC21B6055D')
ALTER TABLE [dbo].[Unidades] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Usuarios]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DelDirecciones]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DelTelefonos_Direccion]    Script Date: 3/8/2018 16:58:49 ******/
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

		--SELECT @vi_UltCod = MAX(Id) 
  --      FROM dbo.Telefonos_Direccion

		--IF ISNULL(@vi_UltCod,0) = 0
  --          SET @vi_UltCod = 0
            
  --      DBCC CHECKIDENT ('dbo.Telefonos_Direccion', RESEED, @vi_UltCod) 

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
/****** Object:  StoredProcedure [dbo].[sp_InsUpdDirecciones]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsUpdTelefonos_Direccion]    Script Date: 3/8/2018 16:58:49 ******/
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
@Telefono NVARCHAR(30),
@DescTelefono NVARCHAR(50)
AS	
BEGIN
	SET NOCOUNT ON	
	DECLARE @starttrancount BIT
	DECLARE @NoError BIT = 0
	DECLARE @Mensaje NVARCHAR(MAX)=''
	DECLARE @vi_UltCod INT
	

	BEGIN TRY
		SELECT @starttrancount = @@TRANCOUNT

		IF @starttrancount = 0				-- VERIFICAR SI NO EXISTE TRX SQL ABIERTA 
			BEGIN TRANSACTION MiTrx	-- SI NO EXISTE TRX SQL INICIAR UNA TRX SQL

		IF @Id IS NULL OR @Id = 0
		BEGIN
			SELECT @vi_UltCod = MAX(Id) + 1
			FROM dbo.Telefonos_Direccion
			WHERE DireccionId=@DireccionId
         
			SET @vi_UltCod =  ISNULL(@vi_UltCod,1)
				

			--INSERT INTO dbo.Telefonos_Direccion
			--        ( DireccionId, Telefono,DescTelefono )
			--VALUES  ( @DireccionId, -- DireccionId - int
			--          @Telefono,  -- Telefono - nvarchar(30)
			--		  @DescTelefono
			--          )
			
			INSERT INTO dbo.Telefonos_Direccion
			        ( Id,DireccionId, Telefono,DescTelefono )
			VALUES  ( @vi_UltCod,
					  @DireccionId, -- DireccionId - int
			          @Telefono,  -- Telefono - nvarchar(30)
					  @DescTelefono
			          )

			SET @Mensaje = 'El teléfono se agregó exitosamente'

		END
		ELSE
		BEGIN
			UPDATE Telefonos_Direccion
			SET Telefono = @Telefono,DescTelefono=@DescTelefono
			WHERE Id=@Id AND DireccionId=@DireccionId
			SET @Mensaje = 'La teléfono se actualizó exitosamente'
		END
		IF @starttrancount = 0				-- VERIFICAR SI NO EXISTE TRX SQL ABIERTA 
			COMMIT TRANSACTION MiTrx	-- SI NO EXISTE TRX SQL INICIAR UNA TRX SQL

	END TRY
	BEGIN CATCH
		SET @NoError = 1
		

		SET @Mensaje = CAST(ERROR_NUMBER() AS VARCHAR) + ERROR_MESSAGE()
		IF XACT_STATE() <> 0 AND @starttrancount = 0 -- Si se inició con una nueva transacción --
			ROLLBACK TRANSACTION MiTrx

		--SELECT @vi_UltCod = MAX(Id) 
  --        FROM dbo.Telefonos_Direccion
         
  --        IF ISNULL(@vi_UltCod,0) = 0
  --          SET @vi_UltCod = 0
            
  --        DBCC CHECKIDENT ('dbo.Telefonos_Direccion', RESEED, @vi_UltCod) 

	END CATCH
	SELECT @NoError response,@Mensaje mensaje
END
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteAllPerfiles_CategoriaTipoPerfil_by_PerfilId]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ins_Lista_CategoriaPerfil]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_InsertaOperacion]    Script Date: 3/8/2018 16:58:49 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarProductos]    Script Date: 3/8/2018 16:58:49 ******/
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
ALTER DATABASE [BDINV] SET  READ_WRITE 
GO
