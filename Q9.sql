-- 9. Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT ROUND(AVG(Tot_quantity),0) AS avg_pizza_order_perday
FROM (SELECT o.order_date, SUM(od.quantity) AS Tot_quantity
FROM orders o
JOIN order_details od ON o.order_id=od.order_id
GROUP BY o.order_date) AS Order_quantity;
