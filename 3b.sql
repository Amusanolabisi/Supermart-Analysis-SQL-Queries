-- Which shipping cities received more than 10 delivered orders in total? Display the city name and the
--count of delivered orders, ordered by count descending.
SELECT shipping_city AS city_name,
COUNT(*) AS delivered_orders
FROM orders
WHERE status = 'Delivered'
GROUP BY shipping_city
HAVING COUNT(*) > 10
ORDER BY delivered_orders DESC;