SET SCHEMA 'cafe';

SELECT ALL * FROM syrup;

SELECT * FROM syrup;

SELECT coffeetype type_, milktype milk, size cup_size
FROM coffeerecipies;

SELECT DISTINCT coffeetype, shotcount
FROM coffeerecipies;

SELECT coffeetype, shotcount
FROM coffeerecipies;

SELECT COUNT(*) as order_amount, MAX(unitprice) AS maximum_unitprice, MIN(unitprice) AS minimum_unitprice
FROM orders;

SELECT *
FROM orders
WHERE orderTime BETWEEN '2025-08-01 %' AND '2025-08-03 %';

SELECT orders.coffeetype
FROM orders
WHERE coffeetype LIKE '_a%';

SELECT orders.customer
FROM orders
WHERE customer LIKE '___';

SELECT coffeetype, size, shotcount, milktype
FROM coffeerecipies
ORDER BY coffeetype ASC, size ASC, shotcount DESC;

SELECT c.coffeetype, s.syrupname
FROM coffeerecipies c CROSS JOIN Syrup s;

SELECT *
FROM coffeerecipies c CROSS JOIN Syrup s
WHERE coffeetype = 'latte' AND milktype = 'oat';

SELECT c.coffeeType, s.syrupName
FROM coffeerecipies c JOIN Syrup s ON s.syrupid = c.syrupid;

SELECT
    o.orderId,
    o.customer,
    o.coffeeType,
    s.syrupName AS syrup
FROM orders AS o
JOIN coffeerecipies AS c
    ON o.coffeetype = c.coffeetype
    AND o.milktype = c.milktype
JOIN syrup AS s
    ON c.syrupid = s.syrupid
ORDER BY o.ordertime;

SELECT
    c.coffeeType,
    c.milkType,
    s.syrupname
FROM coffeerecipies AS c
LEFT JOIN Syrup AS s
    ON s.syrupid = c.syrupid;