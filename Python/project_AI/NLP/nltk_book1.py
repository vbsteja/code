import nltk
from nltk.book import *

nltk.corpus.gutenberg.fileids()

def lexical_diversity(text):
    return len(set(text)) / len(text)

def percentage(count,total):
	return 100 * count / total

percentage(12, 119)