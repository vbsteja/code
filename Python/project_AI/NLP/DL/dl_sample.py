# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
from __future__ import  absolute_import
from __future__ import  division
from __future__ import print_function

import os
import urllib.request
import numpy as np
import tensorflow as tf
import scipy
import spacy
print()

iris_training = "iris_training.csv"
iris_training_uri = "http://download.tensorflow.org/data/iris_training.csv"

iris_test = "iris_test.csv"
iris_test_uri = "http://download.tensorflow.org/data/iris_test.csv"

def main():
    if not os.path.exists(iris_training):
        req = urllib.request.Request(iris_training_uri)
        raw = urllib.request.urlopen(req).read()
        with open(iris_training,"w") as f:
            f.write(raw)
li = []
def spacy_ex():
    nlp = spacy.load('en')
    doc = nlp('hello there here i am suryatej writing a sample nlp program')
    return [(word.text,word.lemma,word.lemma_,word.tag,word.tag_,word.pos,word.pos_) for word in doc]
    print("hello there")
li = spacy_ex()
for i in li:
    print(i[0])