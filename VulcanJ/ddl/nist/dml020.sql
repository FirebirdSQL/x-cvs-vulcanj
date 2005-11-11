SET NAMES ASCII;
CREATE DATABASE 'test.fdb' DEFAULT CHARACTER SET ISO8859_1;

INPUT ddl/input/base-tab.sql;

-- TEST:0080 Simple two-table join!
 SELECT EMPNUM,EMPNAME,GRADE,STAFF.CITY, PNAME, PROJ.CITY FROM STAFF, PROJ WHERE STAFF.CITY = PROJ.CITY order by EMPNAME, PNAME;
-- PASS:0080 If 10 rows are selected with EMPNAMEs:'Alice', 'Betty', ?
-- PASS:0080 'Carmen', and 'Don' but not 'Ed'?

-- TEST:0081 Simple two-table join with filter!
 SELECT EMPNUM,EMPNAME,GRADE,STAFF.CITY,PNUM,PNAME, PTYPE,BUDGET,PROJ.CITY FROM STAFF, PROJ WHERE STAFF.CITY = PROJ.CITY AND GRADE <> 12;
-- PASS:0081 If 4 rows selected with EMPNAMEs 'Betty' and 'Carmen' ?

-- TEST:0082 Join 3 tables!
 SELECT DISTINCT STAFF.CITY, PROJ.CITY FROM STAFF, WORKS, PROJ WHERE STAFF.EMPNUM = WORKS.EMPNUM AND WORKS.PNUM = PROJ.PNUM;
-- PASS:0082 If 5 distinct rows are selected ?

-- TEST:0083 Join a table with itself!
 SELECT FIRST1.EMPNUM, SECOND2.EMPNUM FROM STAFF FIRST1, STAFF SECOND2 WHERE FIRST1.CITY = SECOND2.CITY AND FIRST1.EMPNUM < SECOND2.EMPNUM;
-- PASS:0083 If 2 rows are selected and ?
-- PASS:0083 If EMPNUM pairs are 'E1'/'E4' and 'E2'/'E3'?

DROP DATABASE;
