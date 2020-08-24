<%@page import="com.sa.model.Reviews"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sa.daoimpl.ReviewsDAOImpl"%>
<%@page import="com.sa.dao.ReviewsDAO"%>
<%@page import="com.sa.model.Movies"%>
<%@page import="java.util.List"%>
<%@page import="com.sa.daoimpl.MoviesDAOImpl"%>
<%@page import="com.sa.dao.MovieDAO"%>
<%@page import="com.sa.daoimpl.TweetsDAOImpl"%>
<%@page import="com.sa.dao.TweetsDAO"%>
<%@page import="com.sa.model.User"%>
<%
   User u1 = (User) session.getAttribute("user");
   if (u1 == null)
   {
      response.sendRedirect("login.jsp?msg=Session expired. Login again");
   }
   else
   {
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Sentiment Analysis</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">

<!-- The styles -->
<link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">

<link href="css/charisma-app.css" rel="stylesheet">
<link href='bower_components/fullcalendar/dist/fullcalendar.css'
	rel='stylesheet'>
<link href='bower_components/fullcalendar/dist/fullcalendar.print.css'
	rel='stylesheet' media='print'>
<link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
<link href='bower_components/colorbox/example3/colorbox.css'
	rel='stylesheet'>
<link href='bower_components/responsive-tables/responsive-tables.css'
	rel='stylesheet'>
<link
	href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css'
	rel='stylesheet'>
<link href='css/jquery.noty.css' rel='stylesheet'>
<link href='css/noty_theme_default.css' rel='stylesheet'>
<link href='css/elfinder.min.css' rel='stylesheet'>
<link href='css/elfinder.theme.css' rel='stylesheet'>
<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
<link href='css/uploadify.css' rel='stylesheet'>
<link href='css/animate.min.css' rel='stylesheet'>

<!-- jQuery -->
<script src="bower_components/jquery/jquery.min.js"></script>

<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon" href="img/favicon.ico">

</head>

<body>
	<!-- topbar starts -->
	<div class="navbar navbar-default" role="navigation">

		<div class="navbar-inner">
			<button type="button" class="navbar-toggle pull-left animated flip">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" style='width: 300px;'> <span>Sentiment
					Analysis</span></a>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> <%=u1.getFname() %> <%=u1.getLname() %></span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="updateprofile.jsp">Edit Profile</a></li>
                    <li class="divider"></li>
                    <li><a href="account?request_type=deleteprofile">Delete Profile</a></li>
                    <li class="divider"></li>
                    <li><a href="changepassword.jsp">Change Password</a></li>
                    <li class="divider"></li>
                    <li><a href="account?request_type=logout">Logout</a></li>
                </ul>
            </div>

		</div>
	</div>
	<!-- topbar ends -->
	<div class="ch-container">
		<div class="row">

			<!-- left menu starts -->  
			<div class="col-sm-2 col-lg-2">
				<div class="sidebar-nav">
					<div class="nav-canvas">
						<div class="nav-sm nav nav-stacked"></div>
						<ul class="nav nav-pills nav-stacked main-menu">
							<li class="nav-header">Main</li>
							<li><a class="ajax-link" href="welcome.jsp"><i
									class="glyphicon glyphicon-dashboard"></i><span> Dashboard</span></a></li>

							<li><a class="ajax-link" href="analysis.jsp"><i
									class="glyphicon glyphicon-retweet"></i><span> Tweets Analysis</span></a></li>

							<li><a class="ajax-link" href="adhoc.jsp"><i
									class="glyphicon glyphicon-expand"></i><span> Adhoc Run</span></a></li>

							<li><a class="ajax-link" href="movie.jsp"><i
									class="glyphicon glyphicon-camera"></i><span> Movie Review Analysis</span></a></li>

						</ul>
					</div>
				</div>
			</div>
			<!--/span-->
			<!-- left menu ends -->


			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div>
					<ul class="breadcrumb">
						<li><a>Movie Review Analysis</a></li>
					</ul>
				</div>
				<div class=" row">
				
					<div class='col-md-12'>
						
					<br />
					<%
					   String msg = request.getParameter("msg");
					%>
					<%
					   if (msg != null) {
					%>
					<div class="alert alert-success alert-dismissable">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Message!</strong>
						<%=msg%>.
					</div>
					<%
					   }
					%> 
	
					<a href='' data-toggle="modal" data-target="#addMovie" ><span class='glyphicon glyphicon-plus'></span> Add Movie</a> 
<!-- Modal -->
<div class="modal fade" id="addMovie" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 	
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Movie</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action='addmovie' method=post>
      	
	      <div class="modal-body">
	        	<label>Movie Title</label>
	        	<input type=text name='title' class='form-control' placeholder="Movie Title" required="required"/>
	        	<br/>
	        	<label>Synopsis</label>
	        	<textarea name='synopsis' class='form-control' placeholder="Synopsis" required="required"/></textarea>
	        	<br/>
	        	<label>Genre</label>
	        	<textarea name='genre' class='form-control' placeholder="Genre" required="required"/></textarea>
	        	<br/>
	        	<label>Cast</label>
	        	<textarea name='cast' class='form-control' placeholder="Cast" required="required"/></textarea>
	        	<br/>
	        	<label>Crew</label>
	        	<textarea name='crew' class='form-control' placeholder="Crew" required="required"/></textarea>
	        	<br/>
	        	<label>Poster URL</label>
	        	<input type=text name='poster' class='form-control' placeholder="URL to Movie Poster" required="required"/>
	        	<br/>
	        	<label>Release Date</label>
	        	<input type=date name='releasedate' class='form-control' placeholder="Release Date" required="required"/>
	        	<br/>
	        	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">Add</button>
	      </div>
      </form>
    </div>
  </div>
</div>
				
					<br />
					<br />
					<%
						MovieDAO mDao = new MoviesDAOImpl();
						List<Movies> movies = mDao.readAll();
						ReviewsDAO rDao = new ReviewsDAOImpl();
						SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy | kk:mm");

						if (movies != null && movies.size() > 0)
						{
						    int i=0;
							for (Movies m: movies)
							{
							   i++;
							   float finalRating = 0;
					   			int positiveCount = 0;
					   			int negativeCount = 0;
					   			int neutralCount = 0;
							   
							   List<Reviews> reviews = rDao.readAll(m.getId());
							   boolean userSubmittedRating = rDao.userRubmittedRating(m.getId(), u1.getEmail());
					%>
					
						<!-- Modal -->
						<div class="modal fade" style='z-index: 9999;' id="review<%=i %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Review this Movie</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <form action='writereview'>
						      		<input type=hidden name='id' value='<%=m.getId() %>' />

							      <div class="modal-body">
							      	<textarea class='form-control' required="required" name='review' placeholder="Write your Review here ..."></textarea>
							      
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							        <button type="submit" class="btn btn-primary">Submit Review</button>
							      </div>
						      </form>
						    </div>
						  </div>
						</div>

						<!-- Modal -->
						<div class="modal fade" style='z-index: 9999;' id="readreview<%=i %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Reviews for <%=m.getTitle() %></h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
							      <div class="modal-body">
									
									<%
										if (reviews == null || reviews.size() == 0)
										{
										   %>
										   		<hr/>
										   		No Reviews yet
										   		<hr/>
										   <%
										}
										else
										{
										   %>
										   		<%
										   			for (Reviews r: reviews)
										   			{
										   			   %>
										   			   		<hr/> 
										   			   			<%
										   			   				if (r.getSentiment().length() > 0)
										   			   				{
										   			   				   %>
										   			   						<b style='color: black;'><%=r.getSentiment().toUpperCase() %> Review</b> <br/> <i><%=r.getEmail() %></i> | <i><%=sdf.format(r.getEntry_time()) %></i>
																		<%
										   			   				}
										   			   				else
										   			   				{
										   			   				   %>
										   			   						<b style='color: black;'>Review Classification In Progress</b><br/> <i><%=r.getEmail() %></i> | <i><%=sdf.format(r.getEntry_time()) %></i>										   			   				   
										   			   				   <%
										   			   				}
										   			   			%>
										   			   			<br/><br/>
										   			   			<% if (r.getSentiment().equalsIgnoreCase("positive")) { %>
										   			   				<h4 style='color: green;'><%=r.getReview() %></h4>	
										   			   				<%
										   			   					positiveCount = positiveCount + 1;
										   			   				%>
										   			   										
										   			   			<% } else if (r.getSentiment().equalsIgnoreCase("negative")) { %>
										   			   				<h4 style='color: red;'><%=r.getReview() %></h4>		
										   			   				<%
										   			   					negativeCount = negativeCount + 1;
										   			   				%>

										   			   			<% } else { %>
										   			   				<h4><%=r.getReview() %></h4>
										   			   				<%
										   			   					neutralCount = neutralCount + 1;
										   			   				%>
										   			   			<% } %>
										   			   		<hr/>
										   			   		<br/>
										   			   <%
										   			}
										   			
										   		%>
										   <%
										}
									%>
									
							      <%
							   			finalRating = (positiveCount/(float)(positiveCount+negativeCount))*100;							      

							      %>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							      </div>
						    </div>
						  </div>
						</div>
					
							<div class="card">
								<div class="card-header"><h3><%=m.getTitle() %></h3></div>
								<div class="card-body"> 
									<table class='table table-fixed'>
										<tr>
											<td style='width: 50%;'> 
												<img style='width: 100%;' src='<%=m.getPoster() %>' />									
											</td>
											<td> 
												<table class='table'>
													<tr>
														<th style='width: 50%;'> Movie Title</th>
														<td> <%=m.getTitle() %> </td>
													</tr>
													<tr>
														<th style='width: 50%;'> Genre</th>
														<td> <%=m.getGenre() %> </td>
													</tr>
													<tr>
														<th style='width: 50%;'> Cast</th>
														<td> <%=m.getCast().replaceAll("\n", "<br/>") %> </td>
													</tr>
													<tr>
														<th style='width: 50%;'> Crew</th>
														<td> <%=m.getCrew().replaceAll("\n", "<br/>") %> </td>
													</tr>
													<tr>
														<th style='width: 50%;'> Release Date</th>
														<td> <%=m.getRelease_date() %> </td>
													</tr>
													<tr>
														<th style='width: 50%;'> Predicted Score</th>
														<th>
														<% if (reviews!= null && reviews.size()>0) { %>
														<%= (double) Math.round(finalRating * 100) / 100 %> %
														<% } else { %>
														N/A
														<% } %>
														</th>
													</tr>
													<tr>
														<th> Reviews</th>  
														<td>
															<a href='#' data-toggle="modal" data-target="#readreview<%=i%>">Read Reviews (<%=reviews.size() %>)</a>
															<hr/>
															<% if (userSubmittedRating)
															{
															   %>
															   	You have Reviewed this Movie
															   <%
															}
															else
															{
															   %>
																<a href='#' data-toggle="modal" data-target="#review<%=i%>">Write Review</a>												
															   <%
															}
															 %>
														</td>
													</tr>											
												</table>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<%=m.getSynopsis() %>		
												<br/><br/>
												<a href='deletemovie?id=<%=m.getId() %>' style='float: right;'><i class='fa fa-trash'></i> Delete Movie</a>								
											</td> 
										</tr>
									</table>
		
								</div>
							</div>
							<br/><br/>
					<% 		} 
						}
						else
						{
						   %>
						   		<h4> No Movies Found</h4>
						   <%
						}
					%>

					</div>			
				
				</div>



			</div>
			<!--/#content.col-md-0-->
		</div>
		<!--/fluid-row-->

		
	


	</div>
	<!--/.fluid-container-->

	<!-- external javascript -->

	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calender plugin -->
	<script src='bower_components/moment/min/moment.min.js'></script>
	<script src='bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='js/jquery.dataTables.min.js'></script>

	<!-- select or dropdown enhancer -->
	<script src="bower_components/chosen/chosen.jquery.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="bower_components/colorbox/jquery.colorbox-min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- library for making tables responsive -->
	<script src="bower_components/responsive-tables/responsive-tables.js"></script>
	<!-- tour plugin -->
	<script
		src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="js/charisma.js"></script>


</body>
</html>

<% } %>