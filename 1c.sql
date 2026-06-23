-- c. Display the top 10 most expensive products by unit_price. Show product_name, category_id, and 
--unit_price, ordered from most to least expensive.
SELECT product_name, category_id, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 10;