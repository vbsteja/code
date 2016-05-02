def factorial_fun(N):
    fact,fact_array,fact_str,fact_dic=1,[],"",{}
    #i,s=0,0
    #i=2
    #append=fact_array.append
    for j in range(2,N+1):
        tmp=j
        i=2
        while(True):
            if i<=tmp:
                if(tmp%i==0):
                    tmp=tmp/i
                    #append(i)
                    try:
                        fact_dic[i]+=1
                    except KeyError:
                        fact_dic[i]=1
                else:
                    i=i+1
            else:
                break
    #fact_array.sort()
    #print(fact_array[1:10])
    
    """for i in fact_array:
        if i in fact_dic:
            fact_dic[i]+=1
        else:
            fact_dic[i]=1"""

    #print(fact_dic)
    #li=list(fact_dic).sort()

    for m in sorted(fact_dic.iterkeys()):
        fact_str=fact_str+str(m)+"("+str(fact_dic[m])+")*"
    #print fact_str
    #fact_str=fact_str[0:len(fact_str)-1]
    return fact_str[0:len(fact_str)-1]

    
            
    """for i in  range(2,fact):
        if(fact%i==0):
            fact_array.append(i)
            print(fact_array)
    
    #fact_array=set(reduce(list.__add__, ([i, fact//i] for i in range(1, int(fact**0.5) + 1) if n % i == 0)))
    #fact_array.remove(1)
    #fact_array.remove(fact)
    print(fact_array)
    """
#print(factorial_fun(10000))


def closestNeighbor(li):
    m,m1=0,0
    j=0
    n=0
    p=0
    dic={}
    try:
        for i in li:
            n=abs(li[i]-li[i-1])
            p=abs(li[i]-li[i+1])
            if n>m:
                m=n
                m1=li[i]
            elif p>m:
                m=p
                m1=li[i]
                
    except IndexError:
        print ""
        
    return m1



#print(closestNeighbor([84, 56, 94, 12, 75, 34]))


def kBitsDigits(n, k):
    k=k+1
    f=0
    i,li=1,[]
    b=bin(20).split('b')[1]
    for i in range(len(b)):
        x=bin(i).split('b')[1]
        f=len(x)
        if len(x.split('1'))==k and f<=n:
            li.append(i)
        elif k==1:
            li.append(0)
            break
        elif f >= 20 :
            break

        #i+=1
    return li 
print(kBitsDigits(5,5))
