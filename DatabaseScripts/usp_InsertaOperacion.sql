USE [BDINV]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertaOperacion]    Script Date: 03/25/2018 00:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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