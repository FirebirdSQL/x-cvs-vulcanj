SET NAMES ASCII;
CREATE DATABASE 'test.fdb' DEFAULT CHARACTER SET ISO8859_1;

INPUT ddl/input/base-tab.sql;
COMMIT WORK;

  CREATE TABLE T4(STR110 CHAR(110) NOT NULL,
                NUM6   NUMERIC(6) NOT NULL,
                COL3   CHAR(10),COL4 CHAR(20));
  CREATE UNIQUE INDEX T4_IND ON T4(STR110,NUM6);

COMMIT WORK;

-- from dml050
-- TEST:0226 FIPS sizing - 10 tables in SQL statement!
 SELECT EMPNUM, EMPNAME FROM STAFF WHERE EMPNUM IN (SELECT EMPNUM  FROM WORKS WHERE PNUM IN (SELECT PNUM  FROM PROJ WHERE PTYPE IN (SELECT PTYPE  FROM PROJ WHERE PNUM IN (SELECT PNUM  FROM WORKS WHERE EMPNUM IN (SELECT EMPNUM  FROM WORKS WHERE PNUM IN (SELECT PNUM   FROM PROJ WHERE PTYPE IN (SELECT PTYPE  FROM PROJ WHERE CITY IN (SELECT CITY  FROM STAFF WHERE EMPNUM IN (SELECT EMPNUM  FROM WORKS WHERE HOURS = 20 AND PNUM = 'P2' )))))))));
-- PASS:0226 If 4 rows selected excluding EMPNUM='E5', EMPNAME='Ed'?

ROLLBACK;

-- from dml051
-- TEST:0227 BETWEEN predicate with character string values!
 SELECT PNUM FROM   PROJ WHERE  PNAME BETWEEN 'A' AND 'F';
-- PASS:0227 If PNUM = 'P2'?

 SELECT PNUM FROM   PROJ WHERE PNAME >= 'A' AND PNAME <= 'F';
-- PASS:0227 If PNUM = 'P2'?

 SELECT CITY FROM   STAFF WHERE  EMPNAME NOT BETWEEN 'A' AND 'E';
-- PASS:0228 If CITY = 'Akron'?

 SELECT CITY FROM   STAFF WHERE  NOT( EMPNAME BETWEEN 'A' AND 'E' );
-- PASS:0228 If CITY = 'Akron'?

ROLLBACK;

-- from dml052
-- TEST:0229 Case-sensitive LIKE predicate!
 INSERT INTO STAFF VALUES('E6','ALICE',11,'Gaithersburg');
-- PASS:0229 If 1 row is inserted?
 SELECT EMPNAME FROM   STAFF WHERE  EMPNAME LIKE 'Ali%';
-- PASS:0229 If 1 row is returned and EMPNAME = 'Alice' (not 'ALICE')?
 SELECT EMPNAME FROM   STAFF WHERE  EMPNAME LIKE 'ALI%';
-- PASS:0229 If 1 row is returned and EMPNAME = 'ALICE' (not 'Alice')?

-- from dml053
-- TEST:0233 Table as multiset of rows - INSERT duplicate VALUES()!
 CREATE TABLE TEMP_S (EMPNUM  CHAR(3), GRADE DECIMAL(4), CITY CHAR(15));
 INSERT INTO TEMP_S VALUES('E1',11,'Deale');
-- PASS:0233 If 1 row is inserted?
 INSERT INTO TEMP_S VALUES('E1',11,'Deale');
-- PASS:0233 If 1 row is inserted?
 SELECT COUNT(*) FROM TEMP_S WHERE EMPNUM='E1' AND GRADE=11 AND CITY='Deale';
-- PASS:0233 If count = 2?

ROLLBACK;

-- from dml055
-- TEST:0243 FIPS sizing - precision of SMALLINT >= 4!
 CREATE TABLE HH (SMALLTEST  SMALLINT);
 INSERT INTO HH VALUES(9999);
-- PASS:0243 If 1 row is inserted?

 SELECT COUNT(*) FROM HH WHERE SMALLTEST = 9999;
-- should be 1

 INSERT INTO HH VALUES(-9999);
