SELECT * FROM pizzahut.order_details;

-- DATA EXPLORATION
-- count of rows
SELECT COUNT(*) FROM order_details;
  
-- Sample data
SELECT* FROM order_details LIMIT 10;

-- DATA CLEANING
-- checking deplicates
SELECT order_id, pizza_id, COUNT(*) 
FROM order_details
GROUP BY order_id, pizza_id
HAVING COUNT(*) > 1;

-- checking NULLs
SELECT 
    SUM(order_details_id IS NULL) AS null_order_details_id,
    SUM(order_id IS NULL) AS null_order_id,
    SUM(pizza_id IS NULL) AS null_pizza_id,
    SUM(quantity IS NULL) AS null_quantity
FROM order_details;

-- checking invalid values(negative or 0)
SELECT * 
FROM order_details
WHERE quantity <= 0;

-- check for ID consistency
-- Missing parent orders
SELECT od.*
FROM order_details od
LEFT JOIN orders o ON od.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Missing pizzas
SELECT od.*
FROM order_details od
LEFT JOIN pizzas p ON od.pizza_id = p.pizza_id
WHERE p.pizza_id IS NULL;