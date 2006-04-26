SET NAMES ASCII;
CREATE DATABASE 'test.fdb' DEFAULT CHARACTER SET ISO8859_1;

INPUT ddl/input/base-tab.sql;
COMMIT;

 DELETE FROM WORKS WHERE EXISTS (SELECT * FROM PROJ JOIN STAFF ON PROJ.CITY <> STAFF.CITY AND EMPNUM = WORKS.EMPNUM AND PNUM = WORKS.PNUM);
-- PASS:0857 If delete completed successfully?

 SELECT EMPNUM, PNUM FROM WORKS ORDER BY EMPNUM, PNUM;
-- PASS:0857 If 6 rows are returned in the following order?
--                 empnum pnum
--                 ====== ====
-- PASS:0857 If E1 P1 ?
-- PASS:0857 If E1 P4 ?
-- PASS:0857 If E1 P6 ?
-- PASS:0857 If E2 P2 ?
-- PASS:0857 If E3 P2 ?
-- PASS:0857 If E4 P4 ?

ROLLBACK;

 SELECT EMPNUM, SUM (HOURS) FROM WORKS OWORKS GROUP BY EMPNUM HAVING EMPNUM IN ( SELECT WORKS.EMPNUM FROM WORKS JOIN STAFF ON WORKS.EMPNUM = STAFF.EMPNUM AND HOURS < SUM (OWORKS.HOURS) / 3 AND GRADE > 10) ORDER BY EMPNUM;
-- PASS:0857 If 2 rows are returned in the following order?
--               empnum sum(hours)
--               ====== ==========
-- PASS:0857 If E1 184 ?
-- PASS:0857 If E4 140 ?


 SELECT EMPNUM, SUM (HOURS) FROM WORKS OWORKS GROUP BY EMPNUM HAVING EMPNUM IN ( SELECT WORKS.EMPNUM FROM WORKS JOIN STAFF ON WORKS.EMPNUM = STAFF.EMPNUM AND HOURS >= 10 + AVG (OWORKS.HOURS) AND CITY = 'Deale') ORDER BY EMPNUM;
-- PASS:0857 If 2 rows are returned in the following order?
--               empnum sum(hours)
--               ====== ==========
-- PASS:0857 If E1 184 ?
-- PASS:0857 If E4 140 ?

DROP DATABASE;