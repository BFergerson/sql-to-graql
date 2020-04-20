--------------------------------------------- SCHEMA ---------------------------------------------
CREATE TABLE categories (
  category_id smallint NOT NULL PRIMARY KEY,
  category_name character varying(40)
);

--------------------------------------------- DATA ---------------------------------------------
INSERT INTO categories (category_id, category_name)
VALUES (100, 'Candy');