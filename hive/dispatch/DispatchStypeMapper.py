#!/usr/bin/env python
import sys
import re
import time
for log in sys.stdin:
	line = log.strip()
        p = re.compile(r"([a-z]+):([0-9]+)")
        l = dict(filter(lambda t: t[0] in ['time','fid','source','stype','actor','newsmerge','minimerge','targetsize'], p.findall(line)))
	if len(l) == 8:
		tim = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(int(l['time'])))
		print tim + "," + str(l['fid']) + "," + str(l['source']) + "," + str(l['stype']) + "," + str(l['actor']) + "," + str(l['newsmerge']) + "," + str(l['minimerge']) + "," + str(l['targetsize'])
#dV2 time:1331520139 fid:15711748801 source:43109 stype:8002 actor:326646669 newsmerge:43109 minimerge:43109 targetsize:1 targets:(326646669)   
