create database 'test.fdb';

/*----------------------*/
/* Computed by UPPER(a) */
/*----------------------*/
create table t0 (a char(25), upper_a computed by (upper(a)));
show table t0;
insert into t0(a) values('abcdef');
insert into t0(a) values('ABCDEF');
insert into t0(a) values('123456');
insert into t0(a) values('aBcDeF');
select 'Passed 1 - Insert' from t0 where upper_a = upper(a) having count(*) = 4;

update t0 set a = 'xyz' where a = 'abc';
select 'Passed 1 - Update' from t0 where upper_a = upper(a) having count(*) = 4;

/*-----------------------------------*/
/* Computed by a || UPPER('upper()') */
/*-----------------------------------*/
create table t5 (a char(25), upper_const computed by (a || upper('upper()')));
show table t5;
insert into t5(a) values('abcdef');
insert into t5(a) values('ABCDEF');
insert into t5(a) values('123456');
insert into t5(a) values('aBcDeF');
select 'Passed 2 - Insert' from t5 where upper_const = a || upper('upper()') having count(*) = 4;

update t5 set a = 'xyz' where a = 'abcdef';
select 'Passed 2 - Update' from t5 where upper_const = a || upper('upper()') having count(*) = 4;

drop database;
exit;

