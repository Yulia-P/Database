SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM ROSES;
SELECT * FROM ROSES_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%ROSE%';
DELETE ROSES;
SELECT * FROM USERS;
---------------------------------ADD--------------------------------------------
DECLARE
BEGIN
  ADD_ROSE('FELICITE PERPETUE','CLIMBING, LONG FLOWERING','http://photos/1',1);
  ADD_ROSE('POLAR STAR','SNOW WHITE','http://photos/1',2);
  ADD_ROSE('LEONARDO DA VINCI','FLORIBUNDA','http://photos/2',1);
  ADD_ROSE('WILLIAM MORRIS','D.AUSTIN, SHRUB','http://photos/3',2);
  ADD_ROSE('NIGHT','BLACK, ALL DARK SHADES','http://photos/1',1);
  ADD_ROSE('CHECKMATE','RED, CLASSIC','http://photos/2',2);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM ROSES;
----------------------------DELETE----------------------------------------------
DECLARE
BEGIN
  --DELETE_ROSE_BY_ID(6);
  --DELETE_ROSE_BY_NAME('POLAR STAR');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM SYSTEM.ROSES_VIEW;
--------------------------------UPDATE------------------------------------------
DECLARE
BEGIN
  --UPDATE_ROSE(4,'GENEROUS GARDENER');
  --UPDATE_ROSE(8,'KIWI','BUSH');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM SYSTEM.ROSES_VIEW;
-----------------------------------GET------------------------------------------
SELECT * FROM SYSTEM.ROSES_VIEW;

DECLARE
  CURSOR1 SYS_REFCURSOR;  
  R SYSTEM.ROSES_VIEW%ROWTYPE;
BEGIN
  --GET_ROSES(CURSOR1);
  --GET_ROSE_BY_NAME(CURSOR1,'KIWI');
  --GET_ROSE_BY_ID(CURSOR1,5);
  LOOP
    FETCH CURSOR1 INTO R.ROSE_ID,R.ROSE_NAME,R.ROSE_INFO,R.ROSE_PHOTO;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||R.ROSE_ID      ||' '||
    'NAME: '    ||R.ROSE_NAME    ||' '||
    'INFO: '    ||R.ROSE_INFO    ||' '||
    'PHOTO: '   ||R.ROSE_PHOTO);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------

