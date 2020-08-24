package com.sa.dao;

import java.util.List;

import com.sa.model.Reviews;

public interface ReviewsDAO
{

   public void write(Reviews model) throws Exception;
   
   public void update (String id, String email, String reiew) throws Exception;

   public List<Reviews> readAll(String movieId) throws Exception;
   
   public boolean userRubmittedRating(String id, String email) throws Exception;

}
