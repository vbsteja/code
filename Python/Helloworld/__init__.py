def Books(m,e,h):
    i=0
    r=range
    for k in r(m):
        for j in r(e):
            i+=1
    for k in r(e):
        for j in r(h):
            i+=1
    for k in r(m):
        for j in r(h):
            i+=1
    




    """while t1>0:
        while t2>0:
            i+=1
            t2-=1
            print(t1)
        t1-=1
    while e>0:
        while t3>0:
            i+=1
            t3-=1
        e-=1
    while m>0:
        while h>0:
            i+=1
            h-=1
        m-=1"""

    """while m>0:
        while  e>0:
            while h>0:
                i+=1
                h-=1
            e-=1
        m-=1"""
    return i
print(Books(4,6,20))
