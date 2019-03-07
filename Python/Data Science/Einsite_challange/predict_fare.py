#importing required libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib
#read train.csv into a pandas DataFrame
df = pd.read_csv("/home/surya/Documents/Dataset/cabbie_datafa2fec8/train.csv")

print(len(df))
print(df.columns)


def customize_columns(df_clean,column):
    return df_clean.drop(column,axis = 1)

clean_columns = ['TID','vendor_id','pickup_datetime','dropoff_datetime','store_and_fwd_flag','payment_type']
df_clean = df
for c in clean_columns:
    df_clean = customize_columns(df_clean,c)
df_clean.columns

plt.figure()
df_clean.plot(x = 'fare_amount', y = 'rate_code',)
plt.show()

df_clean['new_user'].unique()
df_clean['rate_code'].unique()

df_clean.loc[df_clean['rate_code'] == 1].fare_amount.max()
df_clean.loc[df_clean['rate_code'] == 2].fare_amount.max()
df_clean.loc[df_clean['rate_code'] == 4].fare_amount.max()
df_clean.loc[df_clean['rate_code'] == 5].fare_amount.max()
df_clean.loc[df_clean['rate_code'] == 3].fare_amount.max()
df_clean.loc[df_clean['rate_code'] == 0].fare_amount.max()
df_clean.loc[df_clean['rate_code'] == 6].fare_amount.max()
df_clean.loc[df_clean['rate_code'] == 210].fare_amount.max()
df_clean.loc[df_clean['rate_code'] == 99].fare_amount.max()
