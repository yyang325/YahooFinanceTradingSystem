<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home Page</title>

    <!-- Bootstrap core CSS -->
    <link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--     <lisnk href="bower_component/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet"> -->

    <!-- Custom styles for this template -->
    <link href="bower_component/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!--     <script src="bower_component/assets/js/ie-emulation-modes-warning.js"></script> -->
    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="bower_component/jquery/dist/jquery.min.js"></script>
<!--     <script>window.jQuery || document.write('<script src="bower_component/assets/js/vendor/jquery.min.js"><\/script>')</script> -->
    <script src="bower_component/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="bower_component/angular/angular.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--     <script src="bower_component/assets/js/ie10-viewport-bug-workaround.js"></script> -->
    
    <!-- Customize Javascript -->
    <script>
    	var app = angular.module("mainApp", []);
    	app.controller("watchlistCtrl", function($scope, $interval, $http){
    		$scope.stocks = [];
    		$scope.stockPool = [];
    		
    		var updateWatchlist = function(){
    			console.log("updating watch list");
    			$http({
    				method: 'GET',
    				url: 'getWatchList'
    			}).then(function(response){
    				$scope.stocks = response.data;
    				console.log("response:", response);
    				console.log($scope.stocks);
    			});
    		};
    		
    		var updateAllStock = function(){
    			console.log("checking all stock");
    			$http({
    				method: 'GET',
    				url: 'getAllStocks'
    			}).then(function(response){
    				$scope.stockPool = response.data;
    				console.log("response:", response);
    				console.log($scope.stockPool);
    			});
    		};
    		
    		/* updating stock detail data in user watch list */
    		updateWatchlist();
    		$interval(updateWatchlist, 1000);
    		
    		/* updating all stock infomation that exist in db */
    		updateAllStock();
    		$interval(updateAllStock, 60000);
    	});
    </script>
    
  </head>

  <body ng-app="mainApp">
  
  	<c:import url="page_component/header.jsp"/>
    <c:import url="watchlist.jsp"/>
    <c:import url="page_component/footer.jsp"/>


    
  </body>
</html>