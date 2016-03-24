<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bower_component/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">

<script type="text/javascript" src="bower_component/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="bower_component/angular/angular.min.js"></script>
<script type="text/javascript" src="bower_component/requirejs/require.js"></script>
<script type="text/javascript" src="bower_component/bootstrap/dist/js/bootstrap.min.js"></script>

<script>
	var app = angular.module("mainApp", []);
	app.controller("mainCtrl", function($scope, $http) {
		$scope.data = {
			username: ""	
		};
		$scope.text="";
		$scope.findUser = function(){
			console.log("clicked!");
			console.log($scope.data.username);
			$http.get("rest/finduser", {params: $scope.data})
			.success(function(resp) {
				console.log("Hello");
				console.log(resp.data);
				$scope.text = resp.data;
			})
		};
	});
</script>
<title>Insert title here</title>
</head>
<body ng-app="mainApp" ng-controller="mainCtrl">
	<!-- Form -->
	<form action="next.html" method="post" id="loginForm">
		<table>
			<tr>
				<td>Username:</td>
				<td><input type="text" name="username" id="j_userName" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" id="j_passWord" /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="email" name="email" id="j_email" /></td>
			</tr>
			<tr>
				<td>Firstname:</td>
				<td><input type="text" name="firstName" id="j_firstName" /></td>
			</tr>
			<tr>
				<td>Lastname:</td>
				<td><input type="text" name="lastName" id="j_lastName" /></td>
			</tr>
			<tr>
				<td>Cash:</td>
				<td><input type="number" name="cash" id="j_cash" min="0" /></td>
			</tr>
			<tr>
				<td>Balance:</td>
				<td><input type="number" name="balance" id="j_balance" min="0" /></td>
			</tr>
			<tr>
				<td>Authority:</td>
				<td><input type="text" name="authority" id="j_autority" /></td>
			</tr>
			<tr>
				<td>Enabled:</td>
				<td><input type="number" name="enabled" id="j_enabled" min="0"
					max="1" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="reset" value="Clear" /> <input type="submit"
					value="Submit" /></td>
			</tr>
		</table>
	</form>
	<hr>
	<table class=".table-bordered">
		<tr>
			<td><input type="text" name="username" id="username" ng-model="data.username"/></td>
			<td><button id="submit" class="round" ng-click="findUser()">Find</button></td>
		</tr>
		<tr>
			<td><p>{{text}}</p></td>
		</tr>
	</table>

</body>
</html>