-- PASS:0243 If 1 row is inserted?

 SELECT SMALLTEST FROM HH WHERE SMALLTEST = -9999;
-- PASS:0243 If SMALLTEST = -9999?


ROLLBACK;

-- TEST:0244 FIPS sizing - precision of INTEGER >= 9!
-- FIPS sizing TEST
 CREATE TABLE EE (INTTEST     INTEGER);
 INSERT INTO EE VALUES(999999999);
-- PASS:0244 If 1 row is inserted?

 SELECT INTTEST FROM EE WHERE INTTEST = 999999999;
-- PASS:0244 If INTTEST = 999999999?

 INSERT INTO EE VALUES(-999999999);
-- PASS:0244 If 1 row is inserted?

 SELECT COUNT(*) FROM EE WHERE INTTEST = -999999999;
-- PASS:0244 If count = 1?


-- TEST:0245 FIPS sizing - precision of DECIMAL >= 15!
-- FIPS sizing TEST

 CREATE TABLE PP_15 (NUMTEST  DECIMAL(15,15));
 INSERT INTO PP_15 VALUES(.123456789012345);
-- PASS:0245 If 1 row is inserted?

 SELECT NUMTEST FROM PP_15;
-- PASS:0245 If NUMTEST = 0.123456789012345?

 SELECT COUNT(*) FROM PP_15 WHERE NUMTEST = 0.123456789012345;
-- PASS:0245 If count = 1?

 DELETE FROM PP_15;
-- PASS:0245 If 1 row is deleted?

 INSERT INTO PP_15 VALUES(-.912345678901234);
-- PASS:0245 If 1 row is inserted?

 SELECT COUNT(*) FROM PP_15 WHERE NUMTEST = -0.912345678901234;
-- PASS:0245 If count = 1?

-- from dml056
-- TEST:0246 FIPS sizing - 100 values in INSERT!
-- FIPS sizing TEST

 CREATE TABLE T100(C1 CHAR(2),C2 CHAR(2),C3 CHAR(2),C4 CHAR(2), C5 CHAR(2),C6 CHAR(2),C7 CHAR(2),C8 CHAR(2), C9 CHAR(2),C10 CHAR(2),C11 CHAR(2),C12 CHAR(2), C13 CHAR(2),C14 CHAR(2),C15 CHAR(2),C16 CHAR(2), C17 CHAR(2),C18 CHAR(2),C19 CHAR(2),C20 CHAR(2), C21 CHAR(2),C22 CHAR(2),C23 CHAR(2),C24 CHAR(2), C25 CHAR(2),C26 CHAR(2),C27 CHAR(2),C28 CHAR(2), C29 CHAR(2),C30 CHAR(2),C31 CHAR(2),C32 CHAR(2), C33 CHAR(2),C34 CHAR(2),C35 CHAR(2),C36 CHAR(2), C37 CHAR(2),C38 CHAR(2),C39 CHAR(2),C40 CHAR(2), C41 CHAR(2),C42 CHAR(2),C43 CHAR(2),C44 CHAR(2), C45 CHAR(2),C46 CHAR(2),C47 CHAR(2),C48 CHAR(2), C49 CHAR(2),C50 CHAR(2),C51 CHAR(2),C52 CHAR(2), C53 CHAR(2),C54 CHAR(2),C55 CHAR(2),C56 CHAR(2), C57 CHAR(2),C58 CHAR(2),C59 CHAR(2),C60 CHAR(2), C61 CHAR(2),C62 CHAR(2),C63 CHAR(2),C64 CHAR(2), C65 CHAR(2),C66 CHAR(2),C67 CHAR(2),C68 CHAR(2), C69 CHAR(2),C70 CHAR(2),C71 CHAR(2),C72 CHAR(2), C73 CHAR(2),C74 CHAR(2),C75 CHAR(2),C76 CHAR(2), C77 CHAR(2),C78 CHAR(2),C79 CHAR(2),C80 CHAR(2), C81 CHAR(2),C82 CHAR(2),C83 CHAR(2),C84 CHAR(2), C85 CHAR(2),C86 CHAR(2),C87 CHAR(2),C88 CHAR(2), C89 CHAR(2),C90 CHAR(2),C91 CHAR(2),C92 CHAR(2), C93 CHAR(2),C94 CHAR(2),C95 CHAR(2),C96 CHAR(2), C97 CHAR(2),C98 CHAR(2),C99 CHAR(2),C100 CHAR(2));
 INSERT INTO T100 VALUES('ZA','ZB','CA','ZC','ZD','AA','ZE','ZF','BA','ZG', 'YA','YB','CB','YC','YD','AB','YE','YF','BB','YG', 'XA','XB','CC','XC','XD','AC','XE','XF','BC','XG', 'UA','UB','CD','UC','UD','AD','UE','UF','BD','UG', 'VA','VB','CE','VC','VD','AE','VE','VF','BE','VG', 'WA','WB','CF','WC','WD','AF','WE','WF','BF','WG', 'LA','LB','CG','LC','LD','AG','LE','LF','BG','LG', 'MA','MB','CH','MC','MD','AH','ME','MF','BH','MG', 'NA','NB','CI','NC','ND','AI','NE','NF','BI','NG', 'OA','OB','CJ','OC','OD','AJ','OE','OF','BJ','OG');
