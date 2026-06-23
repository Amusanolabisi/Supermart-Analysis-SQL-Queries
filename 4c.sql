-- Find all customers whose last name begins with the letters 'Ad' (case-insensitive). Display full name, city, and registration_date.
SELECT first_name || ' ' || last_name AS full_name,
city, registration_date
FROM customers
WHERE last_name ILIKE 'ad%'
ORDER BY first_name, last_name;