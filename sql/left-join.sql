SELECT category.CategoryName
FROM category
LEFT JOIN products
    ON category.category_id = products.category_id
WHERE products.category_id IS NULL;