-- PASS:0246 If 1 row is inserted?

 SELECT C6, C16, C26, C36, C46, C56, C66, C76, C86, C96, C100 FROM T100 WHERE C1 = 'ZA' AND C2 = 'ZB';
-- PASS:0246 If C6 = 'AA', C16 = 'AB', C26 = 'AC', C36 = 'AD' ?
-- PASS:0246 If C46 = 'AE', C56 = 'AF', C66 = 'AG', C76 = 'AH' ?
-- PASS:0246 If C86 = 'AI', C96 = 'AJ', C100 = 'OG' ?

 DELETE FROM T100;
 INSERT INTO T100 VALUES('ZA','ZB','CA','ZC','ZD','AA','ZE','ZF','BA','ZG', 'YA','YB','CB','YC','YD','AB','YE','YF','BB','YG', 'XA','XB','CC','XC','XD','AC','XE','XF','BC','XG', 'UA','UB','CD','UC','UD','AD','UE','UF','BD','UG', 'VA','VB','CE','VC','VD','AE','VE','VF','BE','VG', 'WA','WB','CF','WC','WD','AF','WE','WF','BF','WG', 'LA','LB','CG','LC','LD','AG','LE','LF','BG','LG', 'MA','MB','CH','MC','MD','AH','AE','AF','BH','BG', 'NA','NB','CI','NC','ND','AI','NE','NF','BI','NG', 'OA','OB','CJ','OC','OD','AJ','OE','OF','BJ','OG');
-- PASS:0247 If 1 row is inserted?

 UPDATE T100 SET C5 = 'BA', C10 = 'ZP', C15 = 'BB', C20 = 'YP', C25 = 'BC', C30 = 'XP', C35 = 'BD', C40 = 'UP', C45 = 'BE', C50 = 'VP', C55 = 'BF', C60 = 'WP', C65 = 'BG', C70 = 'LP', C75 = 'BH', C80 = 'MP', C85 = 'BI', C90 = 'NP', C95 = 'BJ', C100 = 'OP';
-- PASS:0247 If 1 row is updated ?

 SELECT C5, C20, C35, C40, C55, C60, C75, C80, C90, C95, C100 FROM T100 WHERE C1 = 'ZA' AND C2 = 'ZB';
-- PASS:0247 If C5 = 'BA', C35 = 'BD', C55 = 'BF', C75 = 'BH' ?
-- PASS:0247 If C90 = 'NP', C100 = 'OP'?


-- from dml057
--TEST:0248 FIPS sizing - binary precision of FLOAT >= 20!

 CREATE TABLE GG (REALTEST     REAL);
 CREATE TABLE II (DOUBLETEST  DOUBLE PRECISION);
 CREATE TABLE JJ (FLOATTEST  FLOAT);
 INSERT INTO JJ VALUES(0.1048575);
-- PASS:0248 If 1 row is inserted?
 SELECT FLOATTEST FROM JJ;
-- PASS:0248 If FLOATTEST = 0.1048575 ?
-- PASS:0248 OR is between 0.1048574 and 0.1048576 ?

 SELECT COUNT(*) FROM JJ WHERE FLOATTEST > 0.1048574 AND FLOATTEST < 0.1048576;
