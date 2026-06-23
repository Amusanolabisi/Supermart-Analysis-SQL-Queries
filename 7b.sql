SELECT first_name || ' ' || last_name AS full_name, city
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders)
ORDER BY last_name, first_name;