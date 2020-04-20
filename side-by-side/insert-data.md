```sql
--------------------------------------------- SCHEMA ---------------------------------------------
CREATE TABLE categories (
  category_id smallint NOT NULL PRIMARY KEY,
  category_name character varying(40)
);

--------------------------------------------- DATA ---------------------------------------------
INSERT INTO categories (category_id, category_name)
VALUES (100, 'Candy');
```

```gql
############################################# SCHEMA #############################################
define
category sub entity,
    key category_name;

category_name sub attribute, datatype string;

############################################# DATA #############################################
insert $c isa category,
    has category_name "Candy";
```