-- PASS:0248 If count = 1?

 DELETE FROM JJ;

 INSERT INTO JJ VALUES(-0.1048575);
-- PASS:0248 If 1 row is inserted?

 SELECT FLOATTEST FROM JJ;
-- PASS:0248 If FLOATTEST = -0.1048575 ?
-- PASS:0248 OR is between -0.1048576 and -0.1048574 ?

 SELECT COUNT(*) FROM JJ WHERE FLOATTEST > -0.1048576 AND FLOATTEST < -0.1048574;
-- PASS:0248 If count = 1?

 INSERT INTO GG VALUES(0.1048575);
-- PASS:0249 If 1 row is inserted?

 SELECT REALTEST FROM GG;
-- PASS:0249 If REALTEST = 0.1048575 ?
-- PASS:0249 OR is between 0.1048574 and 0.1048576 ?

 SELECT COUNT(*) FROM GG WHERE REALTEST > 0.1048574 AND REALTEST < 0.1048576;
-- PASS:0249 If count = 1?

 DELETE FROM GG;
 INSERT INTO GG VALUES(-0.1048575);
-- PASS:0249 If 1 row is inserted?

 SELECT REALTEST FROM GG;
-- PASS:0249 If REALTEST = -0.1048575 ?
-- PASS:0249 OR is between -0.1048576 and -0.1048574 ?

 SELECT COUNT(*) FROM GG WHERE REALTEST > -0.1048576 AND REALTEST < -0.1048574;
-- PASS:0249 If count = 1?

ROLLBACK;

-- TEST:0250 FIPS sizing - bin. precision of DOUBLE >= 30!
-- FIPS sizing TEST

 INSERT INTO II VALUES(0.1073741823);
-- PASS:0250 If 1 row is inserted?

 SELECT DOUBLETEST FROM II;
-- PASS:0250 If DOUBLETEST = 0.1073741823 ?
-- PASS:0250 OR is between 0.1073741822 and 0.1073741824 ?

 SELECT COUNT(*) FROM II WHERE DOUBLETEST > 0.1073741822 AND DOUBLETEST < 0.1073741824;
-- PASS:0250 If count = 1?

 DELETE FROM II;
 INSERT INTO II VALUES(-0.1073741823);
-- PASS:0250 If 1 row is inserted?

 SELECT DOUBLETEST FROM II;
-- PASS:0250 If DOUBLETEST = -0.1073741823 ?
-- PASS:0250 OR is between -0.1073741824 and -0.1073741822 ?

 SELECT COUNT(*) FROM II WHERE DOUBLETEST > -0.1073741824 AND DOUBLETEST < -0.1073741822;
-- PASS:0250 If count = 1?

-----
-----
-- from dml058
-- TEST:0251 COMMIT keeps changes of current transaction!
-----
-----

     DELETE FROM STAFF1;
-- Making sure the table is empty

     INSERT INTO STAFF1 SELECT * FROM STAFF;
-- PASS:0251 If 5 rows are inserted?

     SELECT COUNT(*) FROM STAFF1;
-- PASS:0251 If count = 5?

     INSERT INTO STAFF1
            VALUES('E9','Tom',50,'London');
-- PASS:0251 If 1 row is inserted?
  
     UPDATE STAFF1
            SET GRADE = 40 
            WHERE EMPNUM = 'E2';
-- PASS:0251 If 1 row is updated?

     COMMIT WORK;

     DELETE FROM STAFF1;
-- PASS:0251 If 6 rows are deleted?

-- verify
     ROLLBACK WORK;

-- verify previous commit
     SELECT COUNT(*)
          FROM STAFF1
          WHERE GRADE > 12;
-- PASS:0251 If count = 4?

-- restore
     DELETE FROM STAFF1;
     COMMIT WORK;

-- END TEST >>> 0251 <<< END TEST

-- ***************************************************************

-- TEST:0252 ROLLBACK cancels changes of current transaction!

     DELETE FROM STAFF1;
-- Making sure the table is empty

-- setup
     INSERT INTO STAFF1 SELECT * FROM STAFF;
