SELECT
    first_name,
    last_name,
    email
FROM customers
WHERE email LIKE '%@gmail.com'
ORDER BY last_name ASC;