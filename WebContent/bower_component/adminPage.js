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
        	$scope.active = [];
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
        		});
        	}
        	
        });
        
        
        mainApp.controller("transactionCtrl", function($scope, $http, $interval){
        	
        	$scope.pendingTran = [];
        	$scope.committedTran = [];
        	
        	/* formate unix time into date time */
        	var format = function(old){
        		var d = new Date(old);
        		var formattedDate = d.getDate() + "-" + (d.getMonth() + 1) + "-" + d.getFullYear();
        		var hours = (d.getHours() < 10) ? "0" + d.getHours() : d.getHours();
        		var minutes = (d.getMinutes() < 10) ? "0" + d.getMinutes() : d.getMinutes();
        		var formattedTime = hours + ":" + minutes;

        		formattedDate = formattedDate + " " + formattedTime;
        		console.log(formattedDate);
        		return formattedDate;
        	}
        	
        	/* Show Pending Transaction Table */
        	var showPendingTran = function(){
        		$http.get("admin/allPendingHistory")
        		.success(function(data){
        			console.log(data);
        			for(var i = 0; i < data.length; i++){
        				data[i].date = format(data[i].date);
        			}
        			$scope.pendingTran = data;
        		}).error(function(data){
        			console.log("Ajax Error");
        		});
        	};
        	showPendingTran();
        	$interval(showPendingTran, 3000);
        	
        	
        	/* Show Committed Transaction Table */
        	var showCommittedTran = function(){
        		$http.get("admin/allCommittedHistory")
        		.success(function(data){
        			console.log(data);
        			$scope.committedTran = data;
        		}).error(function(data){
        			console.log("Ajax Error");
        		});
        	};
        	showCommittedTran();
        	$interval(showCommittedTran, 3000);
        	
        	
        	/* Submit a pending Transaction */
        	$scope.submitPending = function(index){
        		console.log("submit pending, index: ", index);
        		$http({
        			url: "admin/commitTran/"+index,
        			method: "GET"
        		}).success(function(data){
        			$scope.pendingTran.splice(index, 1);
        		}).error(function(data){
        			console.log("Ajax Error");
        		});
        	}
        	
        	
        	/* Drop a pending Transaction */
        	$scope.dropPending = function(index){
        		console.log("Dropping pending, index: ", index);
        		$http({
        			url: "admin/dropTran/"+index,
        			method: "GET"
        		}).success(function(data){
        			$scope.pendingTran.splice(index, 1);
        		})
        	}
        });

		
        
        