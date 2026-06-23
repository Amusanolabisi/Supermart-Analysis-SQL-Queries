-- Retrieve the first_name, last_name, and email of every customer who lives in Lagos.
--Sort results alphabetically by last_name, then by first_name.
SELECT first_name, last_name, email
FROM customers
WHERE city = 'Lagos'
ORDER BY last_name ASC, first_name ASC;