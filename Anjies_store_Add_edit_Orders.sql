CREATE PROCEDURE Add_edit_Orders(
		@OrderDate DATE,
		@QtyOrdered INT,
		@Itmperbatch INT,
		@ProductsID INT,
		@EmployeeID INT,
		@SuppliersID INT,
		@Tasktype INT)
AS
BEGIN
	-- Initialising a Try block to ensure the credibility of our operation
	BEGIN TRY
		-- If an error occurs in the TRY block, control is passed to another group of statements that is enclosed in a CATCH block
		DECLARE @Errorcode INT=0, @TaskErrorMessage VARCHAR(25)= 'Invalid tasktype key', @SuccessMessage VARCHAR(20)
		IF @Tasktype > 2
			BEGIN
				RAISERROR('Wrong action key',16,1)
			END
		ELSE
			BEGIN
				--Start inserting logic
				IF @Tasktype = 1
					BEGIN
						INSERT INTO Orders(OrderDate,QtyOrdered,Itmperbatch,ProductsID,EmployeeID,SuppliersID)
						VALUES(@OrderDate,@QtyOrdered,@Itmperbatch,@ProductsID,@EmployeeID,@SuppliersID)
						SET @SuccessMessage = 'Added successfully'
					END
				ELSE IF @Tasktype = 2
					BEGIN
						UPDATE Orders
						SET OrderDate=@OrderDate,QtyOrdered=@QtyOrdered,Itmperbatch=@Itmperbatch,ProductsID=@ProductsID,EmployeeID=@EmployeeID,SuppliersID=@SuppliersID
						WHERE OrderDate=@OrderDate
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
