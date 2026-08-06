
SQL> SET SERVEROUTPUT ON;
SQL>
SQL> DECLARE
  2      v_empno  EMP.EMPNO%TYPE;
  3      v_netsal NUMBER;
  4  BEGIN
  5      -- Enter Employee Number
  6      v_empno := &Enter_Employee_Number;
  7
  8      -- Calculate Net Salary
  9      SELECT SAL + NVL(COMM, 0)
 10      INTO v_netsal
 11      FROM EMP
 12      WHERE EMPNO = v_empno;
 13
 14      DBMS_OUTPUT.PUT_LINE('Net Salary = ' || v_netsal);
 15
 16  EXCEPTION
 17      WHEN NO_DATA_FOUND THEN
 18          DBMS_OUTPUT.PUT_LINE('Employee not found.');
 19  END;
 20  /
Enter value for enter_employee_number: 7369
old   6:     v_empno := &Enter_Employee_Number;
new   6:     v_empno := 7369;
Net Salary = 800

PL/SQL procedure successfully completed.