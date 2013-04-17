select dt, viewcount, viewindex, count(*) from stat_retrive group by dt,viewcount,viewindex order by viewindex;
