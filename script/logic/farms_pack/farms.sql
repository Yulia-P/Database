-- EXCEPTION 90 - 100
-- 90 farm with this phone or address already exists
-- 91 farm data entered incorrectly
-- 92 farm does not exist
-- 93 error delete farm
-- 94 error update farm
-- 95 error when reading farms
-- 99 phone entered incorrectly
--------------------------------------------------------------------------------
CREATE PUBLIC SYNONYM ADD_FARM FOR SYSTEM.ADD_FARM;
--DROP PUBLIC SYNONYM ADD_FARM;

--DROP PROCEDURE ADD_FARM;
CREATE OR REPLACE PROCEDURE ADD_FARM(
FARM_ADDRESS FARMS.ADDRESS%TYPE,
FARM_PHONE FARMS.PHONE%TYPE,
FARM_USER_ID FARMS.USER_ID%TYPE)
IS
  FARM_COUNTER NUMBER;
BEGIN
  IF VALIDATION_PACKAGE.CHECK_PHONE(FARM_PHONE) = FALSE THEN
    RAISE EXCEPTION_PACKAGE.INCORRECTLY_PHONE;
  END IF;
  SELECT COUNT(*) INTO FARM_COUNTER
    FROM FARMS
      WHERE ADDRESS = FARM_ADDRESS
        OR PHONE = FARM_PHONE;
  IF FARM_COUNTER = 0 THEN
    INSERT INTO FARMS(ADDRESS,PHONE,CREATED,USER_ID)
      VALUES (FARM_ADDRESS,FARM_PHONE,CURRENT_TIMESTAMP,FARM_USER_ID);
  ELSE
    RAISE EXCEPTION_PACKAGE.FARM_ALREADY_EXISTS;
  END IF;
  COMMIT;
EXCEPTION
  WHEN EXCEPTION_PACKAGE.INCORRECTLY_PHONE THEN
    RAISE_APPLICATION_ERROR(-20099,'phone entered incorrectly');
    
  WHEN EXCEPTION_PACKAGE.FARM_ALREADY_EXISTS THEN
    RAISE_APPLICATION_ERROR(-20090,'farm with this phone or address already exists');
    
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20091, 'farm data entered incorrectly');
END ADD_FARM;
--------------------------------------------------------------------------------
CREATE PUBLIC SYNONYM DELETE_FARM_BY_ID FOR SYSTEM.DELETE_FARM_BY_ID;
--DROP PUBLIC SYNONYM DELETE_FARM_BY_ID;

--DROP PROCEDURE DELETE_FARM_BY_ID;
CREATE OR REPLACE PROCEDURE DELETE_FARM_BY_ID(
FARM_ID FARMS.ID%TYPE)
IS
  FARM_COUNTER NUMBER;
BEGIN
  SELECT COUNT(*) INTO FARM_COUNTER
    FROM FARMS
      WHERE ID = FARM_ID;
  IF FARM_COUNTER = 0 THEN
    RAISE EXCEPTION_PACKAGE.FARM_DOESNT_EXISTS;
  ELSE
    DELETE FARMS
      WHERE ID = FARM_ID;
  END IF;
  COMMIT;
EXCEPTION
  WHEN EXCEPTION_PACKAGE.FARM_DOESNT_EXISTS THEN
    RAISE_APPLICATION_ERROR(-20092,'farm does not exist');
    
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20093, 'error delete farm');
END DELETE_FARM_BY_ID;
--------------------------------------------------------------------------------
CREATE PUBLIC SYNONYM DELETE_FARM_BY_ADDRESS FOR SYSTEM.DELETE_FARM_BY_ADDRESS;
--DROP PUBLIC SYNONYM DELETE_FARM_BY_ADDRESS;

--DROP PROCEDURE DELETE_FARM_BY_ADDRESS;
CREATE OR REPLACE PROCEDURE DELETE_FARM_BY_ADDRESS(
FARM_ADDRESS FARMS.ADDRESS%TYPE)
IS
  FARM_COUNTER NUMBER;
BEGIN
  SELECT COUNT(*) INTO FARM_COUNTER
    FROM FARMS
      WHERE UPPER(ADDRESS) = UPPER(FARM_ADDRESS);
  IF FARM_COUNTER = 0 THEN
    RAISE EXCEPTION_PACKAGE.FARM_DOESNT_EXISTS;
  ELSE
    DELETE FARMS
      WHERE UPPER(ADDRESS) = UPPER(FARM_ADDRESS);
  END IF;
  COMMIT;
