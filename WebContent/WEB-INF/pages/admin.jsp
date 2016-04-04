<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Page</title>


	<!-- Bootstrap core CSS -->
    <link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="bower_component/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="bower_component/jquery/dist/jquery.min.js"></script>
    <link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="bower_component/bootstrap/dist/js/bootstrap.min.js"></script>
    <link href="bower_component/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="bower_component/angular/angular.min.js"></script>
    <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular-route.min.js"></script>
    <script type="text/javascript" src="bower_component/angular-resource/angular-resource.min.js"></script>
	<script type="text/javascript" src="bower_component/angular-route/angular-route.min.js"></script>
	<script type="text/javascript" src="bower_component/angular-animate/angular-animate.min.js"></script>
	<script type="text/javascript" src="bower_component/angular-bootstrap/ui-bootstrap-tpls.min.js"></script>

	<!-- font-awesome -->
	<link rel="stylesheet" type="text/css" href="bower_component/fontawesome/css/font-awesome.min.css">
	
	<!-- Customize Javascript -->
    <script type="text/javascript" src="bower_component/adminPage.js"></script>

</head>
<body ng-app="adminApp" ng-controller="adminCtrl">

	<c:import url="page_component/adminheader.jsp"/>
	
	<div class="container">	
		<c:import url="stockAdmin.jsp"/>
    
		<c:import url="transactionAdmin.jsp"/>
	</div>
</body>
</html>