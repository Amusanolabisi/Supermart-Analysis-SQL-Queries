SELECT
    ROUND(SUM(quantity * unit_price * (1 - discount / 100.0)), 2) AS total_revenue,
    ROUND(AVG(quantity * unit_price * (1 - discount / 100.0)), 2) AS avg_revenue_per_line_item,
    ROUND(MAX(quantity * unit_price * (1 - discount / 100.0)), 2) AS max_revenue_per_line_item,
    ROUND(MIN(quantity * unit_price * (1 - discount / 100.0)), 2) AS min_revenue_per_line_item
FROM order_items;