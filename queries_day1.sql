CREATE TABLE sales_representatives (
    rep_id INT PRIMARY KEY,
    rep_name VARCHAR(50),
    region VARCHAR(30),
    product_category VARCHAR(30),
    city VARCHAR(30),
    monthly_sales DECIMAL(10,2),
    commission DECIMAL(10,2),
    experience INT,
    joining_date DATE,
    supervisor_id INT
);


INSERT INTO sales_representatives VALUES
(1, 'Adithya Menon', 'South', 'Electronics', 'Bangalore', 85000, 5000, 3, '2022-01-15', 201),
(2, 'Riya Kapoor', 'North', 'Furniture', 'Delhi', 62000, 3500, 2, '2023-04-10', 202),
(3, 'Naveen Raj', 'West', 'Clothing', 'Mumbai', 95000, 6000, 4, '2021-08-20', 203),
(4, 'Ishita Rao', 'South', 'Electronics', 'Chennai', 78000, 4500, 3, '2022-11-12', 201),
(5, 'Varun Das', 'East', 'Groceries', 'Kolkata', 55000, 2800, 1, '2024-02-05', 204),
(6, 'Tanvi Shah', 'West', 'Furniture', 'Pune', 72000, 4000, 2, '2023-07-18', NULL),
(7, 'Rohit Nair', 'South', 'Clothing', 'Hyderabad', 110000, 7500, 5, '2020-05-22', 201),
(8, 'Simran Gill', 'North', 'Electronics', 'Jaipur', 68000, 3200, 2, '2023-09-08', 202),
(9, 'Harish Kumar', 'East', 'Groceries', 'Patna', 48000, 2500, 1, '2024-06-14', 204),
(10, 'Diya Thomas', 'South', 'Furniture', 'Kochi', 92000, 5800, 4, '2021-12-01', 201),
(11, 'Kunal Mehta', 'West', 'Electronics', 'Ahmedabad', 105000, 7000, 5, '2020-04-17', 203),
(12, 'Sanya Bose', 'East', 'Clothing', 'Bhubaneswar', 59000, 3000, 2, '2023-08-25', 204),
(13, 'Arjun Pillai', 'South', 'Groceries', 'Coimbatore', 76000, 4200, 3, '2022-02-11', NULL),
(14, 'Mira Sethi', 'North', 'Furniture', 'Lucknow', 83000, 4900, 3, '2021-06-30', 202),
(15, 'Dev Malhotra', 'West', 'Clothing', 'Surat', 120000, 8500, 6, '2019-10-09', 203),
(16, 'Nisha George', 'South', 'Electronics', 'Mysore', 67000, 3400, 2, '2023-04-03', NULL),
(17, 'Kabir Anand', 'East', 'Groceries', 'Ranchi', 51000, 2700, 1, '2024-05-16', 204),
(18, 'Tara Iyer', 'South', 'Clothing', 'Trivandrum', 98000, 6200, 4, '2021-12-21', 201),
(19, 'Aman Verma', 'North', 'Electronics', 'Chandigarh', 89000, 5300, 3, '2022-08-13', 202),
(20, 'Leena Paul', 'West', 'Furniture', 'Nagpur', 64000, 3100, 2, '2023-03-19', NULL);


SELECT * FROM sales_representatives;


##1 Display all sales representatives
SELECT * FROM sales_representatives;


##2 Use WHERE with AND
SELECT * FROM sales_representatives
WHERE region = 'South' AND product_category = 'Electronics';


##3 Use OR
SELECT * FROM sales_representatives
WHERE city = 'Bangalore' OR city = 'Chennai';


##4 Use NOT
SELECT * FROM sales_representatives
WHERE NOT region = 'North';


##5 Use LIKE
SELECT * FROM sales_representatives
WHERE rep_name LIKE 'A%';


##6 Use IN
SELECT * FROM sales_representatives
WHERE region IN ('South', 'West');


##7 Use BETWEEN
SELECT * FROM sales_representatives
WHERE monthly_sales BETWEEN 60000 AND 100000;


##8 Use IS NULL
SELECT * FROM sales_representatives
WHERE supervisor_id IS NULL;


##9 Use WHERE with multiple conditions
SELECT * FROM sales_representatives
WHERE experience >= 3 AND monthly_sales > 80000;


##10 Display sales representatives who joined after 2022
SELECT * FROM sales_representatives
WHERE joining_date > '2022-12-31';

###outout for ##10
rep_id	rep_name	region	product_category	city	monthly_sales	commission	experience	joining_date	supervisor_id
2	Riya Kapoor	North	Furniture	Delhi	62000	3500	2	10-04-2023	202
5	Varun Das	East	Groceries	Kolkata	55000	2800	1	05-02-2024	204
6	Tanvi Shah	West	Furniture	Pune	72000	4000	2	18-07-2023	NULL
8	Simran Gill	North	Electronics	Jaipur	68000	3200	2	08-09-2023	202
9	Harish Kumar	East	Groceries	Patna	48000	2500	1	14-06-2024	204
12	Sanya Bose	East	Clothing	Bhubaneswar	59000	3000	2	25-08-2023	204
16	Nisha George	South	Electronics	Mysore	67000	3400	2	03-04-2023	NULL
17	Kabir Anand	East	Groceries	Ranchi	51000	2700	1	16-05-2024	204
20	Leena Paul	West	Furniture	Nagpur	64000	3100	2	19-03-2023	NULL

