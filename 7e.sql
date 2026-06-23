SELECT c.first_name || ' ' || c.last_name AS full_name, c.city,
ROUND(cr.total_revenue, 2) AS total_revenue
FROM customers c
JOIN (SELECT o.customer_id,
    SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)) AS total_revenue
    FROM orders o
    JOIN order_items oi
    ON o.order_id = oi.order_id
    GROUP BY o.customer_id) AS cr
    ON c.customer_id = cr.customer_id
WHERE cr.total_revenue > (SELECT AVG(customer_revenue)
    FROM (SELECT SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)) AS customer_revenue
    FROM orders o
    JOIN order_items oi
    ON o.order_id = oi.order_id
    GROUP BY o.customer_id) AS avg_source)
ORDER BY total_revenue DESC;