WITH monthly_revenue AS (
    SELECT
        EXTRACT(MONTH FROM o.order_date) AS month_num,
        SUM(
            oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)
        ) AS total_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE EXTRACT(YEAR FROM o.order_date) = 2023
    GROUP BY EXTRACT(MONTH FROM o.order_date)
),
avg_monthly_revenue AS (
    SELECT
        AVG(total_revenue) AS avg_revenue
    FROM monthly_revenue
)
SELECT
    mr.month_num,
    ROUND(mr.total_revenue, 2) AS total_revenue,
    CASE
        WHEN mr.total_revenue > amr.avg_revenue
            THEN 'Above Average'
        ELSE 'Below Average'
    END AS vs_average
FROM monthly_revenue mr
CROSS JOIN avg_monthly_revenue amr
ORDER BY mr.month_num ASC;