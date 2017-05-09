#!/bin/python

import sys
import itertools

t = int(raw_input().strip())
for a0 in xrange(t):
    n,k = raw_input().strip().split(' ')
    n,k = [int(n),int(k)]
    bit_list = [x&y for (x,y) in itertools.combinations(range(1,n+1),2) if x&y < k]
    print(max(bit_list))
