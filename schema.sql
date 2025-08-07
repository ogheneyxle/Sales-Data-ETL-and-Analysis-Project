CREATE DATABASE IF NOT EXISTS sales_dw;
USE sales_dw;

CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    region VARCHAR(100)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id)
);

USE sales_dw;

SELECT COUNT(*) FROM dim_customer;
SELECT COUNT(*) FROM dim_product;
SELECT COUNT(*) FROM fact_sales;

ALTER TABLE dim_product CHANGE COLUMN name product_name VARCHAR(100);

-- top performing product
SELECT 
    p.product_name,
    SUM(s.quantity) AS total_quantity_sold
FROM fact_sales s
JOIN dim_product p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- total products sold per month
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS sale_month,
    SUM(s.quantity) AS total_units_sold
FROM fact_sales s
GROUP BY sale_month
ORDER BY sale_month;

-- top 10 customers per volume of purchase
SELECT 
    c.customer_name,
    SUM(s.quantity) AS total_units_purchased
FROM fact_sales s
JOIN dim_customer c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_units_purchased DESC
LIMIT 10;

-- quantity sold per region
SELECT 
    c.region,
    SUM(s.quantity) AS total_units_sold
FROM fact_sales s
JOIN dim_customer c ON s.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_units_sold DESC;

-- average order quantity per customer
SELECT 
    c.customer_name,
    COUNT(s.sale_id) AS total_orders,
    SUM(s.quantity) AS total_units,
    ROUND(AVG(s.quantity), 2) AS avg_units_per_order
FROM fact_sales s
JOIN dim_customer c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY avg_units_per_order DESC
LIMIT 10;



