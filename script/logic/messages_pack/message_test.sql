SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM DIALOGS_VIEW;
SELECT * FROM MESSAGES_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%MESSAGE%';
DELETE MESSAGES;
-------------------------------ADD----------------------------------------------
DECLARE
BEGIN
  SYSTEM.ADD_MESSAGE('IM OK',1,1);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM SYSTEM.MESSAGES_VIEW;
-------------------------------DELETE-------------------------------------------
DECLARE
BEGIN
  DELETE_MESSAGE(2,2);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM MESSAGES_VIEW;
-------------------------------GET----------------------------------------------
SELECT * FROM MESSAGES_VIEW;
SELECT * FROM DIALOGS_VIEW;

DECLARE
  CURSOR1 SYS_REFCURSOR;  
  M SYSTEM.MESSAGES_VIEW%ROWTYPE;
BEGIN
  --GET_MESSAGE_BY_ID(CURSOR1,4);
  --GET_MESSAGES_BY_DIALOG_ID(CURSOR1,2);
  --GET_MESSAGES_BY_SENDER_ID(CURSOR1,2,1);
  LOOP
    FETCH CURSOR1 INTO M.MESSAGE_ID,M.MESSAGE_INFO,M.MESSAGE_CREATED,M.USER_ID,M.USER_FIRST_NAME,M.USER_LAST_NAME,M.USER_AVATAR;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||M.MESSAGE_ID      ||' '||
    'MESSAGE: ' ||M.MESSAGE_INFO    ||' '||
    'CREATED: ' ||M.MESSAGE_CREATED ||' '||
    'USER_ID: ' ||M.USER_ID         ||' '||
    'FNAME: '   ||M.USER_FIRST_NAME ||' '||
    'LNAME: '   ||M.USER_LAST_NAME  ||' '||
    'AVTAR: '   ||M.USER_AVATAR);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
