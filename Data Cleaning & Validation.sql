-- Validating order_details with orders
-- orphan order_details (invalid order_id)
SELECT od.*
FROM order_details od
LEFT JOIN orders o ON od.order_id = o.order_id
WHERE o.order_id IS NULL;

-- orphan order_details
SELECT COUNT(*) AS orphan_order_details
FROM order_details od
LEFT JOIN orders o ON od.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Validating order_details with pizzas
-- orphan order_details (invalid pizza_id)
SELECT od.*
FROM order_details od
LEFT JOIN pizzas p ON od.pizza_id = p.pizza_id
WHERE p.pizza_id IS NULL;

-- Count orphan order_details
SELECT COUNT(*) AS orphan_pizza_details
FROM order_details od
LEFT JOIN pizzas p ON od.pizza_id = p.pizza_id
WHERE p.pizza_id IS NULL;

-- Validating pizzas with pizza_types
-- pizzas with invalid pizza_type_id
SELECT p.*
FROM pizzas p
LEFT JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE pt.pizza_type_id IS NULL;

-- Count invalid pizzas
SELECT COUNT(*) AS invalid_pizzas
FROM pizzas p
LEFT JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE pt.pizza_type_id IS NULL;

-- checking unlinked parent rows
-- Orders with no order_details
SELECT o.*
FROM orders o
LEFT JOIN order_details od ON o.order_id = od.order_id
WHERE od.order_id IS NULL;

-- Pizzas never ordered
SELECT p.*
FROM pizzas p
LEFT JOIN order_details od ON p.pizza_id = od.pizza_id
WHERE od.pizza_id IS NULL;

## found 5 pizzas that never been ordered

ALTER TABLE pizzas ADD COLUMN is_active TINYINT DEFAULT 1;

UPDATE pizzas p LEFT JOIN order_details od ON p.pizza_id = od.pizza_id
SET p.is_active = 0
WHERE od.pizza_id IS NULL;

-- unused (inactive) pizzas
SELECT p.*
FROM pizzas p
WHERE p.is_active = 0;

-- Count of how many were marked inactive
SELECT COUNT(*) AS inactive_pizzas
FROM pizzas
WHERE is_active = 0;

-- Pizza_types never used in pizzas
SELECT pt.*
FROM pizza_types pt
LEFT JOIN pizzas p ON pt.pizza_type_id = p.pizza_type_id
WHERE p.pizza_type_id IS NULL;

-- Cross-table data consistency checks
-- checking of revenue calculation
SELECT od.order_details_id, od.quantity, p.price,
       (od.quantity * p.price) AS line_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
LIMIT 10;

-- Orders with zero total revenue
SELECT o.order_id, SUM(od.quantity * p.price) AS total_order_amount
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY o.order_id
HAVING total_order_amount = 0;

-- Quick Audit for checking all key relationships
SELECT 
    (SELECT COUNT(*) 
     FROM order_details od 
     LEFT JOIN orders o ON od.order_id = o.order_id 
     WHERE o.order_id IS NULL) AS orphan_order_details,

    (SELECT COUNT(*) 
     FROM order_details od 
     LEFT JOIN pizzas p ON od.pizza_id = p.pizza_id 
     WHERE p.pizza_id IS NULL) AS orphan_pizza_details,

    (SELECT COUNT(*) 
     FROM pizzas p 
     LEFT JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id 
     WHERE pt.pizza_type_id IS NULL) AS invalid_pizzas,

    (SELECT COUNT(*) 
     FROM orders o 
     LEFT JOIN order_details od ON o.order_id = od.order_id 
     WHERE od.order_id IS NULL) AS unused_orders,

    (SELECT COUNT(*) 
     FROM pizzas p 
     LEFT JOIN order_details od ON p.pizza_id = od.pizza_id 
     WHERE od.pizza_id IS NULL) AS unused_pizzas,

    (SELECT COUNT(*) 
     FROM pizza_types pt 
     LEFT JOIN pizzas p ON pt.pizza_type_id = p.pizza_type_id 
     WHERE p.pizza_type_id IS NULL) AS unused_pizza_types;