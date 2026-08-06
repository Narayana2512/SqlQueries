
SQL> CREATE TABLE DEPT(
  2      DEPTNO NUMBER(2) PRIMARY KEY,
  3      DNAME VARCHAR2(20),
  4      LOC VARCHAR2(20)
  5  );

Table created.

SQL> INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');

1 row created.

SQL> INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');

1 row created.

SQL> INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');

1 row created.

SQL> INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');

1 row created.

SQL> CREATE TABLE EMP(
  2      EMPNO NUMBER(4) PRIMARY KEY,
  3      ENAME VARCHAR2(20),
  4      JOB VARCHAR2(20),
  5      MGR NUMBER(4),
  6      HIREDATE DATE,
  7      SAL NUMBER(7,2),
  8      COMM NUMBER(7,2),
  9      DEPTNO NUMBER(2),
 10      FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO)
 11  );

Table created.

SQL> INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,DATE '1980-12-17',800,NULL,20);

1 row created.

SQL> INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,DATE '1981-02-20',1600,300,30);

1 row created.

SQL> INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,DATE '1981-02-22',1250,500,30);

1 row created.

SQL> INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,DATE '1981-04-02',2975,NULL,20);

1 row created.

SQL> INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,DATE '1981-09-28',1250,1400,30);

1 row created.

SQL> INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,DATE '1981-05-01',2850,NULL,30);

1 row created.

SQL> INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,DATE '1981-06-09',2450,NULL,10);

1 row created.

SQL> INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,DATE '1987-04-19',3000,NULL,20);

1 row created.

SQL> INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,DATE '1981-11-17',5000,NULL,10);

1 row created.

SQL> INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,DATE '1981-09-08',1500,0,30);

1 row created.

SQL> INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,DATE '1987-05-23',1100,NULL,20);

1 row created.

SQL> INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,DATE '1981-12-03',950,NULL,30);

1 row created.

SQL> INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,DATE '1981-12-03',3000,NULL,20);

1 row created.

SQL> INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,DATE '1982-01-23',1300,NULL,10);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT EMPNO,ENAME,DEPTNO
  2  FROM EMP
  3  WHERE DEPTNO=
  4  (
  5  SELECT DEPTNO
  6  FROM EMP
  7  WHERE ENAME='SMITH'
  8  );

     EMPNO ENAME                    DEPTNO
---------- -------------------- ----------
      7369 SMITH                        20
      7566 JONES                        20
      7788 SCOTT                        20
      7876 ADAMS                        20
      7902 FORD                         20

SQL> SELECT *
  2  FROM EMP
  3  WHERE SAL >
  4  (
  5  SELECT AVG(SAL)
  6  FROM EMP
  7  );

     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7566 JONES                MANAGER                    7839 02-APR-81
      2975                    20

      7698 BLAKE                MANAGER                    7839 01-MAY-81
      2850                    30

      7782 CLARK                MANAGER                    7839 09-JUN-81
      2450                    10


     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7788 SCOTT                ANALYST                    7566 19-APR-87
      3000                    20

      7839 KING                 PRESIDENT                       17-NOV-81
      5000                    10

      7902 FORD                 ANALYST                    7566 03-DEC-81
      3000                    20


6 rows selected.

SQL> SELECT ENAME,JOB
  2  FROM EMP E
  3  WHERE EXISTS
  4  (
  5  SELECT 1
  6  FROM EMP
  7  WHERE MGR=E.EMPNO
  8  );

ENAME                JOB
-------------------- --------------------
FORD                 ANALYST
BLAKE                MANAGER
KING                 PRESIDENT
JONES                MANAGER
SCOTT                ANALYST
CLARK                MANAGER

6 rows selected.

SQL> SELECT *
  2  FROM EMP
  3  WHERE SAL <
  4  ALL
  5  (
  6  SELECT SAL
  7  FROM EMP
  8  WHERE DEPTNO=10
  9  );

     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7521 WARD                 SALESMAN                   7698 22-FEB-81
      1250        500         30

      7654 MARTIN               SALESMAN                   7698 28-SEP-81
      1250       1400         30

      7876 ADAMS                CLERK                      7788 23-MAY-87
      1100                    20


     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7900 JAMES                CLERK                      7698 03-DEC-81
       950                    30

      7369 SMITH                CLERK                      7902 17-DEC-80
       800                    20


SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO=
  4  (
  5  SELECT DEPTNO
  6  FROM EMP
  7  WHERE ENAME='JONES'
  8  )
  9  AND MGR=
 10  (
 11  SELECT MGR
 12  FROM EMP
 13  WHERE ENAME='JONES'
 14  )
 15  AND ENAME<>'JONES';

no rows selected

SQL> SELECT EMPNO,ENAME
  2  FROM EMP
  3  WHERE DEPTNO IN
  4  (
  5  SELECT DEPTNO
  6  FROM EMP
  7  WHERE ENAME LIKE '%R%'
  8  );

     EMPNO ENAME
---------- --------------------
      7499 ALLEN
      7521 WARD
      7654 MARTIN
      7698 BLAKE
      7844 TURNER
      7900 JAMES
      7782 CLARK
      7839 KING
      7934 MILLER
      7369 SMITH
      7566 JONES

     EMPNO ENAME
---------- --------------------
      7788 SCOTT
      7876 ADAMS
      7902 FORD

14 rows selected.

SQL> SELECT ENAME,DEPTNO,JOB
  2  FROM EMP
  3  WHERE DEPTNO=
  4  (
  5  SELECT DEPTNO
  6  FROM DEPT
  7  WHERE LOC='NEW YORK'
  8  );

ENAME                    DEPTNO JOB
-------------------- ---------- --------------------
CLARK                        10 MANAGER
KING                         10 PRESIDENT
MILLER                       10 CLERK

SQL> ACCEPT P_LOC CHAR PROMPT 'Enter Location : '
Enter Location :
SQL> SELECT ENAME,JOB
  2  FROM EMP
  3  WHERE DEPTNO=
  4  (
  5  SELECT DEPTNO
  6  FROM DEPT
  7  WHERE LOC='&P_LOC'
  8  );
old   7: WHERE LOC='&P_LOC'
new   7: WHERE LOC=''

no rows selected

SQL> SELECT ENAME,SAL
  2  FROM EMP
  3  WHERE MGR=
  4  (
  5  SELECT EMPNO
  6  FROM EMP
  7  WHERE ENAME='KING'
  8  );

ENAME                       SAL
-------------------- ----------
JONES                      2975
BLAKE                      2850
CLARK                      2450

SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO=
  4  (
  5  SELECT DEPTNO
  6  FROM EMP
  7  WHERE ENAME='JAMES'
  8  );

     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7499 ALLEN                SALESMAN                   7698 20-FEB-81
      1600        300         30

      7521 WARD                 SALESMAN                   7698 22-FEB-81
      1250        500         30

      7654 MARTIN               SALESMAN                   7698 28-SEP-81
      1250       1400         30


     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7698 BLAKE                MANAGER                    7839 01-MAY-81
      2850                    30

      7844 TURNER               SALESMAN                   7698 08-SEP-81
      1500          0         30

      7900 JAMES                CLERK                      7698 03-DEC-81
       950                    30


6 rows selected.

SQL> SELECT *
  2  FROM EMP E
  3  WHERE SAL<
  4  (
  5  SELECT AVG(SAL)
  6  FROM EMP
  7  WHERE DEPTNO=E.DEPTNO
  8  );

     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7369 SMITH                CLERK                      7902 17-DEC-80
       800                    20

      7521 WARD                 SALESMAN                   7698 22-FEB-81
      1250        500         30

      7654 MARTIN               SALESMAN                   7698 28-SEP-81
      1250       1400         30


     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7782 CLARK                MANAGER                    7839 09-JUN-81
      2450                    10

      7844 TURNER               SALESMAN                   7698 08-SEP-81
      1500          0         30

      7876 ADAMS                CLERK                      7788 23-MAY-87
      1100                    20


     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7900 JAMES                CLERK                      7698 03-DEC-81
       950                    30

      7934 MILLER               CLERK                      7782 23-JAN-82
      1300                    10


