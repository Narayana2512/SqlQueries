SQL> CREATE TABLE LODGE_DETAILS
  2  (
  3      LODGE_NAME      VARCHAR2(30) PRIMARY KEY,
  4      LODGE_MANAGER   VARCHAR2(30) NOT NULL,
  5      LODGE_ADDRESS   VARCHAR2(30)
  6  );

Table created.

SQL> CREATE TABLE EMP_DETAILS
  2  (
  3      EMPNO        NUMBER PRIMARY KEY,
  4      FIRST_NAME   VARCHAR2(30) NOT NULL,
  5      LAST_NAME    VARCHAR2(30) NOT NULL,
  6      LODGE_NAME   VARCHAR2(30),
  7      CONSTRAINT FK_EMP_LODGE
  8      FOREIGN KEY (LODGE_NAME)
  9      REFERENCES LODGE_DETAILS(LODGE_NAME)
 10  );

Table created.

SQL> -- SKILL_DETAILS
SQL>
SQL> CREATE TABLE SKILL_DETAILS
  2  (
  3      SKILL        VARCHAR2(30) PRIMARY KEY,
  4      SKILL_DESC   VARCHAR2(30)
  5  );

Table created.

SQL> -- EMP_SKILL
SQL>
SQL> CREATE TABLE EMP_SKILL
  2  (
  3      EMPNO      NUMBER,
  4      SKILL      VARCHAR2(30),
  5      GRADE      NUMBER(10),
  6      CONSTRAINT PK_EMP_SKILL
  7      PRIMARY KEY (EMPNO, SKILL),
  8      CONSTRAINT FK_EMP
  9      FOREIGN KEY (EMPNO)
 10      REFERENCES EMP_DETAILS(EMPNO),
 11      CONSTRAINT FK_SKILL
 12      FOREIGN KEY (SKILL)
 13      REFERENCES SKILL_DETAILS(SKILL)
 14  );

Table created.

SQL> INSERT INTO LODGE_DETAILS VALUES
  2  ('Jessy Lodge','Rajan','Rakesh Nagar');

1 row created.

SQL>
SQL> INSERT INTO LODGE_DETAILS VALUES
  2  ('Rajesh Lodge','Rajani','Anna Nagar');

1 row created.

SQL>
SQL> INSERT INTO LODGE_DETAILS VALUES
  2  ('Gooday Lodge','John','Sea Road');

1 row created.

SQL> INSERT INTO EMP_DETAILS VALUES
  2  (101,'James','Jackson','Rajesh Lodge');

1 row created.

SQL>
SQL> INSERT INTO EMP_DETAILS VALUES
  2  (102,'Kalpash','Raj','Gooday Lodge');

1 row created.

SQL>
SQL> INSERT INTO EMP_DETAILS VALUES
  2  (103,'Jasmine','Joy','Jessy Lodge');

1 row created.

SQL> INSERT INTO SKILL_DETAILS VALUES
  2  ('Oracle SQL','Oracle Corporation');

1 row created.

SQL>
SQL> INSERT INTO SKILL_DETAILS VALUES
  2  ('Dot Net','Microsoft');

1 row created.

SQL>
SQL> INSERT INTO SKILL_DETAILS VALUES
  2  ('Sybase','SAP Corporation');

1 row created.

SQL> INSERT INTO EMP_SKILL VALUES
  2  (101,'Oracle SQL',9);

1 row created.

SQL>
SQL> INSERT INTO EMP_SKILL VALUES
  2  (101,'Sybase',8);

1 row created.

SQL>
SQL> INSERT INTO EMP_SKILL VALUES
  2  (102,'Dot Net',9);

1 row created.

SQL>
SQL> INSERT INTO EMP_SKILL VALUES
  2  (103,'Oracle SQL',8);

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> UPDATE EMP_DETAILS
  2  SET LODGE_NAME='Gooday Lodge'
  3  WHERE EMPNO=101;

1 row updated.

SQL>
SQL> COMMIT;

Commit complete.

SQL> DELETE FROM EMP_SKILL
  2  WHERE EMPNO=103;

1 row deleted.

SQL>
SQL> DELETE FROM EMP_DETAILS
  2  WHERE EMPNO=103;

1 row deleted.

SQL>
SQL> COMMIT;

Commit complete.

