<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmation page</title>

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
</html>