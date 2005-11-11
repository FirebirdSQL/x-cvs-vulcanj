SET NAMES ASCII;
CREATE DATABASE 'test.fdb' DEFAULT CHARACTER SET ISO8859_1;

-- Notes: TEST:0840 Roll back schema manipulation !

 CREATE TABLE USIG (C1 INT, C_1 INT);
 INSERT INTO USIG VALUES (0,2);
 INSERT INTO USIG VALUES (1,3);
COMMIT;

SET AUTODDL OFF;

 CREATE TABLE NOT_THERE (C1 CHAR (10));
-- PASS:0840 If table is created?
 ROLLBACK;
 INSERT INTO NOT_THERE VALUES ('1234567890');
-- PASS:0840 If ERROR, syntax error/access violation, 0 rows
-- selected?

 CREATE VIEW NOT_HERE AS SELECT * FROM USIG;
 ROLLBACK;
 SELECT COUNT (*) FROM NOT_HERE;
-- PASS:0840 If ERROR, syntax error/access violation, 0 rows
-- selected?

 ALTER TABLE USIG ADD  NUL INT;
 ROLLBACK;
 SELECT COUNT (*) FROM USIG WHERE NUL IS NULL;
-- PASS:0840 If ERROR, syntax error/access violation, 0 rows
-- selected?

 ROLLBACK;
 DROP TABLE USIG ;
-- PASS:0840 If table is dropped?
 ROLLBACK;
 SELECT COUNT(*) FROM USIG;
-- PASS:0840 If count = 2?

DROP DATABASE;
