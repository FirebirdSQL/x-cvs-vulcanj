-- s0368916: NEED A BETTER ERROR MESSAGE FOR MORE THAN TKTS_MAX_COLUMNS_IN_INDEX
set names ascii;

create database 'test.fdb';
create table test (
   i1 integer,
   i2 integer,
   i3 integer,
   i4 integer,
   i5 integer,
   i6 integer,
   i7 integer,
   i8 integer,
   i9 integer,
   i10 integer,
   i11 integer,
   i12 integer,
   i13 integer,
   i14 integer,
   i15 integer,
   i16 integer,
   i17 integer);

-- 16 columns is ok
create index i1 on test (i1, i2, i3, i4, i5, i6, i7, i8, i9, i10,
   i11, i12, i13, i14, i15, i16);

-- 17 columns is just wrong
create index i2 on test (i1, i2, i3, i4, i5, i6, i7, i8, i9, i10,
   i11, i12, i13, i14, i15, i16, i17);

drop database;
