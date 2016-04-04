/**
 * this javascript is for the admin application
 */
var mainApp = angular.module("adminApp", ["ngRoute"]);

        /* ng routing configuration */
        mainApp.config(['$routeProvider', function($routeProvider) {
            $routeProvider.

            when('/stock', {
                templateUrl: 'stockAdmin.html',
                controller: 'stockAdminCtrl'
            }).
            
            when('/transaction', {
            	templateUrl: 'transactionAdmin.html',
            	controller: 'transactionAdminCtrl'
            }).
            
            when('/history', {
            	templateUrl: 'historyAdmin.html',
            	controller: 'historyAdminCtrl'
            }).

            otherwise({
                redirectTo: '/'
            });
        }]);
        
        
        mainApp.controller("adminCtrl", function($scope, $http, $interval){
        	
        	$scope.stockPool = [];
        	$scope.newStock = {};
        	var updateStock = function(){
        		$http.get("admin/allStock")
        		.success(function(data) {
        			console.log(data);
        			$scope.stockPool = data;
        		}).error(function(data) {
        			console.log("AJAX ERROR");
        		});
        	}
        	
        	updateStock();
        	$interval(updateStock, 3000);
        	
        	
        	$scope.addNewStock = function(){
        		console.log("click add new stock into stock pool");
        		console.log("new stock is:", $scope.newStock);
        		$http({
        			url: "admin/addStock/"+$scope.newStock.symbol+"/"+$scope.newStock.stockDesc,
        			method: "GET"
        		}).success(function(data){
        			$scope.stockPool.push($scope.newStock);
        			$scope.newStock = {};
        		})
        	}
        	
        });
        
        
        mainApp.controller("transactionCtrl", function($scope, $http, $interval){
        	
        	$scope.pendingTran = [];
        	$scope.committedTran = [];
        	
        	var showPendingTran = function(){
        		$http.get("admin/allPendingHistory")
        		.success(function(data){
        			console.log(data);
        			$scope.pendingTran = data;
        		}).error(function(data){
        			console.log("Ajax Error");
        		});
        	}
        	
        	showPendingTran();
        	$interval(showPendingTran, 3000);
        });

		
        
        