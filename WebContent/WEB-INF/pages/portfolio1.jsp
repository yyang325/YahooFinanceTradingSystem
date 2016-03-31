<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Portfolio</title>

<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/apple-touch-icon-114x114.png">



<!-- require, jquery, angular -->
<!-- <script type="text/javascript" src="bower_component/requirejs/require.js"></script> -->
<script type="text/javascript" src="bower_component/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="bower_component/angular/angular.min.js"></script>

<!-- Bootstrap -->
<link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bower_component/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
<script type="text/javascript" src="bower_component/bootstrap/dist/js/bootstrap.min.js"></script>

<script type="text/javascript" src="bower_component/angular-messages/angular-messages.min.js"></script>

<script type="text/javascript" src="bower_component/angular-resource/angular-resource.min.js"></script>
<script type="text/javascript" src="bower_component/angular-route/angular-route.min.js"></script>
<script type="text/javascript" src="bower_component/angular-animate/angular-animate.min.js"></script>
<script type="text/javascript" src="bower_component/angular-bootstrap/ui-bootstrap-tpls.min.js"></script>
<!-- <script src="js/ui-bootstrap-tpls-0.13.4.min.js"></script> -->

<link href="bower_component/sticky-footer-navbar.css" rel="stylesheet">

<!-- Chart.js -->
<!-- <script src="bower_component/Chart.js/Chart.js"></script>

<script type="text/javascript" src="bower_component/angular-chart/angular-chart.min.js"></script> -->
<!-- <link rel="stylesheet" href="css/angular-chart.css"> -->


<script src="js/Chart.js"></script>
<script src="js/angular-chart.js"></script>
<link rel="stylesheet" href="css/angular-chart.css">




<!-- Bootstrap -->
<link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bower_component/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">


<!-- font-awesome -->
<link rel="stylesheet" type="text/css" href="bower_component/fontawesome/css/font-awesome.min.css">
<!-- <script src="js/activity-portfolio.js"></script> -->

<!-- a customerized js -->
<!-- <script src="js/app2.js"></script> -->

<!-- modernizr
need attention here -->
<!-- <script type="text/javascript" src="bower_component/js/modernizr.custom.js"></script> -->

<!-- owl Slider
need attention here -->
<link href="bower_component/owl/owl-carousel/owl.carousel.css" rel="stylesheet" media="screen">
<link href="bower_component/owl/owl-carousel/owl.theme.css" rel="stylesheet" media="screen">

<!-- animate -->
<link rel="stylesheet" href="bower_component/animate-css/animate.min.css" type="text/css">


 
 
 <link href='https://fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>
 <link href='https://fonts.googleapis.com/css?family=Sonsie+One' rel='stylesheet' type='text/css'>
 <link href='https://fonts.googleapis.com/css?family=Indie+Flower|Montserrat' rel='stylesheet' type='text/css'>

<!-- 
<link href="css/extra/bootstrap-theme.css" rel="stylesheet">
<link href="css/extra/elegant-icons-style.css" rel="stylesheet" />
<link href="css/extra/font-awesome.min.css" rel="stylesheet" />    
<link href="css/extra/style.css" rel="stylesheet">  -->

<!--  -->
<!-- <script src="js/angular.min.js"></script>
    <script src="js/ui-bootstrap-tpls-0.13.4.min.js"></script>
    <script src="js/angular-animate.min.js"></script>
    
    <script src="js/activity-portfolio.js"></script>
    
    <script src="js/angular-resource.min.js"></script>
    <script	src="js/jquery.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    for header and footer
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/extra/bootstrap-theme.css" rel="stylesheet">
<link href="css/extra/elegant-icons-style.css" rel="stylesheet" />
<link href="css/extra/font-awesome.min.css" rel="stylesheet" />    
<link href="css/extra/style.css" rel="stylesheet">
<script src="js/angular.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

    Bootstrap CSS    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    bootstrap theme
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    external css
    font icon
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    Custom styles
    <link href="css/style-responsive.css" rel="stylesheet" />
    
    <script src="js/Chart.js"></script>
	<script src="js/Chart.Doughnut.js"></script>
	
	<script src="js/angular-chart.js"></script>
	<link rel="stylesheet" href="css/angular-chart.css">
	 <link href='https://fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>
	 <link href='https://fonts.googleapis.com/css?family=Sonsie+One' rel='stylesheet' type='text/css'>
	 <link href='https://fonts.googleapis.com/css?family=Indie+Flower|Montserrat' rel='stylesheet' type='text/css'> -->

