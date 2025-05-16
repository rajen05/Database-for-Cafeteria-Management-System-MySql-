create database THEAPUCAFE;
use THEAPUCAFE;


create TABLE Member (
	MemberID nvarchar(10) Not Null Primary Key,
	Password nvarchar(20),
	Name nvarchar(50),
	Gender varchar(6),
	Email nvarchar(50),
	ContactNumber nvarchar(17),
	TotalOrder int,
	Roles varchar(10),
	RegistrationDate DATE,
);

INSERT INTO Member VALUES
('TP074562', 'password123', 'John Doe', 'Male', 'john.doe@student.apu.edu.my', '60123456789', 3, 'Student', '2022-08-15'),
('TP098765', 'securepass', 'Jane Smith', 'Female', 'jane.smith@student.apu.edu.my', '60198765432', 5, 'Student', '2021-11-23'),
('TP123456', 'mypassword', 'Alice Johnson', 'Female', 'alice.johnson@student.apu.edu.my', '60112345678', 2, 'Student', '2023-01-10'),
('TP234567', 'pass456', 'Charlie Brown', 'Male', 'charlie.brown@student.apu.edu.my', '60134567890', 4, 'Student', '2021-06-30'),
('TP345678', 'password789', 'Lucy Van Pelt', 'Female', 'lucy.vanpelt@student.apu.edu.my', '60123487654', 6, 'Student', '2020-09-21'),
('AP000001', 'staffpass1', 'Robert Brown', 'Male', 'robert.brown@staff.apu.edu.my', '60187654321', 10, 'Staff', '2019-07-12'),
('AP000002', 'staffpass2', 'Emily Davis', 'Female', 'emily.davis@staff.apu.edu.my', '60123412345', 7, 'Staff', '2018-05-30'),
('AP000003', 'staffpass3', 'Michael Wilson', 'Male', 'michael.wilson@staff.apu.edu.my', '60134567890', 8, 'Staff', '2020-09-18'),
('AP000004', 'staffpass4', 'Laura White', 'Female', 'laura.white@staff.apu.edu.my', '60123456700', 5, 'Staff', '2017-03-25'),
('AP000005', 'staffpass5', 'Daniel Green', 'Male', 'daniel.green@staff.apu.edu.my', '60156789012', 9, 'Staff', '2016-11-10');

CREATE TABLE Status (
    StatusID nvarchar(5) Not Null PRIMARY KEY,
    PreparationStatus varchar(8),
	DeliveryStatus varchar(8),
);

INSERT INTO Status VALUES 
('ST001', 'Done', 'Done'),
('ST002', 'Done', 'Pending'),
('ST003', 'Pending', 'Pending');


Create Table Manager (
	ManagerId nvarchar(8) Not Null Primary Key,
	ManagerName nvarchar(50),
);
INSERT INTO Manager VALUES ('ACM001', 'Rajendran');


CREATE TABLE Food (
    FoodID nvarchar(8) Not Null PRIMARY KEY,
    FoodName varchar(50),
    FoodDescription nvarchar(150),
    FoodPrice DECIMAL(7, 2),
    AverageRating DECIMAL(7, 2),
);
INSERT INTO Food (FoodID, FoodName, FoodDescription, FoodPrice, AverageRating) VALUES 
('FM001', 'Messi Pizza', 'Classic pizza with tomatoes and mozzarella cheese', 15.99, 4.5),
('FM002', 'Doritosburger', 'Juicy amb burger with cheddar cheese and doritos', 9.49, 4.3),
('FM003', 'Seremban Salad', 'Salad with cucumbers, tomatoes, olives, and Gula Melaka', 7.99, 4.7),
('FM004', 'Pink Pasta', 'Pink pasta in a creamy Alfredo sauce', 12.49, 4.4),
('FM005', 'Sate Goreng Stick', 'Sate Stick with crab,chicen, avocado, and cucumber', 13.99, 4.6),
('FM006', 'Chicken Rice', 'Chicken rice with mushroom soup', 8.99, 4.5),
('FM007', 'Vegetable rice', 'Rice with mixed vegetables and Parmesan cheese', 11.99, 4.8),
('FM008', 'Chicken Tacos', 'Tacos with grilled chicken, lettuce, and salsa', 10.49, 4.4),
('FM009', 'Butter Chicken', 'Chicken cooked in a rich and creamy apple sauce', 14.99, 4.9),
('FM010', 'Sushi', 'Sushi roll with fish, cucumber, and avocado', 16.49, 4.7);


