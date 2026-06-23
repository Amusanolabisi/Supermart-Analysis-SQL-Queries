SELECT
    COUNT(DISTINCT customer_id) AS distinct_customers,
    ROUND(COUNT(*)::numeric / COUNT(DISTINCT customer_id), 2) AS avg_orders_per_customer
FROM orders;