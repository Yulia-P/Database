SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM USERS;
SELECT * FROM NEWS_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%NEWS%';
DELETE NEWS;
----------------------------ADD-------------------------------------------------
--ROSE_USER
DECLARE
BEGIN
  ADD_NEWS('NEWS TITLE1','NEWS INFO1','photo//url',1);
  ADD_NEWS('NEWS TITLE2','NEWS INFO2','photo//url',2);
  ADD_NEWS('NEWS TITLE3','NEWS INFO2','photo//url',2);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

--SYSTEM
SELECT * FROM SYSTEM.NEWS_VIEW;
----------------------------DELETE----------------------------------------------
DECLARE
BEGIN
  --DELETE_NEWS_BY_ID(1);
  --DELETE_NEWS_BY_TITLE('NEWS TITLE2');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM NEWS_VIEW;
----------------------------UPDATE----------------------------------------------
DECLARE
BEGIN
 UPDATE_NEWS(6,'UPDATE TITLE1','UPDATE NEWS INFO1');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
SELECT * FROM NEWS_VIEW;
----------------------------GET-------------------------------------------------
SELECT * FROM NEWS_VIEW;

DECLARE
  CURSOR1 SYS_REFCURSOR;  
  N SYSTEM.NEWS_VIEW%ROWTYPE;
BEGIN
  --GET_NEWS(CURSOR1);
  --GET_NEWS_BY_ID(CURSOR1,6);
  --GET_NEWS_BY_TITLE(CURSOR1,'NEWS TITLE2');
  LOOP
    FETCH CURSOR1 INTO N.NEWS_ID,N.NEWS_TITLE,N.NEWS_INFO,N.NEWS_PHOTO,N.NEWS_CREATED;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||N.NEWS_ID      ||' '||
    'TITLE: '   ||N.NEWS_TITLE   ||' '||
    'INFO: '    ||N.NEWS_INFO    ||' '||
    'PHOTO: '   ||N.NEWS_PHOTO   ||' '||
    'CREATED: ' ||N.NEWS_CREATED);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------