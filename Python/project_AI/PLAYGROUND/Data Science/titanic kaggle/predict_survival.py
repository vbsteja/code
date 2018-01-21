#import the required libraries
import pandas as pd
import numpy as np

import os
print(os.getcwd())
df = pd.read_csv("train.csv")
#read the data into a DataFrame

#update the categorial values of Sex into binary values
df.loc[df['Sex'] == 'female','Sex'] = 0
df.loc[df['Sex'] == 'male','Sex'] = 1
df.Embarked.fillna(0)

print(df)
#create the label data for training
df_label = df['Survived']

#drop the columns which are not effective in predicting the survival rate
df = df.drop('Cabin',axis=1)
df = df.drop('Survived',axis=1)
df = df.drop('Name',axis=1)
df = df.drop('PassengerId',axis=1)
df = df.drop('Ticket',axis = 1)
from sklearn.preprocessing import MinMaxScaler
from sklearn.model_selection import train_test_split
scaler = MinMaxScaler()

X_train,X_test,Y_train,T_test = train_test_split(df,df_label,test_size = 0.10)

#print(df.loc[df['Embarked'] == pd.NaT])

print(df.Embarked.unique())
print(df.Pclass.unique())

print(X_train)
print(X_test)
print(Y_train)

print(df.columns.values)

#print(df.describe())
