SELECT e.first_name || ' ' || e.last_name AS full_name,
    e.role, r.region_name, COUNT(o.order_id) AS total_orders
FROM employees e
LEFT JOIN orders o
ON e.employee_id = o.employee_id
LEFT JOIN regions r
ON e.region_id = r.region_id
GROUP BY e.employee_id, e.first_name, e.last_name, e.role, r.region_name
ORDER BY total_orders DESC, e.last_name ASC;