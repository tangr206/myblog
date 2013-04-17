d=`date +'%Y-%m-%d' -d "6 days ago"`
#d=$1
echo "111"
sh /home/fei.yuan/hive/sql/total_sql.sh $d
sh /home/fei.yuan/hive/sql/dispatch_mysql.sh $d
sh /home/fei.yuan/hive/sql/reply_mysql.sh $d
sh /home/fei.yuan/hive/sql/view_mysql.sh $d
sh /home/fei.yuan/hive/sql/click_mysql.sh $d

d=`date +'%Y-%m-%d' -d "5 days ago"`
#d=$1
echo "111"
sh /home/fei.yuan/hive/sql/total_sql.sh $d
sh /home/fei.yuan/hive/sql/dispatch_mysql.sh $d
sh /home/fei.yuan/hive/sql/reply_mysql.sh $d
sh /home/fei.yuan/hive/sql/view_mysql.sh $d
sh /home/fei.yuan/hive/sql/click_mysql.sh $d

d=`date +'%Y-%m-%d' -d "4 days ago"`
#d=$1
echo "111"
sh /home/fei.yuan/hive/sql/total_sql.sh $d
sh /home/fei.yuan/hive/sql/dispatch_mysql.sh $d
sh /home/fei.yuan/hive/sql/reply_mysql.sh $d
sh /home/fei.yuan/hive/sql/view_mysql.sh $d
sh /home/fei.yuan/hive/sql/click_mysql.sh $d

d=`date +'%Y-%m-%d' -d "3 days ago"`
#d=$1
echo "111"
sh /home/fei.yuan/hive/sql/total_sql.sh $d
sh /home/fei.yuan/hive/sql/dispatch_mysql.sh $d
sh /home/fei.yuan/hive/sql/reply_mysql.sh $d
sh /home/fei.yuan/hive/sql/view_mysql.sh $d
sh /home/fei.yuan/hive/sql/click_mysql.sh $d

d=`date +'%Y-%m-%d' -d "2 days ago"`
#d=$1
echo "111"
sh /home/fei.yuan/hive/sql/total_sql.sh $d
sh /home/fei.yuan/hive/sql/dispatch_mysql.sh $d
sh /home/fei.yuan/hive/sql/reply_mysql.sh $d
sh /home/fei.yuan/hive/sql/view_mysql.sh $d
sh /home/fei.yuan/hive/sql/click_mysql.sh $d

d=`date +'%Y-%m-%d' -d "1 days ago"`
#d=$1
echo "111"
sh /home/fei.yuan/hive/sql/total_sql.sh $d
sh /home/fei.yuan/hive/sql/dispatch_mysql.sh $d
sh /home/fei.yuan/hive/sql/reply_mysql.sh $d
sh /home/fei.yuan/hive/sql/view_mysql.sh $d
sh /home/fei.yuan/hive/sql/click_mysql.sh $d

