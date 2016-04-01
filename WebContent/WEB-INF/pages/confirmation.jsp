
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmation page</title>
<!-- for header and footer -->
 <link href="css/landing-page.css" rel="stylesheet"> 
<link href="css/stylesheet.css" rel="stylesheet">
<script src="js/header.js"></script>

<!-- Custom Fonts -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome/css/font-awesome.css">
	
<!-- Custom styles for this template -->
<link href="bower_component/sticky-footer-navbar.css" rel="stylesheet">

<!-- Slider
    ================================================== -->
<link href="css/owl.carousel.css" rel="stylesheet" media="screen">
<link href="css/owl.theme.css" rel="stylesheet" media="screen">

<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">

<link
	href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>

<link href="css/extra/style.css" rel="stylesheet">
<link href="css/stylesheet.css" rel="stylesheet">
<script src="js/angular.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/stylesheet.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Dosis'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<nav id="tf-menu" class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="#tf-home">YFTS</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">

				<sec:authorize>
					<ul class="nav navbar-nav navbar-right col-md-2">
						<li style="float: right;"><a href="login.html"> <span
								class="glyphicon glyphicon-log-in"></span> Sign in
						</a></li>
					</ul>
				</sec:authorize>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="confirmation">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="intro-message">
						<h2 style="font-family: 'Dosis', sans-serif; font-size: 75px">
							${userInfo.message}</h2>
						<p style="font-size: 38px">Please check your email.
						</h2>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%-- <c:import url="page_component/footer.jsp" /> --%>
	<!--  
<section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-8" style="float:none;margin:auto;text-align:center">
				 <section class="panel">
				 <div class="panel-body">
	<h1>Welcome to our Trading System!</h1>
	<h2>Please check your email.</h2>
	<h2>
		<font color="green">${userInfo.message}</font>
	</h2>
	</div>
	</section>
	</div>
	</div>
	</section>
	</section>
	-->
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmation page</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="bower_component/css/bootstrap.min.css" type="text/css">

<!-- font-awesome -->
<link rel="stylesheet" type="text/css" href="bower_component/fontawesome/css/font-awesome.min.css">

   


</head>
<body>
	<nav id="tf-menu" class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="#tf-home">YFTS</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

				<sec:authorize>
					<ul class="nav navbar-nav navbar-right col-md-2">
						<li style="float: right;"><a href="login.html"> <span
								class="glyphicon glyphicon-log-in"></span> Sign in
						</a></li>
					</ul>
				</sec:authorize>
			</div>
		</div>
	</nav>
	<div class="confirmation">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="intro-message">
						<h2 style="font-family: 'Dosis', sans-serif; font-size: 75px">
							${userInfo.message}</h2>
						<p style="font-size: 38px">Please check your email.
						</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html> --%>