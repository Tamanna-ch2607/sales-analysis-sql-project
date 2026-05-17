CREATE DATABASE SalesDB;
USE SalesDB;

CREATE TABLE Customers(
customer_id INT PRIMARY KEY,
name VARCHAR(50),
city VARCHAR(50),
join_date DATE);

CREATE TABLE Products(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2)
);

CREATE TABLE Orders(
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
order_date DATE,
quantity INT,
FOREIGN KEY (customer_id) REFERENCES
Customers(customer_id),
FOREIGN KEY (product_id) REFERENCES
Products(product_id)
);

INSERT INTO Customers VALUES
(1,'Amit Sharma','Delhi','2024-01-10'),
(2,'Neha Verma','Lucknow','2024-02-15'),
(3,'Rohan Gupta','Agra','2024-03-20'),
(4,'Pooja Singh','Kanpur','2024-04-05'),
(5,'Vikram Yadav','Delhi','2024-05-12');

INSERT INTO Products VALUES
(101,'Laptop','Electronics',55000),
(102,'Mobile Phone','Electronics',20000),
(103,'Headphones','Accessories',1500),
(104,'Office Chair','Furniture',7000),
(105,'Notebook Pack','Stationery',300);

INSERT INTO Orders VALUES
(1001,1,101,'2024-06-01',1),
(1002,2,102,'2024-06-03',2),
(1003,3,103,'2024-06-05',3),
(1004,4,104,'2024-06-07',1),
(1005,5,105,'2024-06-10',5),
(1006,1,102,'2024-06-12',1),
(1007,2,103,'2024-06-15',2);

-- SHOW ALL CUSTOMERS-- 

SELECT*FROM Customers;

-- SHOW ALL ORDERS-- 

SELECT*FROM Orders;

-- TOTAL SALES AMOUNT--

SELECT SUM(price * quantity) AS total_sales
FROM Orders
JOIN Products
ON Orders.product_id = Products.product_id;

-- MOST SOLD PRODUCT-- 

SELECT product_name, SUM(quantity) AS total_sold
FROM Orders
JOIN Products
ON Orders.product_id = Products.product_id
GROUP BY product_name
ORDER BY total_sold DESC;

-- SALES BY CITY--

SELECT city, SUM(price * quantity) AS sales
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
JOIN Products
ON Orders.product_id = Products.product_id
GROUP BY city;

-- TOP CUSTOMERS BY SPENDING--

   SELECT name, SUM(price * quantity) AS total_spent
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
JOIN Products
ON Orders.product_id = Products.product_id
GROUP BY name
ORDER BY total_spent DESC;

-- NUMBERS OF ORDERS PER CUSTOMER--

SELECT name, COUNT(order_id) AS total_orders
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
GROUP BY name;

-- REVENUE BY CATEGORY--

SELECT category, SUM(price * quantity) AS revenue
FROM Orders
JOIN Products
ON Orders.product_id = Products.product_id
GROUP BY category;

-- CUSTOMERS FROM DELHI--

SELECT * FROM Customers
WHERE city = 'Delhi';

-- PRODUCTS ABOVE 50000 PRICE--

SELECT * FROM Products
WHERE price > 5000; 

-- TOTAL ORDERS ON EACH DATE--

SELECT order_date, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY order_date;

-- AVERAGE PRODUCT PRICE--

SELECT AVG(price) AS average_price
FROM Products;