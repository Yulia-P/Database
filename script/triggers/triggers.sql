DROP PROCEDURE LOG_PROCEDURE;

DROP TRIGGER USERS_BEFORE;
DROP TRIGGER USERS_AFTER;

DROP TRIGGER ALBUMS_BEFORE;
DROP TRIGGER ALBUMS_AFTER;

DROP TRIGGER PHOTOS_BEFORE;
DROP TRIGGER PHOTOS_AFTER;

DROP TRIGGER COMMENTS_BEFORE;
DROP TRIGGER COMMENTS_AFTER;

DROP TRIGGER FRIENDS_BEFORE;
DROP TRIGGER FRIENDS_AFTER;

DROP TRIGGER USERS_TO_DIALOGS_BEFORE;
DROP TRIGGER USERS_TO_DIALOGS_AFTER;

DROP TRIGGER DIALOGS_BEFORE;
DROP TRIGGER DIALOGS_AFTER;

DROP TRIGGER MESSAGES_BEFORE;
DROP TRIGGER MESSAGES_AFTER;

DROP TRIGGER NEWS_BEFORE;
DROP TRIGGER NEWS_AFTER;

DROP TRIGGER ROSES_BEFORE;
DROP TRIGGER ROSES_AFTER;

DROP TRIGGER FARMS_BEFORE;
DROP TRIGGER FARMS_AFTER;

--------------------------------------------------------------------------------
SELECT * FROM USER_TRIGGERS;
----
CREATE OR REPLACE PROCEDURE LOG_PROCEDURE(
    TABLE_NAME IN       VARCHAR,
    OPERATION IN        VARCHAR,
    OLD_VALUE IN        VARCHAR,
    NEW_VALUE IN        VARCHAR)
IS 
BEGIN
  INSERT INTO LOGS(TABLE_NAME,EXECUTED_BY_USER,EVENT_TIME,OPERATION,OLD_VALUE,NEW_VALUE) 
    VALUES(TABLE_NAME,USER,SYSDATE,OPERATION,OLD_VALUE,NEW_VALUE);
END LOG_PROCEDURE;
------------------------------USERS_TRIGGER-------------------------------------
CREATE OR REPLACE TRIGGER USERS_BEFORE 
BEFORE INSERT OR UPDATE OR DELETE ON USERS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  LOG_PROCEDURE('USERS',OPER,NULL,NULL);
END;
----------==============================----------
--CHECK!!!!
SET DEFINE OFF;
CREATE OR REPLACE TRIGGER USERS_AFTER 
BEFORE INSERT OR UPDATE OR DELETE ON USERS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
  OLD_VALUE VARCHAR(2000);
  NEW_VALUE VARCHAR(2000);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  OLD_VALUE := :OLD.ID||' '||:OLD.FIRST_NAME||' '||:OLD.LAST_NAME||' '||:OLD.AGE||' '||:OLD.EMAIL||' '||:OLD.PASS||' '||:OLD.INFO||' '||:OLD.AVATAR;
  NEW_VALUE := :NEW.ID||' '||:NEW.FIRST_NAME||' '||:NEW.LAST_NAME||' '||:NEW.AGE||' '||:NEW.EMAIL||' '||:NEW.PASS||' '||:NEW.INFO||' '||:NEW.AVATAR;
  
  LOG_PROCEDURE('USERS',OPER,OLD_VALUE,NEW_VALUE);
END;
------------------------------ALBUMS_TRIGGER------------------------------------
CREATE OR REPLACE TRIGGER ALBUMS_BEFORE 
BEFORE INSERT OR UPDATE OR DELETE ON ALBUMS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  LOG_PROCEDURE('ALBUMS',OPER,NULL,NULL);
END;
----------==============================----------
SET DEFINE OFF;
CREATE OR REPLACE TRIGGER ALBUMS_AFTER 
BEFORE INSERT OR UPDATE OR DELETE ON ALBUMS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
  OLD_VALUE VARCHAR(2000);
  NEW_VALUE VARCHAR(2000);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  OLD_VALUE := :OLD.ID||' '||:OLD.TITLE||' '||:OLD.USER_ID||' '||:OLD.CREATED;
  NEW_VALUE := :NEW.ID||' '||:NEW.TITLE||' '||:NEW.USER_ID||' '||:NEW.CREATED;
  
  LOG_PROCEDURE('ALBUMS',OPER,OLD_VALUE,NEW_VALUE);
