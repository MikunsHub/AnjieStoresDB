ALTER PROCEDURE Add_edit_Products(
	    @ProductName VARCHAR(20),
--		@TotItems INT,
	    @Barcode INT,
		@ExpiryDate DATE,
		@Price VARCHAR(15),
		@SupplierID INT,
		@OrdersID INT,
		@ProductTypeID INT,
		@TaskType INT) 

AS
BEGIN
	BEGIN TRY
		DECLARE @Errorcode INT=0, @TaskErrorMessage VARCHAR(25)= 'Invalid tasktype key', @SuccessMessage VARCHAR(50)
		DECLARE @TotItems INT
		SELECT @TotItems = (QtyOrdered * Itmperbatch) FROM Orders WHERE OrdersID=@OrdersID 

		IF @TaskType > 2
			BEGIN
				RAISERROR('Wrong action key',16,1)
			END
		ELSE
			BEGIN
				IF @TaskType = 1
					BEGIN
						INSERT INTO Products(ProductName,TotItems,Barcode,ExpiryDate,Price,SupplierID,OrdersID,ProductTypeID)
						VALUES(@ProductName,@TotItems,@Barcode,@ExpiryDate,@Price,@SupplierID,@OrdersID,@ProductTypeID)
						SET @SuccessMessage = 'Added successfully'
					END
				ELSE IF @TaskType = 2
					BEGIN
						UPDATE Products
						SET ProductName=@ProductName,TotItems=@TotItems,Barcode=@Barcode,ExpiryDate=@ExpiryDate,Price=@Price,SupplierID=@SupplierID,OrdersID=@OrdersID,ProductTypeID=@ProductTypeID
						WHERE ProductName=@ProductName
						SET @SuccessMessage = 'Edited successfully'
					END
	SELECT  @SuccessMessage AS SuccessMessage, @Errorcode AS ErrorCode
			END
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_MESSAGE() AS ErrorMessage,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_STATE() AS ErrorState,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_LINE() AS ErrorLine
	END CATCH
END



