
SQL> CREATE TABLE EmpTest AS
  2  SELECT * FROM Emp;

Table created.

SQL> INSERT INTO EmpTest (Empno, Ename, Sal)
  2  VALUES (9999, USER, 5000);

1 row created.

SQL> UPDATE EmpTest
  2  SET Sal = Sal * 1.15
  3  WHERE Ename = 'TURNER';

1 row updated.

SQL> ^BSELECT Empno, Ename, Sal
SP2-0734: unknown command beginning "SELECT Em..." - rest of line ignored.
SQL> FROM EmpTest
SP2-0734: unknown command beginning "FROM EmpTe..." - rest of line ignored.
SQL> WHERE Ename = 'TURNER';
SP2-0734: unknown command beginning "WHERE Enam..." - rest of line ignored.
SQL> SELECT Empno, Ename, Sal
  2  FROM EmpTest
  3  WHERE Ename = 'TURNER';

     EMPNO ENAME                       SAL
---------- -------------------- ----------
      7844 TURNER                     1725

SQL> UPDATE EmpTest
  2  SET Sal = (SELECT Sal
  3             FROM EmpTest
  4             WHERE Ename = 'SCOTT')
  5  WHERE Ename = 'SMITH';

1 row updated.

SQL> UPDATE EmpTest
  2  SET Sal = Sal * 1.10
  3  WHERE Deptno = (
  4        SELECT Deptno
  5        FROM Dept
  6        WHERE Loc = 'NEW YORK');

3 rows updated.

SQL> UPDATE EmpTest
  2  SET Comm = NULL;

15 rows updated.

SQL> DELETE FROM EmpTest
  2  WHERE Deptno = (
  3        SELECT Deptno
  4        FROM Dept
  5        WHERE Dname = 'SALES');

6 rows deleted.

SQL> DELETE FROM EmpTest
  2  WHERE Deptno = (
  3        SELECT Deptno
  4        FROM EmpTest
  5        WHERE Ename = UPPER('&ENAME'))
  6  AND Ename <> UPPER('&ENAME');
Enter value for ename: Abhi
old   5:       WHERE Ename = UPPER('&ENAME'))
new   5:       WHERE Ename = UPPER('Abhi'))
Enter value for ename: Miller
old   6: AND Ename <> UPPER('&ENAME')
new   6: AND Ename <> UPPER('Miller')

0 rows deleted.

SQL> CREATE TABLE Emp2 AS
  2  SELECT Empno, Ename, Sal
  3  FROM Emp
  4  WHERE 1 = 0;
CREATE TABLE Emp2 AS
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object


SQL> CREATE TABLE Emp2 AS
  2  SELECT Empno, Ename, Sal
  3  FROM Emp
  4  WHERE 1 = 0;
CREATE TABLE Emp2 AS
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object


SQL>
SQL> CREATE TABLE Emp2 AS
  2  SELECT Empno, Ename, Sal
  3  FROM Emp
  4  WHERE 1 = 0;
CREATE TABLE Emp2 AS
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object


SQL> SELECT object_name, object_type
  2  FROM user_objects
  3  WHERE object_name = 'EMP2';

OBJECT_NAME
--------------------------------------------------------------------------------
OBJECT_TYPE
-----------------------
EMP2
TABLE


SQL> DROP TABLE Emp2;

Table dropped.

SQL> DROP TABLE Emp2 CASCADE CONSTRAINTS;
DROP TABLE Emp2 CASCADE CONSTRAINTS
           *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> CREATE TABLE Emp2 AS
  2  SELECT Empno, Ename, Sal
  3  FROM Emp
  4  WHERE 1 = 0;

Table created.

SQL> CREATE TABLE Emp2 AS
  2  SELECT Empno, Ename, Sal
  3  FROM Emp
  4  WHERE 1 = 0;
CREATE TABLE Emp2 AS
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object


SQL>
SQL> CREATE TABLE Emp3 AS
  2  SELECT Empno, Job
  3  FROM Emp
  4  WHERE 1 = 0;

Table created.

SQL> INSERT ALL
  2      INTO Emp2 (Empno, Ename, Sal)
  3      VALUES (Empno, Ename, Sal)
  4      INTO Emp3 (Empno, Job)
  5      VALUES (Empno, Job)
  6  SELECT Empno, Ename, Sal, Job
  7  FROM Emp;

