-- 12. Analyze the cumulative revenue generated over time.
SELECT order_date, ROUND(SUM(Revenue) OVER(ORDER BY order_date),2) AS Cum_revenue
FROM (SELECT o.order_date, ROUND(SUM(od.quantity*p.price),2) AS Revenue
FROM order_details od 
JOIN orders o ON od.order_id=o.order_id
JOIN pizzas p ON od.pizza_id=p.pizza_id
GROUP BY o.order_date) AS Sales_Revenue;