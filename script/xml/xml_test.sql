SET serveroutput ON;
---------------------------------------------
SELECT * FROM USERS;
--------------------EXPORT-------------------
DECLARE
BEGIN
   XML_PACKAGE.EXPORT_USERS_TO_XML();
EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
--------------------IMPORT-------------------
DECLARE
BEGIN
   XML_PACKAGE.IMPORT_USERS_FROM_XML();

EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
---------------------------------------------