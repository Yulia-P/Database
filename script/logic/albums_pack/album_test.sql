SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM USERS ORDER BY ID;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%ALBUM%';
DELETE ALBUMS;
----------------------------------ADD-------------------------------------------
--ROSE_USER
DECLARE
BEGIN
   SYSTEM.ADD_ALBUM('ALBUM1',1);
   SYSTEM.ADD_ALBUM('ALBUM2',2);
   --ADD_ALBUM('ALBUM3',2);
EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

--SYSTEM
SELECT * FROM SYSTEM.ALBUMS_VIEW;
----------------------------------DELETE----------------------------------------
--ROSE_USER
DECLARE
BEGIN
   --DELETE_ALBUM_BY_ID(4);
   --DELETE_ALBUM_BY_USER_ID(5);
   --DELETE_ALBUM_BY_TITLE(5,'ALBum1');
     DELETE_ALBUM_BY_DATE(1,TO_DATE('16-12-2021','dd-mm-yyyy'),TRUE);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
---------------------------------UPDATE-----------------------------------------
DECLARE
BEGIN
   UPDATE_ALBUM(3,'ALBUM_UPDATE');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

set timing on;
SELECT * FROM ALBUMS WHERE USER_ID =3;
----------------------------------GET-------------------------------------------
set timing on;

SET serveroutput ON;

DECLARE
  CURSOR1 SYS_REFCURSOR;  
  A SYSTEM.ALBUMS_VIEW%ROWTYPE;
BEGIN
  --GET_ALBUM_BY_ID(CURSOR1,2);
  --GET_ALBUMS_BY_USER_ID(CURSOR1,3);
  --GET_ALBUMS_BY_TITLE(CURSOR1,3,'ALBUM_UPDATE');
  --GET_ALBUMS_BY_DATE(CURSOR1,1,TO_DATE('16-12-2021','dd-mm-yyyy'),TRUE);
  LOOP
    FETCH CURSOR1 INTO A.ALBUM_ID,A.ALBUM_TITLE,A.ALBUM_CREATED;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||A.ALBUM_ID     ||' '||
    'TITLE: '   ||A.ALBUM_TITLE  ||' '||
    'CREATED: ' ||A.ALBUM_CREATED );
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------