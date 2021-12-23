SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM ALBUMS;
SELECT * FROM PHOTOS_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%PHOTO%';
DELETE PHOTOS;
-------------------------------------ADD----------------------------------------
--ROSE_USER
DECLARE
BEGIN
   ADD_PHOTO('https://albums/photo1',2,59.4325,43.534);
   ADD_PHOTO('https://albums/bla22',2,21.3212,43.0293);
   ADD_PHOTO('https://albums/photo2',1);
   ADD_PHOTO('https://albums/photo3',1,9.100221,13.2019);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
--SYSTEM
SELECT * FROM PHOTOS;
----------------------------------DELETE----------------------------------------
--ROSE_USER
DECLARE
BEGIN
  --DELETE_PHOTO_BY_ID(1);
  --DELETE_PHOTO_BY_ALBUM_ID(3);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
--SYSTEM
SELECT * FROM PHOTOS;
----------------------------------UPDATE----------------------------------------
--ROSE_USER
DECLARE
BEGIN
  UPDATE_PHOTO_COORDS(2,0,0);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
--SYSTEM
SELECT * FROM PHOTOS;
-------------------------------------GET----------------------------------------
SELECT * FROM SYSTEM.PHOTOS_VIEW;

SET serveroutput ON;

DECLARE
  CURSOR1 SYS_REFCURSOR;  
  P SYSTEM.PHOTOS_VIEW%ROWTYPE;
BEGIN
  GET_PHOTO_BY_ID(CURSOR1,2);
  --GET_PHOTOS_BY_ALBUM_ID(CURSOR1,2);
  --GET_PHOTO_BY_USER_ID(CURSOR1,2);
  LOOP
    FETCH CURSOR1 INTO P.PHOTO_ID,P.PHOTO_PATH,P.PHOTO_CREATED;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||P.PHOTO_ID     ||' '||
    'PATH: '    ||P.PHOTO_PATH   ||' '||
    'CREATED: ' ||P.PHOTO_CREATED);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------