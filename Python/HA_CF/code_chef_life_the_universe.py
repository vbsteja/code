a=0
b=[]
flag=0
a=raw_input()
while int(a)!=42:
    b.append(a)
    a=raw_input()
b.sort()
for i in b:
    print i
