SELECT category.CategoryName, product.ProductName
FROM category
FULL OUTER JOIN products
    ON category.category_id = products.category_id;