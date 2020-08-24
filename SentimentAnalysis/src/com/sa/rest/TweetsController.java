package com.sa.rest;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import com.sa.service.TwitterSentimentAnalysisThread;

@Path("/sa")
public class TweetsController
{
   @POST
   @Path("/tweets")
   public Response upload(String body) throws Exception
   {
	   System.out.println(body);
	   System.out.println("======================");
	   String str[] = body.split("@#@#@#@#");
	   new TwitterSentimentAnalysisThread(str[0], str[1]);
	   
	   return Response.status(Status.OK).entity("Done").build();
   }
}
