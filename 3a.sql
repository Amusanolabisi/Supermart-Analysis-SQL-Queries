SELECT
    EXTRACT(YEAR FROM registration_date) AS registration_year,
    COUNT(*) AS customer_count
FROM customers
WHERE EXTRACT(YEAR FROM registration_date) BETWEEN 2018 AND 2024
GROUP BY EXTRACT(YEAR FROM registration_date)
ORDER BY registration_year ASC;