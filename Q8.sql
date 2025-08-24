-- 8. Find the category-wise distribution of pizzas.
SELECT category, COUNT(name) AS Pizza_count
FROM pizza_types
GROUP BY category;