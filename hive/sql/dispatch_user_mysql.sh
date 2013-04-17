sql="select dt, stype, count(distinct actor) from stat_dispatch where dt='$1' group by dt, stype;"
hive -v -h10.5.18.232 -p10001 -e "$sql"> /tmp/dispatch
sed '1d' /tmp/dispatch > /tmp/dispatch1

while read l; do 
	t=`echo $l|awk '{print $1}'`
	stype=`echo $l|awk '{print $2}'`
	c=`echo $l|awk '{print $3}'`
	statsql="insert into feed_stat(time, feedtype, before_dispatch, after_dispatch) values('$t', $stype, $c, $tosize) on duplicate key update before_dispatch=values(before_dispatch), after_dispatch=values(after_dispatch)"
	echo $statsql
	#echo $statsql|mysql -him3.db -uwork@RR -pGeeker4ZolZ -Dstat
done < /tmp/dispatch1
