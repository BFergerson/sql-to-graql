```sql
SELECT category.CategoryName, product.ProductName
FROM category
INNER JOIN products
    ON category.category_id = products.category_id;
```

```gql
############################################# SCHEMA #############################################
define
product sub entity,
    key product_name,
    plays product-assignment;
category sub entity,
    key category_name,
    plays assigned-category;

category-assignment sub relation,
    relates assigned-category,
    relates product-assignment;

category_name sub attribute, datatype string;
product_name sub attribute, datatype string;

############################################# DATA #############################################
insert
$pp isa product, has product_name "Pumpkin Pie";
$pc isa product, has product_name "Carrot Cake";
$ph isa product, has product_name "Hamburger";

$cp isa category, has category_name "Pie";
$cc isa category, has category_name "Cake";
$cs isa category, has category_name "Sandwich";

(assigned-category: $cp, product-assignment: $pp) isa category-assignment;
(assigned-category: $cc, product-assignment: $pc) isa category-assignment;
(assigned-category: $cs, product-assignment: $ph) isa category-assignment;

############################################# QUERY #############################################
match
$c isa category,
    has category_name $cn;
$p isa product,
    has product_name $pn;
($c, $p) isa category-assignment;
get $cn, $pn;
```