-- ============================
-- ADVANCED ANALYTICS QUERIES
-- ============================


-- 1. Rank Customers by Spending
SELECT c.name,
       SUM(p.amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.status = 'Success'
GROUP BY c.name;


-- 2. Top Product in Each Category
SELECT category_name,
       product_name,
       total_sales
FROM (
    SELECT c.category_name,
           p.product_name,
           SUM(oi.total_price) AS total_sales,
           RANK() OVER (
             PARTITION BY c.category_name
             ORDER BY SUM(oi.total_price) DESC
           ) AS rnk
    FROM categories c
    JOIN products p ON c.category_id = p.category_id
    JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY c.category_name, p.product_name
) t
WHERE rnk = 1;


-- 3. Running (Cumulative) Revenue
SELECT payment_date,
       SUM(amount) AS daily_revenue,
       SUM(SUM(amount)) OVER (ORDER BY payment_date) AS running_total
FROM payments
WHERE status='Success'
GROUP BY payment_date;


-- 4. Repeat Customers
SELECT name,
       COUNT(order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY name
HAVING COUNT(order_id) > 1;


-- 5. Monthly Growth Percentage (CTE)
WITH monthly_sales AS (
    SELECT MONTH(payment_date) AS month,
           SUM(amount) AS revenue
    FROM payments
    WHERE status='Success'
    GROUP BY MONTH(payment_date)
)
SELECT month,
       revenue,
       LAG(revenue) OVER (ORDER BY month) AS prev_month,
       ROUND(
         ((revenue - LAG(revenue) OVER (ORDER BY month))
         / LAG(revenue) OVER (ORDER BY month)) * 100, 2
       ) AS growth_percent
FROM monthly_sales;
