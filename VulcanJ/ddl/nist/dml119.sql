SET NAMES ASCII;
CREATE DATABASE 'test.fdb' DEFAULT CHARACTER SET ISO8859_1;

 CREATE TABLE USER_INPUT ( USER_ID INT, USER_TYPED CHAR (10), CASH_BALANCE NUMERIC (5, 2));
 INSERT INTO USER_INPUT VALUES (0, '999.99', 999.99);
 INSERT INTO USER_INPUT VALUES (1, '-999.99', -999.99);
 INSERT INTO USER_INPUT VALUES (2, '  54.', 54);
 INSERT INTO USER_INPUT VALUES (CAST ('3' AS INT), CAST (-7.02 AS CHAR (10)), CAST (' -.702E+1' AS NUMERIC (5, 2)));
 SELECT CAST (AVG (CAST (USER_TYPED AS INT)) AS INT) FROM USER_INPUT;
--  PASS:0647 If 1 row selected and value is 11 or 12?

 SELECT AVG (cast (USER_TYPED as numeric (5,2))) FROM USER_INPUT;
--  PASS:0647 If 1 row selected and value is 11.745 +- 0.01?

 UPDATE USER_INPUT SET USER_TYPED = CAST (0 AS CHAR (10)), CASH_BALANCE = CASH_BALANCE - CAST ('500' AS NUMERIC (5, 2)) WHERE USER_ID = CAST ('-0' AS INT);
 SELECT SUM (USER_TYPED) * 100, SUM (cast (CASH_BALANCE as real)) FROM USER_INPUT;
--  PASS:0647 If 1 row selected and first value is -95301 +- 4?
--  PASS:0647 AND second value is -453.02 +- 0.04?

 DELETE FROM USER_INPUT;
 INSERT INTO USER_INPUT VALUES (CAST ('3' AS INT), CAST (-7.02 AS CHAR (10)), CAST (' -.702E+1' AS NUMERIC (5, 2)));
 INSERT INTO USER_INPUT VALUES (CAST ('3' AS SMALLINT), CAST (-7.02 AS CHAR (5)), CAST (' -.702E+1' AS DECIMAL (3, 2)));
 SELECT USER_ID FROM USER_INPUT GROUP BY USER_ID, USER_TYPED, CASH_BALANCE HAVING COUNT(*) = 2; 
--  PASS:0647 If 1 row selected and USER_ID = 3?

COMMIT;

 DROP TABLE USER_INPUT ;

DROP DATABASE;
