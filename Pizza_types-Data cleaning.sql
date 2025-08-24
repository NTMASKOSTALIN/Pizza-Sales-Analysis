SELECT * FROM pizzahut.pizza_types;

-- DATA EXPLORATION
-- count of rows
SELECT COUNT(*) FROM order_details;
  
-- Sample data
SELECT* FROM order_details LIMIT 10;

-- checking duplicates
SELECT pizza_type_id, COUNT(*)
FROM pizza_types
GROUP BY pizza_type_id
HAVING COUNT(*) > 1;

-- checking NULL values
SELECT 
    SUM(pizza_type_id IS NULL) AS null_pizza_type_id,
    SUM(name IS NULL) AS null_name,
    SUM(category IS NULL) AS null_category,
    SUM(ingredients IS NULL) AS null_ingredients
FROM pizza_types;

-- validating categories
SELECT DISTINCT category FROM pizza_types;

-- Spot invalid/misspelled categories
SELECT * FROM pizza_types
WHERE category NOT IN ('Classic', 'Veggie', 'Supreme', 'Chicken');

-- checking empty or inconsistent ingredients lists
SELECT * 
FROM pizza_types
WHERE TRIM(ingredients) = '' OR ingredients IS NULL;