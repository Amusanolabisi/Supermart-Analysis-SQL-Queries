SELECT c.category_name,
COUNT(CASE WHEN p.unit_price < 10000 THEN 1 END) AS budget_count,
COUNT(CASE WHEN p.unit_price BETWEEN 10000 AND 99999 THEN 1 END) AS mid_range_count,
COUNT(CASE WHEN p.unit_price >= 100000 THEN 1 END) AS premium_count
FROM categories c
JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY c.category_name;