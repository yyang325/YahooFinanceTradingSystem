<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Success Page</title>
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
<script src="js/app2.js"></script>

<!-- modernizr -->
<!-- need attention here -->
<!-- <script type="text/javascript" src="bower_component/js/modernizr.custom.js"></script> -->

<!-- owl Slider -->
<!-- need attention here -->
<link href="bower_component/owl/owl-carousel/owl.carousel.css" rel="stylesheet" media="screen">
<link href="bower_component/owl/owl-carousel/owl.theme.css" rel="stylesheet" media="screen">

<!-- animate -->
<link rel="stylesheet" href="bower_component/animate-css/animate.min.css" type="text/css">

<script type="text/javascript">
	angular.module("mainApp",[]).controller("mainCtrl",function($scope,$timeout){
		$scope.submit=function(){
			document.getElementById("signin").click();
		};
		
		$scope.counter = 5;
	    $scope.onTimeout = function(){
	        $scope.counter--;
	        if($scope.counter == 0){
	        	console.log($scope.counter);
	        	$scope.submit();
	        }
	        $timeout($scope.onTimeout,1000);
	    }
	    var mytimeout = $timeout($scope.onTimeout,1000);
	});
</script>

<style type="text/css">
#time, p, a {
	text-align:center;
	font-family: 'Unkempt', cursive;
	letter-spacing: 2px;
	font-weight: 700;
}
</style>

</head>
<body style="background-color:grey;"ng-app="mainApp" ng-controller="mainCtrl">
	<section id="main-content" style="margin-top:100px;">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-8" style="float:none;margin:auto;text-align:center">
				 <section class="panel panel-info">
				 <div class="panel-heading">
				 	Activation Done
				 </div>
				 <div class="panel-body">
				<h1>{{counter}}</h1>
			<h1 style="color:#0099CC;">Change SuccessFully!, ${userName}</h1>
			
			<h2 id="go_home">This page will goto Yahoo Finance page after 5 seconds, if not <a id="myLink" ng-click="submit()">click this link</a></h2>

				<form name="login-form" action="login" method="GET"  ng-submit="submit()" style="display:none">
					
					<button type="submit" id="signin" type="submit" >Submit</button>
				</form>
			</div>
		</section>
	</div>
	</div>
	</section>
	</section>
</body>
</html>