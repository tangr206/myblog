DROP TABLE feed_click_test;
CREATE TABLE feed_click_test
(
time string,
ip string,
ref string,
sfet int,
fin int,
from_id    bigint
)
PARTITIONED BY(dt string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
STORED  AS TEXTFILE  ;






CREATE TABLE mayunfeng_feed_test
(
time string,
ip string,
ref string,
sfet int,
fin int,
from_id    bigint
)
PARTITIONED BY(dt string);

LOAD DATA LOCAL INPATH '/home/yunfeng.ma/feed_hive_test/test_log' OVERWRITE INTO TABLE mayunfeng_feed_test PARTITION (dt='2012-03-17');

CREATE TABLE mayunfeng_feed_new (
  time string,
  ip string,
  ref string,
  sfet INT,
  fin INT,
  ff_id INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

add FILE /home/yunfeng.ma/feed_hive_test/StypeReduce.py;


INSERT OVERWRITE TABLE mayunfeng_feed_new
SELECT
  TRANSFORM (time, ip, ref, sfet, fin, from_id)
  USING 'python StypeReduce.py'
  AS (time, ip, ref, sfet, fin, ff_id)
FROM mayunfeng_feed_test;




SELECT
  TRANSFORM (time, ip, ref, sfet, fin, from_id)
  USING 'python StypeReduce.py'
  AS (time, ip, ref, sfet, fin, ff_id)
FROM mayunfeng_feed_test ;

 1331859599018 281914887 119.39.248.29 http://login.api.renren.com/CL.do

