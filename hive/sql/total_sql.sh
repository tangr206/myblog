sql="select count(*),sum(tosize),count(distinct actor) from stat_dispatch where dt='$1' and mcdispatcher=''"
/opt/hive/bin/hive -v -h10.5.18.232 -p10001 -e "$sql"> /tmp/totaldispatch
sed '1d' /tmp/totaldispatch > /tmp/totaldispatch1

while read l; do
        c1=`echo $l|awk '{print $1}'`
        c2=`echo $l|awk '{print $2}'`
        c3=`echo $l|awk '{print $3}'`
        statsql="insert into feed_stat_total(date, dispatch, tosize, dispatch_user) values('$1', $c1, $c2, $c3) on duplicate key update dispatch=values(dispatch), tosize=values(tosize), dispatch_user=values(dispatch_user)"
        echo $statsql|mysql -h10.22.202.217 -ufeed -pfeed -Dfeed_stat
done < /tmp/totaldispatch1


#sql="select count(*),avg(viewindex),count(distinct uid),count(distinct actor) from stat_view where dt='$1'"
sql="select count(*),avg(viewindex),count(distinct uid) from stat_view where dt='$1'"
/opt/hive/bin/hive -v -h10.5.18.232 -p10001 -e "$sql"> /tmp/totalview
sed '1d' /tmp/totalview > /tmp/totalview1
while read l; do
        c1=`echo $l|awk '{print $1}'`
        c2=`echo $l|awk '{print $2}'`
        c3=`echo $l|awk '{print $3}'`
        #c4=`echo $l|awk '{print $4}'`
        #statsql="insert into feed_stat_total(date, view, view_pos, view_user, viewed_user) values('$1', $c1, $c2, $c3, $c4) on duplicate key update view=values(view), view_pos=values(view_pos), view_user=values(view_user), viewed_user=values(viewed_user)"
        statsql="insert into feed_stat_total(date, view, view_pos, view_user) values('$1', $c1, $c2, $c3) on duplicate key update view=values(view), view_pos=values(view_pos), view_user=values(view_user)"
        echo $statsql|mysql -h10.22.202.217 -ufeed -pfeed -Dfeed_stat
done < /tmp/totalview1


sql="select count(*),avg(fin),count(distinct uid), count(distinct actor) from stat_click where dt='$1'"
/opt/hive/bin/hive -v -h10.5.18.232 -p10001 -e "$sql"> /tmp/totalclick
sed '1d' /tmp/totalclick > /tmp/totalclick1

while read l; do
        c1=`echo $l|awk '{print $1}'`
        c2=`echo $l|awk '{print $2}'`
        c3=`echo $l|awk '{print $3}'`
        c4=`echo $l|awk '{print $4}'`
        statsql="insert into feed_stat_total(date, click, click_pos, click_user, clicked_user) values('$1', $c1, $c2, $c3, $c4) on duplicate key update click=values(click), click_pos=values(click_pos), click_user=values(click_user), clicked_user=values(clicked_user)"
        echo $statsql|mysql -h10.22.202.217 -ufeed -pfeed -Dfeed_stat
done < /tmp/totalclick1



sql="select count(*),count(distinct fromid), count(distinct actor) from stat_reply where dt='$1'"
/opt/hive/bin/hive -v -h10.5.18.232 -p10001 -e "$sql"> /tmp/totalreply
sed '1d' /tmp/totalreply > /tmp/totalreply1

while read l; do
        c1=`echo $l|awk '{print $1}'`
        c2=`echo $l|awk '{print $2}'`
        c3=`echo $l|awk '{print $3}'`
        statsql="insert into feed_stat_total(date, reply, reply_user, replyed_user) values('$1', $c1, $c2, $c3) on duplicate key update reply=values(reply), reply_user=values(reply_user), replyed_user=values(replyed_user)"
        echo $statsql|mysql -h10.22.202.217 -ufeed -pfeed -Dfeed_stat
done < /tmp/totalreply1

