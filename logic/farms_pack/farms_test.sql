SET serveroutput ON;
--------------------------------------------------------------------------------
DELETE FARMS;
SELECT * FROM USERS;
SELECT * FROM FARMS;
SELECT * FROM SYSTEM.FARMS_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%INSPECTION%';
DELETE USERS_VIEW;
---------------------------------ADD--------------------------------------------
DECLARE
BEGIN
    ADD_FARM('Hrodno, 233190', '+375291066654',1);
    ADD_FARM('Minsk, 213568', '+375291067774', 2);
    ADD_FARM('Homel, 331001', '+375291069854', 1);
    ADD_FARM('Brest, 245871', '+375293419631', 2);    
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM SYSTEM.FARMS_VIEW;
----------------------------DELETE----------------------------------------------
DECLARE
BEGIN
  --DELETE_FARM_BY_ID(8);
  DELETE_FARM_BY_ADDRESS('Minsk, 213568');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM SYSTEM.FARMS_VIEW;
--------------------------------UPDATE------------------------------------------
DECLARE
BEGIN
  UPDATE_FARM(7,NULL,'+375333820346');
  UPDATE_FARM(5,'Ostrovec, 678329');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM SYSTEM.FARMS_VIEW;
-----------------------------------GET------------------------------------------
SELECT * FROM SYSTEM.FARMS_VIEW;

DECLARE
  CURSOR1 SYS_REFCURSOR;  
  F SYSTEM.FARMS_VIEW%ROWTYPE;
BEGIN
  --GET_FARMS(CURSOR1);
  --GET_FARM_BY_ADDRESS(CURSOR1,'Homel, 331001');
  GET_FARMS_BY_ID(CURSOR1,5);
  LOOP
    FETCH CURSOR1 INTO F.FARM_ID, F.FARM_ADDRESS,  F.FARM_PHONE;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||F.FARM_ID      ||' '||
    'ADDRESS: ' ||F.FARM_ADDRESS ||' '||
    'PHONE: '   ||F.FARM_PHONE);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------