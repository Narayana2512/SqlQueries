
SQL> CREATE TABLE DEPT1
  2  (
  3      DEPTNO INTEGER PRIMARY KEY,
  4      DNAME VARCHAR2(30) NOT NULL,
  5      LOC VARCHAR2(30) NOT NULL
  6  );

Table created.

SQL> CREATE TABLE DEPT1
  2  (
  3      DEPTNO INTEGER PRIMARY KEY,
  4      DNAME VARCHAR2(30) NOT NULL,
  5      LOC VARCHAR2(30) NOT NULL
  6  );
CREATE TABLE DEPT1
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object


SQL> INSERT INTO DEPT1 VALUES (10,'ACCOUNTING','NEW YORK');

1 row created.

SQL> INSERT INTO DEPT1 VALUES (20,'RESEARCH','DALLAS');

1 row created.

SQL> INSERT INTO DEPT1 VALUES (30,'SALES','CHICAGO');

1 row created.

SQL> INSERT INTO DEPT1 VALUES (40,'OPERATIONS','BOSTON');

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> CREATE TABLE EMP1
  2  (
  3      EMPNO INTEGER PRIMARY KEY,
  4      ENAME VARCHAR2(20) NOT NULL,
  5      SAL NUMBER(10,2) CHECK(SAL>5000),
  6      MGR NUMBER,
  7      DEPTNO INTEGER,
  8      CONSTRAINT FK_MGR FOREIGN KEY(MGR)
  9      REFERENCES EMP1(EMPNO),
 10      CONSTRAINT FK_DEPT FOREIGN KEY(DEPTNO)
 11      REFERENCES DEPT1(DEPTNO)
 12  );

Table created.

SQL> INSERT INTO EMP1 VALUES (1001,'KING',50000,NULL,10);

1 row created.

SQL> INSERT INTO EMP1 VALUES (1002,'BLAKE',30000,1001,30);

1 row created.

SQL> INSERT INTO EMP1 VALUES (1003,'CLARK',25000,1001,10);

1 row created.

SQL> INSERT INTO EMP1 VALUES (1004,'JONES',28000,1001,20);

1 row created.

SQL> INSERT INTO EMP1 VALUES (1005,'SCOTT',22000,1004,20);

1 row created.

SQL> INSERT INTO EMP1 VALUES (1006,'ALLEN',18000,1002,30);

1 row created.

SQL> INSERT INTO EMP1 VALUES (1007,'SMITH',12000,1005,20);

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> CREATE TABLE DEPT11
  2  AS
  3  SELECT * FROM DEPT1;

Table created.

SQL>
SQL> CREATE TABLE EMP11
  2  AS
  3  SELECT * FROM EMP1;

Table created.

SQL> ALTER TABLE EMP1
  2  ADD ADDRESS VARCHAR2(30);

Table altered.

SQL> ALTER TABLE EMP1
  2  RENAME COLUMN SAL TO SALARY;

Table altered.

SQL> ALTER TABLE EMP1
  2  RENAME COLUMN SAL TO SALARY;
ALTER TABLE EMP1
*
ERROR at line 1:
ORA-00957: duplicate column name


SQL> ALTER TABLE EMP1
  2  RENAME CONSTRAINT FK_MGR TO FK_MANAGER;

Table altered.

SQL>
SQL> ALTER TABLE EMP1
  2  RENAME CONSTRAINT FK_DEPT TO FK_DEPARTMENT;

Table altered.

SQL> SELECT CONSTRAINT_NAME
  2  FROM USER_CONSTRAINTS
  3  WHERE TABLE_NAME='EMP1';

CONSTRAINT_NAME
--------------------------------------------------------------------------------
FK_MANAGER
FK_DEPARTMENT
SYS_C007493
SYS_C007494
SYS_C007495

SQL> ALTER TABLE EMP1
  2  MODIFY ENAME VARCHAR2(40);

Table altered.

SQL> ALTER TABLE EMP1
  2  MODIFY ENAME NULL;

Table altered.

SQL> COMMENT ON TABLE DEPT1
  2  IS 'Depts of WIPRO';

Comment created.

SQL> COMMENT ON COLUMN DEPT1.DEPTNO
  2  IS 'Deptno of WIPRO';

