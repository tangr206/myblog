sql="select dt, stype, count(*), count(distinct fromid), count(distinct actor) from stat_reply where dt='$1' group by dt, stype;"
/opt/hive/bin/hive -v -h10.5.18.232 -p10001 -e "$sql"> /tmp/reply
sed '1d' /tmp/reply > /tmp/reply1
sql="select stype,count(*) from stat_reply where dt='$1' group by stype"

while read l; do 
	t=`echo $l|awk '{print $1}'`
	stype=`echo $l|awk '{print $2}'`
	c=`echo $l|awk '{print $3}'`
	uc=`echo $l|awk '{print $4}'`
	uc1=`echo $l|awk '{print $5}'`
	statsql="insert into feed_stat_stype(date, stype, reply, reply_user, replyed_user) values('$t', $stype, $c, $uc, $uc1) on duplicate key update reply=values(reply), reply_user=values(reply_user), replyed_user=values(replyed_user)"
	echo $statsql
	echo $statsql|mysql -h10.22.202.217 -ufeed -pfeed -Dfeed_stat
done < /tmp/reply1
