-- Customers
INSERT INTO customers (name,email,phone,city,created_at) VALUES
('Rahul Sharma','rahul@gmail.com','9876543210','Delhi','2024-01-10'),
('Priya Mehta','priya@gmail.com','9876543222','Mumbai','2024-02-15'),
('Aman Verma','aman@gmail.com','9876543333','Bangalore','2024-03-05'),
('Neha Singh','neha@gmail.com','9876543444','Pune','2024-04-12');

-- Categories
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Fashion'),
('Home'),
('Beauty');

-- Products
INSERT INTO products (product_name,category_id,price,stock) VALUES
('iPhone 15',1,75000,20),
('Laptop HP',1,60000,15),
('T-Shirt',2,1200,100),
('Jeans',2,2500,80),
('Mixer Grinder',3,4500,25),
('Lipstick',4,800,200);

-- Orders
INSERT INTO orders (customer_id,order_date,status) VALUES
(1,'2024-06-01','Delivered'),
(2,'2024-06-03','Delivered'),
(3,'2024-06-10','Cancelled'),
(1,'2024-07-05','Delivered'),
(4,'2024-07-12','Pending');

-- Order Items
INSERT INTO order_items (order_id,product_id,quantity,total_price) VALUES
(1,1,1,75000),
(1,3,2,2400),
(2,2,1,60000),
(3,4,1,2500),
(4,5,1,4500),
(4,6,3,2400),
(5,3,1,1200);

-- Payments
INSERT INTO payments (order_id,payment_date,amount,payment_mode,status) VALUES
(1,'2024-06-01',77400,'UPI','Success'),
(2,'2024-06-03',60000,'Card','Success'),
(3,'2024-06-10',2500,'UPI','Failed'),
(4,'2024-07-05',6900,'NetBanking','Success'),
(5,'2024-07-12',1200,'COD','Pending');
