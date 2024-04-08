drop table if exists t;
create table t(col varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL) PARTITION BY KEY (`col`) PARTITIONS 7;
explain select * from t where col = 'linpin';
explain select * from t where col = 'LINPIN';