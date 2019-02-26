USE Project_Group2_FoodOrderingDatabase

/** Function to calculate tax **/

GO
Create FUNCTION TaxAmountCalc(@OrderID INT)
RETURNS DECIMAL(4,2)
AS
BEGIN
	DECLARE @TaxAmount DECIMAL(4,2) =
		(SELECT 0.10*oh.OrderAmount
		FROM dbo.OrderHeader oh 
		WHERE oh.OrderID = @OrderID)
		SET @TaxAmount = ISNULL(@TaxAmount, 0);
		RETURN @TaxAmount;
END
GO

ALTER TABLE Bills
ADD TaxAmount AS (dbo.TaxAmountCalc(OrderID))


/** Function to calculate orderamount **/
GO
Create FUNCTION FoodItemAmountCalc(@OrderDetailID INT)
RETURNS DECIMAL(7,2)
AS
BEGIN
	DECLARE @FoodItemAmount DECIMAL(7,2) =
		(SELECT fi.UnitPrice * od.Quantity 
		FROM dbo.OrderDetail od join  dbo.FoodItems fi
		ON od.FoodItemID = fi.FoodItemID
		WHERE od.OrderDetailID = @OrderDetailID)
		SET @FoodItemAmount = ISNULL(@FoodItemAmount, 0);
		RETURN @FoodItemAmount;
END
GO

ALTER TABLE OrderDetail
ADD FoodItemAmount AS (dbo.FoodItemAmountCalc(OrderDetailID))

GO
Create FUNCTION OrderAmountCalc(@OrderID INT)
RETURNS DECIMAL(7,2)
AS
BEGIN
	DECLARE @OrderAmount DECIMAL(7,2) =
		(SELECT SUM(od.FoodItemAmount) 
		FROM dbo.OrderDetail od 
		WHERE od.OrderID = @OrderID)
		SET @OrderAmount = ISNULL(@OrderAmount, 0);
		RETURN @OrderAmount;
END
GO

ALTER TABLE OrderHeader
ADD OrderAmount AS (dbo.OrderAmountCalc(OrderID))


/*** Function to calculate Total amount by adding Orderamount, Taxamount, Delivery charges and Promo code discount if applicable **/

GO
Create FUNCTION TotalAmountCalc(@OrderID INT)
RETURNS DECIMAL(7,2)
AS
BEGIN
	DECLARE @TotalAmount DECIMAL(7,2)
	SELECT @TotalAmount = 
		CASE WHEN b.PromoCode is NULL
		THEN
			b.TaxAmount+b.Tip+b.DeliveryCharges+oh.OrderAmount
		ELSE
			(b.TaxAmount+b.Tip+b.DeliveryCharges+oh.OrderAmount)-((pc.DiscountPercentage/100)*(b.TaxAmount+b.Tip+b.DeliveryCharges+oh.OrderAmount))
		END
	FROM dbo.Bills b
	FULL JOIN dbo.PromoCode pc 
	ON b.PromoCode = pc.PromoCode
	JOIN dbo.OrderHeader oh
	ON b.OrderID = oh.OrderID
	WHERE b.OrderID = @OrderID
	SET @TotalAmount = ISNULL(@TotalAmount, 0);
	RETURN @TotalAmount;
END
GO

ALTER TABLE Bills
ADD TotalAmount AS (dbo.TotalAmountCalc(OrderID))

SELECT * FROM bills;
SELECT * FROM OrderHeader;
SELECT * FROM PromoCode;


