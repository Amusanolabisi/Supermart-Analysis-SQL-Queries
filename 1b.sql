--List the names of all distinct cities to which SuperMart has shipped at least one order. Sort alphabetically.
SELECT DISTINCT shipping_city
FROM orders
ORDER BY shipping_city ASC;
