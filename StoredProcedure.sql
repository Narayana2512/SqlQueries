SQL> CREATE OR REPLACE PROCEDURE EMP_DETAILS
  2  (
  3      P_EMPNO IN EMP.EMPNO%TYPE
  4  )
  5  IS
  6      V_ENAME EMP.ENAME%TYPE;
  7      V_SAL   EMP.SAL%TYPE;
  8      V_DEPT  EMP.DEPTNO%TYPE;
  9  BEGIN
 10      SELECT ENAME,SAL,DEPTNO
 11      INTO V_ENAME,V_SAL,V_DEPT
 12      FROM EMP
 13      WHERE EMPNO=P_EMPNO;
 14
 15      DBMS_OUTPUT.PUT_LINE('Employee Number : '||P_EMPNO);
 16      DBMS_OUTPUT.PUT_LINE('Employee Name   : '||V_ENAME);
 17      DBMS_OUTPUT.PUT_LINE('Salary          : '||V_SAL);
 18      DBMS_OUTPUT.PUT_LINE('Department No   : '||V_DEPT);
 19
 20  EXCEPTION
 21      WHEN NO_DATA_FOUND THEN
 22          DBMS_OUTPUT.PUT_LINE('Employee Not Found');
 23  END;
 24  /
CREATE OR REPLACE PROCEDURE EMP_DETAILS
*
ERROR at line 1:
ORA-00955: name is already used by an existing object


SQL> CREATE OR REPLACE PROCEDURE SHOW_EMP_DETAILS
  2  (
  3      P_EMPNO IN EMP.EMPNO%TYPE
  4  )
  5  IS
  6      V_ENAME EMP.ENAME%TYPE;
  7      V_SAL   EMP.SAL%TYPE;
  8      V_DEPT  EMP.DEPTNO%TYPE;
  9  BEGIN
 10      SELECT ENAME,SAL,DEPTNO
 11      INTO V_ENAME,V_SAL,V_DEPT
 12      FROM EMP
 13      WHERE EMPNO=P_EMPNO;
 14
 15      DBMS_OUTPUT.PUT_LINE('Employee Number : '||P_EMPNO);
 16      DBMS_OUTPUT.PUT_LINE('Employee Name   : '||V_ENAME);
 17      DBMS_OUTPUT.PUT_LINE('Salary          : '||V_SAL);
 18      DBMS_OUTPUT.PUT_LINE('Department No   : '||V_DEPT);
 19
 20  EXCEPTION
 21      WHEN NO_DATA_FOUND THEN
 22          DBMS_OUTPUT.PUT_LINE('Employee Not Found');
 23  END;
 24  /

Procedure created.

SQL> SET SERVEROUTPUT ON;
SQL>
SQL> EXEC SHOW_EMP_DETAILS(7369);
Employee Number : 7369
Employee Name   : SMITH
Salary          : 800
Department No   : 20

PL/SQL procedure successfully completed.

SQL> CREATE OR REPLACE FUNCTION ADD_NUM
  2  (
  3      A NUMBER,
  4      B NUMBER
  5  )
  6  RETURN NUMBER
  7  IS
  8  BEGIN
  9      RETURN A+B;
 10  END;
 11  /

Function created.

SQL> SET SERVEROUTPUT ON;
SQL>
SQL> DECLARE
  2      RESULT NUMBER;
  3  BEGIN
  4      RESULT:=ADD_NUM(25,35);
  5
  6      DBMS_OUTPUT.PUT_LINE('Addition = '||RESULT);
  7  END;
  8  /
Addition = 60

PL/SQL procedure successfully completed.

SQL> SELECT ADD_NUM(100,200) AS RESULT
  2  FROM DUAL;

    RESULT
----------
       300

SQL> CREATE OR REPLACE PROCEDURE LIST_PROGRAMS
  2  IS
  3      CURSOR C1 IS
  4      SELECT DISTINCT NAME,TYPE
  5      FROM USER_SOURCE
  6      WHERE TYPE IN ('PROCEDURE','FUNCTION')
  7      ORDER BY TYPE,NAME;
  8
  9  BEGIN
 10
 11      DBMS_OUTPUT.PUT_LINE('TYPE          NAME');
 12      DBMS_OUTPUT.PUT_LINE('---------------------------');
 13
 14      FOR R IN C1
 15      LOOP
 16          DBMS_OUTPUT.PUT_LINE(
 17          RPAD(R.TYPE,12)||R.NAME);
 18      END LOOP;
 19
 20  END;
 21  /

Procedure created.

SQL> SET SERVEROUTPUT ON;
SQL>
SQL> EXEC LIST_PROGRAMS;
TYPE          NAME
---------------------------
FUNCTION    ADD_NUM
PROCEDURE   LIST_PROGRAMS
PROCEDURE   SHOW_EMP_DETAILS

PL/SQL procedure successfully completed.

SQL>
 