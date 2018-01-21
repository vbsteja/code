def beautiful_binary_strings(BinaryString):
        NA=[]
        NB=[]
        pcount=0
        result=True
        for i in BinaryString:
                if(i=='A'):
                        NA.append('A')
                elif(i=='B'):
                        NB.append('B')
                else:
                        return False
        if(len(BinaryString)%2!=0):
            result=False
        elif (len(NA) % 2)!=0:
            result=False
        elif (len(NB) % 2)!=0:
            result=False
        #elif BinaryString.find("ABAB",0)!=-1 or BinaryString.find("BABA",0)!=-1:
         #   result=False
        return result
