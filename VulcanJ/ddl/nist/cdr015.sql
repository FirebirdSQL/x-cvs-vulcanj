SET NAMES ASCII;
CREATE DATABASE 'test.fdb' DEFAULT CHARACTER SET ISO8859_1;

INPUT ddl/input/sun-tab2.sql;
INPUT ddl/input/sun-tab2-refresh.sql;

 DELETE FROM SIZ1_F WHERE F1 = 'E1';
 UPDATE SIZ1_P SET S1 = 'E9' WHERE S1 = 'E1' AND S2 = 'TTT';
 SELECT S1 FROM SIZ1_P WHERE S1 = 'E9';

INPUT ddl/input/sun-tab2-refresh.sql;

 UPDATE SIZ1_P SET S1 = 'E9' WHERE S1 = 'E1' AND S2 = 'TTS' AND S3 =1;
 SELECT COUNT(*) FROM SIZ1_P WHERE S1 = 'E1' AND S2 = 'TTS' AND S3 =1;

DROP DATABASE;
