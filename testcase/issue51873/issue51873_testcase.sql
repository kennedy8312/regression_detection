drop table if exists `h1`;
drop table if exists `h2`;
CREATE TABLE `h1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `position_date` date NOT NULL,
  `asset_id` varchar(32) DEFAULT NULL,
  `portfolio_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`,`position_date`) /*T![clustered_index] NONCLUSTERED */,
  UNIQUE KEY `uidx_posi_asset_balance_key` (`position_date`,`portfolio_code`,`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=30002
PARTITION BY RANGE COLUMNS(`position_date`)
(PARTITION `p202401` VALUES LESS THAN ('2024-02-01'));
create table h2 like h1;
insert into h1 values(1,'2024-01-01',1,1);
insert into h2 values(1,'2024-01-01',1,1);
analyze table h1;

with assetBalance AS 
    (SELECT asset_id,
         portfolio_code
    FROM h1 pab
    WHERE pab.position_date = '2024-01-01' ), 
cashBalance AS 
    (SELECT portfolio_code,
         asset_id
    FROM h2 pcb
    WHERE pcb.position_date = '2024-01-01' ), 
assetIdList AS 
    (SELECT DISTINCT asset_id AS assetId
    FROM assetBalance )
SELECT main.portfolioCode
FROM 
    (SELECT DISTINCT balance.portfolio_code AS portfolioCode
    FROM assetBalance balance
    LEFT JOIN assetIdList
        ON balance.asset_id = assetIdList.assetId ) main;

with cashBalance AS 
    (SELECT portfolio_code,
         asset_id
    FROM h2 pcb
    WHERE pcb.position_date = '2024-01-01' ), 
assetBalance AS 
    (SELECT asset_id,
         portfolio_code
    FROM h1 pab
    WHERE pab.position_date = '2024-01-01' ), 
assetIdList AS 
    (SELECT DISTINCT asset_id AS assetId
    FROM assetBalance )
SELECT main.portfolioCode
FROM 
    (SELECT DISTINCT balance.portfolio_code AS portfolioCode
    FROM assetBalance balance
    LEFT JOIN assetIdList
        ON balance.asset_id = assetIdList.assetId ) main;