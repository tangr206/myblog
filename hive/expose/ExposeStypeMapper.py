#!/usr/bin/env python
import sys
import re
import time
for log in sys.stdin:
	line = log.strip()
	str = ""
        p = re.compile(r"([\S]+):(\S*\s)")
        l = dict(filter(lambda t: t[0] in ['stype','owner','uid','f_id','index','actor','source','view','stat_id'], p.findall(line)))
	if len(l) == 9:
		level = re.search("level:[0-9]+",log)
		origin_url = re.search("origin_url:[\S]+",log)
		if level is not None:
			level = level.group()
		if origin_url is not None:
			origin_url = origin_url.group()
		str +=  l['stype'][:-1] + "," + l['owner'][:-1] + "," + l['uid'][:-1] + "," + l['f_id'][:-1] + "," + l['index'][:-1] + "," + l['actor'][:-1] + "," +  l['source'][:-1] + "," + l['view'][:-1] + "," + l['stat_id'][:-1] + ","
		if level:
			str += level[6:]
		else:
			str += ""
		if origin_url:
			str += 	"," + origin_url[11:]
		else:
			str += ","
		print str
