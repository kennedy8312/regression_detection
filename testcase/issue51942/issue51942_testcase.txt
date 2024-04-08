drop table if exists t;

CREATE TABLE t (a int, b int, c varchar(5), primary key(a), index idx(c)) PARTITION BY RANGE (a) (PARTITION p0 VALUES LESS THAN (6), PARTITION p1 VALUES LESS THAN (11), PARTITION p2 VALUES LESS THAN (16));
insert into t(a, b, c) values(1, 2, 'c'), (7, 3, 'd'), (12, 4, 'e');
-- wait 20 * 3 to query the stats info 
-- SELECT SLEEP(60);
analyze table t;
select table_rows, avg_row_length, data_length, index_length from information_schema.tables where table_name='t' AND TABLE_SCHEMA='test';