sql="select dt, stype, count(*), count(distinct actor) from stat_click where dt='$1' group by dt, stype;"
/opt/hive/bin/hive -v -h10.5.18.232 -p10001 -e "$sql"> /tmp/click
sed '1d' /tmp/click > /tmp/click1

while read l; do 
	t=`echo $l|awk '{print $1}'`
	stype=`echo $l|awk '{print $2}'`
	c=`echo $l|awk '{print $3}'`
	uc=`echo $l|awk '{print $4}'`
	statsql="insert into feed_stat_stype(date, stype, click, click_user) values('$t', $stype, $c, $uc) on duplicate key update click=values(click), click_user=values(click_user)"
	echo $statsql
	echo $statsql|mysql -h10.22.202.217 -ufeed -pfeed -Dfeed_stat
done < /tmp/click1
