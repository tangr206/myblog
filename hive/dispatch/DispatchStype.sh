hadoop fs -rmr /user/yunfeng.ma/Edm/xntalk/jicheng/dispatch_test/$1
path="/tmp/feed/dispatch"
echo ${path}
hadoop jar /opt/hadoop-0.21.0/mapred/contrib/streaming/hadoop-0.21.0-streaming.jar -jobconf mapred.map.tasks=30 -jobconf mapred.reduce.tasks=70  -input /log_in/business/feed/dispatchtoV2.$1.*  -output /user/yunfeng.ma/Edm/xntalk/jicheng/dispatch_test/$1 -mapper ${path}/DispatchStypeMapper.py -reducer ${path}/DispatchStypeReduce.py  -file ${path}/DispatchStypeMapper.py -file ${path}/DispatchStypeReduce.py
