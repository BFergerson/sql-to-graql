```sql
SELECT product_name, unit_price
FROM products
WHERE unit_price >= 1.25;
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
insert $p isa product, has product_name "Carrot", has unit_price 1.22;
insert $p isa product, has product_name "Tomato", has unit_price 1.98;
insert $p isa product, has product_name "Brocolli", has unit_price 1.10;

############################################# QUERY #############################################
match
$p isa product,
    has product_name $pn,
    has unit_price $up;
$up >= 1.25;
get $pn, $up;
```