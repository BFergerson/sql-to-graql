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