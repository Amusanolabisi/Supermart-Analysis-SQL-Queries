SELECT
    first_name || ' ' || last_name AS full_name,
    role,
    salary,
    CASE
        WHEN salary >= 100000 THEN 'Executive'
        WHEN salary BETWEEN 80000 AND 99999 THEN 'Senior'
        WHEN salary < 80000 THEN 'Entry Level'
    END AS pay_band
FROM employees
ORDER BY salary DESC;