Create TABLE Rating (
	RatingID nvarchar(10) Not Null Primary Key,
	MemberID nvarchar(10) FOREIGN KEY REFERENCES Member(MemberID),
	FoodID nvarchar(8) FOREIGN KEY REFERENCES Food(FoodID),
	Rating int
); 

INSERT INTO Rating (RatingID, MemberID, FoodID, Rating) VALUES 
('RT001', 'TP074562', 'FM001', 5),
('RT002', 'TP098765', 'FM002', 4),
('RT003', 'AP000001', 'FM003', 5),
('RT004', 'TP123456', 'FM004', 3),
('RT005', 'TP123456', 'FM005', 4),
('RT006', 'AP000003', 'FM006', 5),
('RT007', 'TP234567', 'FM007', 4),
('RT008', 'TP098765', 'FM008', 5),
('RT009', 'TP074562', 'FM009', 5),
('RT010', 'TP074562', 'FM010', 4);


Create TABLE ShoppingCart (
    CartID nvarchar(8) Not Null PRIMARY KEY,  
);

INSERT INTO ShoppingCart(CartID) VALUES 
('C001'),
('C002'),
('C003'),
('C004'),
('C005'),
('C006'),
('C007'),
('C008'),
('C009'),
('C010'),
('C011');


Create table CartItems(
	CartID nvarchar(8) FOREIGN KEY REFERENCES ShoppingCart(CartID),
    FoodID nvarchar(8) FOREIGN KEY REFERENCES Food(FoodID),
	Quantity INT,
);

INSERT INTO CartItems (CartID, FoodID, Quantity) VALUES 
('C001', 'FM001', 2),
('C002', 'FM002', 1),
('C003', 'FM003', 3),
('C004', 'FM004', 1),
('C005', 'FM005', 4),
('C006', 'FM006', 2),
('C007', 'FM007', 3),
('C008', 'FM008', 1),
('C009', 'FM009', 5),
('C010', 'FM010', 2),
('C011','FM002',2);


CREATE TABLE Chef (
    ChefID nvarchar(8) Not Null PRIMARY KEY,
    ChefName nvarchar(50),
);


INSERT INTO Chef (ChefID, ChefName) VALUES 
('ACC001', 'Gordon Ramsay'),
('ACC002', 'Sangeerthanaa'),
('ACC003', 'NG XIN MIN');


CREATE TABLE DispatchWorkers (
    DispatchWorkerID nvarchar(8) Not Null PRIMARY KEY,
    DispatchWorkerName varchar(8),
);

INSERT INTO DispatchWorkers (DispatchWorkerID, DispatchWorkerName) VALUES 
('ACW001', 'YEWEN'),
('ACW002', 'Zhen'),
('ACW003', 'George');

Create Table Orders (
	OrderID nvarchar(10) Not Null PRIMARY KEY,
	CartID nvarchar(8) FOREIGN KEY REFERENCES ShoppingCart(CartID),
	OrderTime TIME,
	OrderDate DATE,
	TotalPrice Decimal(20,2),
	OrderRemark nvarchar(250),
	ManagerId nvarchar(8) FOREIGN KEY REFERENCES Manager(ManagerId),
	DipatchWorkerID nvarchar(8) FOREIGN KEY REFERENCES DispatchWorkers(DispatchWorkerID),
	ChefID nvarchar(8) FOREIGN KEY REFERENCES Chef(ChefID),
	MemberID nvarchar(10) FOREIGN KEY REFERENCES Member(MemberID),
	StatusID nvarchar(5) FOREIGN KEY REFERENCES Status(StatusID)
);

