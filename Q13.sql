-- 13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT category, name, revenue 
FROM (SELECT category, name, revenue, RANK() OVER(PARTITION BY category ORDER BY revenue DESC) AS rankk
      FROM(SELECT pt.name, pt.category, SUM(od.quantity*p.price) AS revenue
           FROM pizzas p
		   JOIN order_details od ON p.pizza_id=od.pizza_id
		   JOIN pizza_types pt ON p.pizza_type_id=pt.pizza_type_id
           GROUP BY pt.name, pt.category) AS a) AS B
WHERE rankk <=3;