```sql
SELECT city_name
FROM customers
INTERSECT
SELECT city_name
FROM suppliers;
```

```gql
############################################# SCHEMA #############################################
define
supplier sub entity,
    has supplier_name,
    plays located;
customer sub entity,
    has customer_name,
    plays located;
city sub entity,
    has city_name,
    plays location;

locating sub relation,
    relates location,
    relates located;

customer_name sub attribute, datatype string;
supplier_name sub attribute, datatype string;
city_name sub attribute, datatype string;

############################################# DATA #############################################
insert
$cud isa customer, has customer_name "Customer D";
$cue isa customer, has customer_name "Customer E";
$cuf isa customer, has customer_name "Customer F";

$sud isa supplier, has supplier_name "Supplier D";
$sue isa supplier, has supplier_name "Supplier E";
$suf isa supplier, has supplier_name "Supplier F";

$cid isa city, has city_name "London";
$cie isa city, has city_name "Batumi";
$cif isa city, has city_name "Paris";

(location: $cid, located: $cud) isa locating;
(location: $cie, located: $cue) isa locating;
(location: $cif, located: $cuf) isa locating;

(location: $cid, located: $sud) isa locating;
(location: $cie, located: $sue) isa locating;
(location: $cif, located: $suf) isa locating;

############################################# QUERY #############################################
match
$c isa city,
    has city_name $cn;
$cu isa customer;
$su isa supplier;
(location: $c, $cu);
(location: $c, $su);
get $cn;
```