-- Top 10 Products By Revenue

SELECT 
    p.name AS product_name,
    SUM(oi.sale_price) AS total_revenue
FROM `genai-experiments-072025.ecommerce_project.order_items` oi
JOIN `genai-experiments-072025.ecommerce_project.product` p 
    ON oi.product_id = p.id
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 Categories By Revenue

SELECT 
    p.category AS category,
    SUM(oi.sale_price) AS total_revenue
FROM `genai-experiments-072025.ecommerce_project.order_items` oi
JOIN `genai-experiments-072025.ecommerce_project.product` p 
    ON oi.product_id = p.id
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 10;

--Revenue By Region (Consumer Contribution)

SELECT 
    u.country AS region,
    SUM(oi.sale_price) AS total_revenue
FROM `genai-experiments-072025.ecommerce_project.order_items` oi
JOIN `genai-experiments-072025.ecommerce_project.user_data` u 
    ON oi.user_id = u.id
GROUP BY region
ORDER BY total_revenue DESC;

-- Sales Trend Over Time (Monthly Revenue)

SELECT 
    FORMAT_DATE("%Y-%m", DATE(oi.created_at)) AS month,
    SUM(oi.sale_price) AS total_revenue
FROM `genai-experiments-072025.ecommerce_project.order_items` oi
GROUP BY month
ORDER BY month;

-- Average Order Value (AOV)

SELECT 
    AVG(order_total) AS avg_order_value
FROM (
    SELECT 
        oi.order_id,
        SUM(oi.sale_price) AS order_total
    FROM `genai-experiments-072025.ecommerce_project.order_items` oi
    GROUP BY oi.order_id
);

-- Repeat Customers (Who Order more than once)

SELECT
  u.id AS user_id,
  COUNT(DISTINCT o.order_id) AS total_orders
FROM `genai-experiments-072025.ecommerce_project.orders` o
JOIN `genai-experiments-072025.ecommerce_project.user_data` u
  ON o.user_id = u.id
GROUP BY u.id
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY total_orders DESC;

-- Underperforming Products (Low Revenue + Low Sales Count)

SELECT 
    p.name AS product_name,
    COUNT(oi.id) AS total_sales,
    SUM(oi.sale_price) AS total_revenue
FROM `genai-experiments-072025.ecommerce_project.order_items` oi
JOIN `genai-experiments-072025.ecommerce_project.product` p 
    ON oi.product_id = p.id
GROUP BY product_name
HAVING total_revenue < 1000  -- threshold (adjustable)
ORDER BY total_revenue ASC, total_sales ASC
LIMIT 10;
