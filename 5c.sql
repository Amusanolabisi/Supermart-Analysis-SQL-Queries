SELECT
    o.order_id, o.order_date,
    c.first_name || ' ' || c.last_name AS customer_full_name,
    p.product_name, oi.quantity, oi.unit_price, oi.discount,
    ROUND(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0),2) AS line_total
FROM order_items oi
INNER JOIN orders o
ON oi.order_id = o.order_id
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN products p
ON oi.product_id = p.product_id
ORDER BY o.order_id ASC, p.product_name ASC;