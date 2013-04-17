select dt, viewcount, viewindex, count(*) from stat_view group by dt,viewcount,viewindex order by viewindex;
