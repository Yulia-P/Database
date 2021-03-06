---------------------------------ROLE-------------------------------------------
---------------------USERS---------------------
GRANT EXECUTE ON REGISTRATION TO ROSE_USER;
GRANT EXECUTE ON CHANGE_AGE  TO ROSE_USER;
GRANT EXECUTE ON CHANGE_INFO TO ROSE_USER;
GRANT EXECUTE ON CHANGE_AVATAR TO ROSE_USER;
GRANT EXECUTE ON LOGIN TO ROSE_USER;
GRANT EXECUTE ON GET_USER_BY_ID TO ROSE_USER;
GRANT EXECUTE ON GET_USERS_BY_NAME TO ROSE_USER;
GRANT EXECUTE ON GET_USER_BY_EMAIL TO ROSE_USER;
GRANT SELECT ON USERS_VIEW TO ROSE_USER;
commit;
---------------------FRIENDS---------------------
GRANT EXECUTE ON ADD_FRIEND TO ROSE_USER;
GRANT EXECUTE ON DELETE_FRIEND_BY_ID TO ROSE_USER;
GRANT EXECUTE ON GET_FRIEND_BY_ID TO ROSE_USER;
GRANT EXECUTE ON GET_FRIEND_BY_EMAIL TO ROSE_USER;
GRANT EXECUTE ON GET_FRIENDS_BY_NAME TO ROSE_USER;
GRANT SELECT ON FRIENDS_VIEW TO ROSE_USER;
commit;
---------------------ALBUMS---------------------
GRANT EXECUTE ON ADD_ALBUM TO ROSE_USER;
GRANT EXECUTE ON DELETE_ALBUM_BY_ID TO ROSE_USER;
GRANT EXECUTE ON DELETE_ALBUM_BY_USER_ID TO ROSE_USER;
GRANT EXECUTE ON DELETE_ALBUM_BY_TITLE TO ROSE_USER;
GRANT EXECUTE ON DELETE_ALBUM_BY_DATE TO ROSE_USER;
GRANT EXECUTE ON UPDATE_ALBUM TO ROSE_USER;
GRANT EXECUTE ON GET_ALBUM_BY_ID TO ROSE_USER;
GRANT EXECUTE ON GET_ALBUMS_BY_USER_ID TO ROSE_USER;
GRANT EXECUTE ON GET_ALBUMS_BY_TITLE TO ROSE_USER;
GRANT EXECUTE ON GET_ALBUMS_BY_DATE TO ROSE_USER;
GRANT SELECT ON ALBUMS_VIEW TO ROSE_USER;
COMMIT;
---------------------PHOTOS---------------------
GRANT EXECUTE ON ADD_PHOTO TO ROSE_USER;
GRANT EXECUTE ON DELETE_PHOTO_BY_ID TO ROSE_USER;
GRANT EXECUTE ON DELETE_PHOTO_BY_ALBUM_ID TO ROSE_USER;
GRANT EXECUTE ON UPDATE_PHOTO_COORDS TO ROSE_USER;
GRANT EXECUTE ON GET_PHOTOS_BY_ALBUM_ID TO ROSE_USER;
GRANT EXECUTE ON GET_PHOTO_BY_ID TO ROSE_USER;
GRANT EXECUTE ON GET_PHOTO_BY_USER_ID TO ROSE_USER;
GRANT SELECT ON PHOTOS_VIEW TO ROSE_USER;
COMMIT;
---------------------COMMENTS---------------------
GRANT EXECUTE ON ADD_COMMENT TO ROSE_USER;
GRANT EXECUTE ON DELETE_COMMENT_BY_ID TO ROSE_USER;
GRANT EXECUTE ON DELETE_COMMENT_BY_PHOTO_ID TO ROSE_USER;
GRANT EXECUTE ON GET_COMMENTS_BY_PHOTO_ID TO ROSE_USER;
GRANT EXECUTE ON GET_COMMENT_BY_ID TO ROSE_USER;
GRANT SELECT ON COMMENTS_VIEW TO ROSE_USER;
COMMIT;
---------------------DIALOGS---------------------
GRANT EXECUTE ON ADD_DIALOG TO ROSE_USER;
GRANT EXECUTE ON DELETE_DIALOG_BY_ID TO ROSE_USER;
GRANT EXECUTE ON INVITE_USER_TO_DIALOG TO ROSE_USER;
GRANT EXECUTE ON REMOVE_USER_OF_DIALOG TO ROSE_USER;
GRANT EXECUTE ON CHECK_USER_IN_DIALOG TO ROSE_USER;
GRANT EXECUTE ON GET_DIALOG_BY_ID TO ROSE_USER;
GRANT EXECUTE ON GET_DIALOGS_BY_TITLE TO ROSE_USER;
GRANT EXECUTE ON GET_DIALOGS_BY_CREATOR_ID TO ROSE_USER;
GRANT SELECT ON DIALOGS_VIEW TO ROSE_USER;
COMMIT;
---------------------MESSAGES---------------------
GRANT EXECUTE ON ADD_MESSAGE TO ROSE_USER;
GRANT EXECUTE ON DELETE_MESSAGE TO ROSE_USER;
GRANT EXECUTE ON CHECK_MESSAGE_SENDER TO ROSE_USER;
GRANT EXECUTE ON GET_MESSAGE_BY_ID TO ROSE_USER;
GRANT EXECUTE ON GET_MESSAGES_BY_DIALOG_ID TO ROSE_USER;
GRANT EXECUTE ON GET_MESSAGES_BY_SENDER_ID TO ROSE_USER;
GRANT SELECT ON MESSAGES_VIEW TO ROSE_USER;
COMMIT;
---------------------ROSES---------------------
GRANT EXECUTE ON ADD_ROSE TO ROSE_USER;
GRANT EXECUTE ON DELETE_ROSE_BY_ID TO ROSE_USER;
GRANT EXECUTE ON DELETE_ROSE_BY_ADDRESS TO ROSE_USER;
GRANT EXECUTE ON UPDATE_ROSE TO ROSE_USER;
GRANT EXECUTE ON GET_ROSES TO ROSE_USER;
GRANT EXECUTE ON GET_ROSE_BY_ADDRESS TO ROSE_USER;
GRANT EXECUTE ON GET_ROSE_BY_ID TO ROSE_USER;
GRANT SELECT ON ROSES_VIEW TO ROSE_USER;
COMMIT;
---------------------FARMS---------------------
GRANT EXECUTE ON ADD_FARM TO ROSE_USER;
GRANT EXECUTE ON DELETE_FARM_BY_ID TO ROSE_USER;
GRANT EXECUTE ON DELETE_FARM_BY_ADDRESS TO ROSE_USER;
GRANT EXECUTE ON UPDATE_FARM TO ROSE_USER;
GRANT EXECUTE ON GET_FARMS TO ROSE_USER;
GRANT EXECUTE ON GET_FARM_BY_ADDRESS TO ROSE_USER;
GRANT EXECUTE ON GET_FARMS_BY_ID TO ROSE_USER;
GRANT SELECT ON FARMS_VIEW TO ROSE_USER;
COMMIT;
---------------------NEWS---------------------
GRANT EXECUTE ON ADD_NEWS TO ROSE_USER;
GRANT EXECUTE ON GET_NEWS TO ROSE_USER;
GRANT EXECUTE ON GET_NEWS_BY_ID TO ROSE_USER;
GRANT EXECUTE ON GET_NEWS_BY_TITLE TO ROSE_USER;
GRANT EXECUTE ON DELETE_NEWS_BY_ID TO ROSE_USER;
GRANT EXECUTE ON DELETE_NEWS_BY_TITLE TO ROSE_USER;
GRANT EXECUTE ON UPDATE_NEWS TO ROSE_USER;
GRANT SELECT ON NEWS_VIEW TO ROSE_USER;
COMMIT;
---------------VALIDATION/EXCEPTION--------------
GRANT EXECUTE ON VALIDATION_PACKAGE TO ROSE_USER;
GRANT EXECUTE ON EXCEPTION_PACKAGE TO ROSE_USER;

SELECT * FROM USER_SYS_PRIVS; 
SELECT * FROM USER_TAB_PRIVS;
SELECT * FROM USER_ROLE_PRIVS;
--------------------------------------------------------------------------------
commit;