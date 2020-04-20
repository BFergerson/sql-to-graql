```sql
--------------------------------------------- SCHEMA ---------------------------------------------
CREATE TABLE products (
  product_id smallint NOT NULL PRIMARY KEY,
  product_name character varying(40) NOT NULL,
  category_id smallint,
  unit_price float,
  FOREIGN KEY (category_id) REFERENCES categories
);

CREATE TABLE categories (
  category_id smallint NOT NULL PRIMARY KEY,
  category_name character varying(40)
);

--------------------------------------------- DATA ---------------------------------------------
INSERT INTO products (product_id, product_name, category_id, unit_price)
SELECT 99, 'Skittles', category_id, 1.10
FROM categories
WHERE category_name = 'Candy';
```

```gql
############################################# SCHEMA #############################################
define
product sub entity,
    key product_name,
    has unit_price,
    plays product-assignment;
category sub entity,
    key category_name,
    plays assigned-category;

category-assignment sub relation,
    relates assigned-category,
    relates product-assignment;

product_name sub attribute, datatype string;
unit_price sub attribute, datatype double;
category_name sub attribute, datatype string;

############################################# DATA #############################################
match
$c isa category, has category_name "Candy";
insert
$p isa product,
    has product_name "Skittles",
    has unit_price 1.10;
(product-assignment: $p, assigned-category: $c)isa category-assignment;
```