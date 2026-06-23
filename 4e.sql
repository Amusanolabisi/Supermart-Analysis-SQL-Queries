SELECT
    first_name,
    last_name,
    city
FROM customers
WHERE city ILIKE '%an%'
ORDER BY city ASC,
         last_name ASC;