def Check_Boys_Girls(HM,HN):
    cnt=0
    dic={}
    DHM=HM
    DHN=HN
    if len(HM)>len(HN):
        print("NO")
    else:
        for i in range(len(HM)):
            for j in range(len(HN)):
                           if(HM[i]>=HN[j]):
                               dic[i]=j
                               del HN[j]
                               break
        if len(dic)!=len(DHM):
            print("NO")
        else:
            print("YES")
                
T=input()
i=0
while(i<T):
    i=i+1
    s = raw_input()
    li = map(int, s.split())
    #M=li[0]
    #N=li[1]
    if li[0]<=10000:
    	M=li[0]
    else:
    	exit()
    if li[1]>=1:
        N=li[1]
    else:
    	exit()
    HM=[]
    HN=[]
    s = raw_input()
    HM= map(int, s.split())
    s=raw_input()
    HN=map(int, s.split())
        #print(HM[:M])
    Check_Boys_Girls(HM[:M],HN[:N])