INSERT INTO Orders (OrderID, CartID, OrderTime, OrderDate, TotalPrice, OrderRemark, ManagerId, DipatchWorkerID, ChefID, MemberID, StatusID) VALUES 

('ORD001', 'C001', '12:30:00', '2023-05-02', 31.98, 'Extra cheese', 'ACM001', 'ACW001', 'ACC001', 'TP074562', 'ST001'),
('ORD002', 'C002', '18:45:00', '2023-06-02', 16.49, 'No pickles', 'ACM001', 'ACW002', 'ACC002', 'TP098765', 'ST002'),
('ORD003', 'C003', '19:15:00', '2023-05-03', 23.97, 'Extra olives', 'ACM001', 'ACW003', 'ACC003', 'TP123456', 'ST001'),
('ORD004', 'C004', '20:15:00', '2023-07-03', 12.49, 'No cheese', 'ACM001', 'ACW003', 'ACC003', 'AP000001', 'ST001'),
('ORD005', 'C005', '20:15:00', '2023-08-03', 535.96, 'Extra wasabi', 'ACM001', 'ACW003', 'ACC003', 'TP234567', 'ST001'),
('ORD006', 'C006', '15:30:00', '2023-05-07', 17.98, 'Extra dressing', 'ACM001', 'ACW003', 'ACC003', 'AP000003', 'ST003'),
('ORD007', 'C007', '17:45:00', '2023-09-08', 35.97, 'No salt', 'ACM001', 'ACW001', 'ACC001', 'TP098765', 'ST001'),
('ORD008', 'C008', '19:00:00', '2023-11-09', 120.49, 'Add guacamole', 'ACM001', 'ACW002', 'ACC002', 'TP074562', 'ST002'),
('ORD009', 'C009', '21:15:00', '2024-01-10', 74.95, 'No cilantro', 'ACM001', 'ACW003', 'ACC003', 'AP000001', 'ST003'),
('ORD010', 'C010', '11:30:00', '2024-02-11', 32.98, 'Extra eel sauce', 'ACM001', 'ACW001', 'ACC001', 'TP123456', 'ST001'),
('ORD011', 'C011', '18:45:00', '2024-02-12', 16.49, 'No pickles', 'ACM001', 'ACW002', 'ACC002', 'TP098765', 'ST002');



 --List the food(s) which has the highest rating. Show food id, food name and the rating.--
select 
   FoodID,
   FoodName,
   AverageRating 
from 
   Food As HighestRatedFood 
where
   AverageRating = (Select max(AverageRating) from food);

--Find the total number of feedback per member. Show member id, member name and total number of feedbacks per member.--
Select 
   Member.MemberID ,
   Member.Name, 
   Count(Rating.RatingID)As TotalRatingPerMember 
from 
   Member
left join 
   Rating ON Member.MemberID = Rating.MemberID
GROUP BY
   Member.MemberID, Member.Name
ORDER BY
	TotalRatingPerMember DESC; 

   --Find members who have not made any orders. Show member id, member name and the total order. ----
Select 
   Member.MemberID,
   Member.Name,
   Count(Orders.OrderID) As TotalOrders 
from 
   Member 
left join 
   Orders ON Member.MemberID = Orders.MemberID 
Group by 
   Member.MemberID , Member.Name 
HAVING 
	COUNT(Orders.OrderID) = 0;

--Find the total number of food(meal) ordered by manager from each chef.--

SELECT 
    Orders.ManagerId,
    Orders.ChefID,
    Chef.ChefName,
    SUM(CartItems.Quantity) AS TotalMealsOrdered
FROM 
    Orders 
JOIN 
    CartItems  ON Orders.CartID = CartItems.CartID
JOIN 
    Chef  ON Orders.ChefID = Chef.ChefID
GROUP BY 
    Orders.ManagerId,
    Orders.ChefID,
    Chef.ChefName;

--Find the total number of food(meal) cooked by each chef. Show chef id, chef name, and number of meals cooked.--
Select 
   Chef.ChefID,
   Chef.ChefName,
   SUM(CartItems.Quantity) AS TotalMealsCooked 
FROM 
   Orders 
JOIN 
   Chef ON  Orders.ChefID = Chef.ChefID 
