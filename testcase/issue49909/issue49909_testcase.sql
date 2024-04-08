drop table if exists t;
create table t(a int, b int as ((grouping(a))) stored);