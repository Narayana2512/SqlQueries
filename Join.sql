
mysql> CREATE DATABASE HR_DB;
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> USE HR_DB;
Database changed
mysql> CREATE TABLE DEPT (
    ->     DEPTNO INT PRIMARY KEY,
    ->     DNAME VARCHAR(20),
    ->     LOC VARCHAR(20)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE EMP (
    ->     EMPNO INT PRIMARY KEY,
    ->     ENAME VARCHAR(20),
    ->     JOB VARCHAR(20),
    ->     MGR INT,
    ->     HIREDATE DATE,
    ->     SAL DECIMAL(10,2),
    ->     COMM DECIMAL(10,2),
    ->     DEPTNO INT,
    ->     FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE SALGRADE (
    ->     GRADE INT,
    ->     LOSAL INT,
    ->     HISAL INT
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO DEPT VALUES
    -> (10,'ACCOUNTING','NEW YORK'),
    -> (20,'RESEARCH','DALLAS'),
    -> (30,'SALES','CHICAGO'),
    -> (40,'OPERATIONS','BOSTON');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO EMP VALUES
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
Query OK, 14 rows affected (0.01 sec)
Records: 14  Duplicates: 0  Warnings: 0

mysql> INSERT INTO SALGRADE VALUES
    -> (1,700,1200),
    -> (2,1201,1400),
    -> (3,1401,2000),
    -> (4,2001,3000),
    -> (5,3001,9999);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT EMPNO,
    ->        ENAME,
    ->        SAL,
    ->        DNAME,
    ->        LOC
    -> FROM EMP
    -> NATURAL JOIN DEPT;
+-------+--------+---------+------------+----------+
| EMPNO | ENAME  | SAL     | DNAME      | LOC      |
+-------+--------+---------+------------+----------+
|  7782 | CLARK  | 2450.00 | ACCOUNTING | NEW YORK |
|  7839 | KING   | 5000.00 | ACCOUNTING | NEW YORK |
|  7934 | MILLER | 1300.00 | ACCOUNTING | NEW YORK |
|  7369 | SMITH  |  800.00 | RESEARCH   | DALLAS   |
|  7566 | JONES  | 2975.00 | RESEARCH   | DALLAS   |
|  7788 | SCOTT  | 3000.00 | RESEARCH   | DALLAS   |
|  7876 | ADAMS  | 1100.00 | RESEARCH   | DALLAS   |
|  7902 | FORD   | 3000.00 | RESEARCH   | DALLAS   |
|  7499 | ALLEN  | 1600.00 | SALES      | CHICAGO  |
|  7521 | WARD   | 1250.00 | SALES      | CHICAGO  |
|  7654 | MARTIN | 1250.00 | SALES      | CHICAGO  |
|  7698 | BLAKE  | 2850.00 | SALES      | CHICAGO  |
|  7844 | TURNER | 1500.00 | SALES      | CHICAGO  |
|  7900 | JAMES  |  950.00 | SALES      | CHICAGO  |
+-------+--------+---------+------------+----------+
14 rows in set (0.00 sec)

mysql> SELECT
    -> E.JOB,
    -> E.MGR,
    -> E.SAL,
    -> E.COMM,
    -> D.DNAME
    -> FROM EMP E, DEPT D
    -> WHERE E.DEPTNO=D.DEPTNO
    -> AND E.JOB='SALESMAN';
+----------+------+---------+---------+-------+
| JOB      | MGR  | SAL     | COMM    | DNAME |
+----------+------+---------+---------+-------+
| SALESMAN | 7698 | 1600.00 |  300.00 | SALES |
| SALESMAN | 7698 | 1250.00 |  500.00 | SALES |
| SALESMAN | 7698 | 1250.00 | 1400.00 | SALES |
| SALESMAN | 7698 | 1500.00 |    0.00 | SALES |
+----------+------+---------+---------+-------+
4 rows in set (0.00 sec)

mysql> SELECT
    -> E.ENAME,
    -> E.JOB,
    -> E.DEPTNO,
    -> D.DNAME
    -> FROM EMP E, DEPT D
    -> WHERE E.DEPTNO=D.DEPTNO
    -> AND D.LOC='DALLAS';
+-------+---------+--------+----------+
| ENAME | JOB     | DEPTNO | DNAME    |
+-------+---------+--------+----------+
| SMITH | CLERK   |     20 | RESEARCH |
| JONES | MANAGER |     20 | RESEARCH |
| SCOTT | ANALYST |     20 | RESEARCH |
| ADAMS | CLERK   |     20 | RESEARCH |
| FORD  | ANALYST |     20 | RESEARCH |
+-------+---------+--------+----------+
5 rows in set (0.00 sec)

mysql> SELECT
    -> E.ENAME AS Employee,
    -> E.EMPNO AS EmpNo,
    -> M.ENAME AS Manager,
    -> M.EMPNO AS MgrNo
    -> FROM EMP E
    -> JOIN EMP M
    -> ON E.MGR=M.EMPNO;
+----------+-------+---------+-------+
| Employee | EmpNo | Manager | MgrNo |
+----------+-------+---------+-------+
| SMITH    |  7369 | FORD    |  7902 |
| ALLEN    |  7499 | BLAKE   |  7698 |
| WARD     |  7521 | BLAKE   |  7698 |
| JONES    |  7566 | KING    |  7839 |
| MARTIN   |  7654 | BLAKE   |  7698 |
| BLAKE    |  7698 | KING    |  7839 |
| CLARK    |  7782 | KING    |  7839 |
| SCOTT    |  7788 | JONES   |  7566 |
| TURNER   |  7844 | BLAKE   |  7698 |
| ADAMS    |  7876 | SCOTT   |  7788 |
| JAMES    |  7900 | BLAKE   |  7698 |
| FORD     |  7902 | JONES   |  7566 |
| MILLER   |  7934 | CLARK   |  7782 |
+----------+-------+---------+-------+
13 rows in set (0.00 sec)

mysql> SELECT
    -> E.ENAME AS Employee,
    -> E.EMPNO AS EmpNo,
    -> M.ENAME AS Manager,
    -> M.EMPNO AS MgrNo
    -> FROM EMP E
    -> LEFT JOIN EMP M
    -> ON E.MGR=M.EMPNO
    -> ORDER BY E.EMPNO;
+----------+-------+---------+-------+
| Employee | EmpNo | Manager | MgrNo |
+----------+-------+---------+-------+
| SMITH    |  7369 | FORD    |  7902 |
| ALLEN    |  7499 | BLAKE   |  7698 |
| WARD     |  7521 | BLAKE   |  7698 |
| JONES    |  7566 | KING    |  7839 |
| MARTIN   |  7654 | BLAKE   |  7698 |
| BLAKE    |  7698 | KING    |  7839 |
| CLARK    |  7782 | KING    |  7839 |
| SCOTT    |  7788 | JONES   |  7566 |
| KING     |  7839 | NULL    |  NULL |
| TURNER   |  7844 | BLAKE   |  7698 |
| ADAMS    |  7876 | SCOTT   |  7788 |
| JAMES    |  7900 | BLAKE   |  7698 |
| FORD     |  7902 | JONES   |  7566 |
| MILLER   |  7934 | CLARK   |  7782 |
+----------+-------+---------+-------+
14 rows in set (0.00 sec)

mysql> SELECT
    -> E.ENAME,
    -> E.JOB,
    -> D.DNAME,
    -> E.SAL,
    -> S.GRADE
    -> FROM EMP E
    -> JOIN DEPT D
    -> ON E.DEPTNO=D.DEPTNO
    -> JOIN SALGRADE S
    -> ON E.SAL BETWEEN S.LOSAL AND S.HISAL;
+--------+-----------+------------+---------+-------+
| ENAME  | JOB       | DNAME      | SAL     | GRADE |
+--------+-----------+------------+---------+-------+
| SMITH  | CLERK     | RESEARCH   |  800.00 |     1 |
| ALLEN  | SALESMAN  | SALES      | 1600.00 |     3 |
| WARD   | SALESMAN  | SALES      | 1250.00 |     2 |
| JONES  | MANAGER   | RESEARCH   | 2975.00 |     4 |
| MARTIN | SALESMAN  | SALES      | 1250.00 |     2 |
| BLAKE  | MANAGER   | SALES      | 2850.00 |     4 |
| CLARK  | MANAGER   | ACCOUNTING | 2450.00 |     4 |
| SCOTT  | ANALYST   | RESEARCH   | 3000.00 |     4 |
| KING   | PRESIDENT | ACCOUNTING | 5000.00 |     5 |
| TURNER | SALESMAN  | SALES      | 1500.00 |     3 |
| ADAMS  | CLERK     | RESEARCH   | 1100.00 |     1 |
| JAMES  | CLERK     | SALES      |  950.00 |     1 |
| FORD   | ANALYST   | RESEARCH   | 3000.00 |     4 |
| MILLER | CLERK     | ACCOUNTING | 1300.00 |     2 |
+--------+-----------+------------+---------+-------+
14 rows in set (0.01 sec)

mysql> SELECT
    -> E.ENAME,
    -> E.HIREDATE,
    -> M.ENAME AS MANAGER,
    -> M.HIREDATE AS MGR_HIREDATE
    -> FROM EMP E
    -> LEFT JOIN EMP M
    -> ON E.MGR=M.EMPNO
    -> WHERE E.HIREDATE<M.HIREDATE;
+-------+------------+---------+--------------+
| ENAME | HIREDATE   | MANAGER | MGR_HIREDATE |
+-------+------------+---------+--------------+
| SMITH | 1980-12-17 | FORD    | 1981-12-03   |
| ALLEN | 1981-02-20 | BLAKE   | 1981-05-01   |
| WARD  | 1981-02-22 | BLAKE   | 1981-05-01   |
| JONES | 1981-04-02 | KING    | 1981-11-17   |
| BLAKE | 1981-05-01 | KING    | 1981-11-17   |
| CLARK | 1981-06-09 | KING    | 1981-11-17   |
+-------+------------+---------+--------------+
6 rows in set (0.00 sec)

mysql> SELECT
    -> E.ENAME,
    -> D.DNAME
    -> FROM DEPT D
    -> LEFT JOIN EMP E
    -> ON D.DEPTNO=E.DEPTNO;
+--------+------------+
| ENAME  | DNAME      |
+--------+------------+
| CLARK  | ACCOUNTING |
| KING   | ACCOUNTING |
| MILLER | ACCOUNTING |
| SMITH  | RESEARCH   |
| JONES  | RESEARCH   |
| SCOTT  | RESEARCH   |
| ADAMS  | RESEARCH   |
| FORD   | RESEARCH   |
| ALLEN  | SALES      |
| WARD   | SALES      |
| MARTIN | SALES      |
| BLAKE  | SALES      |
| TURNER | SALES      |
| JAMES  | SALES      |
| NULL   | OPERATIONS |
+--------+------------+
15 rows in set (0.00 sec)

mysql> SELECT
    -> EMPNO,
    -> ENAME,
    -> DNAME,
    -> LOC
    -> FROM EMP
    -> JOIN DEPT
    -> USING(DEPTNO)
    -> WHERE JOB='CLERK';
+-------+--------+------------+----------+
| EMPNO | ENAME  | DNAME      | LOC      |
+-------+--------+------------+----------+
|  7369 | SMITH  | RESEARCH   | DALLAS   |
|  7876 | ADAMS  | RESEARCH   | DALLAS   |
|  7900 | JAMES  | SALES      | CHICAGO  |
|  7934 | MILLER | ACCOUNTING | NEW YORK |
+-------+--------+------------+----------+
4 rows in set (0.00 sec)

mysql> SELECT
    -> E.ENAME,
    -> E.SAL,
    -> E.MGR,
    -> D.DNAME
    -> FROM EMP E
    -> JOIN DEPT D
    -> ON E.DEPTNO=D.DEPTNO
    -> WHERE E.SAL>2000;
+-------+---------+------+------------+
| ENAME | SAL     | MGR  | DNAME      |
+-------+---------+------+------------+
| JONES | 2975.00 | 7839 | RESEARCH   |
| BLAKE | 2850.00 | 7839 | SALES      |
| CLARK | 2450.00 | 7839 | ACCOUNTING |
| SCOTT | 3000.00 | 7566 | RESEARCH   |
| KING  | 5000.00 | NULL | ACCOUNTING |
| FORD  | 3000.00 | 7566 | RESEARCH   |
+-------+---------+------+------------+
6 rows in set (0.00 sec)

mysql> SELECT
    -> EMPNO,
    -> ENAME,
    -> JOB,
    -> EMP.DEPTNO,
    -> DNAME,
    -> LOC
    -> FROM EMP
    -> LEFT OUTER JOIN DEPT
    -> ON EMP.DEPTNO=DEPT.DEPTNO;
+-------+--------+-----------+--------+------------+----------+
| EMPNO | ENAME  | JOB       | DEPTNO | DNAME      | LOC      |
+-------+--------+-----------+--------+------------+----------+
|  7369 | SMITH  | CLERK     |     20 | RESEARCH   | DALLAS   |
|  7499 | ALLEN  | SALESMAN  |     30 | SALES      | CHICAGO  |
|  7521 | WARD   | SALESMAN  |     30 | SALES      | CHICAGO  |
|  7566 | JONES  | MANAGER   |     20 | RESEARCH   | DALLAS   |
|  7654 | MARTIN | SALESMAN  |     30 | SALES      | CHICAGO  |
|  7698 | BLAKE  | MANAGER   |     30 | SALES      | CHICAGO  |
|  7782 | CLARK  | MANAGER   |     10 | ACCOUNTING | NEW YORK |
|  7788 | SCOTT  | ANALYST   |     20 | RESEARCH   | DALLAS   |
|  7839 | KING   | PRESIDENT |     10 | ACCOUNTING | NEW YORK |
|  7844 | TURNER | SALESMAN  |     30 | SALES      | CHICAGO  |
|  7876 | ADAMS  | CLERK     |     20 | RESEARCH   | DALLAS   |
|  7900 | JAMES  | CLERK     |     30 | SALES      | CHICAGO  |
|  7902 | FORD   | ANALYST   |     20 | RESEARCH   | DALLAS   |
|  7934 | MILLER | CLERK     |     10 | ACCOUNTING | NEW YORK |
+-------+--------+-----------+--------+------------+----------+
14 rows in set (0.00 sec)

mysql> SELECT
    -> ENAME,
    -> DNAME
    -> FROM EMP
    -> RIGHT OUTER JOIN DEPT
    -> ON EMP.DEPTNO=DEPT.DEPTNO;
+--------+------------+
| ENAME  | DNAME      |
+--------+------------+
| CLARK  | ACCOUNTING |
| KING   | ACCOUNTING |
| MILLER | ACCOUNTING |
| SMITH  | RESEARCH   |
| JONES  | RESEARCH   |
| SCOTT  | RESEARCH   |
| ADAMS  | RESEARCH   |
| FORD   | RESEARCH   |
| ALLEN  | SALES      |
| WARD   | SALES      |
| MARTIN | SALES      |
| BLAKE  | SALES      |
| TURNER | SALES      |
| JAMES  | SALES      |
| NULL   | OPERATIONS |
+--------+------------+
15 rows in set (0.00 sec)

mysql> SELECT
    -> EMPNO,
    -> DNAME,
    -> LOC
    -> FROM EMP
    -> LEFT JOIN DEPT
    -> ON EMP.DEPTNO=DEPT.DEPTNO
    ->
    -> UNION
    ->
    -> SELECT
    -> EMPNO,
    -> DNAME,
    -> LOC
    -> FROM EMP
    -> RIGHT JOIN DEPT
    -> ON EMP.DEPTNO=DEPT.DEPTNO;
+-------+------------+----------+
| EMPNO | DNAME      | LOC      |
+-------+------------+----------+
|  7782 | ACCOUNTING | NEW YORK |
|  7839 | ACCOUNTING | NEW YORK |
|  7934 | ACCOUNTING | NEW YORK |
|  7369 | RESEARCH   | DALLAS   |
|  7566 | RESEARCH   | DALLAS   |
|  7788 | RESEARCH   | DALLAS   |
|  7876 | RESEARCH   | DALLAS   |
|  7902 | RESEARCH   | DALLAS   |
|  7499 | SALES      | CHICAGO  |
|  7521 | SALES      | CHICAGO  |
|  7654 | SALES      | CHICAGO  |
|  7698 | SALES      | CHICAGO  |
|  7844 | SALES      | CHICAGO  |
|  7900 | SALES      | CHICAGO  |
|  NULL | OPERATIONS | BOSTON   |
+-------+------------+----------+
15 rows in set (0.00 sec)

mysql>