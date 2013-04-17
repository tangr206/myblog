#!/usr/bin/env python

import sys
request2count = {}
for line in sys.stdin:
    try:
        log = line.strip()
	if log not in request2count:
		request2count[log] = 1
	else:
		request2count[log] += 1
    except:
        pass


for key in request2count.keys():
    request = key
    count = int(request2count[key])
    print '%s\t%d' % (request, count)