EXCEPTION
  WHEN EXCEPTION_PACKAGE.FARM_DOESNT_EXISTS THEN
    RAISE_APPLICATION_ERROR(-20092,'farm does not exist');
    
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20093, 'error delete farm');
END DELETE_FARM_BY_ADDRESS;
--------------------------------------------------------------------------------
CREATE PUBLIC SYNONYM UPDATE_FARM FOR SYSTEM.UPDATE_FARM;
--DROP PUBLIC SYNONYM UPDATE_FARM;

--DROP PROCEDURE UPDATE_FARM;
CREATE OR REPLACE PROCEDURE UPDATE_FARM(
FARM_ID FARMS.ID%TYPE,
FARM_ADDRESS FARMS.ADDRESS%TYPE:=NULL,
FARM_PHONE FARMS.PHONE%TYPE:=NULL
)
IS
  NEW_FARM_ADDRESS FARMS.ADDRESS%TYPE;
  NEW_FARM_PHONE FARMS.PHONE%TYPE;
  
  CHANGEABLE_ENTRY FARMS%ROWTYPE;
BEGIN
  
  SELECT * INTO CHANGEABLE_ENTRY 
    FROM FARMS
      WHERE ID = FARM_ID;
  
  IF FARM_ADDRESS IS NULL THEN
    NEW_FARM_ADDRESS := CHANGEABLE_ENTRY.ADDRESS;
  ELSE
    NEW_FARM_ADDRESS := FARM_ADDRESS;
  END IF;
  
  IF FARM_PHONE IS NULL THEN
    NEW_FARM_PHONE := CHANGEABLE_ENTRY.PHONE;
  ELSE
    NEW_FARM_PHONE := FARM_PHONE;
  END IF;
  
  IF VALIDATION_PACKAGE.CHECK_PHONE(NEW_FARM_PHONE) = FALSE THEN
    RAISE EXCEPTION_PACKAGE.INCORRECTLY_PHONE;
  END IF;
  
  UPDATE FARMS
    SET ADDRESS = NEW_FARM_ADDRESS,PHONE = NEW_FARM_PHONE
      WHERE ID = FARM_ID;
  COMMIT;
EXCEPTION
  WHEN EXCEPTION_PACKAGE.INCORRECTLY_PHONE THEN
    RAISE_APPLICATION_ERROR(-20099,'phone entered incorrectly');
    
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20092,'farm does not exist');
    
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20094, 'error update farm');
END UPDATE_FARM;
--------------------------------------------------------------------------------
CREATE PUBLIC SYNONYM GET_FARMS FOR SYSTEM.GET_FARMS;
--DROP PUBLIC SYNONYM GET_FARMS;

--DROP PROCEDURE GET_FARMS;
CREATE OR REPLACE PROCEDURE GET_FARMS(
RESULT_CURSOR OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN RESULT_CURSOR FOR 
    SELECT * 
      FROM FARMS_VIEW
        ORDER BY FARM_ADDRESS;
EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20095, 'error when reading farms');
END GET_FARMS;
--------------------------------------------------------------------------------
CREATE PUBLIC SYNONYM GET_FARM_BY_ADDRESS FOR SYSTEM.GET_FARM_BY_ADDRESS;
--DROP PUBLIC SYNONYM GET_FARM_BY_ADDRESS;

--DROP PROCEDURE GET_FARM_BY_ADDRESS;
CREATE OR REPLACE PROCEDURE GET_FARM_BY_ADDRESS(
RESULT_CURSOR OUT SYS_REFCURSOR,
I_ADDRESS FARMS_VIEW.FARM_ADDRESS%TYPE)
IS
BEGIN
  OPEN RESULT_CURSOR FOR 
    SELECT * 
      FROM FARMS_VIEW
        WHERE UPPER(FARM_ADDRESS) LIKE UPPER('%'||I_ADDRESS||'%')
          ORDER BY FARM_ADDRESS;
EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20095, 'error when reading farms');
END GET_FARM_BY_ADDRESS;
--------------------------------------------------------------------------------
CREATE PUBLIC SYNONYM GET_FARMS_BY_ID FOR SYSTEM.GET_FARMS_BY_ID;
--DROP PUBLIC SYNONYM GET_FARMS_BY_ID;

--DROP PROCEDURE GET_FARMS_BY_ID;
CREATE OR REPLACE PROCEDURE GET_FARMS_BY_ID(
RESULT_CURSOR OUT SYS_REFCURSOR,
I_ID FARMS_VIEW.FARM_ID%TYPE)
IS
BEGIN
  OPEN RESULT_CURSOR FOR 
    SELECT * 
      FROM FARMS_VIEW
        WHERE FARM_ID = I_ID;
EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20095, 'error when reading farms');
END GET_FARMS_BY_ID;
--------------------------------------------------------------------------------