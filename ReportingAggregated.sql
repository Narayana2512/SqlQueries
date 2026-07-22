
mysql> CREATE DATABASE TechDB;
Query OK, 1 row affected (0.01 sec)

mysql> USE TechDB;
Database changed
mysql> CREATE TABLE employees (
    ->     employee_id INT PRIMARY KEY,
    ->     first_name VARCHAR(30),
    ->     last_name VARCHAR(30),
    ->     job_id VARCHAR(20),
    ->     manager_id INT,
    ->     hire_date DATE,
    ->     salary DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO employees VALUES
    -> (100,'Steven','King','AD_PRES',NULL,'1980-06-17',24000),
    ->
    -> (101,'Neena','Kochhar','AD_VP',100,'1981-09-21',17000),
    ->
    -> (102,'Lex','De Haan','AD_VP',100,'1982-01-13',17000),
    ->
    -> (103,'Alexander','Hunold','IT_PROG',102,'1980-01-03',9000),
    ->
    -> (104,'Bruce','Ernst','IT_PROG',103,'1981-05-21',6000),
    ->
    -> (105,'David','Austin','IT_PROG',103,'1982-06-25',4800),
    ->
    -> (106,'Valli','Pataballa','SA_REP',101,'1983-02-05',8000),
    ->
    -> (107,'Diana','Lorentz','SA_REP',101,'1981-02-07',7500),
    ->
    -> (108,'Nancy','Greenberg','FI_MGR',101,'1980-08-17',12000),
    ->
    -> (109,'Daniel','Faviet','FI_ACCOUNT',108,'1982-08-16',9000),
    ->
    -> (110,'John','Chen','FI_ACCOUNT',108,'1984-09-28',8200);
Query OK, 11 rows affected (0.02 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> SELECT
    -> MAX(salary) AS Highest,
    -> MIN(salary) AS Lowest,
    -> SUM(salary) AS Total_Salary,
    -> AVG(salary) AS Average_Salary
    -> FROM employees;
+----------+---------+--------------+----------------+
| Highest  | Lowest  | Total_Salary | Average_Salary |
+----------+---------+--------------+----------------+
| 24000.00 | 4800.00 |    122500.00 |   11136.363636 |
+----------+---------+--------------+----------------+
1 row in set (0.01 sec)

mysql> SELECT
    -> MAX(salary) AS Maximum,
    -> MIN(salary) AS Minimum,
    -> SUM(salary) AS Sum,
    -> ROUND(AVG(salary),0) AS Average
    -> FROM employees;
+----------+---------+-----------+---------+
| Maximum  | Minimum | Sum       | Average |
+----------+---------+-----------+---------+
| 24000.00 | 4800.00 | 122500.00 |   11136 |
+----------+---------+-----------+---------+
1 row in set (0.00 sec)

mysql> SELECT
    -> job_id,
    -> MIN(salary) AS Minimum,
    -> MAX(salary) AS Maximum,
    -> SUM(salary) AS Total,
    -> ROUND(AVG(salary),0) AS Average
    -> FROM employees
    -> GROUP BY job_id;
+------------+----------+----------+----------+---------+
| job_id     | Minimum  | Maximum  | Total    | Average |
+------------+----------+----------+----------+---------+
| AD_PRES    | 24000.00 | 24000.00 | 24000.00 |   24000 |
| AD_VP      | 17000.00 | 17000.00 | 34000.00 |   17000 |
| IT_PROG    |  4800.00 |  9000.00 | 19800.00 |    6600 |
| SA_REP     |  7500.00 |  8000.00 | 15500.00 |    7750 |
| FI_MGR     | 12000.00 | 12000.00 | 12000.00 |   12000 |
| FI_ACCOUNT |  8200.00 |  9000.00 | 17200.00 |    8600 |
+------------+----------+----------+----------+---------+
6 rows in set (0.01 sec)

mysql> SELECT
    -> job_id,
    -> COUNT(*) AS Number_of_Employees
    -> FROM employees
    -> GROUP BY job_id;
+------------+---------------------+
| job_id     | Number_of_Employees |
+------------+---------------------+
| AD_PRES    |                   1 |
| AD_VP      |                   2 |
| IT_PROG    |                   3 |
| SA_REP     |                   2 |
| FI_MGR     |                   1 |
| FI_ACCOUNT |                   2 |
+------------+---------------------+
6 rows in set (0.01 sec)

mysql> SELECT
    -> COUNT(DISTINCT manager_id) AS Number_of_Managers
    -> FROM employees
    -> WHERE manager_id IS NOT NULL;
+--------------------+
| Number_of_Managers |
+--------------------+
|                  5 |
+--------------------+
1 row in set (0.01 sec)

mysql> SELECT
    -> MAX(salary)-MIN(salary) AS DIFFERENCE
    -> FROM employees;
+------------+
| DIFFERENCE |
+------------+
|   19200.00 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT
    -> manager_id,
    -> MIN(salary) AS Lowest_Salary
    -> FROM employees
    -> WHERE manager_id IS NOT NULL
    -> GROUP BY manager_id
    -> HAVING MIN(salary) > 2000
    -> ORDER BY Lowest_Salary DESC;
+------------+---------------+
| manager_id | Lowest_Salary |
+------------+---------------+
|        100 |      17000.00 |
|        102 |       9000.00 |
|        108 |       8200.00 |
|        101 |       7500.00 |
|        103 |       4800.00 |
+------------+---------------+
5 rows in set (0.00 sec)

mysql> SELECT
    -> COUNT(*) AS Total_Employees,
    ->
    -> SUM(CASE
    -> WHEN YEAR(hire_date)=1980 THEN 1
    -> ELSE 0
    -> END) AS Hired_1980,
    ->
    -> SUM(CASE
    -> WHEN YEAR(hire_date)=1981 THEN 1
    -> ELSE 0
    -> END) AS Hired_1981,
    ->
    -> SUM(CASE
    -> WHEN YEAR(hire_date)=1982 THEN 1
    -> ELSE 0
    -> END) AS Hired_1982
    ->
    -> FROM employees;
+-----------------+------------+------------+------------+
| Total_Employees | Hired_1980 | Hired_1981 | Hired_1982 |
+-----------------+------------+------------+------------+
|              11 |          3 |          3 |          3 |
+-----------------+------------+------------+------------+
1 row in set (0.00 sec)

mysql>