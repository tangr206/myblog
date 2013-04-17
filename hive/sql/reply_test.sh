sql="select stype,count(*) from stat_reply where dt='$1' group by stype"
hive -v -h10.5.18.232 -p10001 -e "$sql"> /tmp/totalreply
sed '1d' /tmp/totalreply > /tmp/totalreply1

while read l; do
        c1=`echo $l|awk '{print $1}'`
        c2=`echo $l|awk '{print $2}'`
        statsql="insert into feed_record(time, stype, replycount) values('$1', $c1, $c2) on duplicate key update replycount=values(replycount), stype=values(stype)"
	echo $statsql
        echo $statsql|mysql -him3.db.d.xiaonei.com -uwork@RR -pGeeker4ZolZ -Dstat
done < /tmp/totalreply1