<style>

	#chartdiv {
		width		: 100%;
		height		: 435px;
		font-size	: 11px;
	}
	
	#username{
		font-size: 32px;
	    line-height: 40px;
	    padding-top: 20px;
	    font-weight: 700;
	    font-family: Open Sans;
	    text-align: center;
	    letter-spacing: 1px;
	}	
	
	.alert {
		display: none;
	}
	th, td {
		text-align:center;
	}
	input[type="range"] {
    display:inline;
	padding-top:6px;
    width: 200px;
    height:20px;
	}
	input[type="range"]::-webkit-slider-thumb {
    	background-color: #666;
    	padding-top:10px;
    	width: 10px;
    	height: 20px;
	}
	
		.highlight{
    background: lightgreen;
    transition: background 200ms;
    }
    .highlight2{
    background: #ff8080;
    transition: background 200ms;
    }
</style>

<script>
	/* var app = angular.module('ui.bootstrap.demo', [ 'ngAnimate', 'ui.bootstrap', 'ngResource','chart.js']);
	
	app.config(['$httpProvider', function ($httpProvider) {    
		$httpProvider.defaults.headers.post['Content-Type'] = 'application/json; charset=UTF-8';
	}]); */
	
	var app = angular.module("mainApp", ["ngAnimate", "ui.bootstrap", "ngResource", "chart.js"]);
	
	app.config(['$httpProvider', function ($httpProvider) {    
		$httpProvider.defaults.headers.post['Content-Type'] = 'application/json; charset=UTF-8';
	}]);
	
	app.service("shared", function() {
		var _stock = null;
		var _user = null;
		var _stockInfo = null;
		var _message = null;
		var _vals = null;
		return {
			getStock : function() {
				return _stock;
			},
			setStock : function(stock) {
				_stock = stock;
			},
			getUser : function() {
				return _user;
			},
			setUser : function(user){
				_user = user;
			},
			getStockInfo : function(){
				return _stockInfo;
			},
			setStockInfo : function(stockInfo){
				_stockInfo = stockInfo;
			},
			getMessage : function(){
				return _message;
			},
			setMessage : function(message){
				_message = message;
			}
		};
		$scope.message = shared.getMessage();
	});
	
	
	app.controller("mainController", ["$scope", "$http", "$interval", "$rootScope","shared", 
	                                  function($scope, $http, $interval, $rootScope, shared) {
		$scope.user;
		//console.log("in main controller");
		$http.get("validUser")
		.success(function(data) {
			//console.log(data);
			$scope.user = data;
			shared.setUser($scope.user);
			
		}).error(function(data) {
			console.log("AJAX ERROR");
		});	
		
		$scope.ownStocks=[];
		
		// refresh portofoli every 2 secnods
		$interval(function() {
			console.log("in interval");
			$http.get("getPortfolio").
			success(function(data) {
				//console.log(resp);
				$scope.ownStocks=data;
				shared.setStockInfo($scope.ownStocks);
				$scope.percent = "100%";
				window.setTimeout(function() {
				     $scope.$apply(function() {
				        $scope.loading = true;
				     });
				 }, 600);
			}).error(function(data) {
				console.log("Ajax Error");
			});
		}, 2000);
		
		$scope.pass = function(stock) {
			//console.log("In pass");
			//console.log(stock);
			shared.setStock(stock);
		};
		
		$scope.hasStock = function(stock) {
			for (var i=0; i<$scope.stockInfo.length; i++){
				if (stock.stock.sid == $scope.stockInfo[i].stock.sid){
					return true;
				}
			}
			return false;
		};
		
	}]);
	
	
	
	 app.controller("ModalCtrl", ["$scope", "$modal", "$log", "shared", function ($scope, $modal, $log, shared) {
		//console.log("in open Add");
		$scope.message = shared.getMessage();
		$scope.item;
		$scope.animationsEnabled = true;
		$scope.buySuccess=false;
		$scope.sellSuccess=false;
		$scope.addSuccess=false;
		
		$scope.openSell = function () {		
			$scope.user = shared.getUser();
			$scope.buyItem = shared.getStock();
			var modalInstance = $modal.open({
				animation: $scope.animationsEnabled,
				templateUrl: 'sellContent.html',
				controller: 'ModalInstanceCtrlSell',
				resolve: {
					items: function () {
						return $scope.user;
					}
				}
			});

			modalInstance.result.then(function (quan) {
				$scope.sellSuccess=true;
				$scope.buySuccess=false;
				$scope.addSuccess=false;
				$scope.user.balance = Math.round($scope.user.balance + $scope.buyItem.price * quan);
			}, function () {
				$log.info('Modal dismissed at: ' + new Date());
			});
		};
		
		$scope.openBuy = function () {		
			$scope.user = shared.getUser();
			$scope.buyItem = shared.getStock();
			var modalInstance = $modal.open({
				animation: $scope.animationsEnabled,
				templateUrl: 'buyContent.html',
				controller: 'ModalInstanceCtrlBuy',
				resolve: {
					items: function () {
						return $scope.user;
					}
				}
			});

			modalInstance.result.then(function (quan) {
				$scope.buySuccess = true;
				$scope.sellSuccess=false;
				$scope.addSuccess=false;
				$scope.user.balance = Math.round($scope.user.balance - $scope.buyItem.price * quan);
			}, function () {
				$log.info('Modal dismissed at: ' + new Date());
			});
		};
		
		$scope.openAdd = function () {
			//console.log("in open Add");
			$scope.user = shared.getUser();
			//console.log($scope.user);
			var modalInstance = $modal.open({
				animation: $scope.animationsEnabled,
				templateUrl: 'addContent.html',
				controller: 'ModalInstanceCtrlAdd',
				resolve: {
					items: function () {
						return $scope.user;
					}
				}
			});
			modalInstance.result.then(function (quan) {
				$scope.addSuccess=true;
				$scope.buySuccess=false;
				$scope.sellSuccess=false;
				$scope.user.cash = $scope.user.cash + quan;
				$scope.user.balance = $scope.user.balance + quan;
			}, function () {
				$log.info('Modal dismissed at: ' + new Date());
			});
		};
		
	}]);
	
	app.controller("ModalInstanceCtrlAdd", ["$scope", "$modalInstance", "$http", "items", "shared",
	                                         function($scope, $modalInstance, $http, items, shared) {
		$scope.balance = items.cash;
		$scope.quan = 1;
		$scope.$watch("quan",function(val,old){
		    val = isNaN(val)?"1":val;
			$scope.quan = parseInt(val);
		});
		
		$scope.add = function (){
			$http({
				method: "POST",
				url: "addCash",
				data: $scope.quan
			}).success(function(data){
				console.log(data);
			}).error(function(data){
				//console.log(data);
			});
		};
		
		$scope.ok = function () {
			$scope.add();
			$modalInstance.close($scope.quan);
		};

		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};

	}]); 
	
	app.controller('ModalInstanceCtrlSell', function ($scope, $modalInstance, $http, items, shared) {
		
		console.log("In Modal Instance Ctrl Sell");
		$scope.user = shared.getUser();
		console.log($scope.user);
		$scope.Math = window.Math;
		$scope.sellItem = shared.getStock();
		console.log($scope.sellItem);
		$scope.quan = 1;
		$scope.newTran;
		$scope.$watch("quan",function(val,old){
			val = isNaN(val)?"1":val;
			$scope.quan = parseInt(val); 
		});
		
		$scope.getAmount = function(sellItem){
			$scope.stockInfo = shared.getStockInfo();
			console.log($scope.stockInfo);
			for (var i=0; i< $scope.stockInfo.length; i++){
				if (sellItem.stockId == $scope.stockInfo[i].stockId){
					return $scope.stockInfo[i].quantity;
				}
			}
			return 0;
		};
		
		$scope.send = function(){
			$http({
				method: "POST",
				url: "addPending",
				data: $scope.newTran = {
						tid: 0,
						user: $scope.user,
						stock: $scope.sellItem,
						price: $scope.sellItem.stockInfo.price,
						/* own: {
							user: $scope.user,
							stock: {
								sid: $scope.sellItem.stock.sid,
								symbol: $scope.sellItem.stock.symbol,
								stockDesc: $scope.sellItem.stockName
							},
						}, */
						quantity: -$scope.quan,
						/* price: $scope.sellItem.price, */
						ts: new Date()
				}
			}).success(function (response) {
				console.log(response);
			}).error(function (data) {
				console.log(data);
			}); 
		};
		
		$scope.ok = function () {
			$scope.send();
			$modalInstance.close($scope.quan);
		};

		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	});
	
	app.controller('ModalInstanceCtrlBuy', function ($scope, $modalInstance, $http, items, shared) {
		$scope.user = shared.getUser();	
		$scope.Math = window.Math;
		$scope.buyItem = shared.getStock();
		$scope.upper = Math.floor($scope.user.cash / $scope.buyItem.stockInfo.price);
		$scope.quan = 1;
		$scope.newTran;
		$scope.$watch("quan",function(val,old){
			val = isNaN(val)?"1":val;
		    $scope.quan = parseInt(val); 
		});
			
		$scope.send = function(){
			$http({
				method: "POST",
				url: "addPending",
				data: $scope.newTran = {
						tid: 0,
						user: $scope.user,
						stock: $scope.buyItem,
						price: $scope.sellItem.stockInfo.price,
						quantity: -$scope.quan,
						/* price: $scope.sellItem.price, */
						ts: new Date()
				}
			}).success(function (response) {
				console.log(response);
			}).error(function (data) {
				console.log(data);
			}); 
		};
		
		$scope.ok = function () {
			$scope.send();
			$modalInstance.close($scope.quan);
		};

		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	});
	
	app.controller("BarCtrl", ["$scope", "shared", "$interval", 
	                           function($scope, shared, $interval) {
		$scope.series = ['Buy',''];
		
		$interval(function(){
			//console.log("In BarCtrl");
			$scope.labels=[];
			$scope.data=[[]];
			$scope.stockInfo = shared.getStockInfo();
			if($scope.stockInfo!=null){
				
				for(var i = 0;i<$scope.stockInfo.length;i++){
					var val = $scope.stockInfo[i].quantity;
					//console.log($scope.stockInfo[i].quantity);
					$scope.labels.push($scope.stockInfo[i].stockSymbol);
					$scope.data[0].push(val);
					//console.log($scope.stockInfo[i].stockSymbol);
				} 
			}
		}, 2000);
			
	}]);
	
	app.controller("PieCtrl", ["$scope", "shared", "$interval",
	                           function ($scope,shared,$interval) {
		$scope.user;
		
		
		$interval(function() {
			$scope.user = shared.getUser();
			//console.log($scope.user);
			$scope.labels=[];
			
			$scope.data=[];
			
			$scope.stockInfo = shared.getStockInfo();
			if($scope.stockInfo != null && $scope.stockInfo.length != 0){
				//console.log("stockinfo is not null");
				var vals = $scope.user.cash;
				for(var i = 0;i<$scope.stockInfo.length;i++){
					vals = $scope.stockInfo[i].quantity*$scope.stockInfo[i].avgCost + vals;
					//console.log($scope.stockInfo[i].stockSymbol);
				}
				$scope.data.push($scope.user.cash);
				$scope.labels.push("Cash" + "("+Math.round($scope.user.cash/vals*100*10)/10+"%)");
				for(var i = 0;i<$scope.stockInfo.length;i++){
					var val = $scope.stockInfo[i].quantity*$scope.stockInfo[i].avgCost;
					$scope.labels.push($scope.stockInfo[i].stockSymbol+"("+Math.round(val/vals*100*10)/10+"%)");
					$scope.data.push(val);
				} 
			}
		}, 2000);
			
		
	}]);
	
