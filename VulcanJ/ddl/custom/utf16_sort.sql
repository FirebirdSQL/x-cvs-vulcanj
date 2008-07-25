--
-- test case for proper binary utf16 sort order
--
-- set names ascii;
create database 'test.fdb' default character set iso8859_1;

create table test (i integer, c varchar(20) character set iso8859_1);
insert into test values (3, 'hello');
insert into test values (4, 'hello ');
insert into test values (1, _iso8859_1'Hola Se�or');
insert into test values (2, 'goodbye');
commit;
select i, c from test order by c;

select i, c from test order by c desc;

drop database ;
