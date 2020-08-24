package com.sa.dao;

import java.util.List;

import com.sa.model.Movies;

public interface MovieDAO
{

   public void write (Movies model) throws Exception;
   
   public List<Movies> readAll() throws Exception;
   
   public Movies getByID(String id) throws Exception;
   
   public void delete(String id) throws Exception;
}
