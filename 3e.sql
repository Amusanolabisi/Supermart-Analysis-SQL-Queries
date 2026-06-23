--  For each year in the dataset (2021–2024), show the total number of orders placed and the count of
-- distinct customers who ordered that year. Order by year ascending.
SELECT EXTRACT(YEAR FROM order_date) AS order_year,
COUNT(*) AS total_order,
COUNT(DISTINCT customer_id) AS customer_count
FROM orders
WHERE EXTRACT(YEAR FROM order_date) BETWEEN 2021 AND 2024
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY order_year ASC;