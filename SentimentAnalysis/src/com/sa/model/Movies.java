package com.sa.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Movies
{

   private String id;
   private String title;
   private String poster;
   private String synopsis;
   private String genre;
   private String cast;
   private String crew;
   private Date release_date;
   private String created_by;
   private Timestamp entry_time;

   public String getPoster()
   {
      return poster;
   }

   public void setPoster(String poster)
   {
      this.poster = poster;
   }

   public String getId()
   {
      return id;
   }

   public void setId(String id)
   {
      this.id = id;
   }

   public String getTitle()
   {
      return title;
   }

   public void setTitle(String title)
   {
      this.title = title;
   }

   public String getSynopsis()
   {
      return synopsis;
   }

   public void setSynopsis(String synopsis)
   {
      this.synopsis = synopsis;
   }

   public String getGenre()
   {
      return genre;
   }

   public void setGenre(String genre)
   {
      this.genre = genre;
   }

   public String getCast()
   {
      return cast;
   }

   public void setCast(String cast)
   {
      this.cast = cast;
   }

   public String getCrew()
   {
      return crew;
   }

   public void setCrew(String crew)
   {
      this.crew = crew;
   }

   public Date getRelease_date()
   {
      return release_date;
   }

   public void setRelease_date(Date release_date)
   {
      this.release_date = release_date;
   }

   public String getCreated_by()
   {
      return created_by;
   }

   public void setCreated_by(String created_by)
   {
      this.created_by = created_by;
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
