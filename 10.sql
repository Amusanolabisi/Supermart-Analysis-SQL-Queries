WITH customer_orders AS (
    -- Aggregate all order counts per customer
    SELECT
        c.customer_id,
        COUNT(o.order_id) AS total_orders,
        COUNT(o.order_id) FILTER (WHERE o.status = 'Delivered') AS delivered_orders,
        COUNT(o.order_id) FILTER (WHERE o.status = 'Cancelled') AS cancelled_orders
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    WHERE EXTRACT(YEAR FROM c.registration_date) < 2024
    GROUP BY c.customer_id
),

customer_revenue AS (
    -- Revenue only from delivered orders
    SELECT
        o.customer_id,
        SUM(
            oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)
        ) AS lifetime_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY o.customer_id
)

SELECT
    c.first_name || ' ' || c.last_name AS customer_name,
    c.city,
    EXTRACT(YEAR FROM c.registration_date) AS registration_year,

    COALESCE(co.total_orders, 0) AS total_orders,
    COALESCE(co.delivered_orders, 0) AS delivered_orders,
    COALESCE(co.cancelled_orders, 0) AS cancelled_orders,

    ROUND(COALESCE(cr.lifetime_revenue, 0), 2) AS lifetime_revenue,

    ROUND(
        CASE
            WHEN COALESCE(co.delivered_orders, 0) > 0
                THEN COALESCE(cr.lifetime_revenue, 0) / co.delivered_orders
            ELSE 0
        END,
        2
    ) AS avg_order_value,

    CASE
        WHEN COALESCE(cr.lifetime_revenue, 0) > 500000
             AND COALESCE(co.delivered_orders, 0) >= 5
            THEN 'VIP'

        WHEN COALESCE(cr.lifetime_revenue, 0) BETWEEN 100000 AND 500000
             OR COALESCE(co.delivered_orders, 0) BETWEEN 2 AND 4
            THEN 'Loyal'

        WHEN COALESCE(co.delivered_orders, 0) = 1
            THEN 'One-Time Buyer'

        WHEN COALESCE(co.delivered_orders, 0) = 0
             AND COALESCE(co.total_orders, 0) > 0
            THEN 'No Conversions'

        ELSE 'Inactive'
    END AS customer_segment

FROM customers c
LEFT JOIN customer_orders co
    ON c.customer_id = co.customer_id
LEFT JOIN customer_revenue cr
    ON c.customer_id = cr.customer_id

WHERE EXTRACT(YEAR FROM c.registration_date) < 2024

ORDER BY
    lifetime_revenue DESC,
    customer_name ASC;