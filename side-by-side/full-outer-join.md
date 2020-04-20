```sql
SELECT category.CategoryName, product.ProductName
FROM category
FULL OUTER JOIN products
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
$pl isa product, has product_name "Lasagne";
$pb isa product, has product_name "Butter";
$pc isa product, has product_name "Cheese";
$pk isa product, has product_name "Ketchup"; #product without category

$cc isa category, has category_name "Cereal"; #category without product
$cp isa category, has category_name "Pasta";
$cd isa category, has category_name "Diary";

(assigned-category: $cp, product-assignment: $pl) isa category-assignment;
(assigned-category: $cd, product-assignment: $pb) isa category-assignment;
(assigned-category: $cd, product-assignment: $pc) isa category-assignment;

############################################# QUERY #############################################
match
$c isa category, has category_name $cn;
$p isa product, has product_name $pn;
{
   ($c, $p) isa category-assignment;
} or {
    not {
       ($c, $p) isa category-assignment;
    };
};
get $cn, $pn;
```