8 rows selected.

SQL> SELECT LOC,
  2  (
  3  SELECT AVG(SAL)
  4  FROM EMP
  5  WHERE EMP.DEPTNO=DEPT.DEPTNO
  6  ) AVG_SAL
  7  FROM DEPT;

LOC                     AVG_SAL
-------------------- ----------
CHICAGO              1566.66667
NEW YORK             2916.66667
DALLAS                     2175
BOSTON

SQL> SELECT *
  2  FROM
  3  (
  4  SELECT *
  5  FROM EMP
  6  ORDER BY SAL
  7  )
  8  WHERE ROWNUM<=5;

     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7369 SMITH                CLERK                      7902 17-DEC-80
       800                    20

      7900 JAMES                CLERK                      7698 03-DEC-81
       950                    30

      7876 ADAMS                CLERK                      7788 23-MAY-87
      1100                    20


     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7521 WARD                 SALESMAN                   7698 22-FEB-81
      1250        500         30

      7654 MARTIN               SALESMAN                   7698 28-SEP-81
      1250       1400         30


SQL> SELECT *
  2  FROM EMP E1
  3  WHERE 5 >
  4  (
  5  SELECT COUNT(*)
  6  FROM EMP E2
  7  WHERE E2.EMPNO>E1.EMPNO
  8  )
  9  ORDER BY EMPNO DESC;

     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7934 MILLER               CLERK                      7782 23-JAN-82
      1300                    10

      7902 FORD                 ANALYST                    7566 03-DEC-81
      3000                    20

      7900 JAMES                CLERK                      7698 03-DEC-81
       950                    30


     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7876 ADAMS                CLERK                      7788 23-MAY-87
      1100                    20

      7844 TURNER               SALESMAN                   7698 08-SEP-81
      1500          0         30


SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO=
  4  (
  5  SELECT DEPTNO
  6  FROM DEPT
  7  WHERE LOC='DALLAS'
  8  )
  9  ORDER BY ENAME;

     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7876 ADAMS                CLERK                      7788 23-MAY-87
      1100                    20

      7902 FORD                 ANALYST                    7566 03-DEC-81
      3000                    20

      7566 JONES                MANAGER                    7839 02-APR-81
      2975                    20


     EMPNO ENAME                JOB                         MGR HIREDATE
---------- -------------------- -------------------- ---------- ---------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7788 SCOTT                ANALYST                    7566 19-APR-87
      3000                    20

      7369 SMITH                CLERK                      7902 17-DEC-80
       800                    20


SQL> SELECT E.EMPNO,
  2         E.ENAME,
  3         E.SAL,
  4         A.AVGSAL
  5  FROM EMP E,
  6  (
  7  SELECT DEPTNO,
  8  AVG(SAL) AVGSAL
  9  FROM EMP
 10  GROUP BY DEPTNO
 11  ) A
 12  WHERE E.DEPTNO=A.DEPTNO
 13  AND E.SAL<A.AVGSAL;

     EMPNO ENAME                       SAL     AVGSAL
---------- -------------------- ---------- ----------
      7521 WARD                       1250 1566.66667
      7654 MARTIN                     1250 1566.66667
      7844 TURNER                     1500 1566.66667
      7900 JAMES                       950 1566.66667
      7782 CLARK                      2450 2916.66667
      7934 MILLER                     1300 2916.66667
      7369 SMITH                       800       2175
      7876 ADAMS                      1100       2175

8 rows selected.

SQL> WITH DEPTSAL AS
  2  (
  3  SELECT DEPTNO,
  4  SUM(SAL) TOTALSAL
  5  FROM EMP
  6  GROUP BY DEPTNO
  7  ),
  8  AVGSAL AS
  9  (
 10  SELECT AVG(SAL) AVERAGESAL
 11  FROM EMP
 12  )
 13  SELECT D.LOC
 14  FROM DEPT D
 15  JOIN DEPTSAL DS
 16  ON D.DEPTNO=DS.DEPTNO
 17  CROSS JOIN AVGSAL A
 18  WHERE DS.TOTALSAL < A.AVERAGESAL;

no rows selected

SQL>