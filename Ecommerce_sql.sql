CREATE DATABASE e_commerce_order_trends;
use e_commerce_order_trends;

CREATE TABLE Users (
UserID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100) UNIQUE,
PasswordHash VARCHAR(255),
Role ENUM('Admin', 'Customer'),
CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Customers (
CustomerID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Phone VARCHAR(15),
Address TEXT,
CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE Products (
ProductID INT AUTO_INCREMENT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10, 2),
Stock INT,
Description TEXT,
ImageURL VARCHAR(255),
CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE Orders (
OrderID INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT,
OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
TotalAmount DECIMAL(10, 2),
Status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled'),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);



CREATE TABLE OrderDetails (
OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
Price DECIMAL(10, 2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Coupons (
CouponID INT AUTO_INCREMENT PRIMARY KEY,
Code VARCHAR(50),
DiscountPercentage DECIMAL(5, 2),
ExpiryDate DATE,
UsageLimit INT,
CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE OrderCoupons (
OrderCouponID INT AUTO_INCREMENT PRIMARY KEY,
OrderID INT,
CouponID INT,
DiscountAmount DECIMAL(10, 2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (CouponID) REFERENCES Coupons(CouponID)
);


CREATE TABLE ProductReviews (
ReviewID INT AUTO_INCREMENT PRIMARY KEY,
ProductID INT,
CustomerID INT,
Rating INT CHECK (Rating BETWEEN 1 AND 5),
ReviewText TEXT,
ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE Shipments (
ShipmentID INT AUTO_INCREMENT PRIMARY KEY,
OrderID INT,
Carrier VARCHAR(100),
TrackingNumber VARCHAR(100),
ShippedDate TIMESTAMP,
EstimatedDeliveryDate TIMESTAMP,
DeliveredDate TIMESTAMP,
Status ENUM('Shipped', 'In Transit', 'Delivered', 'Failed'),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


CREATE TABLE Cart (
CartID INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT,
ProductID INT,
Quantity INT,
AddedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- INSERT VALUES INTO THE TABLE 

INSERT INTO Users (Name, Email, PasswordHash, Role)
VALUES
('Admin User', 'admin@example.com', 'hashedpassword1', 'Admin'),
('John Doe', 'john.doe@example.com', 'hashedpassword2', 'Customer'),
('Jane Smith', 'jane.smith@example.com', 'hashedpassword3', 'Customer'),
('Alice Brown', 'alice.brown@example.com', 'hashedpassword4', 'Customer'),
('Bob White', 'bob.white@example.com', 'hashedpassword5', 'Customer'),
('Michael Brown', 'michael.brown@example.com', 'hashedpassword4', 'Customer'),
('Sarah Johnson', 'sarah.johnson@example.com', 'hashedpassword5', 'Customer');

INSERT INTO Customers (Name, Email, Phone, Address)
VALUES
('John Doe', 'john.doe@example.com', '1234567890', '123 Elm St, New York'),
('Jane Smith', 'jane.smith@example.com', '0987654321', '456 Oak St, California'),
('Alice Brown', 'alice.brown@example.com', '1122334455', '789 Pine St, Texas'),
('Bob White', 'bob.white@example.com', '5566778899', '159 Maple St, Florida'),
('Michael Brown', 'michael.brown@example.com', '1122334455', '789 Pine St, Texas'),
('Sarah Johnson', 'sarah.johnson@example.com', '6677889900', '321 Birch St, Florida');


INSERT INTO Products (ProductName, Category, Price, Stock, Description, ImageURL)
VALUES
('Laptop', 'Electronics', 1000.00, 20, 'High-performance laptop', 'http://example.com/laptop.jpg'),
('Headphones', 'Accessories', 50.00, 100, 'Noise-cancelling headphones', 'http://example.com/headphones.jpg'),
('Smartphone', 'Electronics', 800.00, 30, 'Latest smartphone model', 'http://example.com/smartphone.jpg'),
('Backpack', 'Accessories', 40.00, 50, 'Stylish and durable backpack', 'http://example.com/backpack.jpg'),
('Gaming Console', 'Electronics', 500.00, 15, 'Next-gen gaming console', 'http://example.com/console.jpg'),
('Wireless Mouse', 'Accessories', 25.00, 200, 'Ergonomic wireless mouse', 'http://example.com/mouse.jpg'),
('Smartwatch', 'Electronics', 300.00, 40, 'Feature-packed smartwatch', 'http://example.com/smartwatch.jpg');


INSERT INTO Orders (CustomerID, TotalAmount, Status, OrderDate)
VALUES
(1, 1050.00, 'Shipped', '2024-12-01'),
(2, 850.00, 'Delivered', '2024-11-28'),
(3, 525.00, 'Delivered', '2024-11-30'),
(4, 325.00, 'Shipped', '2024-12-05');


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES
(1, 1, 1, 1000.00),
(1, 2, 1, 50.00),
(2, 3, 1, 800.00),
(2, 4, 1, 40.00),
(3, 5, 1, 500.00),
(3, 6, 1, 25.00),
(4, 7, 1, 300.00);


INSERT INTO Coupons (Code, DiscountPercentage, ExpiryDate, UsageLimit)
VALUES
('WELCOME10', 10.00, '2024-12-31', 100),
('FESTIVE20', 20.00, '2024-12-25', 50),
('HOLIDAY15', 15.00, '2024-12-31', 75);



INSERT INTO OrderCoupons (OrderID, CouponID, DiscountAmount)
VALUES
(1, 1, 100.00),
(2, 2, 170.00),
(3, 3, 78.75);



INSERT INTO ProductReviews (ProductID, CustomerID, Rating, ReviewText)
VALUES
(1, 1, 5, 'Excellent laptop! Highly recommend.'),
(2, 2, 4, 'Great headphones, but a bit pricey.'),
(5, 3, 5, 'Amazing gaming experience!'),
(6, 4, 4, 'Great wireless mouse, very responsive.');



INSERT INTO Shipments (OrderID, Carrier, TrackingNumber, ShippedDate, EstimatedDeliveryDate, DeliveredDate, Status)
VALUES
(1, 'FedEx', 'TRACK123', '2024-12-02', '2024-12-05', NULL, 'In Transit'),
(2, 'UPS', 'TRACK456', '2024-11-29', '2024-12-03', '2024-12-03', 'Delivered'),
(3, 'DHL', 'TRACK789', '2024-12-01', '2024-12-06', '2024-12-06', 'Delivered'),
(4, 'FedEx', 'TRACK101', '2024-12-06', '2024-12-10', NULL, 'In Transit');



INSERT INTO Cart (CustomerID, ProductID, Quantity, AddedDate)
VALUES
(1, 4, 1, '2024-12-10'),
(2, 2, 2, '2024-12-09'),
(3, 7, 1, '2024-12-08'),
(4, 5, 1, '2024-12-09');


select p.ProductName , pr.Rating, pr.ReviewText From ProductReviews pr
join  Products p on p.ProductID= pr.ProductID
where Rating="5";









SELECT 
    p.ProductName, 
    AVG(pr.Rating) AS AverageRating, 
    COUNT(pr.ReviewID) AS TotalReviews
FROM Products p
LEFT JOIN ProductReviews pr ON p.ProductID = pr.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY AverageRating DESC;


#1
Select category, AVG(price) as avg_price
from products
group by category
having avg(price)> 100;

#2
select p.ProductName, count(s. ProductId) as total_sold
from ProductReviews s
join products p on s.ProductId= p.ProductId
group by p.ProductName
order by total_sold desc limit 5;

#3
CREATE TRIGGER  update_stock_after_order
AFTER INSERT ON OrderDetails
for each row 
begin 
     update Products
     set Stock = Stock - NEW.Quantity
	 where ProductId = NEW.ProductId 
END //

DELIMITER ;

#4
Select p.ProductId, p.ProductName, r.Rating from Products p
join ProductReviews r
on p.ProductId=r.ProductId
where r.Rating=5;

#5
select OrderId, DiscountAmount
from OrderCoupons;

#6
select Month(OrderDate) as month, count(OrderId)as totalorders
from Orders
group by month(OrderDate);



#7
create view Ordersummary as
select o.OrderID,
	   c.Name,
       o.OrderDate, 
       o.TotalAmount, 
       o.Status
from Orders o join Customers c on o.OrderID= c.CustomerID;
select * from Ordersummary
where Status="Shipped";

#8
SELECT c.Name, sum(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC;

#9
select p.ProductName, avg(Rating) as AvgRating, count(ReviewID) as TotalReviews from Products p
left join ProductReviews pr on p.ProductID= pr.ProductID
group by p.ProductID, p.ProductName 
order by AvgRating desc;

#10
select Carrier, count(ShipmentId) as TotalShipments
from Shipments
group by Carrier;

#11
select * from Orders
where Year(OrderDate) = 2024;

#12
select c.CustomerId, c.Name, 
sum(o.TotalAmount) as totalspending,
rank() over(order by sum(o.TotalAmount) desc) as customerrank
from Customers c
join Orders o on c.CustomerId=o.CustomerId
group by c.CustomerId, c.Name;

#13
select OrderId, Datediff(DeliveredDate, ShippedDate) as deliverytime
from Shipments
where status='Delivered'; 

#14
select ProductName, Price,
Case
    when Price<50 Then 'low price'
    when Price between 50 and 200 then 'medium price'
    else 'high price'
end as PriceCategory
from Products;

#15
select CustomerId, count(distinct OrderID) as totaldeliveredorders
from Orders
where status='Delivered'
group by CustomerId;