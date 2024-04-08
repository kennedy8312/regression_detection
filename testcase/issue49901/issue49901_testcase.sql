drop table if exists sbtest1;

CREATE TABLE `sbtest1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `k` int(10) unsigned NOT NULL DEFAULT '0',
  `c` char(120) NOT NULL DEFAULT '',
  `pad` char(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`, `k`) /*T![clustered_index] CLUSTERED */
);

source insert_data.sql

alter table sbtest1 add column id_1 int;
alter table sbtest1 add key(id_1);
update sbtest1 set id_1=id;
analyze table sbtest1;

explain analyze select * from sbtest1 where id=1 and id_1=1;
explain analyze select * from sbtest1 where id=1 and id_1=0;
explain analyze select * from sbtest1 use index(primary) where id=1 and id_1=1;
explain analyze select * from sbtest1 use index(primary) where id=1 and id_1=0;