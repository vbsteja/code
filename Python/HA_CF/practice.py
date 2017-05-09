N=raw_input()
S=raw_input()
count =0
s=""
S_list=S.split(' ')

for i in S_list:
    count=0
    for j in S_list:
        if int(i)%int(j)== 0:
            count=count + 1
    if count == 1:
        s=s+i+' '
print s

        
    
