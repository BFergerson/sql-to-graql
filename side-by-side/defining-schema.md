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
```