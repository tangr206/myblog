DROP TABLE stat_dispatch;
CREATE TABLE stat_dispatch(time bigint, fid bigint, source bigint, stype bigint, actor bigint, tosize int, mcdispatcher string, origin_url string) PARTITIONED BY(dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

