package com.sa.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection
{

   public static Connection connect() throws Exception
   {
      Class.forName("org.sqlite.JDBC");
      return DriverManager.getConnection("jdbc:sqlite:/home/ubuntu/sa.db");
//      return DriverManager.getConnection("jdbc:sqlite:C:\\practice\\database\\sa.db");
   }

}
