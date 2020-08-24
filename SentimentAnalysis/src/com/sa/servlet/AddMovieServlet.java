package com.sa.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sa.dao.MovieDAO;
import com.sa.daoimpl.MoviesDAOImpl;
import com.sa.model.Movies;
import com.sa.model.User;

public class AddMovieServlet extends HttpServlet
{
   private static final long serialVersionUID = 1L;

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
   {
      doPost(req, resp);
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
   {
      try
      {
         Movies model = new Movies();
         System.out.println(req.getParameter("releasedate"));
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
         User user = (User) req.getSession().getAttribute("user");
         MovieDAO mDao = new MoviesDAOImpl();
         model.setCast(req.getParameter("cast"));
         model.setCreated_by(user.getEmail());
         model.setCrew(req.getParameter("crew"));
         model.setEntry_time(new Timestamp(System.currentTimeMillis()));
         model.setGenre(req.getParameter("genre"));
         model.setId(String.valueOf(System.currentTimeMillis()));
         model.setPoster(req.getParameter("poster"));
         model.setRelease_date(new Date(sdf.parse(req.getParameter("releasedate")).getTime()));
         model.setSynopsis(req.getParameter("synopsis"));
         model.setTitle(req.getParameter("title"));
         mDao.write(model);
         resp.sendRedirect("movie.jsp?msg=Movie Added Successfully");
      }
      catch (Exception e)
      {
         e.printStackTrace();
         resp.sendRedirect("movie.jsp?msg=Error while adding a movie: " + e.getMessage());
      }
   }

}
