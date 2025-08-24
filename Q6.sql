-- 6. Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT  pt.category, SUM(od.quantity) AS Total_quantity
FROM pizzas p
JOIN pizza_types pt ON pt.pizza_type_id=p.pizza_type_id
JOIN order_details od ON p.pizza_id=od.pizza_id
GROUP BY pt.category
ORDER BY Total_quantity DESC;