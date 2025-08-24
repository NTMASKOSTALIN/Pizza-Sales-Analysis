-- 10. Calculate the percentage contribution of each pizza type to total revenue.
SELECT pt.category, ROUND(SUM(od.quantity*p.price)/(SELECT ROUND(SUM(od2.quantity*p2.price),2)
													FROM pizzas p2
                                                    JOIN order_details od2 ON p2.pizza_id=od2.pizza_id)*100,2) AS Revenue
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id=pt.pizza_type_id
JOIN order_details od ON p.pizza_id=od.pizza_id
GROUP BY pt.category;