sql="select stype,count(*)  from  stat_dispatch where mcdispatcher = '' and dt='$1' group by stype"
hive -v -h10.5.18.232 -p10001 -e "$sql"> /tmp/totaldispatch
sed '1d' /tmp/totaldispatch > /tmp/totaldispatch1

while read l; do
        c1=`echo $l|awk '{print $1}'`
        c2=`echo $l|awk '{print $2}'`
	echo $c1
	echo $c2
#done
        statsql="insert into feed_record(time, stype, dispatchcount) values('$1', $c1, $c2) on duplicate key update dispatchcount=values(dispatchcount), stype=values(stype)"
	echo $statsql
        echo $statsql|mysql -him3.db.d.xiaonei.com -uwork@RR -pGeeker4ZolZ -Dstat
done < /tmp/totaldispatch1
