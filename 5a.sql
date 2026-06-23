SELECT
    o.order_id,
    c.first_name || ' ' || c.last_name AS customer_full_name,
    e.first_name || ' ' || e.last_name AS employee_full_name,
    o.order_date,
    o.status,
    o.shipping_city
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN employees e
    ON o.employee_id = e.employee_id
ORDER BY o.order_date DESC
LIMIT 50;