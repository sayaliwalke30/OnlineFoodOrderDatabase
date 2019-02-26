
USE Project_Group2_FoodOrderingDatabase;

/********* Data is imported for Customer Table FROM CSV File *********/
SELECt * FROM Customer;


/*** Column data encryption ***/
GO       
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Project_Password$';

-- Create certificate to protect symmetric key
CREATE CERTIFICATE TestCertificate
WITH SUBJECT = 'Project Certificate',
EXPIRY_DATE = '2026-10-31';

-- Create symmetric key to encrypt data
CREATE SYMMETRIC KEY TestSymmetricKey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE TestCertificate;

-- Open symmetric key
OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;

INSERT INTO Login
VALUES('Vineet123',1000,EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Vinnet123$')),'vineet123@gmail.com'),
		('Sailee123',1001,EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Sailee123$'),'sailee123@gmail.com'),
		('Charu123',1002,EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Charu123$'),'charu123@gmail.com'),
		('Mihir123',1003,EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Mihir123$'),'mihir123@gmail.com'),
		('Arya123',1004,EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Arya123$'),'arya123@gmail.com'),
		('Divya123',1005,EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Divya123$'),'divya123@gmail.com'),
		('Ankur123',1006,EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Ankur123$'),'ankur123@gmail.com'),
		('Sachin123',1007,EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Sachin123$'),'sachin123@gmail.com'),
		('Shwetha123',1008,EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Shwetha123$'),'shwetha123@gmail.com'),
		('Priya123',1009,EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Priya123$'),'priya123@gmail.com');

SELECT * FROM Login

INSERT INTO Card
Values(1000,EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '1234143526751786')),'VineetBagga','2019-01-01','98052','Credit'),
	  (1001,EncryptByKey(Key_GUID(N'TestSymmetricKey'), '1276926438916271'),'Sailee Walke','2019-09-01','98109','Credit'),
	  (1002,EncryptByKey(Key_GUID(N'TestSymmetricKey'), '1276926284716271'),'Charusmitha Deshpande','2020-09-01','98109','Credit'),
	  (1003,EncryptByKey(Key_GUID(N'TestSymmetricKey'), '1276857429646271'),'Mihir Salunke','2019-11-01','98109','Credit'),
	  (1004,EncryptByKey(Key_GUID(N'TestSymmetricKey'), '4987222229646271'),'Arya Soman','2021-11-01','98109','Credit'),
	  (1005,EncryptByKey(Key_GUID(N'TestSymmetricKey'), '1276857466666666'),'Divya Sharma','2020-11-01','98109','Credit'),
	  (1006,EncryptByKey(Key_GUID(N'TestSymmetricKey'), '1276345687233333'),'Ankur Gupta','2019-12-01','98109','Credit'),
	  (1007,EncryptByKey(Key_GUID(N'TestSymmetricKey'), '1276857466667676'),'Sachin S','2022-11-01','98109','Credit'),
	  (1008,EncryptByKey(Key_GUID(N'TestSymmetricKey'), '1276857466663535'),'Shwetha K','2021-09-01','98109','Credit'),
	  (1009,EncryptByKey(Key_GUID(N'TestSymmetricKey'), '1276343456566666'),'Priya Gupta','2020-08-01','98052','Credit');

SELECT * FROM Card

INSERT INTO dbo.Restaurant 
VALUES	('Chat House'				,'148 Ave NE'			,'Bellevue'	,'Washington','98007','(206)7643214','9AM-9PM'  ,'Mon-Fri'),
		('Cactus'					,'350 Terry Ave NE'		,'Seattle'	,'Washington','98105','(206)7643344','9AM-11PM' ,'Mon-Sun'),
		('Serious Pie and Biscuits'	,'401 Westlake Ave N'	,'Seattle'	,'Washington','98109','(206)8323214','9AM-11PM' ,'Mon-Sun'),
		('The pink door'			,'1919 Post Alley'		,'Seattle'	,'Washington','98109','(206)8123214','11AM-12AM','Mon-Sun'),
		('Mediterranean Kitchen'	,'103 Bellevue way'		,'Bellevue'	,'Washington','98007','(314)7643214','9AM-12AM' ,'Mon-Sun'),
		('Taste Of India'			,'121 University Way'	,'Seattle'	,'Washington','98005','(206)7643567','9AM-11PM' ,'Mon-Sun'),
		('Din Tai Fung'				,'700 Bellevue way'		,'Bellevue'	,'Washington','98007','(114)7643214','9AM-11PM' ,'Mon-Sun'),
		('Zig Zag Cafe'				,'1501 Western Ave'		,'Bellevue'	,'Washington','98007','(206)754214' ,'9AM-9PM'  ,'Mon-Sun'),
		('Lola'						,'2000 4th Ave Belltown','Seattle'	,'Washington','98102','(206)7323214','9AM-9PM'  ,'Mon-Sun'),
		('New'						,'1519 Capital Hill'	,'Seattle'	,'Washington','98109','(206)2453214','9AM-9PM'  ,'Mon-Sun'),
		('Art Of the Table'			,'3801 Stone Way'		,'Seattle'	,'Washington','98109','(206)9873214','9AM-9PM'  ,'Mon-Sun');



INSERT dbo.FoodItems
VALUES( 5000, 'BRUSCHETTA CON CAPONATA'			, 'Dinner' 	 , 11.00, 100.00 , 'eggplant, tomatoes, celery'),
	  ( 5000, 'GRILLED OCTOPUS'					, 'Dinner'	 , 17.00, 150.00 , 'capers, frisee & olives'),
	  ( 5000, 'PIZZA BIANCA'					, 'Lunch'	 , 16.00, 200.00 , 'individual sized pizza'),
	  ( 5000, 'GRILLED ITALIAN SAUSAGE'			, 'Dinner'	 , 15.00, 140.00 , 'w/fried peppers and onions'),
	  ( 5000, 'BUTTERSCOTCH BUDINO'				, 'Dessert'	 , 9.00, 130.00	 , 'tuile cookie'),
	  ( 5000, 'PUMPKIN TART'					, 'Dessert'	 , 9.00, 200.00  , 'toasted meringue'),
	  ( 5001, 'The LUXE Burger'					, 'Burgers'	 , 5.00, 120.00  , 'grilled burger,white truffle cheese'),
	  ( 5001, 'Lucky Star Burger'				, 'Burgers'	 , 8.00, 140.00  , 'grilled burger,smoked gouda cheese'),
	  ( 5001, 'Pumpkin Spice Cake'				, 'Dessert'	 , 5.00, 100.00  , 'All time favourite cake'),
	  ( 5001, 'Chocolate Chip Cookie'			, 'Dessert'	 , 3.00, 90.00   , 'cane juice, dark chocolate chips'),
	  ( 5005, 'Butter Masala Dosa'				, 'Breakfast', 11.00, 200.00 , 'Rice pancake with potato filling'),
	  ( 5005, 'Potato Parantha'					, 'Breakfast', 8.00, 250.00  , 'whole wheat stuffed bread'),
	  ( 5005, 'Paneer Tikka Masala'				, 'Lunch'	 , 16.00, 400.00 , 'Indian cheese in creamy tomato sauce'),
	  ( 5005, 'Kadhai Chicken'					, 'Dinner'	 , 20.00, 500.00 , 'chicken, peppers with spicy sauce'),
	  ( 5005, 'Gulab Jamun'						, 'Dessert'	 , 7.00, 150.00  , 'Spongy milky balls with rose scented syrup'),  
	  ( 5004, 'Falafel Sandwich'				, 'Lunch'	 , 8.49, 200.00  , 'Falafel, hummus, romaine, tomatoes, parsley, pickles and	tahini. Vegetarian.'),
	  ( 5004, 'Chicken Kebab Plate'				, 'Lunch'	 , 14.59, 350.00 , 'Sliced rotisserie chicken, grilled onions,tomatoes, tahini and hummus'),
	  ( 5004, 'Gralic Fries'					, 'Sides'	 , 5.00, 300.00  , 'Seasoned fries, garlic sauce, feta cheese and oregano'),
	  ( 5004, 'Beef and Lamb Shawarma Sandwich'	, 'Lunch'	 , 11.00, 400.00 , 'Sliced rotisserie beef and lamb mix, hummus, romaine, tomatoes, onions, parsley and tahini'),
	  ( 5004, 'Baklawa'							, 'Dessert'	 , 3.00, 100.00  , 'Layered buttered fillo dough stuffed and topped with pistachio');

INSERT dbo.FoodItems
VALUES(5006,'Chicken Momos Steamed','Dinner','12','250','Steamed dough with minched chicken'),
	  (5006,'Pork soup Dumpling','Dinner','15','350','Steamed dumpling with soup'),
	  (5006,'Soy Noodle Salad','Dinner','9','150','noodles veggies with soy dressing'),
      (5006,'Shrimp fried rice','Dinner','15','435','Stir fried rice with egg,shrimp and vegetables'),
      (5007,'Deviled Eggs','Breakfast','5','250','Chives and Aleppo pepper'),
      (5007,'Fried Corn on Cob','Dinner','8','265','Aleppo pepper, shallots, cilantro, butter and lemon'),
      (5007,'Watermelon Salad','Dinner','11','200','Walla Walla onions, basil, Feta chees'),
      (5007,'Chicken and Wild Mushroom Maftool','Dinner','24','750','Pan seared leg, wild mushrooms, spinach, fresh cherry walnut relish');


INSERT into dbo.DeliveryStaff
VALUES	('John'	  ,'Doe'	,'(206)7463524'),
		('Lee'	  ,'Willams','(312)9876543'),
		('David'  ,'Taylor'	,'(206)987433'),
		('Salim'  ,'Khan'	,'(206)3284597'),
		('Shawn'  ,'Parker'	,'(312)9876543'),
		('Sam'	  ,'Kate'	,'(206)9432543'),
		('Zen'	  ,'Green'	,'(312)9464343'),
		('Daneil' ,'Brayon'	,'(312)9464343'),
		('Sandeep','Mishra'	,'(312)9464343'),
		('Ting'	  ,'Tong'	,'(312)9464343');

INSERT into dbo.Delivery
VALUES(7, '567 John Street,Seattle'			, 'Please give a call on arrival' , 'Delivered'	   , '02:00:00'),
	  (9, '534 Elliot Ave,Seattle'				, 'Please do not knock on arrival', 'Delivered'	   , '10:00:00'),
	  (10, '567 John Street,Seattle'			, 'Please give a call on arrival' , 'Delivered'	   , '08:00:00'),
	  (8, '83rd NE Elliot Ave,Seattle'			, NULL							  , 'Delivery Fail', '09:00:00'),
	  (6, '567 John Street,Bellevue'			, NULL						      , 'Delivered'	   , '10:00:00'),
	  (1 , '112 Fairview Ave, Apt 605,Seattle'	, NULL						      , 'Delivered'	   , '05:00:00'),
	  (2 , '1106 11th Ave NE, Apt 402,Seattle'	, 'Please give a call on arrival' , 'Delivered'	   , '10:00:00'),
	  (3 , '431 Desxter Street, Apt 301,Seattle', NULL							  , 'Delivered'	   , '10:00:00'),
	  (4 , '2122 Howe Street,Apt 701,Seattle'	, 'Leave Parcel at reception'	  , 'Delivery fail', '10:00:00'),
	  (5 , '892 Nelson Street,Bellevue'			, 'Call on arrival'				  , 'Delivered'	   , '10:00:00');

INSERT into dbo.Delivery
VALUES(10, '83rd NE Elliot Ave,Seattle'			, NULL							  , 'Delivery Fail', '09:00:00'),
	  (9, '567 John Street,Bellevue'			, NULL						      , 'Delivered'	   , '10:00:00'),
	  (1 , '112 Fairview Ave, Apt 605,Seattle'	, NULL						      , 'Delivered'	   , '05:00:00'),
	  (2 , '1106 11th Ave NE, Apt 402,Seattle'	, 'Please give a call on arrival' , 'Delivered'	   , '10:00:00'),
	  (3 , '431 Desxter Street, Apt 301,Seattle', NULL							  , 'Delivered'	   , '10:00:00'),
	  (4 , '2122 Howe Street,Apt 701,Seattle'	, 'Leave Parcel at reception'	  , 'Delivery fail', '10:00:00'),
	  (5 , '892 Nelson Street,Bellevue'			, 'Call on arrival'				  , 'Delivered'	   , '10:00:00');


INSERT INTO OrderHeader 
VALUES	(1000,5009,3008,'2018-06-12 01:45:20','Success'), (1001,5001,3009,'2018-06-16 01:10:20','Success'),
		(1002,5003,3010,'2018-06-12 07:45:20','Success'), (1003,5008,3011,'2018-06-18 08:45:20','Success'),
		(1005,5001,3012,'2018-06-25 09:30:20','Success'), (1004,5006,3013,'2018-06-16 02:45:20','Success'),
		(1007,5010,3014,'2018-06-11 01:47:20','Success'), (1008,5004,3015,'2018-07-30 09:50:32','Success'),
		(1009,5007,3016,'2018-08-30 10:10:10','Success'), (1006,5007,3017,'2018-09-25 12:20:10','Success'),
		(1002,5009,3009,getdate(),'Success'), (1004,5004,3007,getdate(),'Success'),
		(1003,5005,3005,getdate(),'Success'), (1002,5007,3005,getdate(),'Success'),
		(1008,5010,3003,getdate(),'Success'), (1004,5002,3004,getdate(),'Success'),
		(1006,5008,3005,getdate(),'Success'), (1003,5002,3006,getdate(),'Success'),
        (1002,5009,3007,getdate(),'Success'), (1005,5002,3006,getdate(),'Success'),
        (1010,5002,3006,getdate(),'Success'), (1011,5006,3006,getdate(),'Success'),
        (1012,5002,3006,getdate(),'Success'), (1013,5009,3006,getdate(),'Success');

INSERT INTO OrderHeader
VALUES	(1000,5000,3003,getdate(),'Success'), (1013,5003,3006,getdate(),'Success'),
		(1001,5001,3004,getdate(),'Success'), (1014,5004,3007,getdate(),'Success'),
		(1002,5002,3005,getdate(),'Success'), (1015,5005,3008,getdate(),'Success'),
		(1003,5003,3006,getdate(),'Success'), (1016,5006,3009,getdate(),'Success'),
		(1004,5004,3007,getdate(),'Success'), (1017,5007,3010,getdate(),'Success'),
		(1005,5005,3008,getdate(),'Success'), (1018,5008,3011,getdate(),'Success'),
		(1006,5006,3009,getdate(),'Success'), (1019,5009,3012,getdate(),'Success'),
		(1007,5007,3010,getdate(),'Success'), (1020,5010,3003,getdate(),'Success'),
		(1008,5008,3011,getdate(),'Success'), (1021,5000,3004,getdate(),'Success'),
		(1010,5009,3012,getdate(),'Success'), (1022,5001,3005,getdate(),'Success'),
		(1009,5010,3003,getdate(),'Success'), (1023,5002,3006,getdate(),'Success'),
		(1011,5001,3004,getdate(),'Success'), (1024,5003,3007,getdate(),'Success'),
		(1012,5002,3005,getdate(),'Success'), (1025,5004,3008,getdate(),'Success');


INSERT INTO dbo.OrderDetail 
VALUES (1112,	2,	1,	'Medium Spicy'),
       (1112,	1,	2,	'Medium Spicy, extra cheese'),
       (1112,	4,	1,	'Medium Spicy'),
       (1113,	3,	2,	'extra cheese'),
       (1113,	6,	1,	NULL),
       (1114,	2,	1,	'Medium Spicy'),
       (1114,	19,	1,	'Medium Spicy'),
       (1115,	20,	2,	NULL),
       (1115,	2,	1,	'Low Spicy'),
       (1106,	7,	2,	'Medium Spicy, extra cheese'),
       (1106,	8,	4,	'extra american cheese and grilled'),
	   (1107,	7,	2,	'Medium Spicy, extra cheese'),
       (1109,	8,	4,	'extra american cheese and grilled'),
	   (1108,	7,	2,	'Medium Spicy, extra cheese'),
       (1108,	8,	4,	'extra american cheese and grilled'),
	   (1110,	2,	1,	'Medium Spicy'),
       (1111,	1,	2,	'Medium Spicy, extra cheese'),
       (1127,	4,	1,	'Medium Spicy'),
       (1128,	3,	2,	'extra cheese'),
       (1129,	18,	1,	NULL),
       (1130,	2,	1,	'Medium Spicy'),
       (1131,	19,	1,	'Medium Spicy'),
       (1132,	20,	2,	NULL),
       (1133,	2,	1,	'Low Spicy'),
       (1134,	7,	2,	'Medium Spicy, extra cheese'),
       (1135,	20,	4,	'No  onion'),
	   (1136,	7,	2,	'Medium Spicy, extra cheese'),
       (1137,	8,	4,	'No garlic and onion'),
	   (1138,	7,	2,	'Medium Spicy, extra cheese'),
       (1139,	8,	4,	'extra american cheese and grilled'),
	   (1140,	5,	2,	'Feta cheese'),
	   (1141,	7,	2,	'Medium Spicy, extra cheese'),
	   (1113,	7,	2,	'Medium Spicy, extra cheese'),
	   (1113,	4,	2,	'Feta cheese'),
	   (1108,	7,	2,	'Medium Spicy, extra cheese'),
	   (1108,	7,	2,	'Medium Spicy, extra cheese'),
	   (1110,	17,	2,	'Feta cheese'),
	   (1115,	7,	2,	'Medium Spicy, extra cheese');
	   
INSERT INTO dbo.OrderDetail 
 VALUES(1141,	16,	2,	'Medium Spicy, extra onions'),
	   (1141,	17,	2,	'Medium Spicy, extra cheese'),
	   (1142,	17,	4,	'Medium Spicy, extra cheese'),
	   (1143,	16,	2,	'Low Spicy'),
	   (1144,	16,	2,	'Medium Spicy, extra cheese'),
	   (1144,	18, 2,	'Medium Spicy, extra cheese'),
       (1145,	11,	2,	'Medium Spicy'),
       (1145,	12,	2,	'Medium Spicy'),
       (1146,	3,	2,	'Medium Spicy, extra cheese'),
	   (1147,	4,	2,	'Medium Spicy, extra cheese'),
	   (1148,	16,	2,	'Medium Spicy, extra cheese'),
	   (1149,	17,	3,	'High Spicy, extra cheese'),
	   (1150,	20,	2,	'Medium Spicy, extra cheese'),
	   (1150,	19,	2,	'Medium Spicy, extra cheese'),
	   (1151,	7,	2,	'Medium Spicy, extra american cheese'),
	   (1152,	8,	4,	'Medium Spicy, extra cheese'),
	   (1153,	26,	4,	'Medium Spicy'),
	   (1153,	27,	2,	'Medium Spicy'),
	   (1153,	25,	2,	'Medium Spicy'),
	   (1154,	28,	2,	'Medium Spicy, extra cheese'),
	   (1155,	22,	4,	'Medium Spicy'),
	   (1156,	22,	4,	'Medium Spicy'),
	   (1156,	24,	2,	'Medium Spicy'),
	   (1157,	23,	1,	'Medium Spicy'),
	   (1158,	28,	1,	'Medium Spicy, extra cheese'),
	   (1159,	24,	2,	'Medium Spicy'),
	   (1159,	26,	1,	'Medium Spicy');

INSERT INTO dbo.OrderDetail 
VALUES (1160,	22,	4,	'Medium Spicy'),
	   (1160,	24,	2,	'Medium Spicy'),
	   (1160,	23,	4,	'Medium Spicy'),
	   (1160,	26,	2,	'Medium Spicy'),
	   (1161,	23,	4,	'Medium Spicy'),
	   (1162,	26,	2,	'Medium Spicy'),
	   (1163,	23,	4,	'Medium Spicy'),
	   (1164,	26,	2,	'Medium Spicy'),
	   (1165,	26,	2,	'Medium Spicy'),
	   (1166,	23,	4,	'Medium Spicy'),
	   (1167,	26,	2,	'Medium Spicy');



INSERT INTO PromoCode
VALUES	('THANKS15', '2018-06-11 09:00:00', '2018-06-15 12:00:00', 15.00),
		('WELCOME5', '2018-06-11 09:00:00', '2018-06-12 11:00:00', 5.00),
		('HOLIDAY20', '2018-12-20 09:00:00', '2018-12-30 00:00:00', 20.00),
		('EXTRA5', '2018-08-30 09:00:00', '2018-09-30 11:00:00', 5.00),
		('HAPPY10', '2018-05-11 09:00:00', '2018-06-11 11:00:00', 10.00),
		('NEWYEAR25', '2018-12-25 09:00:00', '2019-01-05 11:00:00', 25.00),
		('FUN20', '2018-07-11 09:00:00', '2018-07-12 11:00:00', 20.00),
		('MOTHER20', '2018-05-01 09:00:00', '2018-05-10 11:00:00', 20.00),
		('FRIDAY15', '2018-04-06 09:00:00', '2018-04-13 11:00:00', 15.00),
		('EXTRA10', '2018-09-11 09:00:00', '2018-09-12 11:00:00', 10.00);

SELECT * FROM PromoCode

INSERT INTO Bills
VALUES	(1112, 'THANKS15', 5.00, 2.00),
		(1113, NULL		 , 4.00, 0.00),
		(1114, 'THANKS15', 0.00, 0.00),
		(1115, NULL		 , 0.00, 0.00),
		(1106, NULL		 , 4.00, 5.00),
		(1107, NULL		 , 2.00, 0.00),
		(1108, NULL		 , 2.00, 6.00),
		(1109, NULL		 , 2.00, 0.00),
		(1110, NULL		 , 2.00, 4.00),
		(1127, NULL		 , 2.00, 0.00),
		(1128, NULL		 , 2.00, 0.00),
		(1129, NULL		 , 0.00, 0.00),
		(1130, NULL		 , 2.00, 0.00),
		(1131, NULL		 , 2.00, 4.00),
		(1132, NULL		 , 2.00, 0.00),
		(1133, NULL		 , 2.00, 0.00),
		(1134, NULL		 , 0.00, 0.00),
		(1135, NULL		 , 2.00, 0.00),
		(1136, NULL		 , 2.00, 0.00),
		(1137, NULL		 , 2.00, 0.00),
		(1138, NULL		 , 0.00, 0.00),
		(1139, NULL		 , 2.00, 0.00),
		(1140, NULL		 , 2.00, 4.00),
		(1141, NULL		 , 2.00, 0.00),
		(1142, NULL		 , 2.00, 0.00),
		(1143, NULL		 , 0.00, 0.00),
		(1144, NULL		 , 2.00, 0.00),
		(1145, NULL		 , 2.00, 4.00),
		(1146, NULL		 , 2.00, 0.00),
		(1147, NULL		 , 2.00, 0.00),
		(1148, NULL		 , 0.00, 0.00),
		(1149, NULL		 , 2.00, 0.00),
		(1150, NULL		 , 0.00, 0.00),
		(1151, NULL		 , 2.00, 0.00),
		(1152, NULL		 , 2.00, 4.00),
		(1153, NULL		 , 2.00, 0.00),
		(1154, NULL		 , 2.00, 0.00),
		(1155, NULL		 , 0.00, 0.00),
		(1156, NULL		 , 2.00, 0.00),
		(1157, NULL		 , 2.00, 4.00),
		(1158, NULL		 , 2.00, 0.00),
		(1159, NULL		 , 2.00, 0.00),
		(1160, NULL		 , 0.00, 0.00),
		(1161, NULL		 , 2.00, 0.00),
		(1162, NULL		 , 2.00, 0.00),
		(1163, NULL		 , 2.00, 0.00),
		(1164, NULL		 , 0.00, 0.00),
		(1165, NULL		 , 2.00, 0.00),
		(1166, NULL		 , 0.00, 0.00),
		(1167, NULL		 , 2.00, 0.00);

SELECT * FROM Bills

INSERT INTO dbo.RatingsAndReviews
VALUES	('1024', '5001'	,  NULL	 , '4', 'Good'	 , '2018-09-02 13:27:49'),
		('1135', '5004'	,  NULL	 , '4', 'Good'	 , '2018-09-07 10:35:52'),
		('1227',  NULL	, '7'	 , '5', 'Awesome', '2018-09-23 19:37:27'),
		('1056',  NULL	, '18'	 , '3', 'Average', '2018-09-27 17:25:39'),
		('1249', '5008'	,  NULL	 , '4', 'Good'	 , '2018-10-13 11:37:48'),
		('1189',  NULL	, '9'	 , '4', 'Good'	 , '2018-10-15 14:49:15'),
		('1062', '5005'	,  NULL	 , '5', 'Awesome', '2018-10-24 22:57:38'),
		('1057',  NULL	, '14'	 , '5', 'Awesome', '2018-10-29 20:14:09'),
		('1239',  NULL	, '3'	 , '5', 'Awesome', '2018-11-07 16:51:43'),
		('1102', '5002'	,  NULL	 , '4', 'Good'	 , '2018-11-14 18:22:47');

INSERT INTO dbo.RatingsAndReviews		
VALUES	('1002', '5001'	,  NULL	 , '4', 'Good'	 , getdate()),
		('1007', '5002'	,  NULL	 , '4', 'Good'	 , getdate()),
		('1014', '5003'	,  NULL	 , '5', 'Awesome', getdate()),
		('1020', '5004'	,  NULL	 , '5', 'Awesome', getdate()),
		('1022', '5005'	,  NULL	 , '3', 'Average', getdate()),
		('1153', '5006'	,  NULL	 , '4', 'Good'	 , getdate()),
		('1123', '5007'	,  NULL	 , '3', 'Average', getdate()),
		('1057', '5008'	,  NULL	 , '4', 'Good'	 , getdate()),
		('1072', '5009'	,  NULL	 , '5', 'Awesome', getdate()),
		('1012', '5010'	,  NULL	 , '4', 'Good'	 , getdate()),
		('1015', '5001'	,  NULL	 , '5', 'Awesome', getdate()),
		('1005', '5005'	,  NULL	 , '3', 'Average', getdate()),
		('1038', '5001'	,  NULL	 , '4', 'Good'	 , getdate()),
		('1063', '5005'	,  NULL	 , '5', 'Awesome', getdate()),
		('1018',  NULL	,  '24'	 , '4', 'Good'	 , getdate()),
		('1113',  NULL	,  '25'	 , '5', 'Awesome', getdate()),
		('1064',  NULL	,  '29'	 , '4', 'Good'	 , getdate()),
		('1021',  NULL	,  '7'	 , '3', 'Average', getdate()),
		('1031',  NULL	,  '17'	 , '5', 'Awesome', getdate()),
		('1048',  NULL	,  '14'	 , '4', 'Good'	 , getdate()),
		('1070',  NULL	,  '19'	 , '5', 'Awesome', getdate()),
		('1011',  NULL	,  '17'	 , '5', 'Awesome', getdate()),
		('1004',  NULL	,  '19'	 , '4', 'Good'	 , getdate()),
		('1001',  NULL	,  '32'	 , '3', 'Average', getdate()),
		('1108',  NULL	,  '36'	 , '3', 'Average', getdate()),
		('1099',  NULL	,  '2'	 , '5', 'Awesome', getdate()),
		('1082',  NULL	,  '9'	 , '4', 'Good'	 , getdate()),
		('1083',  NULL	,  '3'	 , '3', 'Average', getdate()),
		('1071', '5004'	,  NULL	 , '5', 'Awesome', getdate()),
		('1081', '5005'	,  NULL	 , '4', 'Good'	 , getdate()),
		('1019', '5001'	,  NULL	 , '5', 'Awesome', getdate()),
		('1058', '5005'	,  NULL	 , '5', 'Awesome', getdate()),
		('1059', '5004'	,  NULL	 , '3', 'Average', getdate()),
		('1051', '5001'	,  NULL	 , '4', 'Good'	 , getdate()),
		('1129',  NULL	,  '4'	 , '5', 'Awesome', getdate()),
		('1101',  NULL	,  '14'	 , '5', 'Awesome', getdate()),
		('1039',  NULL	,  '17'	 , '4', 'Good'	 , getdate()),
		('1097',  NULL	,  '18'	 , '3', 'Average', getdate()),
		('1063',  NULL	,  '19'	 , '4', 'Good'	 , getdate()),
		('1129',   NULL	,  '14'	 , '4', 'Good'	 , getdate()),
		('1052', '5001'	,  NULL	 , '1', 'Very Bad', getdate()),
		('1126',  NULL	,  '4'	 , '3', 'Average' , getdate()),
		('1043',  NULL	,  '19'	 , '2', 'Bad'	  , getdate()),
		('1065',  NULL	,  '18'	 , '2', 'Bad'	  , getdate()),
		('1064',  NULL	,  '14'	 , '2', 'Bad'	  , getdate()),
		('1015',  NULL	,  '32'	 , '1', 'Very Bad', getdate()),
		('1136',  NULL	,  '36'	 , '1', 'Very Bad', getdate()),
		('1066',  NULL	,  '7'	 , '1', 'Very Bad', getdate()),
		('1021',  NULL	,  '14'	 , '3', 'Average' , getdate()),
		('1093',  NULL	,  '7'	 , '1', 'Very Bad', getdate()),
		('1099',  NULL	,  '19'	 , '2', 'Bad'	  , getdate()),
		('1018',  NULL	,  '18'	 , '1', 'Very Bad', getdate()),
		('1015', '5002'	,  NULL	 , '2', 'Bad'	  , getdate()),
		('1043', '5005'	,  NULL	 , '2', 'Bad'	  , getdate()),
		('1065', '5006'	,  NULL	 , '2', 'Bad'	  , getdate()),
		('1064', '5006'	,  NULL	 , '1', 'Very Bad', getdate()),
		('1036', '5007'	,  NULL	 , '1', 'Very Bad', getdate()),
		('1066', '5009'	,  NULL	 , '1', 'Very Bad', getdate()),
		('1021', '5006'	,  NULL	 , '2', 'Bad'	  , getdate()),
		('1093', '5007'	,  NULL	 , '1', 'Very Bad', getdate()),
		('1025', '5006'	,  NULL	 , '2', 'Bad'	  , getdate()),
		('1027', '5009'	,  NULL	 , '1', 'Very Bad', getdate());

SELECT * FROM RatingsAndReviews;

INSERT INTO dbo.Payment
VALUES 	('2100', '1112', NULL, 'Cash', '2018-06-11 01:52:20', 'Payment Successful'),
		('2101', '1113', '108', 'Card', '2018-07-30 09:55:32', 'Payment Successful'),
		('2102', '1114', '109', 'Card', '2018-08-30 10:15:10', 'Payment Successful'),
		('2103', '1115', NULL, 'Cash', '2018-09-25 12:25:10', 'Payment Successful'),
		('2104', '1106', '106', 'Card', '2018-09-25 12:25:10', 'Payment Successful'),
		('2105', '1107', '100', 'Card', '2018-06-12 01:50:20', 'Payment Successful'),
		('2106', '1108', '101', 'Card', '2018-06-16 01:15:20', 'Payment Successful'),
		('2107', '1109', '102', 'Card', '2018-06-12 07:50:20', 'Payment Failed'),
		('2108', '1110', NULL, 'Cash', '2018-06-12 07:50:20', 'Payment Successful'),
		('2109', '1127', NULL, 'Cash', '2018-06-18 08:50:20', 'Payment Successful'),
		('2110', '1128', NULL, 'Cash', '2018-06-25 09:30:20', 'Payment Successful'),
		('2111', '1129', NULL, 'Cash', '2018-06-16 02:45:20', 'Payment Successful'),
		('2112', '1130', NULL, 'Cash', '2018-06-11 01:52:20', 'Payment Successful'),
		('2113', '1131', NULL, 'Cash', '2018-07-30 09:55:32', 'Payment Successful'),
		('2114', '1132', NULL, 'Cash', '2018-08-30 10:15:10', 'Payment Successful'),
		('2115', '1133', NULL, 'Cash', '2018-09-25 12:25:10', 'Payment Successful'),
		('2116', '1134', NULL, 'Cash', '2018-09-25 12:25:10', 'Payment Successful'),
		('2117', '1135', NULL, 'Cash', '2018-06-12 01:50:20', 'Payment Successful'),
		('2118', '1136', NULL, 'Cash', '2018-06-16 01:15:20', 'Payment Successful'),
		('2119', '1137', NULL, 'Cash', '2018-06-12 07:50:20', 'Payment Successful'),
		('2120', '1138', NULL, 'Cash', '2018-06-12 07:50:20', 'Payment Successful'),
		('2121', '1139', NULL, 'Cash', '2018-06-18 08:50:20', 'Payment Successful'),
		('2122', '1140', NULL, 'Cash', '2018-06-25 09:30:20', 'Payment Successful'),
		('2123', '1141', NULL, 'Cash', '2018-06-16 02:45:20', 'Payment Successful'),
		('2124', '1142', NULL, 'Cash', '2018-06-11 01:52:20', 'Payment Successful'),
		('2125', '1143', NULL, 'Cash', '2018-07-30 09:55:32', 'Payment Successful'),
		('2126', '1144', NULL, 'Cash', '2018-08-30 10:15:10', 'Payment Successful'),
		('2127', '1145', NULL, 'Cash', '2018-09-25 12:25:10', 'Payment Successful'),
		('2128', '1146', NULL, 'Cash', '2018-09-25 12:25:10', 'Payment Successful'),
		('2129', '1147', NULL, 'Cash', '2018-06-12 01:50:20', 'Payment Successful'),
		('2130', '1148', NULL, 'Cash', '2018-06-16 01:15:20', 'Payment Successful'),
		('2131', '1149', NULL, 'Cash', '2018-06-12 07:50:20', 'Payment Successful'),
		('2132', '1150', NULL, 'Cash', '2018-06-12 07:50:20', 'Payment Successful'),
		('2133', '1151', NULL, 'Cash', '2018-06-18 08:50:20', 'Payment Successful'),
		('2134', '1152', NULL, 'Cash', '2018-06-25 09:30:20', 'Payment Successful'),
		('2135', '1153', NULL, 'Cash', '2018-06-16 02:45:20', 'Payment Successful'),
		('2136', '1154', NULL, 'Cash', '2018-06-11 01:52:20', 'Payment Successful'),
		('2137', '1155', NULL, 'Cash', '2018-07-30 09:55:32', 'Payment Successful'),
		('2138', '1156', NULL, 'Cash', '2018-08-30 10:15:10', 'Payment Successful'),
		('2139', '1157', NULL, 'Cash', '2018-09-25 12:25:10', 'Payment Successful'),
		('2140', '1158', NULL, 'Cash', '2018-09-25 12:25:10', 'Payment Successful'),
		('2141', '1159', NULL, 'Cash', '2018-06-12 01:50:20', 'Payment Successful'),
		('2142', '1160', NULL, 'Cash', '2018-06-16 01:15:20', 'Payment Successful'),
		('2143', '1161', NULL, 'Cash', '2018-06-12 07:50:20', 'Payment Successful'),
		('2144', '1162', NULL, 'Cash', '2018-06-12 07:50:20', 'Payment Successful'),
		('2145', '1163', NULL, 'Cash', '2018-06-18 08:50:20', 'Payment Successful'),
		('2146', '1164', NULL, 'Cash', '2018-06-25 09:30:20', 'Payment Successful'),
		('2147', '1165', NULL, 'Cash', '2018-06-16 02:45:20', 'Payment Successful'),
		('2148', '1166', NULL, 'Cash', '2018-06-18 08:50:20', 'Payment Successful'),
		('2149', '1167', NULL, 'Cash', '2018-06-25 09:30:20', 'Payment Successful');				
	
SELECT * FROM Payment
