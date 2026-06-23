WITH customer_orders AS (
    SELECT
        c.customer_id,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
)
SELECT
    CASE
        WHEN total_orders >= 8 THEN 'High Frequency'
        WHEN total_orders BETWEEN 4 AND 7 THEN 'Regular'
        WHEN total_orders BETWEEN 1 AND 3 THEN 'Occasional'
        ELSE 'Inactive'
    END AS segment,
    COUNT(*) AS customer_count
FROM customer_orders
GROUP BY
    CASE
        WHEN total_orders >= 8 THEN 'High Frequency'
        WHEN total_orders BETWEEN 4 AND 7 THEN 'Regular'
        WHEN total_orders BETWEEN 1 AND 3 THEN 'Occasional'
        ELSE 'Inactive'
    END
ORDER BY customer_count DESC;