

sql="select dt, stype, substr(origin_url, 1, 20) as suburl, count(*), sum(tosize), count(distinct actor) from stat_dispatch where dt='$1' and mcdispatcher='' group by dt, stype, substr(origin_url, 1, 20);"
/opt/hive/bin/hive -v -h10.5.18.232 -p10001 -e "$sql"> ./timp/dispatch
sed '1d' /tmp/dispatch > /tmp/dispatch1

while read l; do 
	t=`echo $l|awk '{print $1}'`
	stype=`echo $l|awk '{print $2}'`
	origin=`echo $l|awk '{print $3}'`
	c=`echo $l|awk '{print $4}'`
	tosize=`echo $l|awk '{print $5}'`
	uc=`echo $l|awk '{print $6}'`
	statsql="insert into feed_stat_stype(date, stype, origin, dispatch, tosize, dispatch_user) values('$t', $stype, \"$origin\", $c, $tosize, $uc) on duplicate key update dispatch=values(dispatch), tosize=values(tosize), dispatch_user=values(dispatch_user)"
	#echo $statsql
	echo $statsql|mysql -h10.22.202.217 -ufeed -pfeed -Dfeed_stat 
done < /tmp/dispatch1
