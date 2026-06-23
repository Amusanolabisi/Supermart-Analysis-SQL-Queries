SELECT
    product_name,
    category_id,
    unit_price
FROM products
WHERE product_name ILIKE '%combo%'
   OR product_name ILIKE '%kit%'
   OR product_name ILIKE '%pack%'
ORDER BY product_name;