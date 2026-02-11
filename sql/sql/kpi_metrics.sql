-- ===================
-- BUSINESS KPIs
-- ===================


-- Total Revenue
SELECT SUM(amount) AS total_revenue
FROM payments
WHERE status='Success';


-- Average Order Value
SELECT AVG(amount) AS avg_order_value
FROM payments
WHERE status='Success';


-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;


-- Conversion Rate
SELECT 
(
  COUNT(DISTINCT o.order_id) * 100.0 /
  COUNT(DISTINCT c.customer_id)
) AS conversion_rate
FROM customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id;


-- Repeat Purchase Rate
SELECT 
(
  COUNT(DISTINCT customer_id) * 100.0 /
  (SELECT COUNT(*) FROM customers)
) AS repeat_rate
FROM (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id)>1
) t;
