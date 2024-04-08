drop table if exists `t`;

create table `t` (
  d date,
  v int,
  primary key(d, v)
) partition by range columns (d) (
  partition p1 values less than ('2023-07-02'),
  partition p2 values less than ('2023-07-03')
);

alter table t set tiflash replica 1;
set tidb_partition_prune_mode='static';
select sleep(30);
select TABLE_SCHEMA,TABLE_NAME,REPLICA_COUNT,LOCATION_LABELS,AVAILABLE,PROGRESS from information_schema.tiflash_replica; -- wait until the replication progress finish

select 1 from (
  select /*+ read_from_storage(tiflash[t]) */ sum(1)
  from t where d BETWEEN '2023-07-01' and '2023-07-03' group by d
) total;