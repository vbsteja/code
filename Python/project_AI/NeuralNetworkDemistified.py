
import numpy as np

class NeuralNetwork:
  
  def __init(self):
    self.inputLayerSize = 2
    self.outputLayerSize = 1
    self.hiddenLayerSize = 3
    
    #initialize the weights randomly.
    self.W1 = np.random.randn(self.inputLayerSize,self.hiddenLayerSize)
    self.W2 = np.random.randn(self.hiddenLayerSize,self.outputLayerSize)
    
    def sigmoid(self,z):
      #return the computed sigmoid for the weights or activation
      return (1/(1+np.exp(-z)))
    
    def forward(self,X):
      #computes the forward propagation
      self.z2 = np.dot(self.X,self.W1)
      self.a2 = self.sigmoid(self.z2)
      self.z3 = np.dot(self.a2,self.W2)
      yHat = self.sigmoid(self.z3)
      retun yHat
      
