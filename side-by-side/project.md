```sql
SELECT product_name, unit_price
FROM products;
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
insert $p isa product, has product_name "Apple", has unit_price 0.80;
insert $p isa product, has product_name "Orange", has unit_price 0.67;
insert $p isa product, has product_name "Strawberry", has unit_price 0.33;

############################################# QUERY #############################################
match
$p isa product,
    has product_name $pn,
    has unit_price $up;
get $pn, $up;
```