
SQL> SET SERVEROUTPUT ON;
SQL>
SQL> DECLARE
  2      v_empno EMP.EMPNO%TYPE := &Enter_EMPNO;
  3      v_emp   EMP%ROWTYPE;
  4  BEGIN
  5      SELECT *
  6      INTO v_emp
  7      FROM EMP
  8      WHERE EMPNO = v_empno;
  9
 10      DBMS_OUTPUT.PUT_LINE('Employee Details');
 11      DBMS_OUTPUT.PUT_LINE('------------------------------');
 12      DBMS_OUTPUT.PUT_LINE('Emp No    : ' || v_emp.EMPNO);
 13      DBMS_OUTPUT.PUT_LINE('Name      : ' || v_emp.ENAME);
 14      DBMS_OUTPUT.PUT_LINE('Job       : ' || v_emp.JOB);
 15      DBMS_OUTPUT.PUT_LINE('Manager   : ' || v_emp.MGR);
 16      DBMS_OUTPUT.PUT_LINE('Hire Date : ' || v_emp.HIREDATE);
 17      DBMS_OUTPUT.PUT_LINE('Salary    : ' || v_emp.SAL);
 18      DBMS_OUTPUT.PUT_LINE('Commission: ' || NVL(v_emp.COMM,0));
 19      DBMS_OUTPUT.PUT_LINE('Dept No   : ' || v_emp.DEPTNO);
 20
 21  EXCEPTION
 22      WHEN NO_DATA_FOUND THEN
 23          DBMS_OUTPUT.PUT_LINE('Employee Not Found.');
 24  END;
 25  /
Enter value for enter_empno: 7369
old   2:     v_empno EMP.EMPNO%TYPE := &Enter_EMPNO;
new   2:     v_empno EMP.EMPNO%TYPE := 7369;
Employee Details
------------------------------
Emp No    : 7369
Name      : SMITH
Job       : CLERK
Manager   : 7902
Hire Date : 17-DEC-80
Salary    : 800
Commission: 0
Dept No   : 20

PL/SQL procedure successfully completed.

SQL>