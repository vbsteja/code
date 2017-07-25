import logging, gensim,bz2,spacy

nlp = spacy.load('en')
doc = nlp(u'Hello, spacy!')

print([(w.text,w.pos_,w.tag_)for w in doc])
