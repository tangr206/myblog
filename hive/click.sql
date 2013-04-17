DROP TABLE stat_click;
CREATE TABLE stat_click(stype bigint, uid bigint, ip string, ref string, fin int, actor bigint, url string, stat_id bigint, level bigint, time bigint) PARTITIONED BY(dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

