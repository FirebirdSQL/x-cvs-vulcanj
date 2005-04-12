CREATE DATABASE 'test.fdb' ;
SET NAMES ASCII;
CREATE DOMAIN test VARCHAR(63);

ALTER DOMAIN test ADD CONSTRAINT CHECK (VALUE LIKE 'TE%');
COMMIT;
SELECT RDB$FIELD_NAME, RDB$VALIDATION_SOURCE FROM rdb$fields WHERE RDB$FIELD_NAME='TEST';

DROP DATABASE;