JOIN 
   Status  ON Orders.StatusID = Status.StatusID 
JOIN 
    CartItems  ON Orders.CartID = CartItems.CartID
WHERE 
   Status.PreparationStatus = 'Done' 
GROUP BY  
   Chef.ChefID, Chef.ChefName;

--List all the food where its average rating is more than the average rating of all food.--
SELECT
   FoodID,
   FoodName,
   AverageRating
FROM 
   Food 
WHERE 
   AverageRating > (SELECT AVG(AverageRating) FROM Food)
Order by AverageRating DESC;
	

--Find the top 3 bestselling food(s). The list should include id, name, price and quantity sold.--

SELECT Top 3 
   Food.FoodID, 
   Food.FoodName,
   Food.FoodPrice,
   SUM(CartItems.Quantity) AS TotalQuantitySold 
FROM 
   Food  
JOIN 
   CartItems  ON Food.FoodID = CartItems.FoodID 
JOIN 
   Orders ON CartItems.CartID = Orders.CartID 
GROUP BY 
   Food.FoodID, Food.FoodName, Food.FoodPrice 
ORDER BY 
   TotalQuantitySold DESC;

--Show the top 3 members who spent most on ordering food. List should include id and name and whether they student or staff.--
SELECT Top 3 
   Member.MemberID, 
   Member.Name,
   Member.Roles,
   SUM(Orders.TotalPrice) AS TotalAmountSpent 
FROM 
   Member  
JOIN 
   Orders ON Member.MemberID = Orders.MemberID 
GROUP BY  
   Member.MemberID, Member.Name, Member.Roles 
ORDER BY  
   TotalAmountSpent DESC;

--Show the total members based on gender who are registered as members. List should include id, name, role(student/staff) and gender.-- ************
SELECT 
	Gender,
	Count(MemberID) as Total_member
	FROM Member
GROUP BY
	Gender
Order by
	Gender Asc;

--OR--


SELECT 
    MemberID, 
    Name, 
    Roles, 
    Gender
FROM 
    Member
ORDER BY 
    Gender, 
    Roles, 
    MemberID;

--Show a list of ordered food which has not been delivered to members. The list should show member id, role(student/staff), contact number, food id, food name, quantity, date, and status of delivery.--
SELECT  
   Member.MemberID,
   Member.Roles As Roles,
   Member.ContactNumber, 
   Food.FoodID, 
   Food.FoodName,
   CartItems.Quantity,
   Orders.OrderDate As Date , 
   Status.DeliveryStatus AS DeliveryStatus 
FROM  
   Orders  
JOIN  
   Member ON Orders.MemberID = Member.MemberID  
JOIN 
   CartItems ON Orders.CartID = CartItems.CartID 
JOIN 
   Food ON CartItems.FoodID = Food.FoodID 
JOIN  
   Status  ON Orders.StatusID = Status.StatusID 
WHERE  
   Status.DeliveryStatus = 'Pending';

--Show a list of members who made more than 2 orders. The list should show their member id, name, and role(student/staff) and total orders.--

SELECT 
   Member.MemberID,
   Member.Name,
   Member.Roles AS Role,
   COUNT(Orders.OrderID) AS TotalOrders 
FROM 
   Member 
JOIN 
   Orders  ON Member.MemberID = Orders.MemberID 
GROUP BY  
   Member.MemberID, Member.Name, Member.Roles HAVING COUNT(Orders.OrderID) > 2;

   --Find the monthly sales totals for the past year. The list should show order year, order month and total cost for that month.--
SELECT 
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    SUM(TotalPrice) AS TotalCost
FROM 
    Orders
WHERE 
    OrderDate >= DATEADD(YEAR, -1, GETDATE()) 
GROUP BY 
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY 
    OrderYear ASC,
    OrderMonth ASC;

	--OR--
SELECT 
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    SUM(TotalPrice) AS TotalCost
FROM 
    Orders
WHERE 
     OrderDate >= '2023-01-01' AND OrderDate < '2024-01-01'
GROUP BY 
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY 
    OrderYear ASC,
    OrderMonth ASC;