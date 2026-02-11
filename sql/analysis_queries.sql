-- 1. Total Revenue
SELECT SUM(amount) AS total_revenue
FROM payments
WHERE status = 'Success';


-- 2. Revenue by Category
SELECT c.category_name,
       SUM(oi.total_price) AS revenue
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY c.category_name;


-- 3. Top 5 Selling Products
SELECT p.product_name,
       SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;


-- 4. Monthly Revenue Trend
SELECT MONTH(payment_date) AS month,
       SUM(amount) AS revenue
FROM payments
WHERE status = 'Success'
GROUP BY month;


-- 5. Best Customers
SELECT c.name,
       SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.status = 'Success'
GROUP BY c.name
ORDER BY total_spent DESC;


-- 6. Low Stock Products
SELECT product_name,
       stock
FROM products
WHERE stock < 30;
