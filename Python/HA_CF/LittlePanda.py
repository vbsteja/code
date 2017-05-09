import sys
from itertools import chain,combinations

def GetMAXOR(n,li):
	output=0
	TSubSet=subsets(li)
	#print(TSubSet)
	for x in range(0,len(TSubSet)):
		for y in range(x+1,len(TSubSet)):
			if len(TSubSet[x])>=1:
				if MAXOR(TSubSet[x])==MAXOR(TSubSet[y]):
					#print("SubSet1:",TSubSet[x])
					#print("SubSet2:",TSubSet[y])
					output=output+1
				
				pass
	print(output)
				

	
def subsets(mySet):
    return reduce(lambda z, x: z + [y + [x] for y in z], mySet, [[]])

def MAXOR(li):
	out=0
	for x in li:
			out=out^x
	return out

#read the input
n=input()
li=[]
while len(li)<n:
	li.append(input())
	pass
#s = raw_input()
#li = map(int, s.split())
	
GetMAXOR(n,li)