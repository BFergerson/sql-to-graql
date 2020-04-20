SELECT city_name
FROM customers
INTERSECT
SELECT city_name
FROM suppliers;