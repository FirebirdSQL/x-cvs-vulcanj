SET NAMES ASCII;
CREATE DATABASE 'test.fdb' ;
CREATE EXCEPTION test 'message to show';

ALTER EXCEPTION test 'new message';
COMMIT;

set sqlda_display on;

select _utf16'test' from rdb$database;

SELECT RDB$EXCEPTION_NAME, RDB$EXCEPTION_NUMBER, cast(RDB$MESSAGE as varchar(15) character set utf16) FROM RDB$EXCEPTIONS;

DROP DATABASE;

