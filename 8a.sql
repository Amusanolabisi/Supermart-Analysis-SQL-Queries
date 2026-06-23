WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS full_name,
        c.city,
        SUM(
            oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)
        ) AS total_revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.city
)
SELECT
    customer_id,
    full_name,
    city,
    ROUND(total_revenue, 2) AS total_revenue
FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 10;