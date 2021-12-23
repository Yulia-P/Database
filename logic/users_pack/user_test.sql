SET serveroutput ON;
SELECT * FROM LOGS;
--------------------------------------------------------------------------------
SELECT * FROM USERS;
SELECT * FROM USERS_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%USER%';
DELETE USERS;
SELECT * FROM LOGS;
-----------------------------REGISTRATION---------------------------------------
--ROSE_USER
DECLARE
BEGIN
  REGISTRATION('ANNA','LUIS','ANNA@gmail.com','2266');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

--PYS USER
SELECT * FROM USERS; 
--------------------------------LOGIN-------------------------------------------
--ROSE_USER
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE(LOGIN('olga@gmail.com', 'uy66'));
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
--------------------------------CHANGE------------------------------------------
--ROSE_USER
DECLARE
BEGIN
  --CHANGE_AGE(2,20);
  CHANGE_INFO(2,'Hi Im YULIA');
  --CHANGE_AVATAR(2,'https://loclalhost:3000/index3.png');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
--SYSTEM
SELECT * FROM USERS;
----------------------------------GET-------------------------------------------
--ROSE_USER
--set timing on;
--SELECT * FROM SYSTEM.USERS_VIEW;
SET SERVEROUTPUT ON;

DECLARE
  CURSOR1 SYS_REFCURSOR;  
  U SYSTEM.USERS_VIEW%ROWTYPE;
BEGIN
  GET_USER_BY_ID(CURSOR1,1);
  --GET_USERS_BY_NAME(CURSOR1,'YULIA','POCHIKOVSKAYA');
  --GET_USER_BY_EMAIL(CURSOR1,'antl@gmail.com');
  LOOP
    FETCH CURSOR1 INTO U.USER_ID,U.FIRST_NAME,U.LAST_NAME,U.AGE,U.EMAIL,U.INFO,U.AVATAR;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||U.USER_ID      ||' '||
    'FNAME: '   ||U.FIRST_NAME   ||' '||
    'LNAME: '   ||U.LAST_NAME    ||' '||
    'AGE: '     ||U.AGE          ||' '||
    'EMAIL: '   ||U.EMAIL        ||' '||
    'INFO: '    ||U.INFO         ||' '||
    'AVATAR: '  ||U.AVATAR);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------