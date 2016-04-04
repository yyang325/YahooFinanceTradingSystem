/**
 * 
 */

mainApp.filter('greet', function() {
  return function(input) {
    if (input < 12) {
      return 'Good Morning';
    } else if (input >= 12 && input <= 17) {
      return 'Good Afternoon';
    } else if (input > 17 && input <= 24) {
      return 'Good Evening';
    } else {
      return "I'm not sure what time it is!";
    }
  };
});

mainApp.controller("homeController", ["$scope", "$http", "shared", function($scope, $http, shared) {
	
	$scope.user;
	$scope.currentTime = new Date();
	//console.log("in main controller");
	$http.get("validUser")
	.success(function(data) {
		console.log(data);
		$scope.user = data;
		shared.setUser($scope.user);
		
	}).error(function(data) {
		console.log("AJAX ERROR");
	});
	
	
}]);