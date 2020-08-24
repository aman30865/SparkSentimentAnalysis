package com.sa.model;

import java.sql.Timestamp;

public class Reviews
{
   private String id;
   private String review;
   private String email;
   private String sentiment;
   private Timestamp entry_time;

   public String getId()
   {
      return id;
   }

   public void setId(String id)
   {
      this.id = id;
   }

   public String getReview()
   {
      return review;
   }

   public void setReview(String review)
   {
      this.review = review;
   }

   public String getEmail()
   {
      return email;
   }

   public void setEmail(String email)
   {
      this.email = email;
   }

   public String getSentiment()
   {
      return sentiment;
   }

   public void setSentiment(String sentiment)
   {
      this.sentiment = sentiment;
   }

   public Timestamp getEntry_time()
   {
      return entry_time;
   }

   public void setEntry_time(Timestamp entry_time)
   {
      this.entry_time = entry_time;
   }

}
