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
							<li><a class="ajax-link" href="index.jsp"><i
									class="glyphicon glyphicon-home"></i><span> Home</span></a></li>
							<li><a class="ajax-link" href="register.jsp"><i
									class="glyphicon glyphicon-plus"></i><span> Register</span></a>
							</li>
							<li><a class="ajax-link" href="login.jsp"><i
									class="glyphicon glyphicon-log-in"></i><span> Login</span></a></li>

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
						<li><a>Registration Page</a></li>
					</ul>
				</div>
				<div class=" row">
				
					<div class='col-md-6'>
								<%
								   String msg = request.getParameter("msg");
								%>
								<%
								   if (msg != null) {
								%>
								<div class="alert alert-success alert-dismissable">
									<a href="#" class="close" data-dismiss="alert"
										aria-label="close">&times;</a> <strong>Message!</strong>
									<%=msg%>.
								</div>
								<%
								   }
								%>

								<form method="post" action="account" >
									<input type="hidden" name='request_type' value='register' /> <label>Email:</label>
									<input type="text" name="email" class="form-control" /> <br />
									<label>Password:</label> <input type="password" name="password"
										class="validate-email form-control" /> <br /> <label>First
										name:</label> <input type="text" name="fname" class="form-control" />
									<br /> <label>Last name:</label> <input type="text"
										name="lname" class="form-control" /> <br /> <label>Gender:</label>
									<br /> <input type="radio" name='gender' value='Male' /> Male
									<input type="radio" name='gender' value='Female' /> Female <br />
									<br /> <label>Mobile:</label> <input type="text" name="mobile"
										class="form-control" /> <br /> <label>Address:</label>
									<textarea name="addr" rows=3 class="form-control"></textarea>
									<br />
									<br />
									<button class="btn btn-primary " type="submit">Register</button>
								</form>
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
