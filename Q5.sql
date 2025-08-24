-- 5. List the top 5 most ordered pizza types along with their quantities.
SELECT pt.name, SUM(od.quantity) AS Tot_quantity
FROM pizzas p
JOIN order_details od ON p.pizza_id=od.pizza_id
JOIN pizza_types pt ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pt.name
ORDER BY Tot_quantity DESC LIMIT 5;