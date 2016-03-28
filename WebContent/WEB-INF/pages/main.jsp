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
			username: "", 
			email: ""
		};
		$scope.trans = {
				stock: "",
				user: "",
				price: 0,
				quantity: 0,
		}
		$scope.stocks = null;
		$scope.ownstocks = null;
		$scope.text="";
		$scope.csv="";
		$scope.findUser = function(){
			console.log("clicked!");
			console.log($scope.data.username);
			$http.get("rest/finduser", {params: $scope.data})
			.then(function(resp) {
				console.log("Hello");
				console.log(resp.data);
				$scope.text = resp.data;
			})
		};
		$scope.findEmail = function(){
			console.log("clicked!");
			console.log($scope.data.email);
			$http.get("rest/finduseremail", {params: $scope.data})
			.then(function(resp) {
				console.log("Hello");
				console.log(resp.data);
				$scope.text = resp.data;
			})
		};
		$scope.testcsv = function(){
			console.log("clicked!");
			//console.log($scope.data.email);
			$http.get("rest/csv", { })
			.then(function(resp) {
				console.log("Hello");
				console.log(resp.data);
				$scope.csv = resp.data.message;
			})
		};
		$scope.showStockinfo = function(){
			console.log("show stockinfo clicked!");
			//console.log($scope.data.email);
			$http.get("rest/stocks", { })
			.then(function(resp) {
				console.log("Hello");
				//console.log(resp.data);
				$scope.stocks = resp.data;
			})
		};
		
		$scope.testTrans = function(){
			console.log("show stockinfo clicked!");
			//console.log($scope.data.email);
			$http.get("rest/csvtrans", {params: $scope.trans })
			.then(function(resp) {
				console.log("Hello");
				//console.log(resp.data);
				$scope.stocks = resp.data;
			})
		};
		
		$scope.testDropAll = function(){
			console.log("test Drop All clicked!");
			//console.log($scope.data.email);
			$http.get("rest/csvdropall", { })
			.then(function(resp) {
				console.log("Hello");
				//console.log(resp.data);
				//$scope.stocks = resp.data;
			})
		};
		
		$scope.testCommitAll = function(){
			console.log("test Commit All clicked!");
			//console.log($scope.data.email);
			$http.get("rest/csvcommitall", { })
			.then(function(resp) {
				console.log("Hello");
				//console.log(resp.data);
				//$scope.stocks = resp.data;
			})
		};
		
		$scope.showPortfolio = function(){
			console.log("test show Portfolio clicked!");
			//console.log($scope.data.email);
			$http.get("rest/showportfolio", { })
			.then(function(resp) {
				console.log("Hello");
				console.log(resp.data);
				$scope.ownstocks = resp.data;
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
				<td>Enable:</td>
				<td><input type="number" name="enable" id="j_enable" min="0"
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
	
	<table class=".table-bordered">
		<tr>
			<td><input type="text" name="email" id="email" ng-model="data.email"/></td>
			<td><button id="submit1" class="round" ng-click="findEmail()">Find</button></td>
		</tr>
		<tr>
			<td><p>{{text}}</p></td>
		</tr>
	</table>
	
	<hr>
	<h2>Test CSV module</h2>
	<table class=".table-bordered">
		<tr>
			<td><button id="submit2" class="round" ng-click="testcsv()">ReadCSV</button></td>
		</tr>
		<tr>
			<td><p>{{csv}}</p></td>
		</tr>
	</table>
	
	<hr>
	<h2>Test Stock Service</h2>
	<div class="row">
			<table class="table table-striped">
				<tr>
					<td><button id="submit3" class="round" ng-click="showStockinfo()">Show StockInfo</button></td>
				</tr>
				<tr>
					<th>Name</th>
					<th>Pricechange</th>
					<th>Price</th>
				</tr>
				
					<tr ng-repeat="stock in stocks">
						<td>{{stock.stockName}}</td>
						<td>{{stock.pchange}}</td>
						<td>{{stock.price}}</td>
					</tr>
			</table>
	</div>
	
	<hr>
	<div class="container">
		<table class="table table-striped">
				<tr>
					<td>Stock</td>
					<td><input type="text" name="stockname" id="stockname" ng-model="trans.stock"/></td>
				</tr>
				<tr>
					<td>User</td>
					<td><input type="text" name="username" id="username" ng-model="trans.user"/></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><input type="number" name="stockprice" id="stockprice" ng-model="trans.price"/></td>
				</tr>
				<tr>
					<td>Quantity</td>
					<td><input type="number" name="stockquantity" id="stockquantity" ng-model="trans.quantity"/></td>
				</tr>
				<tr>
					<td><button id="submit5" class="round" ng-click="testDropAll()">Test DropAll in CSV</button></td>
					<td><button id="submit4" class="round" ng-click="testTrans()">Test Save in CSV</button></td>
					<td><button id="submit6" class="round" ng-click="testCommitAll()">Test Commit in CSV</button></td>
				</tr>
				
			</table>
	</div>
	
	<hr>
	<div class="container">
		<table class="table table-striped">
				<tr>
					<td><button id="submit3" class="round" ng-click="showPortfolio()">Show Portfolio</button></td>
				</tr>
				<tr>
					<th>Username</th>
					<th>stockId</th>
					<th>Symbol</th>
					<th>Average Cost</th>
					<th>quantity</th>
				</tr>
				
				<tr ng-repeat="ownstock in ownstocks">
					<td>{{ownstock.userName}}</td>
					<td>{{ownstock.stockId}}</td>
					<td>{{ownstock.stockSymbol}}</td>
					<td>{{ownstock.avgCost}}</td>
					<td>{{ownstock.quantity}}</td>
				</tr>
			</table>
	</div>
	
</body>
</html>