28 rows created.

SQL> TRUNCATE TABLE Emp2;

Table truncated.

SQL>
SQL> INSERT INTO Emp2 VALUES (7788, 'SMITH', 4500);

1 row created.

SQL> INSERT INTO Emp2 VALUES (7654, 'JACK', 3500);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> MERGE INTO Emp2 E2
  2  USING Emp E
  3  ON (E2.Empno = E.Empno)
  4  WHEN MATCHED THEN
  5  UPDATE SET
  6      E2.Ename = E.Ename,
  7      E2.Sal = E.Sal
  8  WHEN NOT MATCHED THEN
  9  INSERT (Empno, Ename, Sal)
 10  VALUES (E.Empno, E.Ename, E.Sal);

14 rows merged.

SQL> SELECT * FROM Emp2;

     EMPNO ENAME                       SAL
---------- -------------------- ----------
      7788 SCOTT                      3000
      7654 MARTIN                     1250
      7782 CLARK                      2450
      7698 BLAKE                      2850
      7876 ADAMS                      1100
      7521 WARD                       1250
      7566 JONES                      2975
      7902 FORD                       3000
      7499 ALLEN                      1600
      7900 JAMES                       950
      7369 SMITH                       800

     EMPNO ENAME                       SAL
---------- -------------------- ----------
      7934 MILLER                     1300
      7839 KING                       5000
      7844 TURNER                     1500

14 rows selected.

SQL> ROLLBACK;

Rollback complete.

SQL> MERGE INTO Emp2 E2
  2  USING Emp E
  3  ON (E2.Empno = E.Empno)
  4  WHEN MATCHED THEN
  5  UPDATE SET
  6      E2.Ename = E.Ename,
  7      E2.Sal = E.Sal
  8  WHERE E.Empno = 7788
  9  WHEN NOT MATCHED THEN
 10  INSERT (Empno, Ename, Sal)
 11  VALUES (E.Empno, E.Ename, E.Sal)
 12  WHERE E.Sal > 3000;

2 rows merged.

SQL> ELECT * FROM Emp2;
SP2-0734: unknown command beginning "ELECT * FR..." - rest of line ignored.
SQL> SELECT * FROM Emp2;

     EMPNO ENAME                       SAL
---------- -------------------- ----------
      7788 SCOTT                      3000
      7654 JACK                       3500
      7839 KING                       5000

SQL> CREATE USER WIPRO
  2  IDENTIFIED BY WIPRO;

User created.

SQL> GRANT ALL
  2  ON Emp
  3  TO WIPRO;

Grant succeeded.

SQL> DELETE FROM Emp
  2  WHERE Deptno = 10;

3 rows deleted.

SQL> DELETE FROM SCOTT.Emp
  2  WHERE Deptno = 10;
DELETE FROM SCOTT.Emp
                  *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL>
SQL> ROLLBACK;

Rollback complete.

SQL> SELECT *
  2  FROM Emp
  3  FOR UPDATE WAIT 20;

     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7369 SMITH                CLERK                      7902 17-DEC-80
       800                    20

      7499 ALLEN                SALESMAN                   7698 20-FEB-81
      1600        300         30

      7521 WARD                 SALESMAN                   7698 22-FEB-81
      1250        500         30


     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7566 JONES                MANAGER                    7839 02-APR-81
      2975                    20

      7654 MARTIN               SALESMAN                   7698 28-SEP-81
      1250       1400         30

      7698 BLAKE                MANAGER                    7839 01-MAY-81
      2850                    30


     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7782 CLARK                MANAGER                    7839 09-JUN-81
      2450                    10

      7788 SCOTT                ANALYST                    7566 19-APR-87
      3000                    20

      7839 KING                 PRESIDENT                       17-NOV-81
      5000                    10


     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7844 TURNER               SALESMAN                   7698 08-SEP-81
      1500          0         30

      7876 ADAMS                CLERK                      7788 23-MAY-87
      1100                    20

      7900 JAMES                CLERK                      7698 03-DEC-81
       950                    30


     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7902 FORD                 ANALYST                    7566 03-DEC-81
      3000                    20

      7934 MILLER               CLERK                      7782 23-JAN-82
      1300                    10


14 rows selected.

SQL> ROLLBACK;

Rollback complete.

SQL> ROLLBACK;

Rollback complete.
