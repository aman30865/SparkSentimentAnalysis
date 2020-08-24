package com.sa.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.sa.dao.ReviewsDAO;
import com.sa.daoimpl.ReviewsDAOImpl;
import com.sa.util.Constants;

public class MovieReviewAnalysisThread implements Runnable
{

   String review;
   String id;
   String email;

   Thread t;

   public MovieReviewAnalysisThread(String review, String id, String email)
   {
      this.review = review;
      this.id = id;
      this.email = email;
      t = new Thread(this);
      t.start();
   }

   @Override
   public void run()
   {
      try
      {
         System.out.println("Running Algo");
         byte[] postData = review.getBytes();
         int postDataLength = postData.length;
         URL url = new URL("http://" + Constants.HOST + ":" + Constants.PORT + "/" + Constants.APPNAME + "/" + Constants.CONTEXT);
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         conn.setDoOutput(true);
         conn.setRequestMethod("POST");
         conn.setRequestProperty("Content-Type", "text/plain");
         conn.setRequestProperty("Content-Length", Integer.toString(postDataLength));
         conn.setUseCaches(false);
         try (DataOutputStream wr = new DataOutputStream(conn.getOutputStream()))
         {
            wr.write(postData);
         }

         if (conn.getResponseCode() != 200)
         {
            throw new RuntimeException("Failed : HTTP error code : "
                     + conn.getResponseCode());
         }

         BufferedReader br = new BufferedReader(new InputStreamReader(
                  (conn.getInputStream())));

         String output = "";
         String line = "";
         while ((line = br.readLine()) != null)
         {
            output += line;
         }

         conn.disconnect();

         System.out.println("Output: " + output);
         ReviewsDAO rDao = new ReviewsDAOImpl();
         rDao.update(id, email, output);
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }

   }

}
