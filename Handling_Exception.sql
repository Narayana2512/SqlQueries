
SQL> CREATE TABLE MESSAGES
  2  (
  3      RESULT VARCHAR2(1000)
  4  );

Table created.

SQL> SET SERVEROUTPUT ON;
SQL>
SQL> ACCEPT P_SAL NUMBER PROMPT 'Enter Salary : '
Enter Salary :
SQL> DECLARE
  2      V_ENAME EMP.ENAME%TYPE;
  3
  4  BEGIN
  5      SELECT ENAME
  6      INTO V_ENAME
  7      FROM EMP
  8      WHERE SAL=&P_SAL;
  9
 10      INSERT INTO MESSAGES
 11      VALUES(V_ENAME||' '||&P_SAL);
 12
 13      COMMIT;
 14
 15  EXCEPTION
 16
 17      WHEN NO_DATA_FOUND THEN
 18          INSERT INTO MESSAGES
 19          VALUES('No Employee with that Salary '||&P_SAL);
 20          COMMIT;
 21
 22      WHEN TOO_MANY_ROWS THEN
 23          INSERT INTO MESSAGES
 24          VALUES('More than one employee with Salary '||&P_SAL);
 25          COMMIT;
 26
 27      WHEN OTHERS THEN
 28          INSERT INTO MESSAGES
 29          VALUES('Other Error');
 30          COMMIT;
 31  END;
 32  /
old   8:     WHERE SAL=&P_SAL;
new   8:     WHERE SAL=         0;
old  11:     VALUES(V_ENAME||' '||&P_SAL);
new  11:     VALUES(V_ENAME||' '||         0);
old  19:         VALUES('No Employee with that Salary '||&P_SAL);
new  19:         VALUES('No Employee with that Salary '||         0);
old  24:         VALUES('More than one employee with Salary '||&P_SAL);
new  24:         VALUES('More than one employee with Salary '||         0);

PL/SQL procedure successfully completed.

SQL> SELECT * FROM MESSAGES;

RESULT
--------------------------------------------------------------------------------
No Employee with that Salary 0

SQL> SET SERVEROUTPUT ON;
SQL>
SQL> ACCEPT P_EMPNO NUMBER PROMPT 'Enter Empno : '
Enter Empno : ACCEPT P_ENAME CHAR PROMPT 'Enter Ename : '
SP2-0425: "ACCEPT P_ENAME CHAR PROMPT 'Enter Ename : '" is not a valid NUMBER
Enter Empno : ACCEPT P_SAL NUMBER PROMPT 'Enter Salary : '
SP2-0425: "ACCEPT P_SAL NUMBER PROMPT 'Enter Salary : '" is not a valid NUMBER
Enter Empno :
SQL> BEGIN
  2
  3      INSERT INTO EMP
  4      (EMPNO,ENAME,SAL)
  5      VALUES
  6      (&P_EMPNO,
  7       UPPER('&P_ENAME'),
  8       &P_SAL);
  9
 10      COMMIT;
 11
 12      DBMS_OUTPUT.PUT_LINE('Employee Inserted Successfully');
 13
 14  EXCEPTION
 15
 16      WHEN OTHERS THEN
 17          DBMS_OUTPUT.PUT_LINE('Error : '||SQLERRM);
 18
 19  END;
 20  /
old   6:     (&P_EMPNO,
new   6:     (         0,
Enter value for p_ename: ABHI
old   7:      UPPER('&P_ENAME'),
new   7:      UPPER('ABHI'),
old   8:      &P_SAL);
new   8:               0);
Employee Inserted Successfully

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON;
SQL>
SQL> ACCEPT P_EMPNO NUMBER PROMPT 'Enter Employee Number : '
Enter Employee Number :
SQL> DECLARE
  2
  3  EMP_NOT_FOUND EXCEPTION;
  4  V_COUNT NUMBER;
  5
  6  BEGIN
  7
  8  SELECT COUNT(*)
  9  INTO V_COUNT
 10  FROM EMP
 11  WHERE EMPNO=&P_EMPNO;
 12
 13  IF V_COUNT=0 THEN
 14  RAISE EMP_NOT_FOUND;
 15  END IF;
 16
 17  DELETE FROM EMP
 18  WHERE EMPNO=&P_EMPNO;
 19
 20  COMMIT;
 21
 22  DBMS_OUTPUT.PUT_LINE('Employee Deleted.');
 23
 24  EXCEPTION
 25
 26  WHEN EMP_NOT_FOUND THEN
 27  DBMS_OUTPUT.PUT_LINE('Employee Not Found.');
 28
 29  END;
 30  /
