mysql> USE hr_assignment;
Database changed
mysql> CREATE TABLE employees (
    ->     empno INT PRIMARY KEY,
    ->     ename VARCHAR(30),
    ->     job VARCHAR(20),
    ->     mgr INT,
    ->     hiredate DATE,
    ->     sal DECIMAL(10,2),
    ->     comm DECIMAL(10,2),
    ->     deptno INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO employees VALUES
    -> (7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
    -> (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
    -> (7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
    -> (7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
    -> (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
    -> (7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
    -> (7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),
    -> (7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20),
    -> (7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
    -> (7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
    -> (7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20),
    -> (7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
    -> (7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
    -> (7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);
Query OK, 14 rows affected (0.02 sec)
Records: 14  Duplicates: 0  Warnings: 0

mysql> SELECT CURDATE() AS Date;
+------------+
| Date       |
+------------+
| 2026-07-22 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT CURDATE() AS Date;
+------------+
| Date       |
+------------+
| 2026-07-22 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT empno,
    ->        ename,
    ->        sal,
    ->        ROUND(sal * 1.155) AS "New Salary"
    -> FROM employees;
+-------+--------+---------+------------+
| empno | ename  | sal     | New Salary |
+-------+--------+---------+------------+
|  7369 | SMITH  |  800.00 |        924 |
|  7499 | ALLEN  | 1600.00 |       1848 |
|  7521 | WARD   | 1250.00 |       1444 |
|  7566 | JONES  | 2975.00 |       3436 |
|  7654 | MARTIN | 1250.00 |       1444 |
|  7698 | BLAKE  | 2850.00 |       3292 |
|  7782 | CLARK  | 2450.00 |       2830 |
|  7788 | SCOTT  | 3000.00 |       3465 |
|  7839 | KING   | 5000.00 |       5775 |
|  7844 | TURNER | 1500.00 |       1733 |
|  7876 | ADAMS  | 1100.00 |       1271 |
|  7900 | JAMES  |  950.00 |       1097 |
|  7902 | FORD   | 3000.00 |       3465 |
|  7934 | MILLER | 1300.00 |       1502 |
+-------+--------+---------+------------+
14 rows in set (0.00 sec)

mysql> SELECT empno,
    ->        ename,
    ->        sal,
    ->        ROUND(sal * 1.155) AS "New Salary",
    ->        ROUND((sal * 1.155) - sal) AS Increase_
    -> FROM employees;
+-------+--------+---------+------------+-----------+
| empno | ename  | sal     | New Salary | Increase_ |
+-------+--------+---------+------------+-----------+
|  7369 | SMITH  |  800.00 |        924 |       124 |
|  7499 | ALLEN  | 1600.00 |       1848 |       248 |
|  7521 | WARD   | 1250.00 |       1444 |       194 |
|  7566 | JONES  | 2975.00 |       3436 |       461 |
|  7654 | MARTIN | 1250.00 |       1444 |       194 |
|  7698 | BLAKE  | 2850.00 |       3292 |       442 |
|  7782 | CLARK  | 2450.00 |       2830 |       380 |
|  7788 | SCOTT  | 3000.00 |       3465 |       465 |
|  7839 | KING   | 5000.00 |       5775 |       775 |
|  7844 | TURNER | 1500.00 |       1733 |       233 |
|  7876 | ADAMS  | 1100.00 |       1271 |       171 |
|  7900 | JAMES  |  950.00 |       1097 |       147 |
|  7902 | FORD   | 3000.00 |       3465 |       465 |
|  7934 | MILLER | 1300.00 |       1502 |       202 |
+-------+--------+---------+------------+-----------+
14 rows in set (0.01 sec)

mysql> SELECT empno,
    ->        ename,
    ->        sal,
    ->        ROUND(sal * 1.155) AS "New Salary",
    ->        ROUND((sal * 1.155) - sal) AS Increase_
    -> FROM employees;
+-------+--------+---------+------------+-----------+
| empno | ename  | sal     | New Salary | Increase_ |
+-------+--------+---------+------------+-----------+
|  7369 | SMITH  |  800.00 |        924 |       124 |
|  7499 | ALLEN  | 1600.00 |       1848 |       248 |
|  7521 | WARD   | 1250.00 |       1444 |       194 |
|  7566 | JONES  | 2975.00 |       3436 |       461 |
|  7654 | MARTIN | 1250.00 |       1444 |       194 |
|  7698 | BLAKE  | 2850.00 |       3292 |       442 |
|  7782 | CLARK  | 2450.00 |       2830 |       380 |
|  7788 | SCOTT  | 3000.00 |       3465 |       465 |
|  7839 | KING   | 5000.00 |       5775 |       775 |
|  7844 | TURNER | 1500.00 |       1733 |       233 |
|  7876 | ADAMS  | 1100.00 |       1271 |       171 |
|  7900 | JAMES  |  950.00 |       1097 |       147 |
|  7902 | FORD   | 3000.00 |       3465 |       465 |
|  7934 | MILLER | 1300.00 |       1502 |       202 |
+-------+--------+---------+------------+-----------+
14 rows in set (0.00 sec)

mysql> SELECT empno,
    ->        ename,
    ->        sal,
    ->        ROUND(sal * 1.155) AS "New Salary",
    ->        ROUND((sal * 1.155) - sal) AS Increase_
    -> FROM employees;
+-------+--------+---------+------------+-----------+
| empno | ename  | sal     | New Salary | Increase_ |
+-------+--------+---------+------------+-----------+
|  7369 | SMITH  |  800.00 |        924 |       124 |
|  7499 | ALLEN  | 1600.00 |       1848 |       248 |
|  7521 | WARD   | 1250.00 |       1444 |       194 |
|  7566 | JONES  | 2975.00 |       3436 |       461 |
|  7654 | MARTIN | 1250.00 |       1444 |       194 |
|  7698 | BLAKE  | 2850.00 |       3292 |       442 |
|  7782 | CLARK  | 2450.00 |       2830 |       380 |
|  7788 | SCOTT  | 3000.00 |       3465 |       465 |
|  7839 | KING   | 5000.00 |       5775 |       775 |
|  7844 | TURNER | 1500.00 |       1733 |       233 |
|  7876 | ADAMS  | 1100.00 |       1271 |       171 |
|  7900 | JAMES  |  950.00 |       1097 |       147 |
|  7902 | FORD   | 3000.00 |       3465 |       465 |
|  7934 | MILLER | 1300.00 |       1502 |       202 |
+-------+--------+---------+------------+-----------+
14 rows in set (0.00 sec)

mysql> SELECT CONCAT(UCASE(LEFT(ename,1)),
    ->               LCASE(SUBSTRING(ename,2))) AS Employee_Name,
    ->        LENGTH(ename) AS Length
    -> FROM employees
    -> WHERE LEFT(ename,1) IN ('J','A','M')
    -> ORDER BY ename;
+---------------+--------+
| Employee_Name | Length |
+---------------+--------+
| Adams         |      5 |
| Allen         |      5 |
| James         |      5 |
| Jones         |      5 |
| Martin        |      6 |
| Miller        |      6 |
+---------------+--------+
6 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE ename LIKE 'H%';
Empty set (0.00 sec)

mysql> SELECT ename,
    ->        ROUND(TIMESTAMPDIFF(MONTH,hiredate,CURDATE())) AS MONTHS_WORKED
    -> FROM employees
    -> ORDER BY MONTHS_WORKED;
+--------+---------------+
| ename  | MONTHS_WORKED |
+--------+---------------+
| ADAMS  |           469 |
| SCOTT  |           471 |
| MILLER |           533 |
| JAMES  |           535 |
| FORD   |           535 |
| KING   |           536 |
| MARTIN |           537 |
| TURNER |           538 |
| CLARK  |           541 |
| BLAKE  |           542 |
| JONES  |           543 |
| ALLEN  |           545 |
| WARD   |           545 |
| SMITH  |           547 |
+--------+---------------+
14 rows in set (0.00 sec)

mysql> SELECT ename,
    -> CONCAT('Dream Salaries: ',
    -> ROUND(sal*3)) AS Dream_Salaries
    -> FROM employees;
+--------+-----------------------+
| ename  | Dream_Salaries        |
+--------+-----------------------+
| SMITH  | Dream Salaries: 2400  |
| ALLEN  | Dream Salaries: 4800  |
| WARD   | Dream Salaries: 3750  |
| JONES  | Dream Salaries: 8925  |
| MARTIN | Dream Salaries: 3750  |
| BLAKE  | Dream Salaries: 8550  |
| CLARK  | Dream Salaries: 7350  |
| SCOTT  | Dream Salaries: 9000  |
| KING   | Dream Salaries: 15000 |
| TURNER | Dream Salaries: 4500  |
| ADAMS  | Dream Salaries: 3300  |
| JAMES  | Dream Salaries: 2850  |
| FORD   | Dream Salaries: 9000  |
| MILLER | Dream Salaries: 3900  |
+--------+-----------------------+
14 rows in set (0.00 sec)

mysql> SELECT ename,
    -> LPAD(sal,15,'$') AS SALARY
    -> FROM employees;
+--------+-----------------+
| ename  | SALARY          |
+--------+-----------------+
| SMITH  | $$$$$$$$$800.00 |
| ALLEN  | $$$$$$$$1600.00 |
| WARD   | $$$$$$$$1250.00 |
| JONES  | $$$$$$$$2975.00 |
| MARTIN | $$$$$$$$1250.00 |
| BLAKE  | $$$$$$$$2850.00 |
| CLARK  | $$$$$$$$2450.00 |
| SCOTT  | $$$$$$$$3000.00 |
| KING   | $$$$$$$$5000.00 |
| TURNER | $$$$$$$$1500.00 |
| ADAMS  | $$$$$$$$1100.00 |
| JAMES  | $$$$$$$$$950.00 |
| FORD   | $$$$$$$$3000.00 |
| MILLER | $$$$$$$$1300.00 |
+--------+-----------------+
14 rows in set (0.00 sec)

mysql> SELECT
    -> ename,
    -> hiredate,
    -> DATE_ADD(
    -> DATE_ADD(hiredate,INTERVAL 6 MONTH),
    -> INTERVAL ((9-DAYOFWEEK(DATE_ADD(hiredate,INTERVAL 6 MONTH)))%7) DAY
    -> ) AS REVIEW
    -> FROM employees;
+--------+------------+------------+
| ename  | hiredate   | REVIEW     |
+--------+------------+------------+
| SMITH  | 1980-12-17 | 1981-06-22 |
| ALLEN  | 1981-02-20 | 1981-08-24 |
| WARD   | 1981-02-22 | 1981-08-24 |
| JONES  | 1981-04-02 | 1981-10-05 |
| MARTIN | 1981-09-28 | 1982-03-29 |
| BLAKE  | 1981-05-01 | 1981-11-02 |
| CLARK  | 1981-06-09 | 1981-12-14 |
| SCOTT  | 1987-04-19 | 1987-10-19 |
| KING   | 1981-11-17 | 1982-05-17 |
| TURNER | 1981-09-08 | 1982-03-08 |
| ADAMS  | 1987-05-23 | 1987-11-23 |
| JAMES  | 1981-12-03 | 1982-06-07 |
| FORD   | 1981-12-03 | 1982-06-07 |
| MILLER | 1982-01-23 | 1982-07-26 |
+--------+------------+------------+
14 rows in set (0.01 sec)

mysql> SELECT
    -> ename,
    -> hiredate,
    -> DAYNAME(hiredate) AS DAY
    -> FROM employees
    -> ORDER BY FIELD(DAYNAME(hiredate),
    -> 'Monday','Tuesday','Wednesday',
    -> 'Thursday','Friday','Saturday','Sunday');
+--------+------------+-----------+
| ename  | hiredate   | DAY       |
+--------+------------+-----------+
| MARTIN | 1981-09-28 | Monday    |
| CLARK  | 1981-06-09 | Tuesday   |
| KING   | 1981-11-17 | Tuesday   |
| TURNER | 1981-09-08 | Tuesday   |
| SMITH  | 1980-12-17 | Wednesday |
| JONES  | 1981-04-02 | Thursday  |
| JAMES  | 1981-12-03 | Thursday  |
| FORD   | 1981-12-03 | Thursday  |
| ALLEN  | 1981-02-20 | Friday    |
| BLAKE  | 1981-05-01 | Friday    |
| ADAMS  | 1987-05-23 | Saturday  |
| MILLER | 1982-01-23 | Saturday  |
| WARD   | 1981-02-22 | Sunday    |
| SCOTT  | 1987-04-19 | Sunday    |
+--------+------------+-----------+
14 rows in set (0.00 sec)

mysql> SELECT
    -> ename,
    -> IFNULL(comm,'No Commission') AS COMM
    -> FROM employees;
+--------+---------------+
| ename  | COMM          |
+--------+---------------+
| SMITH  | No Commission |
| ALLEN  | 300.00        |
| WARD   | 500.00        |
| JONES  | No Commission |
| MARTIN | 1400.00       |
| BLAKE  | No Commission |
| CLARK  | No Commission |
| SCOTT  | No Commission |
| KING   | No Commission |
| TURNER | 0.00          |
| ADAMS  | No Commission |
| JAMES  | No Commission |
| FORD   | No Commission |
| MILLER | No Commission |
+--------+---------------+
14 rows in set (0.00 sec)

mysql> SELECT
    -> ename,
    -> job,
    -> CASE
    -> WHEN job='PRESIDENT' THEN 'A'
    -> WHEN job='MANAGER' THEN 'B'
    -> WHEN job='SALESMAN' THEN 'C'
    -> WHEN job='CLERK' THEN 'D'
    -> ELSE 'E'
    -> END AS Grade
    -> FROM employees;
+--------+-----------+-------+
| ename  | job       | Grade |
+--------+-----------+-------+
| SMITH  | CLERK     | D     |
| ALLEN  | SALESMAN  | C     |
| WARD   | SALESMAN  | C     |
| JONES  | MANAGER   | B     |
| MARTIN | SALESMAN  | C     |
| BLAKE  | MANAGER   | B     |
| CLARK  | MANAGER   | B     |
| SCOTT  | ANALYST   | E     |
| KING   | PRESIDENT | A     |
| TURNER | SALESMAN  | C     |
| ADAMS  | CLERK     | D     |
| JAMES  | CLERK     | D     |
| FORD   | ANALYST   | E     |
| MILLER | CLERK     | D     |
+--------+-----------+-------+
14 rows in set (0.00 sec)

mysql> SELECT
    -> ename,
    -> job,
    -> CASE
    -> WHEN job='PRESIDENT' THEN 'A'
    -> WHEN job='MANAGER' THEN 'B'
    -> WHEN job='SALESMAN' THEN 'C'
    -> WHEN job='CLERK' THEN 'D'
    -> ELSE 'E'
    -> END AS Grade
    -> FROM employees;
+--------+-----------+-------+
| ename  | job       | Grade |
+--------+-----------+-------+
| SMITH  | CLERK     | D     |
| ALLEN  | SALESMAN  | C     |
| WARD   | SALESMAN  | C     |
| JONES  | MANAGER   | B     |
| MARTIN | SALESMAN  | C     |
| BLAKE  | MANAGER   | B     |
| CLARK  | MANAGER   | B     |
| SCOTT  | ANALYST   | E     |
| KING   | PRESIDENT | A     |
| TURNER | SALESMAN  | C     |
| ADAMS  | CLERK     | D     |
| JAMES  | CLERK     | D     |
| FORD   | ANALYST   | E     |
| MILLER | CLERK     | D     |
+--------+-----------+-------+
14 rows in set (0.00 sec)
