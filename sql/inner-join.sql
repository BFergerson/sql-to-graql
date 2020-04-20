SELECT category.CategoryName, product.ProductName
FROM category
INNER JOIN products
    ON category.category_id = products.category_id;