package com.streaming.twitter

import scala.io.Source

import org.apache.spark.streaming.Seconds
import org.apache.spark.streaming.StreamingContext
import org.apache.spark.streaming.twitter.TwitterUtils

import scalaj.http.Http
import twitter4j.auth.OAuthAuthorization
import twitter4j.conf.ConfigurationBuilder
import org.apache.log4j.{ Level, Logger }

/** Listens to a stream of tweets and saves them to disk. */
object FetchTweets {

  /** Our main function where the action happens */
  def main(args: Array[String]) {

    val hashtag = "corona"
    val email = "celestialcluster@gmail.com"
    
    // Configure Twitter credentials using twitter.txt
    //setupTwitter()

    val rootLogger = Logger.getRootLogger()
    rootLogger.setLevel(Level.ERROR)

    // Set up a Spark streaming context named "SaveTweets" that runs locally using
    // all CPU cores and one-second batches of data
    val ssc = new StreamingContext("local[*]", "SaveTweets", Seconds(1))

    val cb = new ConfigurationBuilder()
    cb.setDebugEnabled(true).setOAuthConsumerKey("TMOpyBWG6HqxyUlQf3GoZupiD")
      .setOAuthConsumerSecret("aTwfUphrBHW3FSBxpaIBZthAEg8RScwcqIfu7ewAgyLCmyYgt9")
      .setOAuthAccessToken("212984777-C55Tz503cxBIiQjX6vyr2HhkRrisOmU3rASmZcq1")
      .setOAuthAccessTokenSecret("a0aTD3AJK2mX0kuAcP3b5FyQ1CpyY2TIbAzHpjZrcdIVp").setTweetModeExtended(true)

    // Create a DStream from Twitter using our streaming context
    //val tweets = TwitterUtils.createStream(ssc, None)

    val configuration = cb.build()
    val tweets = TwitterUtils.createStream(
      ssc,
      Some(new OAuthAuthorization(configuration)))

    val filtered = tweets.filter(_.getLang() == "en")

    val filtered2 = filtered.filter(x => x.getText().contains("#" + hashtag))

    // Now extract the text of each status update into RDD's using map()

    val statuses = filtered2.map(status => status.getText())

    var totalTweets: Long = 0

    statuses.foreachRDD((rdd, time) => {

      rdd.collect().foreach(data => {
        for (line <- Source.fromFile("C:/Twitter/service.txt").getLines) {
          val result = Http("http://" + line + ":8080/SentimentAnalysis/rest/sa/tweets").postData(email + "@#@#@#@#" + data)
            .header("Content-Type", "application/text")
            .header("Charset", "UTF-8").asString
          print(result)
        }

      })

    })

    // You can also write results into a database of your choosing, but we'll do that later.

    // Set a checkpoint directory, and kick it all off
    ssc.checkpoint("C:/checkpoint/")
    ssc.start()
    ssc.awaitTermination()
  }
}
