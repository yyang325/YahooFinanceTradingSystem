/**
 * this javascript is for the application
 */
var mainApp = angular.module("mainApp", ["ngRoute","ngAnimate", "ui.bootstrap", "ngResource", "chart.js"]);

		mainApp.config(['$httpProvider', function ($httpProvider) {    
			$httpProvider.defaults.headers.post['Content-Type'] = 'application/json; charset=UTF-8';
		}]);
        
        /* ng routing configuration */
        mainApp.config(['$routeProvider', function($routeProvider) {
            $routeProvider.

            when('/watchlist', {
                templateUrl: 'watchlist.html',
                controller: 'watchlistCtrl'
            }).
            
            when('/portfolio', {
            	templateUrl: 'portfolio.html',
            	//controller: 'portfolioCtrl'
            }).
            
            when('/history', {
            	templateUrl: 'history.html',
            	controller: 'historyCtrl'
            }).

            otherwise({
                redirectTo: '/'
            });
        }]);
        
        //for shared data
        mainApp.service("shared", function() {
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

		/* watch list controller */
        mainApp.controller("watchlistCtrl", function($scope, $interval, $http){
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
            $interval(updateWatchlist, 3000);

            /* updating all stock infomation that exist in db */
            updateAllStock();
            $interval(updateAllStock, 60000);
        });
        
        
        