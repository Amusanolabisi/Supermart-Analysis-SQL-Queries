WITH order_revenue AS (
    -- CTE 1: Revenue per order (all line items summed)
    SELECT
        o.order_id,
        o.employee_id,
        SUM(
            oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)
        ) AS order_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
      AND o.order_date BETWEEN '2021-01-01' AND '2024-06-30'
    GROUP BY o.order_id, o.employee_id
),

employee_sales AS (
    -- CTE 2: Employee-level aggregation
    SELECT
        employee_id,
        COUNT(order_id) AS total_delivered_orders,
        SUM(order_revenue) AS total_revenue,
        AVG(order_revenue) AS avg_order_value,
        MAX(order_revenue) AS best_single_order
    FROM order_revenue
    GROUP BY employee_id
)

SELECT
    e.first_name || ' ' || e.last_name AS employee_name,
    e.role,
    r.region_name,

    COALESCE(es.total_delivered_orders, 0) AS total_delivered_orders,
    ROUND(COALESCE(es.total_revenue, 0), 2) AS total_revenue,
    ROUND(COALESCE(es.avg_order_value, 0), 2) AS avg_order_value,
    ROUND(COALESCE(es.best_single_order, 0), 2) AS best_single_order,

    CASE
        WHEN COALESCE(es.total_revenue, 0) > 5000000
            THEN 'Elite'
        WHEN COALESCE(es.total_revenue, 0) BETWEEN 1000000 AND 5000000
            THEN 'Strong'
        WHEN COALESCE(es.total_revenue, 0) BETWEEN 100000 AND 999999
            THEN 'Developing'
        ELSE 'Inactive'
    END AS performance_band

FROM employees e
LEFT JOIN employee_sales es
    ON e.employee_id = es.employee_id
LEFT JOIN regions r
    ON e.region_id = r.region_id

ORDER BY
    total_revenue DESC,
    employee_name ASC;