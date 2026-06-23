SELECT
    product_name,
    category_id,
    unit_price
FROM products
WHERE product_name ILIKE '%set%'
ORDER BY unit_price DESC;