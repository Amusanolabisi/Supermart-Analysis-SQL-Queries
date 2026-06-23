SELECT
    e.first_name || ' ' || e.last_name AS full_name,
    COUNT(o.order_id) AS total_orders
FROM employees e
INNER JOIN orders o
    ON e.employee_id = o.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
HAVING COUNT(o.order_id) >= 20
ORDER BY total_orders DESC;