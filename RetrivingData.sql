mysql> CREATE DATABASE company_db;
ERROR 1007 (HY000): Can't create database 'company_db'; database exists
mysql> CREATE DATABASE companies_db;
Query OK, 1 row affected (0.03 sec)

mysql> USE companies_db;
Database changed
mysql>
mysql> CREATE TABLE DEPT (
    ->     DEPTNO INT PRIMARY KEY,
    ->     DNAME VARCHAR(30),
    ->     LOC VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO DEPT VALUES
    -> (10,'ACCOUNTING','NEW YORK'),
    -> (20,'RESEARCH','DALLAS'),
    -> (30,'SALES','CHICAGO'),
    -> (40,'OPERATIONS','BOSTON');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE EMP (
    ->     EMPNO INT PRIMARY KEY,
    ->     ENAME VARCHAR(30),
    ->     JOB VARCHAR(30),
    ->     MGR INT,
    ->     HIREDATE DATE,
    ->     SAL DECIMAL(10,2),
    ->     COMM DECIMAL(10,2),
    ->     DEPTNO INT,
    ->     FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO EMP VALUES
    -> (7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
    -> (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
    -> (7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
    -> (7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
    -> (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
    -> (7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
    -> (7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),
    -> (7788,'SCOTT','ANALYST',7566,'1987-07-13',3000,NULL,20),
    -> (7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
    -> (7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
    -> (7876,'ADAMS','CLERK',7788,'1987-07-13',1100,NULL,20),
    -> (7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
    -> (7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
    -> (7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);
Query OK, 14 rows affected (0.01 sec)
Records: 14  Duplicates: 0  Warnings: 0

mysql> DESCRIBE DEPT;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| DEPTNO | int         | NO   | PRI | NULL    |       |
| DNAME  | varchar(30) | YES  |     | NULL    |       |
| LOC    | varchar(30) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.02 sec)

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

mysql> DESCRIBE EMP;
+----------+---------------+------+-----+---------+-------+
| Field    | Type          | Null | Key | Default | Extra |
+----------+---------------+------+-----+---------+-------+
| EMPNO    | int           | NO   | PRI | NULL    |       |
| ENAME    | varchar(30)   | YES  |     | NULL    |       |
| JOB      | varchar(30)   | YES  |     | NULL    |       |
| MGR      | int           | YES  |     | NULL    |       |
| HIREDATE | date          | YES  |     | NULL    |       |
| SAL      | decimal(10,2) | YES  |     | NULL    |       |
| COMM     | decimal(10,2) | YES  |     | NULL    |       |
| DEPTNO   | int           | YES  | MUL | NULL    |       |
+----------+---------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

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

mysql>
mysql> SELECT ENAME, DEPTNO
    -> FROM EMP
    -> WHERE EMPNO = 7788;
+-------+--------+
| ENAME | DEPTNO |
+-------+--------+
| SCOTT |     20 |
+-------+--------+
1 row in set (0.00 sec)

mysql>