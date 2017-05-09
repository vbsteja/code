import random
def GetChar(st):
    s=[]
    i=0
    while i<len(st):
        s.append(st[i])
        i=i+1
    #print(s)
    return s

def CountR(st):
    sout=[]
    cnt1=0
    for x in st:
        sout=GetChar(x)
        i,j,start,cnt=0,0,0,0
        for z in range(len(sout)):
            if sout[z]=='K':
                if cnt==0:
                    start,cnt=z,cnt+1
                else:
                    cnt=cnt+1
            else:
                i,j,start,cnt=start,cnt,0,0
        #i=random.randint(0,len(sout)/2)
        #j=random.randint(len(sout)/2,len(sout)-1)
        #print (i,j)
        for m in range(i,j+1):
            if sout[m]=='R':
                sout[m]='K'
            else:
                sout[m]='R'
        print(sout)
        for n in sout:
            if n=='R':
                cnt1=cnt1+1
        print(cnt1)
        cnt1=0

n=input()
st=[]
if n<=10:
    for i in range(n):
        st.insert(i,raw_input())
CountR(st)