</script>

</head>
<body ng-app="mainApp">
	<%-- <c:import url="page_component/header.jsp"/> --%>
	<c:import url="page_component/header.jsp"/>
	<div class="container">
		<section id="main-content">
			<section class="wrapper" ng-controller="mainController">
				<!-- page starts -->
				<div class="row">
					<div class="col-lg-4">
						<section class="panel panel-info">
							<header class="panel-heading" align="center">
								<p style="font-size: 20px">Welcome:</p>
							</header>
							<div class="panel-body">
								<div style="text-align: center">
									<span id="username">{{user.username}}</span>
								</div>
							</div>
						</section>
					</div>

					<div class="col-lg-4" ng-controller="ModalCtrl">
						<section class="panel panel-info">
							<header class="panel-heading" align="center">
								<p style="font-size: 20px">Balance:</p>
								
							</header>
							<div class="panel-body">
								<div class="row">
									<div  style="text-align: center" class="col-lg-7">
									<span><b style="color: #27B63F;vertical-align: sub;font-size: 28px;margin-left: 5px;">
										{{user.cash | currency}}
									</b></span>
									
									<div id="addSuccess"
										ng-show="addSuccess&&!sellSuccess&&!sellSuccess">Add
										Credit Success!</div>
									</div>
									<div class="col-lg-3">
										<button id="addBalance" class="btn btn-primary btn-sm"
											ng-click="openAdd()">Add Balance</button>
									</div>
								</div>
							</div>
						</section>
					</div>

					<div class="col-lg-4">
						<section class="panel panel-info">
							<header class="panel-heading" align="center">
								<p style="font-size: 20px">Account Asset:</p>
							</header>
							<div class="panel-body">
								<div style="text-align: center">
									<span><b style="color: #27B63F;vertical-align: sub;font-size: 28px;margin-left: 5px;">
										{{user.balance | currency}}
									</b></span>
								</div>
							</div>
						</section>
					</div>

				</div>

				<div class="col-lg-12" ng-controller="ModalCtrl">
					<section class="panel panel-info">
						<header class="panel-heading" align="center">
							<p style="font-size: 20px">Open Positions</p>
						</header>
						<div class="panel-body">
							<form action="portfolio" id="listUserStocks" method="post">
								<table
									class="table table-striped table-bordered table-advance table-hover">
									<tbody>
										<tr class="success">
											<!-- <th><i class="icon_star"></i> Stock Id</th> -->
											
											<th>Symbol</th>
											<!--  <th>Stock Name</th> -->
											<th>Quantity</th>
											<th>Average Cost</th>
											<th>Market Price</th>
											<th>Daily Change</th>
											<th>Daily Change(%)</th>
											<th>Action</th>
											<!-- <th>Change</th>
		                                 <th>Change%</th> -->

										</tr>
										<tr ng-repeat="stock in ownStocks">
											
											<td>{{stock.stockSymbol}}</td>
											<td>{{stock.quantity}}</td>
											<td>{{stock.avgCost | number:2}}</td>
											<td>{{stock.stockInfo.price}}</td>
											<td>{{stock.stockInfo.change}}</td>
											<td>{{stock.stockInfo.pchange}}</td>
											<sec:authorize access="hasAnyRole('ADMIN', 'USER')">
												<td>
													<div class="btn-group">
														<!--   <a class="btn btn-primary" href="#" ng-click="pass(stock); openBuy()">Buy</a> -->
														<a class="btn btn-success" href="#"
															ng-click="pass(stock); openSell()">Sell</a>
													</div>
													<div class="btn-group">
														<!--   <a class="btn btn-primary" href="#" ng-click="pass(stock); openBuy()">Buy</a> -->
														<a class="btn btn-success" href="#"
															ng-click="pass(stock); openBuy()">Buy</a>
													</div>
												</td>
										
											</sec:authorize>
											<%-- <td ng-if="stock.change>0" highlighter="stock.price">&#36{{stock.price| number:2}}</td>
										<td ng-if="stock.change<0" highlighter2="stock.price" >  &#36{{stock.price| number:2}}</td>
										<td  ng-if="stock.change==0" style="color:black">&#36{{stock.price| number:2}}</td> --%>
										</tr>


									</tbody>
								</table>

							</form>

						</div>
					</section>

				</div>

				<!-- chart section -->
				<div class="row">
					<div class="col-lg-12">
						<section class="panel panel-info">
							<header class="panel-heading" style="font-size: 20px;"
								align="center"> Asset Analysis </header>
							<div class="panel-body">
								<div class="tab-pane" id="chartjs">
									<div class="row">
										<div class="col-lg-1"></div>
										
										<div class="col-lg-5">
											<header class="panel-heading" align="center"> Stock
												Quantity Chart </header>
											<div class="panel-body text-center" ng-controller="BarCtrl">
												<canvas id="bar" class="chart chart-bar" chart-data="data"
													chart-labels="labels" chart-series="series">
												</canvas>
											</div>

										</div>
										<div class="col-lg-5">
											<section class="panel">
												<header class="panel-heading" align="center"> Asset Doughnut Chart </header>
												<div class="panel-body text-center" ng-controller="PieCtrl">
													<canvas id="doughnut" class="chart chart-doughnut"
														chart-data="data" chart-labels="labels"
														chart-legend="true">
												</canvas>
												</div>
											</section>
										</div>
										<div class="col-lg-1"></div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>

			</section>
		</section>

		<%-- <c:import url="page_component/header.jsp"/>	
	
	<section id="main-content">
          <section class="wrapper" ng-controller="mainController">
			<!-- page start-->
			   <div class="row">
			   	 
			   	 
			   	 <div class="col-lg-3" >
                      <section class="panel panel-info">
                          <header class="panel-heading" align="center">
                              <p style="font-size:20px">Balance</p>
                          </header>
                          <div class="panel-body">
								<div ng-controller="ModalDemoCtrl" style="text-align:center">
										<span>Current Balance: <b style="color: #27B63F;vertical-align: sub;font-size: 28px;margin-left: 5px;">
										<br>
										 {{user.balance | currency}}</b></span>	
										<div id="addSuccess" ng-show="addSuccess&&!sellSuccess&&!sellSuccess">Adding money Success!</div>	
										<br>
										<button id="addBalance" class="btn btn-primary btn-sm"
											ng-click="openAdd()">Manage Balance</button>
								</div>
								
							</div>
                      </section>
                 </div>
			   	 
			   	 
                  <div class="col-lg-9" ng-controller="ModalDemoCtrl">
                      <section class="panel panel-info">
                          <header class="panel-heading" align="center">
                              <p style="font-size:20px">Stock</p>
                          </header>
                          <div class="panel-body">
                        <form action="portfolio" id="listUserStocks" method="post">
                          <table class="table table-striped table-bordered table-advance table-hover" >
                           <tbody>
                              <tr class="success" >
                                 <!-- <th><i class="icon_star"></i> Stock Id</th> -->
                                 <th>Action</th>
                                 <th>StockSymbol</th>
                                 <th>StockName</th>
                                 <th>Quantity</th>
                                 <th>Price</th>
                                 <th>Change</th>
                                 <th>Change%</th>
                                 
                                 
                              </tr>
                              <tr ng-repeat=" stock in stockInfo | orderBy:predicate:reverse | filter:stock.symbol track by $index">
								<!-- <td>{{stock.stock.sid}}</td> -->
								<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                                 <td>
                                  <div class="btn-group">
                                    <!--   <a class="btn btn-primary" href="#" ng-click="pass(stock); openBuy()">Buy</a> -->
                                      <a class="btn btn-success" href="#" ng-click="pass(stock); openSell()" >Sell</a> 
                                  </div>
                                  </td>
                                 </sec:authorize>
								<td>{{stock.stock.symbol}}</td>
								<td>{{stock.stockName}}</td>
								<td>{{stock.quantity}}</td>
								<td ng-if="stock.change>0" highlighter="stock.price">&#36{{stock.price| number:2}}</td>
								<td ng-if="stock.change<0" highlighter2="stock.price" >  &#36{{stock.price| number:2}}</td>
								<td  ng-if="stock.change==0" style="color:black">&#36{{stock.price| number:2}}</td>
								<!-- <b ng-if="stock.change>0" highlighter="stock.price" >&#36{{stock.price| number:2}}</b>
									<b ng-if="stock.change<0" highlighter2="stock.price" >&#36{{stock.price| number:2}}</b>
									<b ng-if="stock.change==0" style="color:black">&#36{{stock.price| number:2}}</b>
								</td> -->
								
								
					     		<td >
									<b ng-if="stock.change>0" style="color:green">+{{stock.change| number:2}} <span class="glyphicon glyphicon-arrow-up"></span></b>
									<b ng-if="stock.change<0"  style="color:red">{{stock.change| number:2}} <span class="glyphicon glyphicon-arrow-down"></span></b>
									<b ng-if="stock.change==0"  style="color:black">{{stock.change| number:2}}</b>
								</td>
								<td >
									<b ng-if="stock.pchange.indexOf('-')>-1" style="color:red">{{stock.pchange}} <span class="glyphicon glyphicon-arrow-down"></span></b>
									<b ng-if="stock.pchange.indexOf('+')>-1"  style="color:green">{{stock.pchange}} <span class="glyphicon glyphicon-arrow-up"></span></b>
									<b ng-if="stock.pchange.indexOf('0')==0" style="color:black">{{stock.pchange}}</b>
								</td>
								
								
								
                              </tr>

                           </tbody>
                        </table>
                        
                        </form>
                        <!-- Loading -->

                       
                       <!--  <!-- loading bar 
						<div class = "loadbox" ng-hide="loading">
							<div class = "loadbar">
								<div class="progress progress-striped active progress-sm" >
							    	<div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:{{percent}}">
							        	<span class="sr-only">45% Complete</span>
							        </div>
					    		</div>
					     		<p>Loading...</p>
					    	</div>
					   </div>  -->
                        
                        
                  <div id="buySuccess" ng-show="buySuccess&&!sellSuccess&&!addSuccess">Buying Transaction Success!</div>
		          <div id="sellSuccess" ng-show="sellSuccess&&!buySuccess&&!addSuccess">Selling Transaction Success!</div>
	              </div>
                      </section>
                  </div>
                  
                  
                  
                  
                  
              </div>
              
    <!-- <div ng-controller="mainController">
		<div ng-controller="ModalDemoCtrl">
				<button id="addBalance" class="btn btn-primary btn-sm"
					ng-click="openAdd()">Add Balance</button>
				<span>Current Balance: <b style="color: red">{{user.balance}}</b></span>	
				<div id="addSuccess" ng-show="addSuccess&&!sellSuccess&&!sellSuccess">Adding money Success!</div>	
			
		</div>
		
	</div> -->
	
	

          
			
		</section>
	</section>
	 --%>

		<div>
			<script type="text/ng-template" id="buyContent.html">
        <div class="modal-header">
			 <button type="button" class="close" ng-click="cancel()">&times;</button>
            <h3 class="modal-title">Buy Stock</h3>
        </div>
        <div class="modal-body" style="font-size:15px;">
            <label>Stock Symbol:  </label>
			<b style=" font-family: 'Indie Flower', cursive; font-size:25px;"> {{buyItem.stock.symbol}}</b>
			<br/>
			<label>Stock Name:  </label>
			<b style=" font-family: 'Indie Flower', cursive; font-size:25px;"> {{buyItem.stockName}}</b>
			<br/>
			<label>Unit Price:  </label>
			<b style="font-family: 'Indie Flower', cursive; font-size:25px;"> {{buyItem.price}}</b>
			<br/>
			<label>Quantity:  </label>
			<input type="number" min="1" max={{upper}} value={{quan}} ng-model="quan"/>
			<br/>	
        </div>				
        <div class="modal-footer">
		<div>		
			<h5 style="margin-right:50px"><strong>Ready to buy <span style="color:red">{{quan}}</span>
			shares of <span style="color:red">{{buyItem.stock.symbol}}</span> ? <strong></h5>
			<h5><strong>Balance after transaction: <span style="color:red">
			{{Math.round(user.balance - buyItem.price * quan) |currency}}</span><strong> </h5>
		</div>
            <button class="btn btn-success" type="button" ng-click="ok()">OK</button>
            <button class="btn btn-default" type="button" ng-click="cancel()">Cancel</button>
        </div>
    	</script>
		
			<script type="text/ng-template" id="sellContent.html">
        <div class="modal-header">
 		<button type="button" class="close" ng-click="cancel()">&times;</button>
            <h3 class="modal-title">Sell Stocks </h3> 
        </div>
        <div class="modal-body" style="font-size:15px;">
            <label>Stock Symbol: </label>
			<b style=" font-family: 'Helvetica'; font-size:25px;">{{sellItem.stockSymbol}}</b><br/>
			<label>Stock Name: </label>
			<b style=" font-family: 'Helvetica'; font-size:25px;">{{sellItem.stockInfo.companyName}}</b><br/>
			<label>Unit Price: </label>
			<b style=" font-family: 'Helvetica'; font-size:25px;">{{sellItem.stockInfo.price}}</b><br/>
			<label>Open Position: </label>
			<b style=" font-family: 'Helvetica'; font-size:25px;">{{getAmount(sellItem)}}</b><br/>
			<label>Quantity: </label>
			<input type="number" min="1" max={{getAmount(sellItem)}} value={{quan}} ng-model="quan"/>
			<br/>	
        </div>				
        <div class="modal-footer">
		<div>		
			<h5 style="margin-right:50px"><strong>Ready to sell <span style="color:red">{{quan}}</span>
			shares of <span style="color:red">{{sellItem.stock.symbol}}</span>? </strong></h5>
			<h5><strong>Balance after transaction: <span style="color:red">$
			{{Math.round(user.balance + sellItem.price * quan) | currency}}</span></strong></h5>
		</div><br/>
            <button class="btn btn-danger" type="button" ng-click="ok()">Sell</button>
            <button class="btn btn-default" type="button" ng-click="cancel()">Cancel</button>
        </div>
    	</script>
		
			<script type="text/ng-template" id="addContent.html">
        <div class="modal-header">
            <h3 class="modal-title" style="font-family:'Sonsie One', cursive;">Add Balance</h3>
        </div>
        <div class="modal-body">
			<div class="modal-inner" style="text-align:center;padding:10px">
				<label style="text-center;font-family:'Sonsie One',cursive;font-size: 25px;color: #184636;">Amount: </label>
				<input type="number" min="1" max={{2147483647-balance}} value={{quan}} ng-model="quan"/>
				<br><br>
				<p style="text-center;font-family: 'Montserrat', sans-serif; font-size: medium;color: #184636;">You will have <span style="color:red">$ {{balance + quan}}</span> in your account,
				<br>after adding <span style="color:red">$ {{quan}}</span></p>
				<br>

				<button class="btn btn-primary" type="button" ng-click="ok()">  Add  </button>
            	<button class="btn btn-warning" type="button" ng-click="cancel()">Cancel</button>
			</div>
        </div>		
        <div class="modal-footer">
		<div>		
        <button type="button" class="btn btn-danger" ng-click="cancel()">Close</button>
        </div>
    		</script>
		</div>

	</div>
	
	
	<!-- <!-- javascripts
    <script src="js/jquery.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
        nice scroll
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    chartjs
    <script src="assets/chart-master/Chart.js"></script>
    custom chart script for this page only
	<script src="js/angular-chart.js"></script>

    custome script for all page
    <script src="js/scripts.js"></script> --> 
	
	<c:import url="page_component/footer.jsp"/>
</body>
</html>