mysql> CREATE DATABASE employee_db;
Query OK, 1 row affected (0.01 sec)

mysql> USE employee_db;
Database changed
mysql> CREATE TABLE DEPT
    -> (
    ->     DEPTNO INT PRIMARY KEY,
    ->     DNAME VARCHAR(30) NOT NULL,
    ->     LOC VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO DEPT VALUES
    -> (10,'ACCOUNTING','NEW YORK'),
    -> (20,'RESEARCH','DALLAS'),
    -> (30,'SALES','CHICAGO'),
    -> (40,'OPERATIONS','BOSTON');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE EMP
    -> (
    ->     EMPNO INT PRIMARY KEY,
    ->     ENAME VARCHAR(30) NOT NULL,
    ->     JOB VARCHAR(30),
    ->     MGR INT,
    ->     HIREDATE DATE,
    ->     SAL DECIMAL(10,2),
    ->     COMM DECIMAL(10,2),
    ->     DEPTNO INT,
    ->
    ->     FOREIGN KEY(DEPTNO)
    ->     REFERENCES DEPT(DEPTNO)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO EMP VALUES
    -> (7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
    ->
    -> (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
    ->
    -> (7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
    ->
    -> (7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
    ->
    -> (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
    ->
    -> (7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
    ->
    -> (7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),
    ->
    -> (7788,'SCOTT','ANALYST',7566,'1987-07-13',3000,NULL,20),
    ->
    -> (7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
    ->
    -> (7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
    ->
    -> (7876,'ADAMS','CLERK',7788,'1987-07-13',1100,NULL,20),
    ->
    -> (7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
    ->
    -> (7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
    ->
    -> (7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);
Query OK, 14 rows affected (0.01 sec)
Records: 14  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM DEPT;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM EMP;
+-------+--------+-----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1987-07-13 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1987-07-13 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.00 sec)

mysql> SELECT ENAME, SAL, COMM
    -> FROM EMP
    -> WHERE COMM IS NOT NULL
    -> ORDER BY 2 DESC, 3 DESC;
+--------+---------+---------+
| ENAME  | SAL     | COMM    |
+--------+---------+---------+
| ALLEN  | 1600.00 |  300.00 |
| TURNER | 1500.00 |    0.00 |
| MARTIN | 1250.00 | 1400.00 |
| WARD   | 1250.00 |  500.00 |
+--------+---------+---------+
4 rows in set (0.00 sec)

mysql> SELECT DISTINCT JOB
    -> FROM EMP;
+-----------+
| JOB       |
+-----------+
| CLERK     |
| SALESMAN  |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
+-----------+
5 rows in set (0.01 sec)

mysql> SELECT
    -> EMPNO AS 'Emp #',
    -> ENAME AS 'Employee',
    -> JOB AS 'Job',
    -> HIREDATE AS 'Hire Date'
    -> FROM EMP;
+-------+----------+-----------+------------+
| Emp # | Employee | Job       | Hire Date  |
+-------+----------+-----------+------------+
|  7369 | SMITH    | CLERK     | 1980-12-17 |
|  7499 | ALLEN    | SALESMAN  | 1981-02-20 |
|  7521 | WARD     | SALESMAN  | 1981-02-22 |
|  7566 | JONES    | MANAGER   | 1981-04-02 |
|  7654 | MARTIN   | SALESMAN  | 1981-09-28 |
|  7698 | BLAKE    | MANAGER   | 1981-05-01 |
|  7782 | CLARK    | MANAGER   | 1981-06-09 |
|  7788 | SCOTT    | ANALYST   | 1987-07-13 |
|  7839 | KING     | PRESIDENT | 1981-11-17 |
|  7844 | TURNER   | SALESMAN  | 1981-09-08 |
|  7876 | ADAMS    | CLERK     | 1987-07-13 |
|  7900 | JAMES    | CLERK     | 1981-12-03 |
|  7902 | FORD     | ANALYST   | 1981-12-03 |
|  7934 | MILLER   | CLERK     | 1982-01-23 |
+-------+----------+-----------+------------+
14 rows in set (0.00 sec)

mysql> SELECT
    -> CONCAT(ENAME, ', ', JOB) AS 'Employee and Title'
    -> FROM EMP;
+--------------------+
| Employee and Title |
+--------------------+
| SMITH, CLERK       |
| ALLEN, SALESMAN    |
| WARD, SALESMAN     |
| JONES, MANAGER     |
| MARTIN, SALESMAN   |
| BLAKE, MANAGER     |
| CLARK, MANAGER     |
| SCOTT, ANALYST     |
| KING, PRESIDENT    |
| TURNER, SALESMAN   |
| ADAMS, CLERK       |
| JAMES, CLERK       |
| FORD, ANALYST      |
| MILLER, CLERK      |
+--------------------+
14 rows in set (0.00 sec)

mysql> SELECT
    -> CONCAT(ENAME, ',', JOB, ',', HIREDATE, ',', MGR) AS THE_OUTPUT
    -> FROM EMP;
+---------------------------------+
| THE_OUTPUT                      |
+---------------------------------+
| SMITH,CLERK,1980-12-17,7902     |
| ALLEN,SALESMAN,1981-02-20,7698  |
| WARD,SALESMAN,1981-02-22,7698   |
| JONES,MANAGER,1981-04-02,7839   |
| MARTIN,SALESMAN,1981-09-28,7698 |
| BLAKE,MANAGER,1981-05-01,7839   |
| CLARK,MANAGER,1981-06-09,7839   |
| SCOTT,ANALYST,1987-07-13,7566   |
| NULL                            |
| TURNER,SALESMAN,1981-09-08,7698 |
| ADAMS,CLERK,1987-07-13,7788     |
| JAMES,CLERK,1981-12-03,7698     |
| FORD,ANALYST,1981-12-03,7566    |
| MILLER,CLERK,1982-01-23,7782    |
+---------------------------------+
14 rows in set (0.00 sec)

mysql> SELECT ENAME, JOB, HIREDATE
    -> FROM EMP
    -> WHERE ENAME IN ('SCOTT','TURNER')
    -> ORDER BY HIREDATE;
+--------+----------+------------+
| ENAME  | JOB      | HIREDATE   |
+--------+----------+------------+
| TURNER | SALESMAN | 1981-09-08 |
| SCOTT  | ANALYST  | 1987-07-13 |
+--------+----------+------------+
2 rows in set (0.00 sec)

mysql> SELECT ENAME, DEPTNO
    -> FROM EMP
    -> WHERE DEPTNO IN (20,30)
    -> ORDER BY ENAME;
+--------+--------+
| ENAME  | DEPTNO |
+--------+--------+
| ADAMS  |     20 |
| ALLEN  |     30 |
| BLAKE  |     30 |
| FORD   |     20 |
| JAMES  |     30 |
| JONES  |     20 |
| MARTIN |     30 |
| SCOTT  |     20 |
| SMITH  |     20 |
| TURNER |     30 |
| WARD   |     30 |
+--------+--------+
11 rows in set (0.00 sec)

mysql> SELECT
    -> ENAME AS Employee,
    -> SAL AS 'Monthly Salary'
    -> FROM EMP
    -> WHERE SAL BETWEEN 2000 AND 3000
    -> AND DEPTNO IN (20,30);
+----------+----------------+
| Employee | Monthly Salary |
+----------+----------------+
| JONES    |        2975.00 |
| BLAKE    |        2850.00 |
| SCOTT    |        3000.00 |
| FORD     |        3000.00 |
+----------+----------------+
4 rows in set (0.01 sec)

mysql> SELECT ENAME, HIREDATE
    -> FROM EMP
    -> WHERE YEAR(HIREDATE)=1981;
+--------+------------+
| ENAME  | HIREDATE   |
+--------+------------+
| ALLEN  | 1981-02-20 |
| WARD   | 1981-02-22 |
| JONES  | 1981-04-02 |
| MARTIN | 1981-09-28 |
| BLAKE  | 1981-05-01 |
| CLARK  | 1981-06-09 |
| KING   | 1981-11-17 |
| TURNER | 1981-09-08 |
| JAMES  | 1981-12-03 |
| FORD   | 1981-12-03 |
+--------+------------+
10 rows in set (0.00 sec)

mysql> SELECT ENAME, SAL
    -> FROM EMP
    -> WHERE SAL > 2000;
+-------+---------+
| ENAME | SAL     |
+-------+---------+
| JONES | 2975.00 |
| BLAKE | 2850.00 |
| CLARK | 2450.00 |
| SCOTT | 3000.00 |
| KING  | 5000.00 |
| FORD  | 3000.00 |
+-------+---------+
6 rows in set (0.00 sec)

mysql> SELECT EMPNO, ENAME, SAL, DEPTNO
    -> FROM EMP
    -> WHERE MGR = 7698
    -> ORDER BY ENAME;
+-------+--------+---------+--------+
| EMPNO | ENAME  | SAL     | DEPTNO |
+-------+--------+---------+--------+
|  7499 | ALLEN  | 1600.00 |     30 |
|  7900 | JAMES  |  950.00 |     30 |
|  7654 | MARTIN | 1250.00 |     30 |
|  7844 | TURNER | 1500.00 |     30 |
|  7521 | WARD   | 1250.00 |     30 |
+-------+--------+---------+--------+
5 rows in set (0.00 sec)

mysql> SELECT EMPNO, ENAME, SAL, DEPTNO
    -> FROM EMP
    -> WHERE MGR = 7566
    -> ORDER BY SAL;
+-------+-------+---------+--------+
| EMPNO | ENAME | SAL     | DEPTNO |
+-------+-------+---------+--------+
|  7788 | SCOTT | 3000.00 |     20 |
|  7902 | FORD  | 3000.00 |     20 |
+-------+-------+---------+--------+
2 rows in set (0.00 sec)

mysql> SELECT ENAME
    -> FROM EMP
    -> WHERE ENAME LIKE '__A%';
+-------+
| ENAME |
+-------+
| BLAKE |
| CLARK |
| ADAMS |
+-------+
3 rows in set (0.00 sec)

mysql> SELECT ENAME
    -> FROM EMP
    -> WHERE ENAME LIKE '%A%'
    -> AND ENAME LIKE '%S%';
+-------+
| ENAME |
+-------+
| ADAMS |
| JAMES |
+-------+
2 rows in set (0.00 sec)

mysql> SELECT ENAME, JOB, SAL
    -> FROM EMP
    -> WHERE JOB='CLERK'
    -> AND SAL IN (800,950,1300);
+--------+-------+---------+
| ENAME  | JOB   | SAL     |
+--------+-------+---------+
| SMITH  | CLERK |  800.00 |
| JAMES  | CLERK |  950.00 |
| MILLER | CLERK | 1300.00 |
+--------+-------+---------+
3 rows in set (0.00 sec)

mysql>