CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    referred_by INT          -- customer_id of the person who referred them
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,         -- NULL = guest order
    amount INT
);

INSERT INTO customers VALUES
(1, 'Meera',    'Chennai',     NULL),
(2, 'Suresh',   'Madurai',     1),
(3, 'Lakshmi',  'Coimbatore',  1),
(4, 'Vijay',    'Bangalore',   2),
(5, 'Nila',     'Chennai',     NULL);   -- has no orders

INSERT INTO orders VALUES
(101, 1,    2500),
(102, 1,    1800),
(103, 2,    3200),
(104, 4,    900),
(105, NULL, 1500),                      -- guest order, no customer
(106, 3,    2100);

## inner join
SELECT c.customer_name, o.order_id, o.amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;

##2 left join
SELECT c.customer_name, o.order_id, o.amount
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;

##3 right join
SELECT o.order_id, o.amount, c.customer_name
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

##4 full outer join
SELECT c.customer_name, o.order_id, o.amount
FROM customers AS c
LEFT JOIN orders AS o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.order_id, o.amount
FROM customers AS c
RIGHT JOIN orders AS o ON c.customer_id = o.customer_id;

##5 query table with alias
SELECT c.customer_name, o.amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.amount > 2000;

## output for inner join
customer_name	order_id	amount
Meera	101	2500
Meera	102	1800
Suresh	103	3200
Vijay	104	900
Lakshmi	106	2100
