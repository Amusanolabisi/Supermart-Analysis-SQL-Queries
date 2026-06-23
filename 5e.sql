SELECT
    c.category_name,
    p.product_name,
    COUNT(DISTINCT oi.order_id) AS times_ordered,
    SUM(oi.quantity) AS total_qty_sold
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    c.category_name,
    p.product_name
ORDER BY
    c.category_name ASC,
    total_qty_sold DESC;