 mainApp.controller("mainController", ["$scope", "$http", "$interval", "$rootScope","shared", 
    	                                  function($scope, $http, $interval, $rootScope, shared) {
    		$scope.user;
    		console.log("in main controller");
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
    	
    	
    	
    	 mainApp.controller("ModalCtrl", ["$scope", "$modal", "$log", "shared", function ($scope, $modal, $log, shared) {
    		//console.log("in open Add");
    		$scope.message = shared.getMessage();
    		$scope.item;
    		$scope.animationsEnabled = true;
    		$scope.buySuccess=false;
    		$scope.sellSuccess=false;
    		$scope.addSuccess=false;
    		
    		$scope.openSell = function () {		
    			$scope.user = shared.getUser();
    			$scope.sellItem = shared.getStock();
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
    				$scope.user.cash = Math.round($scope.user.cash + $scope.sellItem.stockInfo.price * quan);
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
    				$scope.user.cash = Math.round($scope.user.cash - $scope.buyItem.stockInfo.price * quan);
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
    	
    	mainApp.controller("ModalInstanceCtrlAdd", ["$scope", "$modalInstance", "$http", "items", "shared",
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
    	
    	mainApp.controller('ModalInstanceCtrlSell', function ($scope, $modalInstance, $http, items, shared) {
    		
    		//console.log("In Modal Instance Ctrl Sell");
    		$scope.user = shared.getUser();
    		//console.log($scope.user);
    		$scope.Math = window.Math;
    		$scope.sellItem = shared.getStock();
    		//console.log($scope.sellItem);
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
    						stock: {
    							sid: $scope.sellItem.stockId,
    							symbol: $scope.sellItem.stockSymbol,
    							stockDesc: $scope.sellItem.stockInfo.companyName
    						},
    						price: $scope.sellItem.stockInfo.price,
    						quantity: -$scope.quan,
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
    	
    	mainApp.controller('ModalInstanceCtrlBuy', function ($scope, $modalInstance, $http, items, shared) {
    		$scope.user = shared.getUser();	
    		$scope.Math = window.Math;
    		$scope.buyItem = shared.getStock();
    		console.log($scope.buyItem);
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
    						stock: {
    							sid: $scope.buyItem.stockId,
    							symbol: $scope.buyItem.stockSymbol,
    							stockDesc: $scope.buyItem.stockInfo.companyName
    						},
    						price: $scope.buyItem.stockInfo.price,
    						quantity: $scope.quan,
    						/* price: $scope.sellItem.price, */
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
    	
    	mainApp.controller("BarCtrl", ["$scope", "shared", "$interval", 
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
    	
    	mainApp.controller("PieCtrl", ["$scope", "shared", "$interval",
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