package com.sa.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sa.dao.MovieDAO;
import com.sa.model.Movies;
import com.sa.util.DBConnection;

public class MoviesDAOImpl implements MovieDAO
{

   @Override
   public void write(Movies model) throws Exception
   {
      Connection con = null;
      try
      {
         con = DBConnection.connect();
         PreparedStatement ps = con.prepareStatement("insert into movies values (?,?,?,?,?,?,?,?,?,?) ");
         ps.setString(1, model.getId());
         ps.setString(2, model.getTitle());
         ps.setString(3, model.getPoster());
         ps.setString(4, model.getSynopsis());
         ps.setString(5, model.getGenre());
         ps.setString(6, model.getCast());
         ps.setString(7, model.getCrew());
         ps.setDate(8, model.getRelease_date());
         ps.setString(9, model.getCreated_by());
         ps.setTimestamp(10, model.getEntry_time());
         ps.execute();
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

   @Override
   public List<Movies> readAll() throws Exception
   {
      Connection con = null;
      List<Movies> result = new ArrayList<Movies>();
      try
      {
         con = DBConnection.connect();
         ResultSet rs = con.createStatement().executeQuery("select * from movies");
         while (rs.next())
         {
            Movies model = new Movies();
            model.setCast(rs.getString("cast"));
            model.setCreated_by(rs.getString("created_by"));
            model.setCrew(rs.getString("crew"));
            model.setEntry_time(rs.getTimestamp("entry_time"));
            model.setGenre(rs.getString("genre"));
            model.setId(rs.getString("id"));
            model.setPoster(rs.getString("poster"));
            model.setRelease_date(rs.getDate("release_date"));
            model.setSynopsis(rs.getString("synopsis"));
            model.setTitle(rs.getString("title"));
            result.add(model);
         }

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
      return result;
   }

   @Override
   public Movies getByID(String id) throws Exception
   {
      Connection con = null;
      try
      {
         con = DBConnection.connect();
         con = DBConnection.connect();
         ResultSet rs = con.createStatement().executeQuery("select * from movies");
         Movies model = new Movies();
         model.setCast(rs.getString("cast"));
         model.setCreated_by(rs.getString("created_by"));
         model.setCrew(rs.getString("crew"));
         model.setEntry_time(rs.getTimestamp("entry_time"));
         model.setGenre(rs.getString("genre"));
         model.setId(rs.getString("id"));
         model.setPoster(rs.getString("poster"));
         model.setRelease_date(rs.getDate("release_date"));
         model.setSynopsis(rs.getString("synopsis"));
         model.setTitle(rs.getString("title"));
         return model;
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

   @Override
   public void delete(String id) throws Exception
   {
      Connection con = null;
      try
      {
         con = DBConnection.connect();
         con.createStatement().execute("delete from movies where id='" + id + "' ");
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
