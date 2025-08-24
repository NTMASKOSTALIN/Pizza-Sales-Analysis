-- 10. Determine the top 3 most ordered pizza types based on revenue.
SELECT pt.name, SUM(od.quantity*p.price) AS revenue
FROM pizzas p
JOIN order_details od ON p.pizza_id=od.pizza_id
JOIN pizza_types pt ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pt.name
Order BY revenue DESC LIMIT 3;