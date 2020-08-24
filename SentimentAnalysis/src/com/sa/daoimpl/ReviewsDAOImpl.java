package com.sa.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sa.dao.ReviewsDAO;
import com.sa.model.Reviews;
import com.sa.util.DBConnection;

public class ReviewsDAOImpl implements ReviewsDAO
{

   @Override
   public void write(Reviews model) throws Exception
   {
      Connection con = null;
      try
      {
         con = DBConnection.connect();
         PreparedStatement ps = con.prepareStatement("insert into reviews values (?,?,?,?,?) ");
         ps.setString(1, model.getId());
         ps.setString(2, model.getReview());
         ps.setString(3, model.getEmail());
         ps.setString(4, model.getSentiment());
         ps.setTimestamp(5, model.getEntry_time());
         ps.execute();
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
      finally
      {
         con.close();
      }
   }

   @Override
   public List<Reviews> readAll(String movieId) throws Exception
   {
      List<Reviews> result = new ArrayList<Reviews>();
      Connection con = null;
      try
      {
         con = DBConnection.connect();
         ResultSet rs = con.createStatement().executeQuery("select * from reviews where id='" + movieId + "' ");
         while (rs.next())
         {
            Reviews model = new Reviews();
            model.setEmail(rs.getString("email"));
            model.setEntry_time(rs.getTimestamp("entry_time"));
            model.setId(rs.getString("id"));
            model.setReview(rs.getString("review"));
            model.setSentiment(rs.getString("sentiment"));
            result.add(model);
         }
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
      finally
      {
         con.close();
      }
      return result;
   }

   @Override
   public void update(String id, String email, String review) throws Exception
   {
      Connection con = null;
      try
      {
         con = DBConnection.connect();
         con.createStatement().execute("update reviews set sentiment='" + review + "' where email='" + email + "' and id='" + id + "' ");

      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
      finally
      {
         con.close();
      }
   }

   @Override
   public boolean userRubmittedRating(String id, String email) throws Exception
   {
      Connection con = null;
      try
      {
         con = DBConnection.connect();
         ResultSet rs = con.createStatement().executeQuery("select count(*) from reviews where email='" + email + "' and id='" + id + "' ");
         rs.next();
         if (rs.getInt(1) > 0)
            return true;
         else
            return false;
      }
      catch (Exception e)
      {
         e.printStackTrace();
         throw e;
      }
      finally
      {
         con.close();
      }
   }

}
