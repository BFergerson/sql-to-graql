```sql
UPDATE products
SET unit_price = 1.41
WHERE product_name = 'A&W';
```

```gql
############################################# SCHEMA #############################################
define
product sub entity,
    key product_name,
    has unit_price;

product_name sub attribute, datatype string;
unit_price sub attribute, datatype double;

############################################# DATA #############################################
insert $p isa product, has product_name "Sprite", has unit_price 1.55;
insert $p isa product, has product_name "7 UP", has unit_price 1.68;
insert $p isa product, has product_name "A&W", has unit_price 2.41;

############################################# QUERY #############################################
match $p isa product, has product_name "A&W", has unit_price $up via $r;
delete $r;

match $p isa product, has product_name "A&W";
insert $p has unit_price 1.41;
```