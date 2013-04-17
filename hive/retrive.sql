DROP TABLE stat_retrive;
CREATE TABLE stat_retrive(stype bigint, owner bigint, uid bigint, f_id bigint, viewindex int, actor bigint, source bigint, viewcount bigint, stat_id bigint, level bigint, origin_url string, time bigint) PARTITIONED BY(dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

