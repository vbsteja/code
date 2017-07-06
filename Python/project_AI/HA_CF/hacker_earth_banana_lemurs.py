import math
NK=raw_input()#input for N bananas and  K lemors in that order

NK=NK.split(' ')
N,K=int(NK[0]),int(NK[1])
a=0
if N > K:
    a=math.ceil(N%float(K))
    #1.2 < float(math.floor(1.8))+.5
    #if a < float(math.floor(a))+.5:
    #print a
    print(int(math.ceil(a/2.0)))
else:
    a=math.ceil (K%float(N))
    print(int(math.ceil(a/2.0)))


class Hello(object):
  	"""docstring for Hello"""
  	def __init__(self, arg):
  		super(Hello, self).__init__()
  		self.arg = arg
  	def printmyname(self,name):
  		print(name)
h=Hello("surya")
h.printmyname("surya")
