SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM PHOTOS_VIEW;
SELECT * FROM COMMENTS_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%COMMENT%';
DELETE COMMENTS;
----------------------------------ADD-------------------------------------------
--ROSE_USER
DECLARE
BEGIN
  ADD_COMMENT('FIRST COMMENT',1,1);
  ADD_COMMENT('HI',1,2);
  ADD_COMMENT('LIKE',2,1);
  ADD_COMMENT('LIKE',2,3);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
--SYSTEM
SELECT * FROM COMMENTS;
---------------------------------DELETE-----------------------------------------
--ROSE_USER
DECLARE
BEGIN
  DELETE_COMMENT_BY_ID(1);
  --DELETE_COMMENT_BY_PHOTO_ID(6);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
--SYSTEM
SELECT * FROM COMMENTS_VIEW;
----------------------------------GET-------------------------------------------
SET serveroutput ON;

DECLARE
  CURSOR1 SYS_REFCURSOR;  
  C SYSTEM.COMMENTS_VIEW%ROWTYPE;
BEGIN
  GET_COMMENT_BY_ID(CURSOR1,2);  
  --GET_COMMENTS_BY_PHOTO_ID(CURSOR1,7);
  LOOP
    FETCH CURSOR1 INTO C.COMMENT_ID,C.COMMENT_INFO,C.COMMENT_CREATED,C.OWNER_ID,
      C.OWNER_FIRST_NAME,C.OWNER_LAST_NAME,C.OWNER_AVATAR;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '       ||C.COMMENT_ID       ||' '||
    'INFO: '     ||C.COMMENT_INFO     ||' '||
    'CREATED: '  ||C.COMMENT_CREATED  ||' '||
    'OWNER: '    ||C.OWNER_ID         ||' '||
    'FNAME: '    ||C.OWNER_FIRST_NAME ||' '||
    'LNAME: '    ||C.OWNER_LAST_NAME  ||' '||
    'AVATAR: '   ||C.OWNER_AVATAR);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------