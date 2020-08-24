package com.sa.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sa.service.MovieReviewAnalysisThread;
import com.sa.dao.ReviewsDAO;
import com.sa.daoimpl.ReviewsDAOImpl;
import com.sa.model.Reviews;
import com.sa.model.User;

public class WriteReviewServlet extends HttpServlet
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
         User user = (User) req.getSession().getAttribute("user");
         String review = req.getParameter("review");
         ReviewsDAO rDao = new ReviewsDAOImpl();
         Reviews model = new Reviews();
         model.setEmail(user.getEmail());
         model.setEntry_time(new Timestamp(System.currentTimeMillis()));
         model.setId(req.getParameter("id"));
         model.setReview(review);
         model.setSentiment("");
         rDao.write(model);
         new MovieReviewAnalysisThread(review, req.getParameter("id"), user.getEmail());
         resp.sendRedirect("movie.jsp?msg=Your Review Submitted");
      }
      catch (Exception e)
      {
         e.printStackTrace();
         resp.sendRedirect("movie.jsp?msg=Error while writing review");
      }
   }

}
