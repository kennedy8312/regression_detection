drop table if exists tf8f605ff;
create table if not exists tf8f605ff ( col_30 boolean ,col_31 decimal ( 37 , 17 )    default 957.79 ,col_32 time   not null , unique key idx_6 ( col_32 ,col_30 ,col_31 ) ,unique key idx_7 ( col_31 ,col_32 ,col_30 ) ,unique key idx_8 ( col_31 ,col_32 ,col_30 ) ) charset gbk collate gbk_bin;
alter table tf8f605ff add column col_59 tinyint  unsigned not null;
alter table tf8f605ff alter column col_31 drop default;
alter table tf8f605ff add unique key idx_25 ( col_30 );
INSERT INTO `tf8f605ff` VALUES (0,NULL,'12:09:39',128), (1,211.00000000000000000,'10:44:41',76);
insert ignore into tf8f605ff  values ( 0,0.71,'17:42:07.00',2 ) ,( 1,5207.803,'05:05:08.00',42 ) ,( 1,8.755,'16:53:49.00',19 ) ,( 0,0.81,'14:08:29.00',208 ) on duplicate key update col_31 = 8438.3418, col_59 = 61, col_32 = '00:35:59.00', col_30 = 0;
select * from tf8f605ff;