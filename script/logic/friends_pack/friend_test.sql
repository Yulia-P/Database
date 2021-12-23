SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM USERS;
SELECT * FROM FRIENDS;
SELECT * FROM FRIENDS_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%FRIEND%';
DELETE FRIENDS;
----------------------------------ADD-------------------------------------------
--ROSE_USER
DECLARE
BEGIN
  SYSTEM.ADD_FRIEND(1,2);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
--SYSTEM
SELECT * FROM FRIENDS;
----------------------------------DELETE----------------------------------------
--USER_ROSE
DECLARE
BEGIN
  SYSTEM.DELETE_FRIEND_BY_ID(2,3);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
--SYSTEM
SELECT * FROM FRIENDS;
----------------------------------GET-------------------------------------------
select * from system.FRIENDS_VIEW;
SET serveroutput ON;

DECLARE
  CURSOR1 SYS_REFCURSOR;  
  F SYSTEM.FRIENDS_VIEW%ROWTYPE;
BEGIN
  --SYSTEM.GET_FRIEND_BY_ID(CURSOR1,1,3);
  --SYSTEM.GET_FRIENDS_BY_NAME(CURSOR1,1,'ANTON','LOSHCHENKO');
  SYSTEM.GET_FRIEND_BY_EMAIL(CURSOR1,1,'antl@gmail.com');
  LOOP
    FETCH CURSOR1 INTO F.FRIEND_ID,F.FRIEND_FIRST_NAME,F.FRIEND_LAST_NAME,F.FRIEND_EMAIL,F.FRIEND_AVATAR;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||F.FRIEND_ID         ||' '||
    'FNAME: '   ||F.FRIEND_FIRST_NAME ||' '||
    'LNAME: '   ||F.FRIEND_LAST_NAME  ||' '||
    'EMAIL: '   ||F.FRIEND_EMAIL      ||' '||
    'AVATAR: '  ||F.FRIEND_AVATAR);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------