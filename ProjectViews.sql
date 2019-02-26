USE Project_Group2_FoodOrderingDatabase;
	
/*****Find most valuable Customer with highest order Amount******/
Create View TopCustomer
WITH ENCRYPTION
As
SELECT top 20 sh.CustomerID,c.FirstName,c.LastName,SUM(sh.OrderAmount) AS[Total Order Amount],
COALESCE(STUFF((SELECT distinct ',	'+RTRIM(CAST(oh.OrderID	as char))			
							FROM	dbo.Orderheader oh	
							WHERE	sh.CustomerID	=	oh.CustomerID	
							FOR XML PATH('')) ,	1,	2, ''), '') AS	OrderID	
FROM	Orderheader sh
INNER JOIN dbo.Customer c
ON c.CustomerID=sh.CustomerID
GROUP BY sh.CustomerID,c.FirstName,c.LastName
order by [Total Order Amount] DESC;

--DROP view TopCustomer;

SELECT * FROM TopCustomer;

/*****Find most popular restaurant having highest number of Orders******/

Create View TopRestaurant
WITH ENCRYPTION
As
SELECT Top 100 oh.RestaurantID,r.Name AS [Restaurant Name],COUNT(oh.OrderID) AS[Total No of Orders]
FROM dbo.OrderHeader oh
INNER JOIN dbo.restaurant r
ON oh.RestaurantID=r.RestaurantID
GROUP BY oh.RestaurantID,r.Name
order by [Total No of Orders] DESC;

--DROP view TopRestaurant;
SELECT * FROM TopRestaurant;

/*****Find most popular food item for each restaurant******/
Create View PopularFoodItem
WITH ENCRYPTION
As
SELECT TOP 20 r.Name AS [Restaurant Name], f.Name as [Food Name], COUNT(od.FoodItemID) AS[No of times ordered]
FROM dbo.FoodItems f
INNER JOIN dbo.restaurant r
ON f.RestaurantID=r.RestaurantID
INNER JOIN dbo.OrderDetail od
ON od.FoodItemID=f.FoodItemID
GROUP BY f.RestaurantID,r.Name,f.Name,f.Category
Order by [No of times ordered] DESC;

--DROP view PopularFoodItem;
SELECT * from PopularFoodItem;