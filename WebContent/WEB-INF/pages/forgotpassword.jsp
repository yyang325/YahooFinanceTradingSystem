<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Forgot Password</title>

<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/apple-touch-icon-114x114.png">

<!-- require, jquery, angular -->
<script type="text/javascript" src="bower_component/requirejs/require.js"></script>
<script type="text/javascript" src="bower_component/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="bower_component/angular/angular.min.js"></script>
<script type="text/javascript" src="bower_component/angular-messages/angular-messages.min.js"></script>
<script type="text/javascript" src="bower_component/angular-resource/angular-resource.min.js"></script>
<script type="text/javascript" src="bower_component/angular-route/angular-route.min.js"></script>


<!-- Bootstrap -->
<link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bower_component/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
<script type="text/javascript" src="bower_component/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- font-awesome -->
<link rel="stylesheet" type="text/css" href="bower_component/fontawesome/css/font-awesome.min.css">

<!-- a customerized js -->
<!-- <script src="js/app2.js"></script> -->

<!-- modernizr -->
<!-- need attention here -->
<!-- <script type="text/javascript" src="bower_component/js/modernizr.custom.js"></script> -->

<!-- owl Slider -->
<!-- need attention here -->
<link href="bower_component/owl/owl-carousel/owl.carousel.css" rel="stylesheet" media="screen">
<link href="bower_component/owl/owl-carousel/owl.theme.css" rel="stylesheet" media="screen">

<!-- animate -->
<link rel="stylesheet" href="bower_component/animate-css/animate.min.css" type="text/css">

<!-- Stylesheet ================================================== -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/stylesheet.css" rel="stylesheet">
<link href="css/landing-page.css" rel="stylesheet">
<link rel="stylesheet" href="css/animate.min.css" type="text/css">
<link rel="stylesheet" href="css/creative.css" type="text/css">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/modernizr.custom.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script>
	var app = angular.module("mainApp", ["ngRoute","ngMessages"]);
	app.config(function($routeProvider){
		$routeProvider 
			.when("/page1", {
				templateUrl: "html/page1.html",
				controller: "mainCtrl"
			});
	});
	app.controller("mainCtrl", function($scope, $http){
		$scope.email = "";
		$scope.sendEmail = function(){
			console.log("in sendEmail angular");
			 $scope.message = "Please check your input email to change the password!";
			$http({
				url:"recoveraccountemail",
				method: "GET",
				params: {email:$scope.email}
			}).then(function(response){
				console.log("send email success");
				//
			}); 
		};
	});
</script>
<style>

#forgot {
	 position: fixed;
	  top: 50%;
	  left: 50%;
	  /* bring your own prefixes */
	  transform: translate(-50%, -50%);
}
</style>

</head>
<body ng-app="mainApp"  class="forgotpassword">
<!-- <div id="forgot"  ng-app="validation"> -->
<div id="forgot">
	<div class="content-section-c">
		<div class="container">
			<div class="row">
				<section style="margin-top: 30px;">
					<div class="container">
						<div class="row">
							<div class="col-md-6 col-md-offset-3">
								<div class="panel panel-login">
									<div class="panel-heading" style="height: 60px; text-align: center; font-size: 18px; color: #666; font-weight: bold;">
										<h1>Recover Account</h1>
									</div>	
									<div class="panel-body">
										<div class="row">
											<div class="col-lg-12">
												<form  name="registerform" ng-controller="mainCtrl" >
													<div class="form-group" ng-class="{ 'has-error': registerform.email.$touched && registerform.email.$invalid}">		
														<label for="uemail" style="color: black;">
																	Email:</label> <input type="email" name="email" id="j_email"
																	tabindex="1" class="form-control"
																	placeholder="Enter your email address" ng-model="email"
																	>
																 <div class="help-block" ng-messages="registerform.email.$error" ng-messages-multiple ng-if="registerform.email.$dirty">
																	<p ng-message="required" style="color: #f05f40;">This field is required</p>
																	<p ng-message="email" style="color: #f05f40;">This needs to be a valid email</p>	
																</div>
														<a href="#page1" ng-click="sendEmail()">Recover Account</a>
														<div ng-view></div>
													</div>
												</form>
											</div>
										</div>
									</div>	
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</div>

</body>
</html>