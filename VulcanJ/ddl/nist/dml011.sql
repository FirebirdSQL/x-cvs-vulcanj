SET NAMES ASCII;
CREATE DATABASE 'test.fdb' DEFAULT CHARACTER SET ISO8859_1;

INPUT ddl/input/base-tab.sql;

 COMMIT;

-- TEST:0033 UPDATE view without <WHERE clause>!
 CREATE VIEW TEMP_SS(EMPNUM,GRADE,CITY) AS SELECT EMPNUM,GRADE,CITY FROM   STAFF WHERE  GRADE > 12 WITH CHECK OPTION;
 UPDATE TEMP_SS SET GRADE = 15;
 SELECT COUNT(*) FROM TEMP_SS WHERE GRADE = 15;
-- PASS:0033 If count = 2?
		
 ROLLBACK;
 
-- TEST:0034 UPDATE table with SET column in <WHERE clause>!
 UPDATE STAFF SET GRADE = 2*GRADE WHERE GRADE = 13;
 SELECT COUNT(*) FROM STAFF WHERE GRADE = 26;
-- PASS:0034 If count = 2?

 ROLLBACK;
 
-- TEST:0035 UPDATE with correlated subquery in <WHERE clause>!
 UPDATE STAFF SET GRADE=10*STAFF.GRADE WHERE STAFF.EMPNUM NOT IN (SELECT WORKS.EMPNUM FROM WORKS WHERE STAFF.EMPNUM = WORKS.EMPNUM);
 SELECT COUNT(*) FROM STAFF WHERE GRADE=130;
-- PASS:0035 If count = 1?

 ROLLBACK;
-- TEST:0036 UPDATE view globally with check option violation!
 SELECT COUNT(*) FROM STAFF WHERE GRADE = 11;

 UPDATE TEMP_SS SET GRADE = 11;
-- PASS:0036 If ERROR, view check constraint, 0 rows updated?

DROP DATABASE;
