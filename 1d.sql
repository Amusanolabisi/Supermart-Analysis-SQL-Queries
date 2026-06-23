-- List all employees hired on or after 1st January 2021. Display their full name (first_name and last_name
--concatenated as one column called full_name), role, hire_date, and salary, ordered by hire_date ascending.
SELECT first_name|| '' || last_name AS full_name, role, hire_date, salary
FROM employees
WHERE hire_date >= '2021-01-01'
ORDER BY hire_date ASC;