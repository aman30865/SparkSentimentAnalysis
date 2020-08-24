package com.mrc.rest;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import com.mrc.service.ExecutorService;
import com.mrc.util.Constants;

@Path("/mrc")
public class ExecutorController
{
   @POST
   @Path("/run")
   public Response generate(String body) throws Exception
   {
      System.out.println("Calling script");
      String output = ExecutorService.runPythonScript(Constants.SCRIPT_NAME, Constants.SCRIPT_DIR, body);
      System.out.println("Done: "+output);
      
      return Response.status(Status.OK).entity(output).build();
   }
}