old  11: WHERE EMPNO=&P_EMPNO;
new  11: WHERE EMPNO=         0;
old  18: WHERE EMPNO=&P_EMPNO;
new  18: WHERE EMPNO=         0;
Employee Deleted.

PL/SQL procedure successfully completed.

SQL> CREATE TABLE STOCK
  2  (
  3  PNO NUMBER PRIMARY KEY,
  4  PNAME VARCHAR2(20),
  5  RATE NUMBER,
  6  TR_QTY NUMBER
  7  );

Table created.

SQL> INSERT INTO STOCK VALUES(101,'PEN',20,100);

1 row created.

SQL> INSERT INTO STOCK VALUES(102,'BOOK',50,150);

1 row created.

SQL> INSERT INTO STOCK VALUES(103,'PENCIL',10,200);

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> SET SERVEROUTPUT ON;
SQL>
SQL> ACCEPT PNO NUMBER PROMPT 'Enter Product No : '
Enter Product No : ACCEPT TTYPE CHAR PROMPT 'Enter Transaction Type(R/I): '
SP2-0425: "ACCEPT TTYPE CHAR PROMPT 'Enter Transaction Type(R/I): '" is not a valid NUMBER
Enter Product No : ACCEPT QTY NUMBER PROMPT 'Enter Quantity : '
SP2-0425: "ACCEPT QTY NUMBER PROMPT 'Enter Quantity : '" is not a valid NUMBER
Enter Product No :
SQL> DECLARE
  2
  3  PRODUCT_NOT_FOUND EXCEPTION;
  4  INVALID_TRANSACTION EXCEPTION;
  5
  6  V_COUNT NUMBER;
  7
  8  BEGIN
  9
 10  SELECT COUNT(*)
 11  INTO V_COUNT
 12  FROM STOCK
 13  WHERE PNO=&PNO;
 14
 15  IF V_COUNT=0 THEN
 16  RAISE PRODUCT_NOT_FOUND;
 17  END IF;
 18
 19  IF UPPER('&TTYPE')='R' THEN
 20
 21  UPDATE STOCK
 22  SET TR_QTY=TR_QTY+&QTY
 23  WHERE PNO=&PNO;
 24
 25  ELSIF UPPER('&TTYPE')='I' THEN
 26
 27  UPDATE STOCK
 28  SET TR_QTY=TR_QTY-&QTY
 29  WHERE PNO=&PNO;
 30
 31  ELSE
 32
 33  RAISE INVALID_TRANSACTION;
 34
 35  END IF;
 36
 37  COMMIT;
 38
 39  DBMS_OUTPUT.PUT_LINE('Stock Updated Successfully.');
 40
 41  EXCEPTION
 42
 43  WHEN PRODUCT_NOT_FOUND THEN
 44  DBMS_OUTPUT.PUT_LINE('Product Not Found.');
 45
 46  WHEN INVALID_TRANSACTION THEN
 47  DBMS_OUTPUT.PUT_LINE('Transaction Type should be R or I.');
 48
 49  END;
 50  /
old  13: WHERE PNO=&PNO;
new  13: WHERE PNO=         0;
Enter value for ttype: 101
old  19: IF UPPER('&TTYPE')='R' THEN
new  19: IF UPPER('101')='R' THEN
Enter value for qty: 50
old  22: SET TR_QTY=TR_QTY+&QTY
new  22: SET TR_QTY=TR_QTY+50
old  23: WHERE PNO=&PNO;
new  23: WHERE PNO=         0;
Enter value for ttype: 102
old  25: ELSIF UPPER('&TTYPE')='I' THEN
new  25: ELSIF UPPER('102')='I' THEN
Enter value for qty: 20
old  28: SET TR_QTY=TR_QTY-&QTY
new  28: SET TR_QTY=TR_QTY-20
old  29: WHERE PNO=&PNO;
new  29: WHERE PNO=         0;
Product Not Found.

PL/SQL procedure successfully completed.

SQL>