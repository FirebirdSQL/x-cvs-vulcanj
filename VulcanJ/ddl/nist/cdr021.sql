SET NAMES ASCII;
CREATE DATABASE 'test.fdb' DEFAULT CHARACTER SET ISO8859_1;

INPUT ddl/input/sun-tab3.sql;
INPUT ddl/input/sun-tab3-refresh.sql;
INPUT ddl/input/sul-tab1.sql;
INPUT ddl/input/sul-tab1-refresh.sql;
 DELETE FROM STAFF_P WHERE EMPNUM='E1';
 SELECT EMPNUM FROM STAFF_P WHERE EMPNUM = 'E1'; 
 UPDATE STAFF_P SET EMPNUM = 'E9' WHERE EMPNUM = 'E2';
 SELECT COUNT(*) FROM STAFF_P WHERE EMPNUM = 'E2';


DROP DATABASE;