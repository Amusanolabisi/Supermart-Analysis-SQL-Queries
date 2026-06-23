SELECT c.first_name || ' ' || c.last_name AS full_name,
    c.city, ROUND(dt.total_lifetime_revenue, 2) AS total_lifetime_revenue
FROM customers c
JOIN (SELECT o.customer_id,
	SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)) AS total_lifetime_revenue
    FROM orders o
    JOIN order_items oi
    ON o.order_id = oi.order_id
    GROUP BY o.customer_id) AS dt
    ON c.customer_id = dt.customer_id
ORDER BY total_lifetime_revenue DESC
LIMIT 5;