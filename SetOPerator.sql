
mysql> CREATE DATABASE SetOperatorDB;
Query OK, 1 row affected (0.02 sec)

mysql> USE SetOperatorDB;
Database changed
mysql> CREATE TABLE EMP (
    ->     EMPNO INT PRIMARY KEY,
    ->     ENAME VARCHAR(20),
    ->     JOB VARCHAR(20),
    ->     MGR INT,
    ->     HIREDATE DATE,
    ->     SAL DECIMAL(10,2),
    ->     COMM DECIMAL(10,2),
    ->     DEPTNO INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO EMP VALUES
    -> (7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
    -> (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
    -> (7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
    -> (7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
    -> (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
    -> (7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
    -> (7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),
    -> (7788,'SCOTT','ANALYST',7566,'1982-12-09',3000,NULL,20),
    -> (7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
    -> (7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
    -> (7876,'ADAMS','CLERK',7788,'1983-01-12',1100,NULL,20),
    -> (7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
    -> (7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
    -> (7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);
Query OK, 14 rows affected (0.01 sec)
Records: 14  Duplicates: 0  Warnings: 0

mysql> SELECT
    ->     JOB AS Job,
    ->     DEPTNO AS Department_No,
    ->     SUM(SAL) AS Department_Job_Salary
    -> FROM EMP
    -> WHERE DEPTNO IN (10,20,30)
    -> GROUP BY DEPTNO, JOB
    ->
    -> UNION ALL
    ->
    -> SELECT
    ->     'TOTAL',
    ->     NULL,
    ->     SUM(SAL)
    -> FROM EMP
    -> WHERE DEPTNO IN (10,20,30);
+-----------+---------------+-----------------------+
| Job       | Department_No | Department_Job_Salary |
+-----------+---------------+-----------------------+
| CLERK     |            20 |               1900.00 |
| SALESMAN  |            30 |               5600.00 |
| MANAGER   |            20 |               2975.00 |
| MANAGER   |            30 |               2850.00 |
| MANAGER   |            10 |               2450.00 |
| ANALYST   |            20 |               6000.00 |
| PRESIDENT |            10 |               5000.00 |
| CLERK     |            30 |                950.00 |
| CLERK     |            10 |               1300.00 |
| TOTAL     |          NULL |              29025.00 |
+-----------+---------------+-----------------------+
10 rows in set (0.01 sec)

mysql> SELECT
    ->     CONCAT('Department ', DEPTNO) AS Category,
    ->     SUM(SAL) AS Total_Salary
    -> FROM EMP
    -> GROUP BY DEPTNO
    ->
    -> UNION ALL
    ->
    -> SELECT
    ->     CONCAT('Job ', JOB),
    ->     SUM(SAL)
    -> FROM EMP
    -> GROUP BY JOB
    ->
    -> UNION ALL
    ->
    -> SELECT
    ->     'Grand Total',
    ->     SUM(SAL)
    -> FROM EMP;
+---------------+--------------+
| Category      | Total_Salary |
+---------------+--------------+
| Department 20 |     10875.00 |
| Department 30 |      9400.00 |
| Department 10 |      8750.00 |
| Job CLERK     |      4150.00 |
| Job SALESMAN  |      5600.00 |
| Job MANAGER   |      8275.00 |
| Job ANALYST   |      6000.00 |
| Job PRESIDENT |      5000.00 |
| Grand Total   |     29025.00 |
+---------------+--------------+
9 rows in set (0.00 sec)

mysql> SELECT JOB, DEPTNO
    -> FROM EMP
    -> WHERE DEPTNO = 20
    ->
    -> UNION ALL
    ->
    -> SELECT JOB, DEPTNO
    -> FROM EMP
    -> WHERE DEPTNO = 10
    ->
    -> UNION ALL
    ->
    -> SELECT JOB, DEPTNO
    -> FROM EMP
    -> WHERE DEPTNO = 30;
+-----------+--------+
| JOB       | DEPTNO |
+-----------+--------+
| CLERK     |     20 |
| MANAGER   |     20 |
| ANALYST   |     20 |
| CLERK     |     20 |
| ANALYST   |     20 |
| MANAGER   |     10 |
| PRESIDENT |     10 |
| CLERK     |     10 |
| SALESMAN  |     30 |
| SALESMAN  |     30 |
| SALESMAN  |     30 |
| MANAGER   |     30 |
| SALESMAN  |     30 |
| CLERK     |     30 |
+-----------+--------+
14 rows in set (0.00 sec)

mysql>