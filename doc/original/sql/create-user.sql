CREATE USER "atlas_quiz_user"@"localhost" IDENTIFIED BY "Super";
GRANT SELECT, INSERT, UPDATE, DELETE ON quiz_mania_db.* TO "atlas_quiz_user"@"localhost";
FLUSH PRIVILEGES;