drop table if exists t;
create table t (a int);
create or replace algorithm=undefined view v (a,b) AS select 1 as a, json_object('k', '0') as b from t;
select sum(json_extract(b, '$.path')) from v group by a;