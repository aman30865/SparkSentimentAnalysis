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
  <meta http-equiv="refresh" content="5">

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
						<li><a>Dashboard</a></li>
					</ul>
				</div>
				<div class=" row">
				
					<div class='col-md-6'>
						<%
							TweetsDAO tDao = new TweetsDAOImpl();
							int posCount = tDao.getPositiveCount(u1.getEmail());
							int negCount = tDao.getNegativeCount(u1.getEmail());
						%>
						
						<div class='col-md-5'>
						<div class="panel panel-default">
						  <div class="panel-heading">Positive Tweets Count</div>
						  <div class="panel-body">
						    <button class="btn btn-success" type="button" onclick="window.location.href='analysis.jsp'" >
							  <span class="badge" style='font-size: 48px;'><%=posCount %></span>
							</button>

						  </div>
						</div>
						</div>
						<div class='col-md-5'>
						<div class="panel panel-default">
						  <div class="panel-heading">Negative Tweets Count</div>
						  <div class="panel-body">
						    <button class="btn btn-danger" type="button" onclick="window.location.href='analysis.jsp'" >
							  <span class="badge" style='font-size: 48px;'><%=negCount %></span>
							</button>
						  </div>
						</div>
						</div>
						
						

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