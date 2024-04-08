drop table if exists test;
create table if not exists test (
  rowid bigint(20) primary key,
  a decimal (21,4),
  b varchar(19),
  c varchar(600),
  d varchar(600)
);
insert into test values (1, 1, '1100', null, null);
select sum(t.a) as a, c from (
  select a, b, c from (select a, b, c from test) b where '02' = '01'
  union all
  select a, b, c from (select a, b, c from test) b where '02' = '02'
) t
where t.b = '1100';
