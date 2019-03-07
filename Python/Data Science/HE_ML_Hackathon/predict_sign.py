import pandas as pd
from sklearn.ensemble import RandomForestClassifier,AdaBoostClassifier

#reading the csv files of train and test data
df_train = pd.read_csv("/home/surya/Documents/Dataset/HK_HA_ML/train.csv")
df_test = pd.read_csv("/home/surya/Documents/Dataset/HK_HA_ML/test.csv")

df_train.head()
df_train['DetectedCamera'].value_counts()
#encoding as integer
mapping = {'Front':0,'Right':1,'Left':2,'Rear':3}
df_train = df_train.replace({'DetectedCamera':mapping})
df_test = df_test.replace({'DetectedCamera':mapping})

#reanaming the columns
df_train.rename(columns = {'SignFacing (Target)':'Target'},inplace = True)
df_train.columns
mapping = {'Front':0,'Left':1,'Rear':2,'Right':3}
df_train = df_train.replace({'Target':mapping})

#target variable
Y_train = df_train['Target']
test_id = df_test['Id']

#drop the columns
df_train.drop(['Target','Id'],inplace = True,axis = 1)
df_test.drop(['Id'],inplace = True,axis = 1)

df_train.head()
df_train.columns
##################################################################################
#classifier 1 start
#train the Algorithm using RandomForestClassifier
clf = RandomForestClassifier(n_estimators=2000,min_samples_split=32,oob_score=True)
clf.fit(df_train,Y_train)

print("the score of the RandomForestClassifier is : ",clf.score(df_train,Y_train) )

pred = clf.predict_proba(df_test)

#write submission file and submit
columns = ['Front','Left','Rear','Right']
sub = pd.DataFrame(data=pred, columns=columns)
sub['Id'] = test_id
sub = sub[['Id','Front','Left','Rear','Right']]
sub.to_csv("sub_rfih.csv",  index=False, float_format='%0.6f') #99.8XXX

#classifier 1 end
##################################################################################

##################################################################################
#classifier 2 start
#train the Algorithm using AdaBoostClassifier
clf_ada = AdaBoostClassifier(n_estimators=1000,learning_rate=1.0,algorithm='SAMME.R')
clf_ada.fit(df_train,Y_train)

#predict based on AdaBoostClassifier
pred = clf_ada.predict_proba(df_test)

#write aubmission file and submit
columns = ['Front','Left','Rear','Right']
sub = pd.DataFrame(data=pred,columns=columns)
sub['Id'] = test_id
sub = sub[['Id','Front','Left','Rear','Right']]
sub.to_csv("sub_AdaB.csv",index=False,float_format='%0.6f')

#classifier 2 end
##################################################################################
