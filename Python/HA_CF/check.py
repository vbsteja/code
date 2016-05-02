def DispDiff(li,lk):
    ld=[]
    c=0
    for i in li:
        for j in lk:
            if(i==j):
                c=0
                continue
            else:
                c=1
        if c==1:
            ld.append(i)
    print("the different itrems are")
    for i in ld:
        print(i)
    print("_______")


cnt=0;
li=[]
while cnt<399:
    li.append(input())
    cnt=cnt+1
li=sorted(li)
lk=[]
cnt=0
while cnt<369:
    lk.append(input())
    cnt=cnt+1
lk=sorted(lk)
DispDiff(li,lk)
