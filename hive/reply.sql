DROP TABLE stat_reply;
CREATE TABLE stat_reply(time bigint, fromid bigint, actor bigint, stype bigint, source bigint, fid bigint) PARTITIONED BY(dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
