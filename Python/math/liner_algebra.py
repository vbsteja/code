#%% Change working directory from the workspace root to the ipynb file location. Turn this addition off with the DataScience.changeDirOnImportExport setting
import os
try:
	os.chdir(os.path.join(os.getcwd(), 'Python\math'))
	print(os.getcwd())
except:
	pass

#%%
import numpy as np


#%%
a = np.imag([2,3])

print(type(a))


#%%
print("Hello")

#%%



