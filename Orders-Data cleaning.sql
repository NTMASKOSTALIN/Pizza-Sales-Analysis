SELECT * FROM pizzahut.orders;

-- DATA EXPLORATION
-- count of rows
SELECT COUNT(*) FROM orders;
  
-- Sample data
SELECT* FROM orders LIMIT 10;

-- DATA CLEANING
-- checking duplicate values
SELECT order_id, COUNT(*) 
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- checking NULL values
SELECT 
    SUM(order_id IS NULL) AS null_order_id,
    SUM(order_date IS NULL) AS null_order_date,
    SUM(order_time IS NULL) AS null_order_time
FROM orders;

-- checking invalid dates & time
-- Orders in the future
SELECT * 
FROM orders
WHERE order_date > CURDATE();

-- Orders with invalid times (e.g., beyond 24h if stored wrongly)
SELECT * 
FROM orders
WHERE order_time NOT BETWEEN '00:00:00' AND '23:59:59';

-- Standardizing format
-- Convert date to YYYY-MM-DD
UPDATE orders SET order_date = STR_TO_DATE(order_date, '%Y-%m-%d')
WHERE order_date IS NOT NULL;

-- Ensuring order_time in TIME format
UPDATE orders SET order_time = SEC_TO_TIME(TIME_TO_SEC(order_time));
