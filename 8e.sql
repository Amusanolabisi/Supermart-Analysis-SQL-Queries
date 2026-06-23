WITH yearly_revenue AS (
    SELECT
        EXTRACT(YEAR FROM o.order_date) AS order_year,
        SUM(
            oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)
        ) AS total_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY EXTRACT(YEAR FROM o.order_date)
)
SELECT
    order_year,
    ROUND(total_revenue, 2) AS total_revenue
FROM yearly_revenue
ORDER BY order_year ASC;