(function() {

  var app = angular.module("validation", ["ngMessages"]);

  var RegistrationController = function() {
    var model = this;

    model.message = "";

    model.user = {
      username: "",
      passWord: "",
      confirmPassword: "",
      email:"",
      firstname:"",
      lastname:""
    };

    model.submit = function(isValid) {
      console.log("h");
      if (isValid) {
        model.message = "Submitted " + model.user.username;
      } else {
        model.message = "There are still invalid fields below";
      }
    };

  };

  var compareTo = function() {
    return {
      require: "ngModel",
      scope: {
        otherModelValue: "=compareTo"
      },
      link: function(scope, element, attributes, ngModel) {

        ngModel.$validators.compareTo = function(modelValue) {
          return modelValue == scope.otherModelValue;
        };

        scope.$watch("otherModelValue", function() {
          ngModel.$validate();
        });
      }
    };
  };
  var usernameValid = function($q, $http) {	  
	  return {
		  require:"ngModel",
	      link : function($scope, element, attrs, ngModel) {
	        ngModel.$asyncValidators.usernameValid = function(modelValue) {
	        	var u =  $.param({userName: modelValue});
			    return $http({ 
						method: "POST",
						url: "registervalidation",
						dataType: "text",
						data: u,
						headers:{'Content-Type':'application/x-www-form-urlencoded'}
				}).then(function(resp){
						console.log(resp.data);
						if (resp.data==1)
							return $q.reject('');
						return true
				})
	        }
	       /* $scope.$watch(function() {
	            ngModel.$validate();
	          });*/
	       
	      }
	  };
  };
  var emailValid = function($q, $http) {	  
	  return {
		  require:"ngModel",
	      link : function($scope, element, attrs, ngModel) {
	        ngModel.$asyncValidators.emailValid = function(modelValue) {
	        	var u =  $.param({email: modelValue});
			    return $http({ 
						method: "POST",
						url: "registervalidation",
						dataType: "text",
						data: u,
						headers:{'Content-Type':'application/x-www-form-urlencoded'}
				}).then(function(resp){
						console.log(resp.data);
						if (resp.data==1)
							return $q.reject('');
						return true
				})
	        }
	      }
	  };
  };
  /*var usernameValid = function(){
	  return {
		  require:"ngModel",
		  link: function(scope, element, attributes, ngModel) {

		        ngModel.$validators.usernameValid = function(modelValue) {
		          return modelValue == 'mzou';
		        };
	  }
  };*/

  app.directive("usernameValid",usernameValid);
  app.directive("emailValid",emailValid);
  app.directive("compareTo", compareTo);
  app.controller("RegistrationController", RegistrationController);

}());