-- PASS:0252 If 5 rows are inserted?

     COMMIT WORK;

     INSERT INTO STAFF1 VALUES('E10','Tom',50,'London');
-- PASS:0252 If 1 row is inserted?

     UPDATE STAFF1
            SET GRADE = 40
            WHERE EMPNUM = 'E1';
-- PASS:0252 If 1 row is updated?

     DELETE FROM STAFF1
            WHERE EMPNUM = 'E2';
-- PASS:0252 If 1 row is deleted?

     ROLLBACK WORK;

-- verify     
     SELECT SUM(GRADE)
          FROM STAFF1;
-- PASS:0252 If SUM(GRADE) = 60?

-- restore
     DELETE FROM STAFF1;
     COMMIT WORK;

-- END TEST >>> 0252 <<< END TEST

-- ****************************************************************

-- TEST:0253 TEST0124 workaround (key = key+1)!

     SELECT NUMKEY
          FROM UPUNIQ
          ORDER BY NUMKEY DESC;
-- PASS:0253 If 6 rows are selected and first NUMKEY = 8 ?

     UPDATE UPUNIQ
          SET NUMKEY = 8 + 1
          WHERE NUMKEY = 8;
-- PASS:0253 If 1 row is updated?

     UPDATE UPUNIQ
          SET NUMKEY = 6 + 1
          WHERE NUMKEY = 6;
-- PASS:0253 If 1 row is updated?

     UPDATE UPUNIQ
          SET NUMKEY = 4 + 1
          WHERE NUMKEY = 4;
-- PASS:0253 If 1 row is updated?

     UPDATE UPUNIQ
          SET NUMKEY = 3 + 1
          WHERE NUMKEY = 3;
-- PASS:0253 If 1 row is updated?

     UPDATE UPUNIQ
          SET NUMKEY = 2 + 1 
          WHERE NUMKEY = 2;
-- PASS:0253 If 1 row is updated?

     UPDATE UPUNIQ
          SET NUMKEY = 1 + 1
          WHERE NUMKEY = 1;
-- PASS:0253 If 1 row is updated?


     SELECT MAX(NUMKEY), MIN(NUMKEY)
          FROM UPUNIQ;
-- PASS:0253 If MAX(NUMKEY) = 9 AND MIN(NUMKEY) = 2?

-- restore
     ROLLBACK WORK;

-- END TEST >>> 0253 <<< END TEST

-- **************************************************************

-- TEST:0254 Column name in SET clause!

     DELETE FROM PROJ1;
-- Making sure the table is empty

-- setup
     INSERT INTO PROJ1
            SELECT *
                 FROM PROJ;
-- PASS:0254 If 6 rows are inserted?

     UPDATE PROJ1
          SET CITY = PTYPE;
-- PASS:0254 If 6 rows are updated?

     SELECT CITY
          FROM PROJ1
          WHERE PNUM = 'P1';
-- PASS:0254 If CITY = 'Design'?

-- restore
     ROLLBACK WORK;

-- END TEST >>> 0254 <<< END TEST

-- **************************************************************


-- TEST:0255 Key word USER for INSERT, UPDATE!

     DELETE FROM T4;
-- Making sure the table is empty

-- setup
     INSERT INTO T4
          VALUES(USER,100,'good','luck');
-- PASS:0255 If 1 row is inserted?

     SELECT STR110 
          FROM T4
          WHERE NUM6 = 100;
-- PASS:0255 If STR110 = 'HU'?

-- setup
     INSERT INTO T4
          VALUES('Hello',101,'good','luck');
-- PASS:0255 If 1 row is inserted?

     UPDATE T4
          SET STR110 = USER
          WHERE NUM6 = 101;
-- PASS:0255 If 1 row is updated?

     SELECT STR110 
          FROM T4
          WHERE NUM6 = 101;
-- PASS:0255 If STR110 = 'HU'?

-- restore
     ROLLBACK WORK;
       
-- END TEST >>> 0255 <<< END TEST

-- ***************************************************************

-- TEST:0256 Key word USER in WHERE clause!

     DELETE FROM T4;
-- Making sure the table is empty

-- setup
     INSERT INTO T4
            VALUES('HU',100,'good','luck');
