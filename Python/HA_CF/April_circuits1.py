def count_consonents(s):
    c,v=0,0
    vow=['a','e','i','o','u']
    for i in s:
        if i in vow:
            v+=1
        else:
            c+=1
    #print(c)
    #print(v)
    if c>v:
        return True
    else:
        return False

def consec_consonents(s):
    c=0
    vow=['a','e','i','o','u','y']
    for i in s:
        if i in vow:
            c+=1
        elif c<3:
            c=0
        elif c==3:
            break
    if c==3:
        return True
    else:
        return False

a=input()
s=[]
for i in range(a):
    s.append(raw_input())
for i in s:
    if consec_consonents(i) or count_consonents(i):
        print "hard"
        #print("in if")
        #print count_consonents(i)
        #print consec_consonents(i)
    else:
        #print("in else")
        #print count_consonents(i)
        #print consec_consonents(i)
        print "easy"
