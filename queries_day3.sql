CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    region VARCHAR(20),
    category VARCHAR(30),
    sale_date DATE,
    quantity INT,
    amount INT
);

INSERT INTO sales_data VALUES
(1,  'South', 'Electronics', '2026-01-10', 2, 40000),
(2,  'South', 'Electronics', '2026-02-05', 1, 25000),
(3,  'South', 'Furniture',   '2026-01-18', 3, 15000),
(4,  'North', 'Electronics', '2026-01-22', 1, 30000),
(5,  'North', 'Furniture',   '2026-02-14', 2, 12000),
(6,  'North', 'Clothing',    '2026-02-20', 5, 8000),
(7,  'East',  'Clothing',    '2026-01-30', 4, 6000),
(8,  'East',  'Electronics', '2026-03-03', 2, 35000),
(9,  'West',  'Furniture',   '2026-03-12', 1, 9000),
(10, 'West',  'Clothing',    '2026-03-25', 6, 10000),
(11, 'South', 'Clothing',    '2026-03-08', 3, 4500),
(12, 'East',  'Furniture',   '2026-02-11', 2, 11000);

## COUNT, SUM, AVG, MAX, MIN: overall summary
SELECT
    COUNT(*)              AS total_sales,
    SUM(amount)           AS total_amount,
    ROUND(AVG(amount), 2) AS avg_amount,
    MAX(amount)           AS highest_sale,
    MIN(amount)           AS lowest_sale
FROM sales_data;

## SUM and COUNT by region
SELECT region, COUNT(*) AS total_sales, SUM(amount) AS total_amount
FROM sales_data
GROUP BY region
ORDER BY total_amount DESC;

## COUNT, SUM, AVG by category
SELECT
    category,
    COUNT(*)              AS total_sales,
    SUM(amount)           AS total_amount,
    ROUND(AVG(amount), 2) AS avg_amount
FROM sales_data
GROUP BY category
ORDER BY total_amount DESC;

## MAX and MIN by region
SELECT region, MAX(amount) AS highest_sale, MIN(amount) AS lowest_sale
FROM sales_data
GROUP BY region
ORDER BY region;

## Group by month
SELECT
    MONTHNAME(sale_date) AS month_name,
    COUNT(*)             AS total_sales,
    SUM(amount)          AS total_amount
FROM sales_data
GROUP BY MONTH(sale_date), MONTHNAME(sale_date)
ORDER BY MONTH(sale_date);

## Group by region and category
SELECT region, category, COUNT(*) AS total_sales, SUM(amount) AS total_amount
FROM sales_data
GROUP BY region, category
ORDER BY region, category;

## Having regions with total sales above 50,000
SELECT region, SUM(amount) AS total_amount
FROM sales_data
GROUP BY region
HAVING SUM(amount) > 50000;

## HAVING category and month combinations above 30,000 
SELECT
    category,
    MONTHNAME(sale_date) AS month_name,
    SUM(amount)          AS total_amount
FROM sales_data
GROUP BY category, MONTH(sale_date), MONTHNAME(sale_date)
HAVING SUM(amount) > 30000
ORDER BY MONTH(sale_date);

## Window function: running total with SUM() OVER()
SELECT
    sale_id,
    sale_date,
    region,
    amount,
    SUM(amount) OVER (ORDER BY sale_date, sale_id) AS running_total
FROM sales_data
ORDER BY sale_date, sale_id;

sale_id	sale_date	region	amount	running_total
1	10-01-2026	South	40000	40000
3	18-01-2026	South	15000	55000
4	22-01-2026	North	30000	85000
7	30-01-2026	East	6000	91000
2	05-02-2026	South	25000	116000
12	11-02-2026	East	11000	127000
5	14-02-2026	North	12000	139000
6	20-02-2026	North	8000	147000
8	03-03-2026	East	35000	182000
11	08-03-2026	South	4500	186500
9	12-03-2026	West	9000	195500
10	25-03-2026	West	10000	205500
