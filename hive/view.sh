date=$1
echo "LOAD DATA INPATH 'hdfs://BJCER256-233.opi.com:8020/user/fei.yuan/stat/task/view/output/$date/part-*' OVERWRITE INTO TABLE stat_view PARTITION (dt='$date');"|hive -h10.5.18.232 -p 10001
#SELECT * FROM stat_view LIMIT 10;
