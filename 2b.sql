-- For each product category, calculate the minimum, maximum, and average unit_price of products in that category.
--Round the average to 2 decimal places. Display category_name (not just the ID). Order by average price descending.
SELECT category_name,
MIN(unit_price) AS min_price,
MAX(unit_price) AS max_price,
ROUND(AVG(unit_price),2) AS average_price
FROM categories c
JOIN products p
ON c.category_id = p.category_id
GROUP BY category_name
ORDER BY average_price DESC;