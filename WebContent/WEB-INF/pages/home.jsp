<!DOCTYPE>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Bootstrap -->
<link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bower_component/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- font-awesome -->
<link rel="stylesheet" type="text/css" href="bower_component/fontawesome/css/font-awesome.min.css">


<title>Home Page</title>

<script>
var app = angular.module('mainModule', []);
app.filter('capitalize', function() {
    return function(input) {
      return (!!input) ? input.charAt(0).toUpperCase() + input.substr(1).toLowerCase() : '';
    }
});
</script>

</head>
<body>
	<c:import url="page_component/header.jsp"/>	
	
	<section id="page-top" class="index">	
	<div class="intro-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message" ng-controller="headerCtrl">
                        <h1>Hello, {{user.userName|capitalize}}</h1>
                        <h3>Welcome to Yahoo Finance Trading System</h3>
                        
                        <a href="marketdata" class="btn btn-primary btn-xl page-scoll">Go Explore it!</a>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->
    </div>
	</section>
		
	<c:import url="page_component/footer.jsp"/>
	

</body>
</html>