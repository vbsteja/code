import tensorflow as tf
import numpy as np
from matplotlib import pyplot as plt
from sklearn.model_selection import train_test_split
lr = 0.1
epochs  = 100
reg_lambda = 0.

x_dataset = np.linspace(-1, 1,100)

num_coeffs = 9
y_dataset_params = [0.] * num_coeffs
y_dataset_params[2]  = 1
y_dataset = 0.

for x in range(num_coeffs):
	y_dataset += y_dataset_params[x] * np.power(x_dataset,x)
y_dataset += np.random.randn(*x_dataset.shape) * 0.3

x_train,x_test,y_train,y_test = train_test_split(x_dataset,y_dataset,test_size = 0.3)

X = tf.placeholder(tf.float32)
Y = tf.placeholder(tf.float32)

def model(X,w):
	terms = []
	for i in range(num_coeffs):
		term = tf.multiply(w[i], np.power(X,i))
		terms.append(term)
	return tf.add_n(terms)

w = tf.Variable([0.] * num_coeffs,name = "parameters")
y_model = model(X, w)
cost = tf.div(tf.add(tf.reduce_sum(tf.square(Y-y_model)),tf.multiply(reg_lambda,tf.reduce_sum(tf.square(w)))), 2*x_train.size)

ops = tf.train.GradientDescentOptimizer(lr).minimize(cost)

sess = tf.Session()
init = tf.global_variables_initializer()
sess.run(init)

for reg_lambda in np.linspace(0, 1,100):
	for e in range(epochs):
		sess.run(ops,feed_dict={X:x_train,Y:y_train})
	final_cost = sess.run(cost,feed_dict={X:x_test,Y:y_test})
	print("reg lambda: ",reg_lambda)
	print("final cost: ",final_cost)
w_val = sess.run(w)
print(w_val)
sess.close()
