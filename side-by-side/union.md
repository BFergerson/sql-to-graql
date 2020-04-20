```sql
SELECT city_name
FROM customers
UNION
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
$cua isa customer, has customer_name "Customer A";
$cub isa customer, has customer_name "Customer B";
$cuc isa customer, has customer_name "Customer C";

$sua isa supplier, has supplier_name "Supplier A";
$sub isa supplier, has supplier_name "Supplier B";
$suc isa supplier, has supplier_name "Supplier C";

$cia isa city, has city_name "Langley";
$cib isa city, has city_name "Miami";
$cic isa city, has city_name "Las Vegas";
$cid isa city, has city_name "Tokyo";
$cie isa city, has city_name "Sydney";
$cif isa city, has city_name "Berlin";
$cig isa city, has city_name "Cambridge"; #extra city which no customers/suppliers are located

(location: $cia, located: $cua) isa locating;
(location: $cib, located: $cub) isa locating;
(location: $cic, located: $cuc) isa locating;
(location: $cid, located: $sua) isa locating;
(location: $cie, located: $sub) isa locating;
(location: $cif, located: $suc) isa locating;

############################################# QUERY #############################################
match
$c isa city,
    has city_name $cn;
{$x isa supplier; } or {$x isa customer; };
(location: $c, $x);
get $cn;
```