END;
------------------------------PHOTOS_TRIGGER------------------------------------
CREATE OR REPLACE TRIGGER PHOTOS_BEFORE 
BEFORE INSERT OR UPDATE OR DELETE ON PHOTOS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  LOG_PROCEDURE('PHOTOS',OPER,NULL,NULL);
END;
----------==============================----------
SET DEFINE OFF;
CREATE OR REPLACE TRIGGER PHOTOS_AFTER 
BEFORE INSERT OR UPDATE OR DELETE ON PHOTOS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
  OLD_VALUE VARCHAR(2000);
  NEW_VALUE VARCHAR(2000);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  OLD_VALUE := :OLD.ID||' '||:OLD.PHOTO||' '||:OLD.ALBUM_ID||' '||:OLD.CREATED||' '||:OLD.LONGITUDE||' '||:OLD.LATITUDE;
  NEW_VALUE := :NEW.ID||' '||:NEW.PHOTO||' '||:NEW.ALBUM_ID||' '||:NEW.CREATED||' '||:NEW.LONGITUDE||' '||:NEW.LATITUDE;
  
  LOG_PROCEDURE('PHOTOS',OPER,OLD_VALUE,NEW_VALUE);
END;
------------------------------COMMENTS_TRIGGER----------------------------------
CREATE OR REPLACE TRIGGER COMMENTS_BEFORE 
BEFORE INSERT OR UPDATE OR DELETE ON COMMENTS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  LOG_PROCEDURE('COMMENTS',OPER,NULL,NULL);
END;
----------==============================----------
SET DEFINE OFF;
CREATE OR REPLACE TRIGGER COMMENTS_AFTER 
BEFORE INSERT OR UPDATE OR DELETE ON COMMENTS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
  OLD_VALUE VARCHAR(2000);
  NEW_VALUE VARCHAR(2000);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  OLD_VALUE := :OLD.ID||' '||:OLD.INFO||' '||:OLD.PHOTO_ID||' '||:OLD.USER_ID||' '||:OLD.CREATED;
  NEW_VALUE := :NEW.ID||' '||:NEW.INFO||' '||:NEW.PHOTO_ID||' '||:NEW.USER_ID||' '||:NEW.CREATED;
  
  LOG_PROCEDURE('COMMENTS',OPER,OLD_VALUE,NEW_VALUE);
END;
------------------------------FRIENDS_TRIGGER-----------------------------------
CREATE OR REPLACE TRIGGER FRIENDS_BEFORE 
BEFORE INSERT OR UPDATE OR DELETE ON FRIENDS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  LOG_PROCEDURE('FRIENDS',OPER,NULL,NULL);
END;
----------==============================----------
SET DEFINE OFF;
CREATE OR REPLACE TRIGGER FRIENDS_AFTER 
BEFORE INSERT OR UPDATE OR DELETE ON FRIENDS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
  OLD_VALUE VARCHAR(2000);
  NEW_VALUE VARCHAR(2000);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  OLD_VALUE := :OLD.USER_1||' '||:OLD.USER_2;
  NEW_VALUE := :NEW.USER_1||' '||:NEW.USER_2;
  
  LOG_PROCEDURE('FRIENDS',OPER,OLD_VALUE,NEW_VALUE);
END;
------------------------------USERS_TO_DIALOGS_TRIGGER--------------------------
CREATE OR REPLACE TRIGGER USERS_TO_DIALOGS_BEFORE 
BEFORE INSERT OR UPDATE OR DELETE ON USERS_TO_DIALOGS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  LOG_PROCEDURE('USERS_TO_DIALOGS',OPER,NULL,NULL);
END;
----------==============================----------
SET DEFINE OFF;
CREATE OR REPLACE TRIGGER USERS_TO_DIALOGS_AFTER 
BEFORE INSERT OR UPDATE OR DELETE ON USERS_TO_DIALOGS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
  OLD_VALUE VARCHAR(2000);
  NEW_VALUE VARCHAR(2000);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  OLD_VALUE := :OLD.USER_ID||' '||:OLD.DIALOG_ID;
  NEW_VALUE := :NEW.USER_ID||' '||:NEW.DIALOG_ID;
  
  LOG_PROCEDURE('USERS_TO_DIALOGS',OPER,OLD_VALUE,NEW_VALUE);
END;
------------------------------DIALOGS_TRIGGER-----------------------------------
CREATE OR REPLACE TRIGGER DIALOGS_BEFORE 
BEFORE INSERT OR UPDATE OR DELETE ON DIALOGS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  LOG_PROCEDURE('DIALOGS',OPER,NULL,NULL);
END;
----------==============================----------
SET DEFINE OFF;
CREATE OR REPLACE TRIGGER DIALOGS_AFTER 
BEFORE INSERT OR UPDATE OR DELETE ON DIALOGS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
  OLD_VALUE VARCHAR(2000);
  NEW_VALUE VARCHAR(2000);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  OLD_VALUE := :OLD.ID||' '||:OLD.TITLE||' '||:OLD.CREATED;
  NEW_VALUE := :NEW.ID||' '||:NEW.TITLE||' '||:NEW.CREATED;
  
  LOG_PROCEDURE('DIALOGS',OPER,OLD_VALUE,NEW_VALUE);
