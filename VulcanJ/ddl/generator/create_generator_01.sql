CREATE DATABASE 'test.fdb' ;

CREATE GENERATOR test;
COMMIT;
SELECT GENERATOR_NAME, SYSTEM_FLAG FROM RDB$GENERATORS WHERE RDB$GENERATOR_NAME='TEST';

DROP DATABASE;
