WITH product_sales AS (
    SELECT
        c.category_id,
        c.category_name,
        p.product_id,
        p.product_name,
        SUM(oi.quantity) AS total_qty_sold
    FROM categories c
    JOIN products p
        ON c.category_id = p.category_id
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY
        c.category_id,
        c.category_name,
        p.product_id,
        p.product_name
)
SELECT
    category_name,
    product_name,
    total_qty_sold
FROM product_sales ps
WHERE total_qty_sold = (
    SELECT MAX(ps2.total_qty_sold)
    FROM product_sales ps2
    WHERE ps2.category_id = ps.category_id)
ORDER BY category_name;