-- PASS:0256 If 1 row is inserted?

     SELECT STR110 
          FROM T4
          WHERE STR110 = USER;
-- PASS:0256 If STR110 = 'HU'?

-- setup
     INSERT INTO T4
            VALUES('Hello',101,'good','luck');
-- PASS:0256 If 1 row is inserted?

     DELETE FROM T4
            WHERE STR110 = USER;
-- PASS:0256 If 1 row is deleted?

     SELECT COUNT(*)
          FROM T4
          WHERE STR110 LIKE '%HU%';
-- PASS:0256 If count = 0?

     ROLLBACK WORK;

-- from dml059
 * TEST:0257 SELECT MAX, MIN (COL1 + or - COL2)!
 INSERT INTO VTABLE VALUES(10,11,12,13,15);
-- PASS:0257 If 1 row is inserted?
 INSERT INTO VTABLE VALUES(100,111,1112,113,115);
-- PASS:0257 If 1 row is inserted?

 SELECT COL1, MAX(COL2 + COL3), MIN(COL3 - COL2) FROM VTABLE GROUP BY COL1 ORDER BY COL1;
-- PASS:0257 If 4 rows are selected in order with values:?
-- PASS:0257 ( 0, 3, 1) ?
-- PASS:0257 ( 10, 50, 1)?
-- PASS:0257 ( 100, 1223, 100)?
-- PASS:0257 ( 1000, 1000, 5000)?


-- TEST:0258 SELECT SUM(2*COL1*COL2) in HAVING SUM(COL2*COL3)!
 INSERT INTO VTABLE VALUES (10,11,12,13,15);
-- PASS:0258 if 1 row is inserted?
 INSERT INTO VTABLE VALUES (100,111,1112,113,115);
-- PASS:0258 if 1 row is inserted?
 SELECT COL1,SUM(2 * COL2 * COL3) FROM VTABLE GROUP BY COL1 HAVING SUM(COL2 * COL3) > 2000 OR SUM(COL2 * COL3) < -2000 ORDER BY COL1;
-- PASS:0258 If 2 rows are selected?
-- PASS:0258 If first row has values (100, 366864) ?
-- PASS:0258 If second row has values (1000, -12000000) ?


-- TEST:0259 SOME, ANY in HAVING clause!
 INSERT INTO VTABLE VALUES(10,11,12,13,15);
-- PASS:0259 If 1 row is inserted?
 INSERT INTO VTABLE VALUES(100,111,1112,113,115);
-- PASS:0259 If 1 row is inserted?

SELECT COL1, MAX(COL2) FROM VTABLE
				GROUP BY COL1 
				HAVING MAX(COL2) > ANY (SELECT GRADE FROM STAFF) 
				AND MAX(COL2) < SOME (SELECT HOURS FROM WORKS) 
				ORDER BY COL1;
-- this didn't work before
-- PASS:0259 If 1 row is selected and COL1 = 10 and MAX(COL2) = 20?


-- TEST:0260 EXISTS in HAVING clause!
 INSERT INTO VTABLE VALUES(10,11,12,13,15);
-- PASS:0260 If 1 row is inserted?
 INSERT INTO VTABLE VALUES(100,111,1112,113,115);
-- PASS:0260 If 1 row is inserted?

 SELECT COL1, MAX(COL2) FROM VTABLE GROUP BY COL1 HAVING EXISTS (SELECT * FROM STAFF WHERE EMPNUM = 'E1') AND MAX(COL2) BETWEEN 10 AND 90 ORDER BY COL1;
-- PASS:0260 If 1 row is selected and COL1 = 10 and MAX(COL2) = 20?


-- TEST:0264 WHERE, HAVING without GROUP BY!
 SELECT SUM(COL1) FROM VTABLE WHERE 10 + COL1 > COL2 HAVING MAX(COL1) > 100;
-- PASS:0264 If SUM(COL1) = 1000?
 SELECT SUM(COL1) FROM VTABLE WHERE 1000 + COL1 >= COL2 HAVING MAX(COL1) > 100;
-- PASS:0264 If SUM(COL1) = 1110?

ROLLBACK WORK;

DROP DATABASE;
