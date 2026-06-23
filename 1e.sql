-- Retrieve all orders placed in December across any year. Show order_id, order_date, status, and
--shipping_city. Order by order_date descending.
SELECT order_id, order_date, status, shipping_city
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = 12
ORDER BY order_date DESC;