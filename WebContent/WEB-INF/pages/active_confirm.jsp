<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmation page</title>
<!-- require, jquery, angular -->
	<script type="text/javascript" src="bower_component/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript" src="bower_component/angular/angular.min.js"></script>
	<script type="text/javascript" src="bower_component/angular-messages/angular-messages.min.js"></script>
	<script type="text/javascript" src="bower_component/requirejs/require.js"></script>

<!-- Bootstrap -->
<link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bower_component/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
<script type="text/javascript" src="bower_component/bootstrap/dist/js/bootstrap.min.js"></script>

<style type="text/css">
#time, p, a {
	text-align:center;
	font-family: 'Unkempt', cursive;
	letter-spacing: 2px;
	font-weight: 700;
}

</style>

<script type="text/javascript">
	angular.module("mainApp",[]).controller("mainCtrl",function($scope,$timeout){
		$scope.submit=function(){
			document.getElementById("signin").click();
		};
		
		$scope.counter = 10;
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
			<h1 style="color:#0099CC;">Thank you for joining us, ${userName}</h1>
			
			<h2 id="go_home">This page will goto Yahoo Finance page after 10 seconds, if not <a id="myLink" ng-click="submit()">click this link</a></h2>

				<form name="login-form" action="login_auto" method="POST"  ng-submit="submit()" style="display:none">
					<input type="text" name="j_username" id="j_username" value="${userName}"/>
					<input type="submit" id="signin" type="submit" name="submit1">
				</form>
			</div>
		</section>
	</div>
	</div>
	</section>
	</section>
</body>
</html>