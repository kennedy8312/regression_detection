drop table if exists ast;
drop table if exists acc;
create table if not exists ast (i varchar(20));
create table if not exists acc (j varchar(20), k varchar(20), l varchar(20), m varchar(20));

explain with t as(
select i,
    (case
        when b.j = '20001' then b.l
        else b.k
    end) an
from
    ast a
inner join acc b on
(a.i = b.m)
and a.i = 'astp2019121731703151'),
t1 as (select i, group_concat(an order by an separator '; ') an from t group by i)
select * from t1;

with t as(
select i,
    (case
        when b.j = '20001' then b.l
        else b.k
    end) an
from
    ast a
inner join acc b on
(a.i = b.m)
and a.i = 'astp2019121731703151'),
t1 as (select i, group_concat(an order by an separator '; ') an from t group by i)
select * from t1;