END;
------------------------------MESSAGES_TRIGGER----------------------------------
CREATE OR REPLACE TRIGGER MESSAGES_BEFORE 
BEFORE INSERT OR UPDATE OR DELETE ON MESSAGES
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  LOG_PROCEDURE('MESSAGES',OPER,NULL,NULL);
END;
----------==============================----------
SET DEFINE OFF;
CREATE OR REPLACE TRIGGER MESSAGES_AFTER 
BEFORE INSERT OR UPDATE OR DELETE ON MESSAGES
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
  OLD_VALUE VARCHAR(2000);
  NEW_VALUE VARCHAR(2000);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  OLD_VALUE := :OLD.ID||' '||:OLD.INFO||' '||:OLD.USER_ID||' '||:OLD.DIALOG_ID||' '||:OLD.CREATED;
  NEW_VALUE := :NEW.ID||' '||:NEW.INFO||' '||:NEW.USER_ID||' '||:NEW.DIALOG_ID||' '||:NEW.CREATED;
  
  LOG_PROCEDURE('MESSAGES',OPER,OLD_VALUE,NEW_VALUE);
END;
------------------------------NEWS_TRIGGER--------------------------------------
CREATE OR REPLACE TRIGGER NEWS_BEFORE 
BEFORE INSERT OR UPDATE OR DELETE ON NEWS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  LOG_PROCEDURE('NEWS',OPER,NULL,NULL);
END;
----------==============================----------
SET DEFINE OFF;
CREATE OR REPLACE TRIGGER NEWS_AFTER 
BEFORE INSERT OR UPDATE OR DELETE ON NEWS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
  OLD_VALUE VARCHAR(2000);
  NEW_VALUE VARCHAR(2000);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  OLD_VALUE := :OLD.ID||' '||:OLD.TITLE||' '||:OLD.INFO||' '||:OLD.PHOTO||' '||:OLD.CREATED||' '||:OLD.USER_ID;
  NEW_VALUE := :NEW.ID||' '||:NEW.TITLE||' '||:NEW.INFO||' '||:NEW.PHOTO||' '||:NEW.CREATED||' '||:NEW.USER_ID;
  
  LOG_PROCEDURE('NEWS',OPER,OLD_VALUE,NEW_VALUE);
END;
------------------------------ROSES_TRIGGER------------------------------------
CREATE OR REPLACE TRIGGER ROSES_BEFORE
BEFORE INSERT OR UPDATE OR DELETE ON ROSES
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  LOG_PROCEDURE('ROSES',OPER,NULL,NULL);
END;
----------==============================----------
SET DEFINE OFF;
CREATE OR REPLACE TRIGGER ROSES_AFTER
BEFORE INSERT OR UPDATE OR DELETE ON ROSES
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
  OLD_VALUE VARCHAR(2000);
  NEW_VALUE VARCHAR(2000);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  OLD_VALUE := :OLD.ID||' '||:OLD.NAME||' '||:OLD.CREATED||' '||:OLD.INFO||' '||:OLD.PHOTO||' '||:OLD.USER_ID;
  NEW_VALUE := :NEW.ID||' '||:NEW.NAME||' '||:NEW.CREATED||' '||:NEW.INFO||' '||:NEW.PHOTO||' '||:NEW.USER_ID;
  
  LOG_PROCEDURE('ROSES',OPER,OLD_VALUE,NEW_VALUE);
END;
------------------------------FARMS_TRIGGER-------------------------
CREATE OR REPLACE TRIGGER FARMS_BEFORE
BEFORE INSERT OR UPDATE OR DELETE ON FARMS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  LOG_PROCEDURE('FARMS',OPER,NULL,NULL);
END;
----------==============================----------
SET DEFINE OFF;
CREATE OR REPLACE TRIGGER FARMS_AFTER
BEFORE INSERT OR UPDATE OR DELETE ON FARMS
FOR EACH ROW
DECLARE
  OPER VARCHAR(10);
  OLD_VALUE VARCHAR(2000);
  NEW_VALUE VARCHAR(2000);
BEGIN
  IF INSERTING THEN OPER := 'INSERT';
  ELSIF UPDATING THEN OPER := 'UPDATE';
  ELSIF DELETING THEN OPER := 'DELETE';
  END IF;
  
  OLD_VALUE := :OLD.ID||' '||:OLD.ADDRESS||' '||:OLD.PHONE||' '||:OLD.CREATED||' '||:OLD.USER_ID;
  NEW_VALUE := :NEW.ID||' '||:NEW.ADDRESS||' '||:NEW.PHONE||' '||:NEW.CREATED||' '||:NEW.USER_ID;
  
  LOG_PROCEDURE('FARMS',OPER,OLD_VALUE,NEW_VALUE);
END;
--------------------------------------------------------------------------------