# -*- coding: utf-8 -*-
"""
Created on Fri Apr 14 21:00:16 2017

@author: surya
"""

'''
# Read input from stdin and provide input before running code

name = raw_input()
print 'Hi, %s.' % name
'''
#print 'Hello World!'
import math
def getDif(f):
    fact = math.factorial(f)
    diff = len(str(fact)) - len(str(fact).rstrip('0'))
    return fact,diff

T = input()
l = []
go_back = False
revisit = 1
dic = {}
for _ in range(T):
    M = input()
    f = M * 5
    while True:
        fact,diff = getDif(f)
        dic[f] = fact
        if diff < M:
            go_back = False
            f += 1
            print('diff is less than M')
        elif diff > M:
            print('diff is greater than M')
            go_back = True

        if go_back:
            print('inside the go_baack')
            f -= 1
        if diff == M and go_back == False:
            print('inside the appends')
            l.append(fact)
            f += 1
            fact,diff = getDif(f)
            if( diff > M):
                print('revisited')
                revisit = 2
        if revisit == 2:
            break

    l = map(str,sorted(dic.keys()))
    print len(l)
    print " ".join(l)
