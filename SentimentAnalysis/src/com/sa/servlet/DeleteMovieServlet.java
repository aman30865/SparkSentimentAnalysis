package com.sa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sa.dao.MovieDAO;
import com.sa.daoimpl.MoviesDAOImpl;

public class DeleteMovieServlet extends HttpServlet
{
   private static final long serialVersionUID = 1L;

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
   {
      String id = req.getParameter("id");
      MovieDAO mDao = new MoviesDAOImpl();
      try
      {
         mDao.delete(id);         
         resp.sendRedirect("movie.jsp?msg=Movie Deleted");
      }
      catch (Exception e)
      {
         e.printStackTrace();
         resp.sendRedirect("movie.jsp?msg=Error while deleting the movie: " + e.getMessage());
      }
   }

}
