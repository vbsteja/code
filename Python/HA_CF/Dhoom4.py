def Dhoom4Time(NK,SK,LK):
    time=0
    m=0
    cnt=0
    stack=[]
    stack1=[]
    tk=SK
    if(SK==LK):
        return time+1
    else:
        min=time
        for i in range(len(NK)):
            temp=SK
            for j in NK:
                temp=temp+j
                stack[cnt].extend(stack.insert(j,0))
                if  temp==LK:
                    time=time+1
                    m=m+1
                    break
                continue
            temp=0
            cnt=cnt+1
            if m!=0:
                cnt=cnt-1
                del stack[cnt]
        
        return min
    
    
    
s = raw_input()
li = map(int, s.split())
SK=li[0]
LK=li[1]
N=raw_input()
s=raw_input()
NK=map(int,s.split())
print(SK,"",LK,"",NK)
i=Dhoom4Time(NK,SK,LK)
print(i)
