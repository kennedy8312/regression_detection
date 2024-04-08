drop table if exists `tx1`;
CREATE TABLE `tx1`  (
  `ID` varchar(13),
  `a` varchar(13),
  `b` varchar(4000),
  `ltype` int(5) NOT NULL
);
drop table if exists `tx2`;
CREATE TABLE `tx2`  (
  `ID` varchar(13),
  `rid` varchar(12),
  `a` varchar(9),
  `b` varchar(8),
  `c` longtext,
  `d` varchar(12),
  `ltype` int(5) NOT NULL
) PARTITION BY LIST (`ltype`)
(PARTITION `p1` VALUES IN (501),
PARTITION `p2` VALUES IN (502));

insert into tx1 values(1,1,1,501);
insert into tx2 values(1,1,1,1,1,1,501);

select * from tx1 inner join tx2 on tx1.ID=tx2.ID and tx1.ltype=tx2.ltype where tx2.rid='1'; 