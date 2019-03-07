import  sklearn
import pandas as pd

def start():
    print("Hello there")

#returns the encoded sequence
def encode(pattern,n_unique):
    encoded = list()
    for value in pattern:
        row = [0.0 for x in range(n_unique)]
        row[value] = 1.0
        encoded.append(row)
    return  encoded

#returns the encoded XY pair_tuple_to_list
def to_xy_pairs(encoded):
    X,y = list(),list()
    for i in range(1,len(encoded)):
        X.append(encoded[i-1])
        y.append(encoded[i])
    return X,y

#generating the sequence to be used in LSTM
def to_lstm_dataset(sequence,n_unique):
    encoded = encode(sequence,n_unique)
    X,y = to_xy_pairs(encoded)
    dfx,dfy = pd.DataFrame(X),pd.DataFrame(y)
    lstmx = dfx.values
    lstmx = lstmx.reshape(lstmx.shape[0],1,lstmx.shape[1])
    lstmy = dfy.values
    return lstmx,lstmy



seq1 = [3, 0, 1, 2, 3]
seq2 = [4, 0, 1, 2, 4]
n_unique = len(set(seq1 + seq2))
seq1X,seq1y = to_lstm_dataset(seq1,n_unique)
seq2X,seq2y = to_lstm_dataset(seq2,n_unique)

from keras.models import Sequential
from keras.layers import Dense,Activation,LSTM

#define LSTM configuration
n_neurons = 20
n_batch = 1
n_epoch = 250
n_features = n_unique

model = Sequential()
model.add(LSTM(20,batch_input_shape = (1,1,5),stateful = True))
model.add(Dense(5,activation='sigmoid'))
model.compile(loss = 'binary_crossentropy',optimizer='adam')

for i in range(250):
    model.fit(seq1X, seq1y, epochs = 1, batch_size = 1, verbose = 1, shuffle = False)
    model.reset_states()
    model.fit(seq2X, seq2y, epochs = 1, batch_size = 1, verbose = 1, shuffle = False)
    model.reset_states()


# test LSTM on sequence 1
print('Sequence 1')
result = model.predict_classes(seq1X, batch_size=n_batch, verbose=0)
model.reset_states()
for i in range(len(result)):
	print('X=%.1f y=%.1f, yhat=%.1f' % (seq1[i], seq1[i+1], result[i]))

# test LSTM on sequence 2
print('Sequence 2')
result = model.predict_classes(seq2X, batch_size=n_batch, verbose=0)
model.reset_states()
for i in range(len(result)):
	print('X=%.1f y=%.1f, yhat=%.1f' % (seq2[i], seq2[i+1], result[i]))


"""
enc = encode(seq1, 5)
X,y = to_xy_pairs(enc)
for i in range(len(X)):
    print(X[i],y[i])
"""
