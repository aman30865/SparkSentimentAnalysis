import numpy as np
import pandas as pd
import sys



df = pd.read_csv('imdb.csv')




blank = []
for i,rv,lb in df.itertuples():
    if rv.isspace():
        blank.append(i)



from sklearn.model_selection import train_test_split
X = df['review']
y = df['sentiment']


X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.3,random_state=42)


from sklearn.pipeline import Pipeline
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.svm import LinearSVC



clf = Pipeline([('tfidf',TfidfVectorizer()),('lsvc',LinearSVC())])



clf.fit(X_train,y_train)


predictions = clf.predict(X_test)



from sklearn.metrics import confusion_matrix,classification_report
from sklearn import metrics




type(X_test)



nd = pd.Series([sys.argv[1]])


print (clf.predict(nd)[0])




