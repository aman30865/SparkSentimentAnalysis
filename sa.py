import sys
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
analyser = SentimentIntensityAnalyzer()


def sentiment_analyzer_scores(sentence):
    score = analyser.polarity_scores(sentence)
    print (score['neg'])
    print (score['pos'])


sentiment_analyzer_scores(sys.argv[1])