Comment created.

SQL> COMMENT ON COLUMN EMP1.EMPNO
  2  IS 'Empno of WIPRO';

Comment created.

SQL> COMMENT ON TABLE DEPT1 IS '';

Comment created.

SQL>
SQL> COMMENT ON COLUMN DEPT1.DEPTNO IS '';

Comment created.

SQL>
SQL> COMMENT ON TABLE EMP1 IS '';

Comment created.

SQL>
SQL> COMMENT ON COLUMN EMP1.EMPNO IS '';

Comment created.

SQL> ALTER TABLE EMP1
  2  SET UNUSED (SALARY,ENAME);

Table altered.

SQL> ALTER TABLE EMP1
  2  SET UNUSED (SALARY,ENAME);
SET UNUSED (SALARY,ENAME)
                   *
ERROR at line 2:
ORA-00904: "ENAME": invalid identifier


SQL> DROP TABLE EMP1 CASCADE CONSTRAINTS;

Table dropped.

SQL>
SQL> DROP TABLE DEPT1 CASCADE CONSTRAINTS;

Table dropped.

SQL> CREATE TABLE EMP1
  2  AS
  3  SELECT *
  4  FROM EMP;

Table created.

SQL>
SQL> SELECT * FROM EMP1;

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

SQL> ALTER TABLE EMP1
  2  RENAME TO EMP_TEST;

Table altered.

SQL> TRUNCATE TABLE EMP_TEST;

Table truncated.

SQL>
SQL> SELECT COUNT(*) FROM EMP_TEST;

  COUNT(*)
----------
         0

SQL> TRUNCATE TABLE EMP_TEST;

Table truncated.

SQL>
SQL> SELECT COUNT(*) FROM EMP_TEST;

  COUNT(*)
----------
         0

SQL> DROP TABLE EMP2;
DROP TABLE EMP2
           *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> CREATE TABLE EMP2
  2  AS
  3  SELECT EMPNO,ENAME,SAL
  4  FROM EMP
  5  WHERE 1=2;

Table created.

SQL> SELECT * FROM EMP2;

no rows selected

SQL> DROP TABLE EMP2;

Table dropped.

SQL> FLASHBACK TABLE EMP2 TO BEFORE DROP;

Flashback complete.

SQL> SELECT * FROM EMP2;

no rows selected

SQL> FLASHBACK TABLE EMP2 TO BEFORE DROP
  2  RENAME TO EMP2_1;
FLASHBACK TABLE EMP2 TO BEFORE DROP
*
ERROR at line 1:
ORA-38305: object not in RECYCLE BIN


SQL> SELECT * FROM EMP2_1;
SELECT * FROM EMP2_1
              *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> SELECT TABLE_NAME
  2  FROM USER_TABLES;

TABLE_NAME
--------------------------------------------------------------------------------
LODGE_DETAILS
EMP_DETAILS
SKILL_DETAILS
EMP_SKILL
DEPT
EMP
EMP_TEST
EMP2
DEPT11
EMP11

10 rows selected.

SQL> SELECT * FROM TAB;

TNAME
--------------------------------------------------------------------------------
TABTYPE        CLUSTERID
------------- ----------
LODGE_DETAILS
TABLE

EMP_DETAILS
TABLE

SKILL_DETAILS
TABLE


TNAME
--------------------------------------------------------------------------------
TABTYPE        CLUSTERID
------------- ----------
EMP_SKILL
TABLE

EMP_VIEW
VIEW

EMPV
SYNONYM


TNAME
--------------------------------------------------------------------------------
TABTYPE        CLUSTERID
------------- ----------
DEPT
TABLE

EMP
TABLE

EMP_TEST
TABLE


TNAME
--------------------------------------------------------------------------------
TABTYPE        CLUSTERID
------------- ----------
EMP2
TABLE

BIN$ZKRkxHqXRBmxBPmczpXxhg==$0
TABLE

DEPT11
TABLE


TNAME
--------------------------------------------------------------------------------
TABTYPE        CLUSTERID
------------- ----------
EMP11
TABLE

BIN$fzmB6MJGR5m2Tir9BlR3qg==$0
TABLE


14 rows selected.

SQL>