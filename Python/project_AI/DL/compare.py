class NeuralNetwork:
    def __init__(self):
        self.inputLayerSize = 2
        self.outputLayerSize = 1
        self.hiddenLayerSize = 3
        
        #initialize the random weights
        self.W1 = np.random.randn(self.inputLayerSize, self.hiddenLayerSize)
        self.W2 = np.random.randn(self.hiddenLayerSize, self.outputLayerSize)
    
    def forward(self,X):
        #propagates inputs through networks.
        self.z2 = np.dot(X,self.W1)
        self.a2 = self.sigmoid(self.z2)
        self.z3 = np.dot(self.a2,self.W2)
        yHat = self.sigmoid(self.z3)
        return yHat
        
    def sigmoid(self,Z):
        #apply the sigmoid activation function
        return (1/(1+np.exp(-Z)))
    
    def sigmoidPrime(self,Z):
        #apply the sigmoid activation derivation function
        return (np.exp(-Z)/((1+np.exp(-Z))**2))
    
    def costFunction(self,X,y):
        self.yHat = self.forward(X)
        J = 0.5*sum((y-self.yHat)**2)
        return J

    def costFunctionPrime(self, X, y):
        #Compute derivative with respect to W and W2 for a given X and y:
        self.yHat = self.forward(X)
        
        delta3 = np.multiply(-(y-self.yHat), self.sigmoidPrime(self.z3))
        dJdW2 = np.dot(self.a2.T, delta3)
        
        delta2 = np.dot(delta3, self.W2.T)*self.sigmoidPrime(self.z2)
        dJdW1 = np.dot(X.T, delta2)  
        
        return dJdW1, dJdW2
    
    def getParams(self):
        params = np.concatenate((self.W1.ravel(),self.W2.ravel()))
        return params
    
    def setParams(self, params):
        #Set W1 and W2 using single paramater vector.
        W1_start = 0
        W1_end = self.hiddenLayerSize * self.inputLayerSize
        self.W1 = np.reshape(params[W1_start:W1_end], (self.inputLayerSize , self.hiddenLayerSize))
        W2_end = W1_end + self.hiddenLayerSize*self.outputLayerSize
        self.W2 = np.reshape(params[W1_end:W2_end], (self.hiddenLayerSize, self.outputLayerSize))
        
    def computeGradients(self,X,Y):
        djdw1,djdw2 = self.costFunctionPrime(X,Y)
        return np.concatenate((djdw1.ravel(),djdw2.ravel()))

def computeNumericalGradient(N,X,Y):
    params = N.getParams()
    numgrad = np.zeros(params.shape)
    perturb = np.zeros(params.shape)
    e = 1e-4
    print(params)
    for p in range(len(params)):
        perturb[p] = e            
        N.setParams(params+perturb)
        loss2 = N.costFunction(X,Y)
        #print(type(loss2))
        N.setParams(params-perturb)
        loss1 = N.costFunction(X,Y)
        
        numgrad[p] = (loss2-loss1)/(2*e)
        perturb[p] = 0
    N.setParams(params)
    return numgrad


