DROP TABLE stat_view;
CREATE TABLE stat_view(stype bigint, owner bigint, uid bigint, f_id bigint, viewindex int, actor bigint, source bigint, viewcount bigint, stat_id bigint, level bigint, origin_url string, time bigint) PARTITIONED BY(dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' LINES TERMINATED BY '\n';
LOAD DATA INPATH 'hdfs://BJCER256-233.opi.com:8020/user/fei.yuan/stat/task/view/output/2012-03-21/part-*' OVERWRITE INTO TABLE stat_view PARTITION (dt='2012-03-21');
SELECT * FROM stat_view LIMIT 10;

