drop table if exists t;
create table t (b varchar(255), a int primary key nonclustered, key (b)) partition by key(a) partitions 3;
insert into t values ('Ab', 1),('abc',2),('BC',3),('AC',4),('BA',5),('cda',6);
analyze table t;
select * from t where a = 2;