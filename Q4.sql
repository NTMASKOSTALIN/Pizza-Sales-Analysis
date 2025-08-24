-- 4. Identify the most common pizza size ordered.
SELECT p.size, count(od.order_details_id) AS order_count
FROM pizzas p
JOIN order_details od ON p.pizza_id=od.pizza_id
GROUP BY p.size
ORDER BY order_count DESC LIMIT 1;