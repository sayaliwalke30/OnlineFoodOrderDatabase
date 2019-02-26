
CREATE DATABASE Project_Group2_FoodOrderingDatabase;

USE Project_Group2_FoodOrderingDatabase;

/********  Customer data is imported from CSV file ********/

/*CREATE TABLE Customer(
	CustomerID int IDENTITY(1000,1) PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Address varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	State varchar(50) NOT NULL,
	ZipCode varchar(40) NOT NULL,
	ContactNumber varchar(50) NOT NULL);*/

CREATE TABLE Card(
	CardID int IDENTITY(100,1) PRIMARY KEY,
	CustomerID int NOT NULL
		REFERENCES dbo.Customer(CustomerID),
	CardNumber VARBINARY(250) NOT NULL,
	CardHolderName varchar(40) NOT NULL,
	ExpiryDate date NOT NULL,
	ZipCode varchar(6) NOT NULL,
	CardType varchar(10) NOT NULL);

CREATE TABLE Login(
	UserName varchar(20) PRIMARY KEY,
	CustomerID int NOT NULL
		REFERENCES dbo.Customer(CustomerID),
	Password VARBINARY(250) NOT NULL,
	emailID varchar(40) NOT NULL);

CREATE TABLE Restaurant(
	RestaurantID Int Identity(5000,1) PRIMARY KEY,
	Name varchar(40) NOT NULL,
	Address varchar(40) NOT NULL,
	City varchar(15) NOT NULL,
	State varchar(15) NOT NULL,
	ZipCode varchar(6) NOT NULL,
	ContactNumber varchar(20) NOT NULL,
	OperatingHours varchar(10) NOT NULL,
	OperatingDays varchar(10) NOT NULL);

CREATE TABLE FoodItems(
	FoodItemID int identity(1,1) PRIMARY KEY,
	RestaurantID int NOT NULL
		REFERENCES dbo.Restaurant(RestaurantID),
	Name varchar(40) NOT NULL,
	Category varchar(20) NOT NULL,
	UnitPrice decimal(5,2) NOT NULL,
	Calories decimal(6,2) NOT NULL,
	Description varchar(100) NOT NULL);

CREATE TABLE RatingsAndReviews(
	FeedbackID int identity(100,1) PRIMARY KEY,
	CustomerID int NOT NULL
		REFERENCES dbo.Customer(CustomerID),
	RestaurantID int
		REFERENCES dbo.Restaurant(RestaurantID),
	FoodItemID int
		REFERENCES dbo.FoodItems(FoodItemID),
	Ratings int NOT NULL,
	Reviews varchar(100),
	FeedbackDate datetime NOT NULL);

CREATE TABLE DeliveryStaff(
	DeliveryStaffID int identity(1,1) PRIMARY KEY,
	FirstName varchar(30) NOT NULL,
	LastName varchar(30) NOT NULL,
	ContactNumber varchar(20) NOT NULL);

CREATE TABLE Delivery(
	DeliveryID int Identity(3000,1) PRIMARY KEY,
	DeliveryStaffID int  NOT NULL
		REFERENCES dbo.DeliveryStaff(DeliveryStaffID),
	Address varchar(40) NOT NULL,
	Instructions varchar(100),
	Status varchar(50) NOT NULL,
	EstimatedTimeOfDelivery time NOT NULL);

CREATE TABLE OrderHeader(
	OrderID int identity(1100,1) PRIMARY KEY,
	CustomerID int NOT NULL
		REFERENCES dbo.Customer(CustomerID),
	RestaurantID int NOT NULL
		REFERENCES dbo.Restaurant(RestaurantID),
	DeliveryID int NOT NULL
		REFERENCES dbo.Delivery(DeliveryID),
	OrderDate datetime NOT NULL,
	Status varchar(50) NOT NULL);

CREATE TABLE OrderDetail(
	OrderDetailID int identity(2200,1) NOT NULL,
	OrderID int NOT NULL
		REFERENCES dbo.OrderHeader(OrderID),
		CONSTRAINT PKOrderDetail PRIMARY KEY CLUSTERED
			(OrderDetailID,OrderID),
	FoodItemID int NOT NULL
		REFERENCES dbo.FoodItems(FoodItemID),
	Quantity int NOT NULL,
	Instructions varchar(100));

CREATE TABLE PromoCode(
	PromoCode varchar(10) PRIMARY KEY,
	StartDate datetime NOT NULL,
	EndDate datetime NOT NULL,
	DiscountPercentage decimal(4,2) NOT NULL);

CREATE TABLE Bills(
	BillID int identity(2100,1) PRIMARY KEY,
	OrderID int NOT NULL
		REFERENCES dbo.OrderHeader(OrderID),
	PromoCode varchar(10)
		REFERENCES dbo.PromoCode(PromoCode),
	Tip decimal(4,2) NOT NULL,
	DeliveryCharges decimal(4,2) NOT NULL);

CREATE TABLE Payment(
	PaymentID int identity(3100,1) PRIMARY KEY,
	BillID int NOT NULL
		REFERENCES dbo.Bills(BillID),
	CustomerID int NOT NULL
		REFERENCES dbo.Customer(CustomerID),
	CardID int 
		REFERENCES dbo.Card(CardID),
	PaymentType varchar(20) NOT NULL,
	PaymentDate datetime NOT NULL,
	Status varchar(50) NOT NULL);


USE Project_Group2_FoodOrderingDatabase
DROP TABLE Payment
DROP TABLE Bills
DROP TABLE PromoCode
DROP TABLE OrderDetail
DROP TABLE OrderHeader
DROP TABLE Delivery
DROP TABLE DeliveryStaff
DROP TABLE RatingsAndReviews
DROP TABLE FoodItems
DROP TABLE Restaurant
DROP TABLE Login
DROP TABLE Card
DROP TABLE Customer