
SQL> SET SERVEROUTPUT ON;
SQL>
SQL> DECLARE
  2      v_empno EMP.EMPNO%TYPE := &Enter_EMPNO;
  3      v_ename EMP.ENAME%TYPE := '&Enter_ENAME';
  4      v_sal   EMP.SAL%TYPE := &Enter_SAL;
  5      v_count NUMBER;
  6  BEGIN
  7      SELECT COUNT(*)
  8      INTO v_count
  9      FROM EMP
 10      WHERE EMPNO = v_empno;
 11
 12      IF v_count = 0 THEN
 13          INSERT INTO EMP(EMPNO, ENAME, SAL)
 14          VALUES(v_empno, v_ename, v_sal);
 15
 16          DBMS_OUTPUT.PUT_LINE('Employee Inserted Successfully');
 17      ELSE
 18          UPDATE EMP
 19          SET ENAME = v_ename,
 20              SAL = v_sal
 21          WHERE EMPNO = v_empno;
 22
 23          DBMS_OUTPUT.PUT_LINE('Employee Updated Successfully');
 24      END IF;
 25
 26      COMMIT;
 27  END;
 28  /
Enter value for enter_empno: 8001
old   2:     v_empno EMP.EMPNO%TYPE := &Enter_EMPNO;
new   2:     v_empno EMP.EMPNO%TYPE := 8001;
Enter value for enter_ename: ABHI
old   3:     v_ename EMP.ENAME%TYPE := '&Enter_ENAME';
new   3:     v_ename EMP.ENAME%TYPE := 'ABHI';
Enter value for enter_sal: 25000
old   4:     v_sal   EMP.SAL%TYPE := &Enter_SAL;
new   4:     v_sal   EMP.SAL%TYPE := 25000;
Employee Inserted Successfully

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON;
SQL>
SQL> DECLARE
  2      v_num NUMBER := &Enter_Number;
  3  BEGIN
  4      IF MOD(v_num,2)=0 THEN
  5          DBMS_OUTPUT.PUT_LINE(v_num||' is EVEN');
  6      ELSE
  7          DBMS_OUTPUT.PUT_LINE(v_num||' is ODD');
  8      END IF;
  9  END;
 10  /
Enter value for enter_number: 24
old   2:     v_num NUMBER := &Enter_Number;
new   2:     v_num NUMBER := 24;
24 is EVEN

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON;
SQL>
SQL> DECLARE
  2      v_empno EMP.EMPNO%TYPE := &Enter_EMPNO;
  3      v_deptno EMP.DEPTNO%TYPE;
  4  BEGIN
  5      SELECT DEPTNO
  6      INTO v_deptno
  7      FROM EMP
  8      WHERE EMPNO = v_empno;
  9
 10      IF v_deptno = 10 THEN
 11          UPDATE EMP
 12          SET SAL = SAL + (SAL * 0.10)
 13          WHERE EMPNO = v_empno;
 14
 15          DBMS_OUTPUT.PUT_LINE('10% Salary Increment');
 16      ELSIF v_deptno = 20 THEN
 17          UPDATE EMP
 18          SET SAL = SAL + (SAL * 0.15)
 19          WHERE EMPNO = v_empno;
 20
 21          DBMS_OUTPUT.PUT_LINE('15% Salary Increment');
 22      ELSE
 23          UPDATE EMP
 24          SET SAL = SAL + NVL(COMM,0)
 25          WHERE EMPNO = v_empno;
 26
 27          DBMS_OUTPUT.PUT_LINE('Salary Updated with Commission');
 28      END IF;
 29
 30      COMMIT;
 31  END;
 32  /
Enter value for enter_empno: 7782
old   2:     v_empno EMP.EMPNO%TYPE := &Enter_EMPNO;
new   2:     v_empno EMP.EMPNO%TYPE := 7782;
10% Salary Increment

PL/SQL procedure successfully completed.

SQL> SELECT EMPNO,ENAME,SAL
  2  FROM EMP
  3  WHERE EMPNO=7782;

     EMPNO ENAME                       SAL
---------- -------------------- ----------
      7782 CLARK                      2695

SQL> CREATE TABLE MYTABLE1
  2  (
  3      RESULT NUMBER
  4  );

Table created.

SQL> SET SERVEROUTPUT ON;
SQL>
SQL> DECLARE
  2      i NUMBER;
  3  BEGIN
  4      FOR i IN 1..10 LOOP
  5
  6          IF i=6 OR i=8 THEN
  7              CONTINUE;
  8          END IF;
  9
 10          INSERT INTO MYTABLE1
 11          VALUES(i);
 12
 13      END LOOP;
 14
 15      COMMIT;
 16
 17      DBMS_OUTPUT.PUT_LINE('Records Inserted Successfully');
 18  END;
 19  /
Records Inserted Successfully

PL/SQL procedure successfully completed.

SQL> SELECT * FROM MYTABLE1;

    RESULT
----------
         1
         2
         3
         4
         5
         7
         9
        10

8 rows selected.

SQL>