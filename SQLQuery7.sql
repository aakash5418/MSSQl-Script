USE [Shopping_Cart]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTUPDATE]    Script Date: 1/4/2023 3:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_INSERTUPDATE]
	
@OrderDetailsId BIGINT,
@ProductName VARCHAR(50),
@Quantity INT ,
@Price DECIMAL ,
@OrderId BIGINT, 
@ProductId INT,
@Created_By_User VARCHAR(50),
@Modified_By VARCHAR(50)
AS
BEGIN
IF  EXISTS (SELECT * FROM OrderDetails  WHERE OrderDetailsId = @OrderDetailsId)
UPDATE OrderDetails
SET ProductName = @ProductName,Quantity = @Quantity,Price = @Price,OrderId = @OrderId,ProductID = @ProductId, Modified_Date = getdate(),Modified_By = @Modified_By
WHERE OrderDetailsId = @OrderDetailsId
ELSE
INSERT INTO OrderDetails(OrderDetailsId,ProductName,Quantity,Price,OrderId,ProductID,Created_By_User,Created_Date)
VALUES(@OrderDetailsId,@ProductName,@Quantity,@Price,@OrderId,@ProductId,@Created_By_User,Getdate())
END

EXEc [dbo].[SP_INSERTUPDATE] 100037,'i7Processor',1,'100',10008,106,'procedure','Aakash'

select * from CustomerInfo
select * from OrderDetails where OrderId=10008

---TURN OFF IDENTITY
set  
identity_insert OrderDetails on

-- COLUMN EXISTS
IF EXISTS(SELECT *
          FROM   INFORMATION_SCHEMA.COLUMNS
          WHERE  TABLE_NAME = 'Customers'
                 AND COLUMN_NAME = 'FirstName')


