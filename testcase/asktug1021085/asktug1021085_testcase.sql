drop table if exists _of_com_mq;

CREATE TABLE `_of_com_mq` (
 `mark` char(35) NOT NULL COMMENT '消息唯一ID(虚拟主机+队列名称+消息类型+消息ID)',
 `type` char(50) NOT NULL COMMENT '消息类型',
 `vHost` char(50) NOT NULL COMMENT '虚拟主机',
 `queue` char(50) NOT NULL COMMENT '队列名称',
 `msgId` char(100) NOT NULL COMMENT '消息ID',
 `data` mediumtext NOT NULL COMMENT '队列数据',
 `syncCount` int(11) NOT NULL COMMENT '已同步次数',
 `updateTime` timestamp NOT NULL DEFAULT '1999-12-31 16:00:00' COMMENT '消息最后更新时间',
 `createTime` timestamp NOT NULL DEFAULT '1999-12-31 16:00:00' COMMENT '消息首次创建时间',
 `syncLevel` int(11) NOT NULL COMMENT '同步等级, 数值越大优先级越低',
 `lockTime` timestamp NOT NULL DEFAULT '1999-12-31 16:00:00' COMMENT '锁定时间, 每 syncLevel * 5 分钟重试',
 `lockMark` char(35) NOT NULL COMMENT '锁定时生成的唯一ID',
 PRIMARY KEY (`type`,`mark`) /*T![clustered_index] CLUSTERED */,
 KEY `常规排序搜索` (`type`,`lockTime`,`queue`,`vHost`,`msgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='消息队列表'
PARTITION BY KEY (`type`)
(PARTITION `p0`,
PARTITION `p1`,
PARTITION `p10`,
PARTITION `p100`,
PARTITION `p101`,
PARTITION `p102`,
PARTITION `p103`,
PARTITION `p104`,
PARTITION `p105`,
PARTITION `p106`,
PARTITION `p107`,
PARTITION `p108`,
PARTITION `p109`,
PARTITION `p11`,
PARTITION `p110`,
PARTITION `p111`,
PARTITION `p112`,
PARTITION `p113`,
PARTITION `p114`,
PARTITION `p115`,
PARTITION `p116`,
PARTITION `p117`,
PARTITION `p118`,
PARTITION `p119`,
PARTITION `p12`,
PARTITION `p120`,
PARTITION `p121`,
PARTITION `p122`,
PARTITION `p123`,
PARTITION `p124`,
PARTITION `p125`,
PARTITION `p126`,
PARTITION `p127`,
PARTITION `p128`,
PARTITION `p129`,
PARTITION `p13`,
PARTITION `p130`,
PARTITION `p131`,
PARTITION `p132`,
PARTITION `p133`,
PARTITION `p134`,
PARTITION `p135`,
PARTITION `p136`,
PARTITION `p137`,
PARTITION `p138`,
PARTITION `p139`,
PARTITION `p14`,
PARTITION `p140`,
PARTITION `p141`,
PARTITION `p142`,
PARTITION `p143`,
PARTITION `p144`,
PARTITION `p145`,
PARTITION `p146`,
PARTITION `p147`,
PARTITION `p148`,
PARTITION `p149`,
PARTITION `p15`,
PARTITION `p150`,
PARTITION `p151`,
PARTITION `p152`,
PARTITION `p153`,
PARTITION `p154`,
PARTITION `p155`,
PARTITION `p156`,
PARTITION `p157`,
PARTITION `p158`,
PARTITION `p159`,
PARTITION `p16`,
PARTITION `p160`,
PARTITION `p161`,
PARTITION `p162`,
PARTITION `p163`,
PARTITION `p164`,
PARTITION `p165`,
PARTITION `p166`,
PARTITION `p167`,
PARTITION `p168`,
PARTITION `p169`,
PARTITION `p17`,
PARTITION `p170`,
PARTITION `p171`,
PARTITION `p172`,
PARTITION `p173`,
PARTITION `p174`,
PARTITION `p175`,
PARTITION `p176`,
PARTITION `p177`,
PARTITION `p178`,
PARTITION `p179`,
PARTITION `p18`,
PARTITION `p180`,
PARTITION `p181`,
PARTITION `p182`,
PARTITION `p183`,
PARTITION `p184`,
PARTITION `p185`,
PARTITION `p186`,
PARTITION `p187`,
PARTITION `p188`,
PARTITION `p189`,
PARTITION `p19`,
PARTITION `p190`,
PARTITION `p191`,
PARTITION `p192`,
PARTITION `p193`,
PARTITION `p194`,
PARTITION `p195`,
PARTITION `p196`,
PARTITION `p197`,
PARTITION `p198`,
PARTITION `p199`,
PARTITION `p2`,
PARTITION `p20`,
PARTITION `p200`,
PARTITION `p201`,
PARTITION `p202`,
PARTITION `p203`,
PARTITION `p204`,
PARTITION `p205`,
PARTITION `p206`,
PARTITION `p207`,
PARTITION `p208`,
PARTITION `p209`,
PARTITION `p21`,
PARTITION `p210`,
PARTITION `p211`,
PARTITION `p212`,
PARTITION `p213`,
PARTITION `p214`,
PARTITION `p215`,
PARTITION `p216`,
PARTITION `p217`,
PARTITION `p218`,
PARTITION `p219`,
PARTITION `p22`,
PARTITION `p220`,
PARTITION `p221`,
PARTITION `p222`,
PARTITION `p223`,
PARTITION `p224`,
PARTITION `p225`,
PARTITION `p226`,
PARTITION `p227`,
PARTITION `p228`,
PARTITION `p229`,
PARTITION `p23`,
PARTITION `p230`,
PARTITION `p231`,
PARTITION `p232`,
PARTITION `p233`,
PARTITION `p234`,
PARTITION `p235`,
PARTITION `p236`,
PARTITION `p237`,
PARTITION `p238`,
PARTITION `p239`,
PARTITION `p24`,
PARTITION `p240`,
PARTITION `p241`,
PARTITION `p242`,
PARTITION `p243`,
PARTITION `p244`,
PARTITION `p245`,
PARTITION `p246`,
PARTITION `p247`,
PARTITION `p248`,
PARTITION `p249`,
PARTITION `p25`,
PARTITION `p26`,
PARTITION `p27`,
PARTITION `p28`,
PARTITION `p29`,
PARTITION `p3`,
PARTITION `p30`,
PARTITION `p31`,
PARTITION `p32`,
PARTITION `p33`,
PARTITION `p34`,
PARTITION `p35`,
PARTITION `p36`,
PARTITION `p37`,
PARTITION `p38`,
PARTITION `p39`,
PARTITION `p4`,
PARTITION `p40`,
PARTITION `p41`,
PARTITION `p42`,
PARTITION `p43`,
PARTITION `p44`,
PARTITION `p45`,
PARTITION `p46`,
PARTITION `p47`,
PARTITION `p48`,
PARTITION `p49`,
PARTITION `p5`,
PARTITION `p50`,
PARTITION `p51`,
PARTITION `p52`,
PARTITION `p53`,
PARTITION `p54`,
PARTITION `p55`,
PARTITION `p56`,
PARTITION `p57`,
PARTITION `p58`,
PARTITION `p59`,
PARTITION `p6`,
PARTITION `p60`,
PARTITION `p61`,
PARTITION `p62`,
PARTITION `p63`,
PARTITION `p64`,
PARTITION `p65`,
PARTITION `p66`,
PARTITION `p67`,
PARTITION `p68`,
PARTITION `p69`,
PARTITION `p7`,
PARTITION `p70`,
PARTITION `p71`,
PARTITION `p72`,
PARTITION `p73`,
PARTITION `p74`,
PARTITION `p75`,
PARTITION `p76`,
PARTITION `p77`,
PARTITION `p78`,
PARTITION `p79`,
PARTITION `p8`,
PARTITION `p80`,
PARTITION `p81`,
PARTITION `p82`,
PARTITION `p83`,
PARTITION `p84`,
PARTITION `p85`,
PARTITION `p86`,
PARTITION `p87`,
PARTITION `p88`,
PARTITION `p89`,
PARTITION `p9`,
PARTITION `p90`,
PARTITION `p91`,
PARTITION `p92`,
PARTITION `p93`,
PARTITION `p94`,
PARTITION `p95`,
PARTITION `p96`,
PARTITION `p97`,
PARTITION `p98`,
PARTITION `p99`);

INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('20428a37c0f6ac61dd86885fca8cc679', 'default', 'ipds', 'analysisOriginalData', '8b36ac42cfe37e0e55744dd38829f2e7', '\"8b36ac42cfe37e0e55744dd38829f2e7\"', 81, '2023-08-18 12:31:50', '2023-08-18 12:31:50', 81, '2023-08-29 19:44:23', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('25467736153374f516dc5f7a79fa9314', 'default', 'ipds', 'analysisOriginalData', 'b0c7fbc7dd9c50572440d6bac893cad6', '\"b0c7fbc7dd9c50572440d6bac893cad6\"', 104, '2023-08-10 05:18:01', '2023-08-10 05:18:01', 104, '2023-08-30 00:45:25', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('68b5fe3e20c6247cc240cb7d1aef85f6', 'default', 'ipds', 'analysisOriginalData', '159b0f2fdb20e975793353f6725bfb07', '\"159b0f2fdb20e975793353f6725bfb07\"', 104, '2023-08-07 02:23:29', '2023-08-07 02:23:29', 104, '2023-08-30 00:43:46', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('73e48bb0cf9f6d0162c9fffd20f4a741', 'default', 'ipds', 'analysisOriginalData', '3212107a282e50b480a888395881a3f4', '\"3212107a282e50b480a888395881a3f4\"', 99, '2023-08-13 18:36:42', '2023-08-13 18:36:42', 97, '2023-08-29 23:29:11', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('7516f2bf72ea7f0b1aaa4d4b4527b45d', 'default', 'ipds', 'analysisOriginalData', '2c80044fb56f660531aa6b2e974f5be7', '\"2c80044fb56f660531aa6b2e974f5be7\"', 105, '2023-08-17 19:04:53', '2023-08-17 19:04:53', 83, '2023-08-29 22:43:02', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('8045c309166863d1ccb636520b44d95e', 'default', 'ipds', 'analysisOriginalData', '98bc496644cdfd1c007abf9df892e05b', '\"98bc496644cdfd1c007abf9df892e05b\"', 133, '2023-08-13 18:43:18', '2023-08-13 18:43:18', 97, '2023-08-29 23:29:16', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('8a563eb6b98317117859c7a7d8ef4a80', 'default', 'ipds', 'analysisOriginalData', 'a00ee55655dfa9fd9e2134de62af5016', '\"a00ee55655dfa9fd9e2134de62af5016\"', 64, '2023-08-22 15:45:30', '2023-08-22 15:45:30', 64, '2023-08-29 19:19:25', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('8ba62e1ca64818f4535d560eb0d97c4e', 'default', 'ipds', 'analysisOriginalData', '63ca6398bccd5b4b4375a3ccece96cf0', '\"63ca6398bccd5b4b4375a3ccece96cf0\"', 104, '2023-08-10 22:42:34', '2023-08-10 22:42:34', 104, '2023-08-30 00:44:16', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('919b1b2e65b9f456a77c75cd68988c2f', 'default', 'ipds', 'analysisOriginalData', '30190e7d07967c73406d43138d5078af', '\"30190e7d07967c73406d43138d5078af\"', 104, '2023-08-10 22:33:51', '2023-08-10 22:33:51', 104, '2023-08-30 00:43:20', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('b2950a83d84b5ece0d6e2ea571defa01', 'default', 'ipds', 'analysisOriginalData', 'e22b7c49083fd1b49fd1de9729838534', '\"e22b7c49083fd1b49fd1de9729838534\"', 81, '2023-08-19 11:47:28', '2023-08-19 11:47:28', 78, '2023-08-29 20:13:32', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('cf7bdc05360dc35d2bb971f6f18a5d39', 'default', 'ipds', 'analysisOriginalData', 'f8100c816ae744b17fb97b91f4ef1751', '\"f8100c816ae744b17fb97b91f4ef1751\"', 85, '2023-08-17 01:45:37', '2023-08-17 01:45:37', 85, '2023-08-30 01:43:01', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('d555fc3b657697b2c7774fe1d277c274', 'default', 'ipds', 'analysisOriginalData', '3e2b4dc2c19bb80907f53c0f505f61a9', '\"3e2b4dc2c19bb80907f53c0f505f61a9\"', 104, '2023-08-10 10:42:16', '2023-08-10 10:42:16', 104, '2023-08-30 00:43:39', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('d849f765c3f76b812a76b12c438af024', 'default', 'ipds', 'analysisOriginalData', '5f8b37ed867d3838adf8c80d29c011fc', '\"5f8b37ed867d3838adf8c80d29c011fc\"', 64, '2023-08-22 15:48:30', '2023-08-22 15:48:30', 64, '2023-08-29 19:19:04', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('d92d4a127d426c8e7edc71b8e630501f', 'default', 'ipds', 'analysisOriginalData', '29103296080f88bf7f44f09d6b3c3b47', '\"29103296080f88bf7f44f09d6b3c3b47\"', 104, '2023-08-08 08:58:56', '2023-08-08 08:58:56', 104, '2023-08-30 00:43:46', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('a48fef4a10ce20119aba37bf4565517c', 'default', 'ipds', 'checkDevIsComplete', '2306191823281', '{\"batchNo\":\"2306191823281\"}', 10309, '2023-06-19 02:28:28', '2023-06-19 02:23:28', 10309, '2023-08-29 19:17:16', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('0085e361d4edd0b2d26b0feb7b4d58d5', 'default', 'ipds', 'countReptileNum', '120', '{\"taskId\":\"120\"}', 348, '2023-08-15 08:05:24', '2023-08-15 08:00:24', 348, '2023-08-29 20:02:51', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('05ae533819154eff4f30b342cac91c96', 'default', 'ipds', 'countReptileNum', '19', '{\"taskId\":\"19\"}', 952, '2023-07-21 02:31:11', '2023-07-21 02:26:11', 952, '2023-08-29 20:01:07', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('0c517da83ffa9b6ea47bc5879499086a', 'default', 'ipds', 'countReptileNum', '21', '{\"taskId\":\"21\"}', 993, '2023-07-19 09:06:18', '2023-07-19 09:01:18', 993, '2023-08-29 20:00:46', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('0f466d5484e8f97b9202abb2fedcb034', 'default', 'ipds', 'countReptileNum', '53', '{\"taskId\":\"53\"}', 666, '2023-08-02 01:46:25', '2023-08-02 01:41:25', 666, '2023-08-29 20:03:53', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('190d8ada50a82c0299954ef1169e54ad', 'default', 'ipds', 'countReptileNum', '56', '{\"taskId\":\"56\"}', 659, '2023-08-02 08:46:04', '2023-08-02 08:41:04', 659, '2023-08-29 20:07:27', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('1ec79ba87551d0550d54d234b6c8611c', 'default', 'ipds', 'countReptileNum', '69', '{\"taskId\":\"69\"}', 577, '2023-08-05 18:28:19', '2023-08-05 18:23:19', 577, '2023-08-29 20:09:05', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('2019c7f36d254406eefd838dc22d9e11', 'default', 'ipds', 'countReptileNum', '10', '{\"taskId\":\"10\"}', 1062, '2023-07-16 10:06:22', '2023-07-16 10:01:22', 1062, '2023-08-29 20:06:20', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('20e62dcdfd10f464cbaf34777e5d24a1', 'default', 'ipds', 'countReptileNum', '122', '{\"taskId\":\"122\"}', 296, '2023-08-17 11:48:01', '2023-08-17 11:43:01', 296, '2023-08-29 20:06:42', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('28f5774cb7126d60410e531da87fdd7a', 'default', 'ipds', 'countReptileNum', '94', '{\"taskId\":\"94\"}', 374, '2023-08-14 05:56:28', '2023-08-14 05:51:28', 374, '2023-08-29 20:06:25', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('2aec9ec67ba78ed0ab94b772b6af8021', 'default', 'ipds', 'countReptileNum', '2', '{\"taskId\":\"2\"}', 1174, '2023-07-11 21:40:10', '2023-07-11 21:35:10', 1171, '2023-08-29 20:03:06', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('30f675398e9d1324c7b9624cb97aed38', 'default', 'ipds', 'countReptileNum', '96', '{\"taskId\":\"96\"}', 374, '2023-08-14 05:56:27', '2023-08-14 05:51:27', 374, '2023-08-29 20:07:30', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('373fba408116eab64658c512bb6d9b8d', 'default', 'ipds', 'countReptileNum', '18', '{\"taskId\":\"18\"}', 951, '2023-07-21 02:33:11', '2023-07-21 02:28:11', 951, '2023-08-29 20:01:32', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('3ccfb821429ebcdc34345cbd246eef75', 'default', 'ipds', 'countReptileNum', '108', '{\"taskId\":\"108\"}', 351, '2023-08-15 04:30:27', '2023-08-15 04:25:27', 351, '2023-08-29 20:13:28', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('44afae0190504dc5420aaa6a06b4d0ec', 'default', 'ipds', 'countReptileNum', '8', '{\"taskId\":\"8\"}', 1110, '2023-07-14 10:07:13', '2023-07-14 10:02:13', 1110, '2023-08-29 20:08:11', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('541d8524a74bad9c273d39135c1e71c9', 'default', 'ipds', 'countReptileNum', '65', '{\"taskId\":\"65\"}', 620, '2023-08-03 23:17:02', '2023-08-03 23:12:02', 620, '2023-08-29 20:13:35', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('5828a20c7742c9102e19ff2bfd45e010', 'default', 'ipds', 'countReptileNum', '22', '{\"taskId\":\"22\"}', 919, '2023-07-22 10:05:48', '2023-07-22 10:00:48', 919, '2023-08-29 20:04:07', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('58e18ce35281c2d1d00efd6317bf2c70', 'default', 'ipds', 'countReptileNum', '135', '{\"taskId\":\"135\"}', 300, '2023-08-17 08:05:22', '2023-08-17 08:00:22', 300, '2023-08-29 20:02:42', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('63b7f6e4608605d0ce4b24463cd8d428', 'default', 'ipds', 'countReptileNum', '116', '{\"taskId\":\"116\"}', 372, '2023-08-14 08:05:21', '2023-08-14 08:00:21', 372, '2023-08-29 20:01:56', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('6709c1377646e5aba85946439fe3715e', 'default', 'ipds', 'countReptileNum', '129', '{\"taskId\":\"129\"}', 324, '2023-08-16 08:05:29', '2023-08-16 08:00:29', 324, '2023-08-29 20:03:00', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('6dc976370569b4076f9bb9d96a4c0403', 'default', 'ipds', 'countReptileNum', '127', '{\"taskId\":\"127\"}', 296, '2023-08-17 11:55:41', '2023-08-17 11:50:41', 296, '2023-08-29 20:05:49', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('720a2600a1dba480c042e087f12d6dc9', 'default', 'ipds', 'countReptileNum', '4', '{\"taskId\":\"4\"}', 1173, '2023-07-11 21:40:07', '2023-07-11 21:35:07', 1173, '2023-08-29 20:01:57', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('7440fdf57b2ca86725b973a623874f53', 'default', 'ipds', 'countReptileNum', '15', '{\"taskId\":\"15\"}', 992, '2023-07-19 10:06:08', '2023-07-19 10:01:08', 992, '2023-08-29 20:03:07', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('7d29bbed68925dce28928fe067884a4b', 'default', 'ipds', 'countReptileNum', '72', '{\"taskId\":\"72\"}', 575, '2023-08-05 20:17:59', '2023-08-05 20:12:59', 575, '2023-08-29 20:04:33', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('7d7786073316090f6ae0f09b23d92646', 'default', 'ipds', 'countReptileNum', '13', '{\"taskId\":\"13\"}', 1058, '2023-07-16 16:02:36', '2023-07-16 15:57:36', 1058, '2023-08-29 20:01:25', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('924baf8fb674fa2ee82db57d904908cc', 'default', 'ipds', 'countReptileNum', '146', '{\"taskId\":\"146\"}', 221, '2023-08-20 14:58:33', '2023-08-20 14:53:33', 221, '2023-08-29 20:14:00', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('92d77769c376e711ca1c07c2b5b171e1', 'default', 'ipds', 'countReptileNum', '138', '{\"taskId\":\"138\"}', 282, '2023-08-18 01:54:12', '2023-08-18 01:49:12', 282, '2023-08-29 20:02:48', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('9d3258f4006e7cf844152dfddb4d848a', 'default', 'ipds', 'countReptileNum', '79', '{\"taskId\":\"79\"}', 464, '2023-08-10 11:35:20', '2023-08-10 11:30:20', 464, '2023-08-29 20:03:02', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('9d5354ef0354e664c9ab88a6c5c971db', 'default', 'ipds', 'countReptileNum', '92', '{\"taskId\":\"92\"}', 374, '2023-08-14 05:56:28', '2023-08-14 05:51:28', 374, '2023-08-29 20:05:52', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('9d893afab1fa5090149ffed8a684e93e', 'default', 'ipds', 'countReptileNum', '51', '{\"taskId\":\"51\"}', 664, '2023-08-02 01:46:25', '2023-08-02 01:41:25', 664, '2023-08-29 20:15:11', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('a329249daedd393fcb0d374f590cce9f', 'default', 'ipds', 'countReptileNum', '6', '{\"taskId\":\"6\"}', 833, '2023-07-26 01:04:01', '2023-07-26 00:59:01', 833, '2023-08-29 20:02:24', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('a63aa74c2119f42913beed78dd8e6ced', 'default', 'ipds', 'countReptileNum', '39', '{\"taskId\":\"39\"}', 781, '2023-07-28 04:04:24', '2023-07-28 03:59:24', 781, '2023-08-29 20:12:24', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('ab1f63ee4cb0690ee6ade0ebee30d0e7', 'default', 'ipds', 'countReptileNum', '75', '{\"taskId\":\"75\"}', 530, '2023-08-07 17:58:57', '2023-08-07 17:53:57', 530, '2023-08-29 20:06:23', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('b597713e7d0b11f924e6f737bcffed3e', 'default', 'ipds', 'countReptileNum', '110', '{\"taskId\":\"110\"}', 396, '2023-08-13 08:05:29', '2023-08-13 08:00:29', 396, '2023-08-29 20:02:05', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('b7273934e33c8c5f2753a653a8f61870', 'default', 'ipds', 'countReptileNum', '100', '{\"taskId\":\"100\"}', 420, '2023-08-12 08:05:20', '2023-08-12 08:00:20', 420, '2023-08-29 20:02:35', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('baa87409a5e7a32e96a3d8cfa355cafe', 'default', 'ipds', 'countReptileNum', '32', '{\"taskId\":\"32\"}', 850, '2023-07-25 06:28:50', '2023-07-25 06:23:50', 850, '2023-08-29 20:08:20', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('be8a411c6160238e0a3d0de780be941e', 'default', 'ipds', 'countReptileNum', '7', '{\"taskId\":\"7\"}', 1134, '2023-07-13 10:07:14', '2023-07-13 10:02:14', 1134, '2023-08-29 20:08:15', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('c069f74501372f5bc7f4c5f74eb6f9d7', 'default', 'ipds', 'countReptileNum', '148', '{\"taskId\":\"148\"}', 252, '2023-08-19 08:05:21', '2023-08-19 08:00:21', 252, '2023-08-29 20:02:34', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('c25acc38393f40472545cdea40cf3882', 'default', 'ipds', 'countReptileNum', '48', '{\"taskId\":\"48\"}', 701, '2023-07-31 11:35:25', '2023-07-31 11:30:25', 701, '2023-08-29 20:13:42', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('caa4853d8f714aa6e7b964d80d43321b', 'default', 'ipds', 'countReptileNum', '29', '{\"taskId\":\"29\"}', 810, '2023-07-27 00:39:05', '2023-07-27 00:34:05', 810, '2023-08-29 20:00:43', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('d048d524477ba72b325c88d46a9d47a0', 'default', 'ipds', 'countReptileNum', '20', '{\"taskId\":\"20\"}', 1005, '2023-07-18 21:46:07', '2023-07-18 21:41:07', 1005, '2023-08-29 20:00:54', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('d75d4cf446ca8adecfef9ea6c9c1e59c', 'default', 'ipds', 'countReptileNum', '9', '{\"taskId\":\"9\"}', 1086, '2023-07-15 10:07:33', '2023-07-15 10:02:33', 1086, '2023-08-29 20:06:43', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('d7b258235278977c0380f0cf8a640a68', 'default', 'ipds', 'countReptileNum', '40', '{\"taskId\":\"40\"}', 775, '2023-07-28 10:07:35', '2023-07-28 10:02:35', 775, '2023-08-29 20:06:48', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('df9a5c5f448b5fca7c8884aeff8766c9', 'default', 'ipds', 'countReptileNum', '107', '{\"taskId\":\"107\"}', 350, '2023-08-15 04:30:26', '2023-08-15 04:25:26', 350, '2023-08-29 20:12:22', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('e127cf6d9152b0232964e862a240b8ef', 'default', 'ipds', 'countReptileNum', '78', '{\"taskId\":\"78\"}', 477, '2023-08-09 23:08:15', '2023-08-09 23:03:15', 477, '2023-08-29 20:04:37', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('e12f50e430e96f39d24d6c41d8803be0', 'default', 'ipds', 'countReptileNum', '154', '{\"taskId\":\"154\"}', 239, '2023-08-19 21:47:17', '2023-08-19 21:42:17', 239, '2023-08-29 20:00:38', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('e1e86d3a778e65f5ad81776533398910', 'default', 'ipds', 'countReptileNum', '5', '{\"taskId\":\"5\"}', 832, '2023-07-26 01:04:00', '2023-07-26 00:59:00', 832, '2023-08-29 20:06:45', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('e56a3e6726d2b2e766e5d6723f8618b7', 'default', 'ipds', 'countReptileNum', '77', '{\"taskId\":\"77\"}', 474, '2023-08-10 01:35:13', '2023-08-10 01:30:13', 474, '2023-08-29 20:12:28', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('e8d8105caed3132da7099021869fca8f', 'default', 'ipds', 'countReptileNum', '14', '{\"taskId\":\"14\"}', 1008, '2023-07-18 16:09:55', '2023-07-18 16:04:55', 1008, '2023-08-29 20:08:07', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('e9f10b4e680b32981062cd37a6b97644', 'default', 'ipds', 'countReptileNum', '54', '{\"taskId\":\"54\"}', 666, '2023-08-02 01:46:25', '2023-08-02 01:41:25', 666, '2023-08-29 20:03:03', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('f0a07b247fa275c606bbe55b7f835ba6', 'default', 'ipds', 'countReptileNum', '157', '{\"taskId\":\"157\"}', 204, '2023-08-21 08:05:23', '2023-08-21 08:00:23', 204, '2023-08-29 20:02:55', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('f2c1fcc6f4f3eaa0b4beb33da02259e5', 'default', 'ipds', 'countReptileNum', '141', '{\"taskId\":\"141\"}', 221, '2023-08-20 14:31:06', '2023-08-20 14:26:06', 221, '2023-08-29 20:12:40', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('f69140810adec571e68e80baaa236de7', 'default', 'ipds', 'countReptileNum', '85', '{\"taskId\":\"85\"}', 375, '2023-08-14 05:56:28', '2023-08-14 05:51:28', 375, '2023-08-29 20:02:49', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('f74307975d4b6a287f70ac87f089f7a7', 'default', 'ipds', 'countReptileNum', '3', '{\"taskId\":\"3\"}', 1173, '2023-07-11 21:40:08', '2023-07-11 21:35:08', 1173, '2023-08-29 20:02:06', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('f9020c62a0cd8597784fddcaca4d02c8', 'default', 'ipds', 'countReptileNum', '166', '{\"taskId\":\"166\"}', 180, '2023-08-22 08:05:42', '2023-08-22 08:00:42', 180, '2023-08-29 20:03:02', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('f919503d04cf1376f78db1eb216c8ffb', 'default', 'ipds', 'countReptileNum', '153', '{\"taskId\":\"153\"}', 228, '2023-08-20 08:05:31', '2023-08-20 08:00:31', 228, '2023-08-29 20:03:37', '');
INSERT INTO `_of_com_mq`(`mark`, `vHost`, `queue`, `type`, `msgId`, `data`, `syncCount`, `updateTime`, `createTime`, `syncLevel`, `lockTime`, `lockMark`) VALUES ('fab929f442a062502f65973feb72e06a', 'default', 'ipds', 'countReptileNum', '104', '{\"taskId\":\"104\"}', 350, '2023-08-15 04:30:25', '2023-08-15 04:25:25', 350, '2023-08-29 19:20:06', '');

SELECT 	* FROM `_of_com_mq` WHERE type = 'analysisOriginalData' order by createTime asc;