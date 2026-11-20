CREATE TABLE rep_sales (
    sale_id INT PRIMARY KEY,
    rep_name VARCHAR(30),
    region VARCHAR(20),
    sale_date DATE,
    amount INT
);

INSERT INTO rep_sales VALUES
(1,  'Arun',   'South', '2026-01-10', 40000),
(2,  'Bala',   'South', '2026-01-25', 25000),
(3,  'Arun',   'South', '2026-02-05', 15000),
(4,  'Deepa',  'North', '2026-01-22', 30000),
(5,  'Eshan',  'North', '2026-02-14', 12000),
(6,  'Deepa',  'North', '2026-03-02', 8000),
(7,  'Gokul',  'East',  '2026-01-30', 35000),
(8,  'Hari',   'East',  '2026-02-11', 11000),
(9,  'Hari',   'East',  '2026-03-09', 6000),
(10, 'Jeevan', 'West',  '2026-03-12', 10000),
(11, 'Kavya',  'West',  '2026-03-25', 9000),
(12, 'Kavya',  'West',  '2026-02-20', 4500);

##1 Non-correlated subquery: sales above the overall average
SELECT sale_id, rep_name, region, amount
FROM rep_sales
WHERE amount > (SELECT AVG(amount) FROM rep_sales);

##2 Correlated subquery: top sale per region
SELECT s.region, s.rep_name, s.amount
FROM rep_sales AS s
WHERE s.amount = (
    SELECT MAX(x.amount)
    FROM rep_sales AS x
    WHERE x.region = s.region
)
ORDER BY s.region;

##3 Nested subquery, then the same thing as a CTE
SELECT t.rep_name, t.total
FROM (
    SELECT rep_name, SUM(amount) AS total
    FROM rep_sales
    GROUP BY rep_name
) AS t
WHERE t.total > (
    SELECT AVG(y.total)
    FROM (
        SELECT SUM(amount) AS total
        FROM rep_sales
        GROUP BY rep_name
    ) AS y
);

Nested subquery, then the same thing as a CTE
WITH rep_totals AS (
    SELECT rep_name, SUM(amount) AS total
    FROM rep_sales
    GROUP BY rep_name
)
SELECT rep_name, total
FROM rep_totals
WHERE total > (SELECT AVG(total) FROM rep_totals)
ORDER BY total DESC;


##4 Chaining 2 CTEs: top performer per region by total sales
WITH rep_totals AS (
    SELECT region, rep_name, SUM(amount) AS total
    FROM rep_sales
    GROUP BY region, rep_name
),
region_best AS (
    SELECT region, MAX(total) AS best_total
    FROM rep_totals
    GROUP BY region
)
SELECT r.region, r.rep_name, r.total
FROM rep_totals AS r
INNER JOIN region_best AS b
    ON r.region = b.region
   AND r.total  = b.best_total
ORDER BY r.region;

###Output fot the 2 cte's function
region	rep_name	total
East	Gokul	35000
North	Deepa	38000
South	Arun	55000
West	Kavya	13500
