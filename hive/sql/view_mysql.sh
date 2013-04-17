#select count(*),avg(viewindex),count(distinct uid) from stat_view where dt='$1'

sql="select dt, stype, count(*), avg(viewindex), count(distinct uid) from stat_view where dt='$1' group by dt, stype;"
/opt/hive/bin/hive -v -h10.5.18.232 -p10001 -e "$sql"> /tmp/view
sed '1d' /tmp/view > /tmp/view1

while read l; do 
	t=`echo $l|awk '{print $1}'`
	stype=`echo $l|awk '{print $2}'`
	#origin=`echo $l|awk '{print $3}'`
	c=`echo $l|awk '{print $3}'`
	index=`echo $l|awk '{print $4}'`
	uc=`echo $l|awk '{print $5}'`
	#statsql="insert into feed_stat_(time, feedtype, exposure) values('$t', $stype, $c) on duplicate key update exposure=values(exposure)"
	statsql="insert into feed_stat_stype(date, stype, view, view_pos, view_user) values('$t', $stype, $c, $index, $uc) on duplicate key update view=values(view), view_pos=values(view_pos), view_user=values(view_user)"
	echo $statsql|mysql -h10.22.202.217 -ufeed -pfeed -Dfeed_stat 

	#echo $statsql
	#echo $statsql|mysql -him3.db -uwork@RR -pGeeker4ZolZ -Dstat
done < /tmp/view1
