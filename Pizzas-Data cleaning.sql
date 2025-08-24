SELECT * FROM pizzahut.pizzas;

-- DATA EXPLORATION
-- count of rows
SELECT COUNT(*) FROM pizzas;
  
-- Sample data
SELECT* FROM pizzas LIMIT 10;

-- DATA CLEANING
-- checking duplicates
SELECT pizza_id, COUNT(*)
FROM pizzas
GROUP BY pizza_id
HAVING COUNT(*) > 1;

-- Checking NULLs
SELECT 
    SUM(pizza_id IS NULL) AS null_pizza_id,
    SUM(pizza_type_id IS NULL) AS null_pizza_type_id,
    SUM(size IS NULL) AS null_size,
    SUM(price IS NULL) AS null_price
FROM pizzas;

-- Checking invalid sizes (expected values: S, M, L, XL, XXL)
SELECT DISTINCT size FROM pizzas;

-- Invalid values
SELECT * FROM pizzas
WHERE size NOT IN ('S', 'M', 'L', 'XL', 'XXL');

-- Checking invalid prices (Negative or zero prices)
SELECT * 
FROM pizzas
WHERE price <= 0;

-- Checking pizza_type_id consistency
SELECT p.*
FROM pizzas p
LEFT JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE pt.pizza_type_id IS NULL;