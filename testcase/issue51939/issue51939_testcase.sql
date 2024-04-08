drop table if exists `tl`;

CREATE TABLE `tl` (
  `col_42` json NOT NULL,
  `col_43` tinyint(1) DEFAULT NULL,
  `col_44` char(168) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL,
  `col_45` json DEFAULT NULL,
  `col_46` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `col_47` char(43) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xW2YNb99pse4)',
  `col_48` time NOT NULL DEFAULT '12:31:25',
  PRIMARY KEY (`col_47`,`col_46`(2)) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tl` VALUES ('[\"01qHMy8yycbq2v1CZ80kiIECEQFLXYsnM0tpVh9vbx71DMpaPdp6hBkrpTodkXVt\", \"dGugZHV3pmqjLSdICAYbiwFGZsYWX9MrzgSGCslmEsfFzXYOiXyE0YMS1TSfnX5R\", \"Ypz8Jj0hBSBQbiWd3LbPRV2qvSEAxV8rlXnxpn93nXmFyMJkCQzyhtNn0FUwH6Ce\", \"Yf6kag9ruOT04V8AHT6NYhCNIa2CYZDVg8zWaxxHFm0GPAJh0e6Mc5Upa0EAp1Sr\", \"ljrRnPUdxJNkWxmkn4K25YeFwVtedGtLDrWlWYZyqt2Shpfg4p7jroOwbOZHuHiE\"]',0,'釸7鈡w歀痂暰苕rv)Ts','[5661899762065804824, 3294089805449875423, 2378579521053711229, 6262068190112960080]','Wxup81婱鍋cH爀
2潺檛楍1N7','2ZNeu2n5-2+Q3qYp','10:14:20'), ('[\"iOl0B9dVMoNYk8Qroj6JTwm0MaCJmr5qnQzdjMtaoDar4jGe6q20HAyVu3GacogW\", \"PBy3AXmGhzJMBX3Ow9INdeATLld8bVVjrIUVTlspzpHMZPuFGlEsDeRN6JOLqRLy\", \"jyr0odf7TOhLpuejrfbvsBbjqCchHSKEFZ079c5KUhu0FIuoqm6tBNbWCBb0xb3c\", \"PmPE8oZf73Zwffi97D7AaQM5g0xameUwPvO15LEUPVlF4iiDVsXyGMESSbEzR5L7\", \"4y0WxQIzPw217QeSXCySsK3pGbHdMxx6ETtIZQfGI8v7Pq9Rxhwkslr1ih8M7Dok\"]',0,'','[2142591371645505560, 2975660707908269211]','','aC794Ir-)iJZr&a','02:30:55'), ('[\"je9igPre8L6VdmtEtVDwxCgTqcuSKdqdO4fheHXRJOQLojiHx4F8cXmFpiYq9955\", \"zPjn7sAeMVLLGE3o9lpnZai26ad8qxHNQF6CSsMshFbP2fDuByV3SYxhxkVwIQd3\", \"Etj8PQZe64XWTbBElIEhWA3F3OcytxNMLvxQqr4miDxoK96Q8fGjBg34H3i4y3V5\", \"IDNAQjueBRQyUE285zoPSMhIvVKrxbiXAVvge0iC9AaEFK18Gh3sign84Nu6M3Ar\", \"MK79tEDnyHn2Cmw4W55hEzAsKvqUTZbViv6UyiEqnUE9jpBOnMEDQbq6yQip4qm3\"]',1,')譺
)RK5','[1760220588316922379, 4921535278728445755, 5623214347361271244, 5272407040485486430, 9017432485293265763]','RLFF','gS','06:27:28');

alter table tl add index idx_16(`col_48`,(cast(`col_45` as signed array)),`col_46`(5));

desc select col_47 from tl where col_48 = '10:14:20';
