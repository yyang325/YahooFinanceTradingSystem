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
        mainApp.controller("watchlistCtrl", function($scope, $interval, $http, shared){
            $scope.stocks = [];
            $scope.stockPool = [];
            
            /**
             * get user info
             */
            $scope.user;
    		//console.log("in main controller");
    		$http.get("validUser")
    		.success(function(data) {
    			console.log(data);
    			$scope.user = data;
    			shared.setUser($scope.user);
    			
    		}).error(function(data) {
    			console.log("AJAX ERROR");
    		});
    		
    		//set shared stock
    		$scope.pass = function(stock) {
    			console.log("In pass");
    			console.log(stock);
    			shared.setStock(stock);
    		};

            var updateWatchlist = function(){
                //console.log("updating watch list");
                $http({
                    method: 'GET',
                    url: 'getWatchList'
                }).then(function(response){
                    $scope.stocks = response.data;
                    //console.log("response:", response);
                    //console.log($scope.stocks);
                });
            };

            var updateAllStock = function(){
                //console.log("checking all stock");
                $http({
                    method: 'GET',
                    url: 'getAllStocks'
                }).then(function(response){
                    $scope.stockPool = response.data;
                    //console.log("response:", response);
                    //console.log($scope.stockPool);
                });
            };

            /* updating stock detail data in user watch list */
            updateWatchlist();
            $interval(updateWatchlist, 3000);

            /* updating all stock infomation that exist in db */
            updateAllStock();
            $interval(updateAllStock, 60000);
        });

        mainApp.controller("ModalCtrlInWatch", ["$scope", "$modal", "$log", "shared", function ($scope, $modal, $log, shared) {
    		//console.log("in open Add");
    		$scope.message = shared.getMessage();
    		$scope.item;
    		$scope.animationsEnabled = true;
    		$scope.buySuccess=false;
    		
    		$scope.openBuy = function () {		
    			$scope.user = shared.getUser();
    			$scope.buyItem = shared.getStock();
    			//console.log($scope.buyItem);
    			var modalInstance = $modal.open({
    				animation: $scope.animationsEnabled,
    				templateUrl: 'buyContentInWatch.html',
    				controller: 'ModalInstanceCtrlBuyInWatch',
    				resolve: {
    					items: function () {
    						return $scope.user;
    					}
    				}
    			});

    			modalInstance.result.then(function (quan) {
    				$scope.buySuccess = true;
    				$scope.user.cash = Math.round($scope.user.cash - $scope.buyItem.price * quan);
    			}, function () {
    				$log.info('Modal dismissed at: ' + new Date());
    			});
    		};
    		
    	}]);
        
        mainApp.controller('ModalInstanceCtrlBuyInWatch', function ($scope, $modalInstance, $http, items, shared) {
    		$scope.user = shared.getUser();	
    		$scope.Math = window.Math;
    		$scope.buyItem = shared.getStock();
    		$scope.stockId;
    		$scope.data={
    				symbol: $scope.buyItem.stockSymbol
    		};
    		console.log($scope.buyItem);
    		$scope.upper = Math.floor($scope.user.cash / $scope.buyItem.price);
    		$scope.quan = 1;
    		$scope.newTran;
    		$scope.$watch("quan",function(val,old){
    			val = isNaN(val)?"1":val;
    		    $scope.quan = parseInt(val); 
    		});
    		
    		//get the stockId for the symbol using the symbol
    		$http.get("getStockId", {params: $scope.data})
    		.then(function(resp) {
    			//console.log(resp.data);
    			$scope.stockId=resp.data;
    		});
    			
    		$scope.send = function(){
    			$http({
    				method: "POST",
    				url: "addPending",
    				data: $scope.newTran = {
    						tid: 0,
    						user: $scope.user,
    						stock: {
    							sid: $scope.stockId,
    							symbol: $scope.buyItem.stockSymbol,
    							stockDesc: $scope.buyItem.companyName
    						},
    						price: $scope.buyItem.price,
    						quantity: $scope.quan,
//    						price: $scope.buyItem.price, 
    						ts: new Date()
    				}
    			}).success(function (response) {
    				console.log(response);
    			}).error(function (data) {
    				//console.log(data);
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

        mainApp.controller("historyCtrl", function($scope, $http, $interval){
            $scope.message = "this is history page -- testing message.";
            $scope.historyRecords = [];

            var updateHistory = function(){
                //console.log("checking all history");
                $http({
                    method: 'GET',
                    url: 'getTranHistory'
                }).then(function(response){
                    $scope.historyRecords = response.data;
                    //console.log("response:", response);
                });
            };

            updateHistory();
            $interval(updateHistory, 2000);
        });
        
        
        