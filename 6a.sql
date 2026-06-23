-- Assign a price tier label to every product using the table below. Display product_name, 
-- category_name (joined from categories), unit_price, and price_tier. Order by unit_price ascending
SELECT product_name, category_name, unit_price,
CASE
		WHEN unit_price < 10000 THEN 'Budget'
		WHEN unit_price BETWEEN 10000 AND 99000 THEN 'Mid-Range'
		WHEN unit_price >= 100000 THEN 'Premium'
    END AS price_tier
FROM products p
INNER JOIN categories c
ON p.category_id = c.category_id
ORDER BY unit_price ASC;
