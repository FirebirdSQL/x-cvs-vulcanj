SET NAMES ASCII;
CREATE DATABASE 'test.fdb' DEFAULT CHARACTER SET ISO8859_1;


-- TEST:7520 ALTER TABLE SET COLUMN DEFAULT!
-- can't perform this action in FB. skipping test.
-- 6/15/2005.
-- ALTER TABLE alt_test ALTER COLUMN N SET DEFAULT 80;


-- TEST:7521 ALTER TABLE DROP COLUMN DEFAULT!
-- can't perform this action in FB. skipping test.
-- 6/15/2005.

-- ALTER TABLE alt_test ALTER COLUMN L DROP DEFAULT;


DROP DATABASE;