SQL> SELECT E.EMPNO,
  2         E.FIRST_NAME,
  3         E.LAST_NAME,
  4         ES.SKILL
  5  FROM EMP_DETAILS E
  6  JOIN EMP_SKILL ES
  7  ON E.EMPNO=ES.EMPNO
  8  WHERE UPPER(ES.SKILL)=UPPER('SyBaSe');

     EMPNO FIRST_NAME                     LAST_NAME
---------- ------------------------------ ------------------------------
SKILL
------------------------------
       101 James                          Jackson
Sybase


SQL> SELECT
  2  E.FIRST_NAME,
  3  ES.SKILL,
  4  L.LODGE_MANAGER
  5  FROM EMP_DETAILS E
  6  JOIN EMP_SKILL ES
  7  ON E.EMPNO=ES.EMPNO
  8  JOIN LODGE_DETAILS L
  9  ON E.LODGE_NAME=L.LODGE_NAME;

FIRST_NAME                     SKILL
------------------------------ ------------------------------
LODGE_MANAGER
------------------------------
James                          Oracle SQL
John

James                          Sybase
John

Kalpash                        Dot Net
John


SQL> SELECT
  2  EMPNO,
  3  COUNT(SKILL) AS TOTAL_SKILLS
  4  FROM EMP_SKILL
  5  WHERE EMPNO=101
  6  GROUP BY EMPNO;

     EMPNO TOTAL_SKILLS
---------- ------------
       101            2

SQL> SELECT
  2  E.FIRST_NAME
  3  FROM EMP_DETAILS E
  4  JOIN EMP_SKILL ES
  5  ON E.EMPNO=ES.EMPNO
  6  WHERE ES.SKILL='Oracle SQL';

FIRST_NAME
------------------------------
James

SQL> CREATE VIEW EMP_VIEW AS
  2  SELECT
  3  E.EMPNO,
  4  E.FIRST_NAME,
  5  ES.SKILL,
  6  L.LODGE_MANAGER
  7  FROM EMP_DETAILS E
  8  JOIN EMP_SKILL ES
  9  ON E.EMPNO=ES.EMPNO
 10  JOIN LODGE_DETAILS L
 11  ON E.LODGE_NAME=L.LODGE_NAME;

View created.

SQL> SELECT * FROM EMP_VIEW;

     EMPNO FIRST_NAME                     SKILL
---------- ------------------------------ ------------------------------
LODGE_MANAGER
------------------------------
       101 James                          Oracle SQL
John

       101 James                          Sybase
John

       102 Kalpash                        Dot Net
John


SQL> CREATE SYNONYM EMPV
  2  FOR EMP_VIEW;

Synonym created.

SQL> SELECT * FROM EMPV;

     EMPNO FIRST_NAME                     SKILL
---------- ------------------------------ ------------------------------
LODGE_MANAGER
------------------------------
       101 James                          Oracle SQL
John

       101 James                          Sybase
John

       102 Kalpash                        Dot Net
John


SQL> CREATE INDEX IDX_EMP_SKILL
  2  ON EMP_SKILL(SKILL);

Index created.

SQL> SELECT * FROM LODGE_DETAILS;

LODGE_NAME                     LODGE_MANAGER
------------------------------ ------------------------------
LODGE_ADDRESS
------------------------------
Jessy Lodge                    Rajan
Rakesh Nagar

Rajesh Lodge                   Rajani
Anna Nagar

Gooday Lodge                   John
Sea Road


SQL>
SQL> SELECT * FROM EMP_DETAILS;

     EMPNO FIRST_NAME                     LAST_NAME
---------- ------------------------------ ------------------------------
LODGE_NAME
------------------------------
       101 James                          Jackson
Gooday Lodge

       102 Kalpash                        Raj
Gooday Lodge


SQL>
SQL> SELECT * FROM SKILL_DETAILS;

SKILL                          SKILL_DESC
------------------------------ ------------------------------
Oracle SQL                     Oracle Corporation
Dot Net                        Microsoft
Sybase                         SAP Corporation

SQL>
SQL> SELECT * FROM EMP_SKILL;

     EMPNO SKILL                               GRADE
---------- ------------------------------ ----------
       101 Oracle SQL                              9
       101 Sybase                                  8
       102 Dot Net                                 9
