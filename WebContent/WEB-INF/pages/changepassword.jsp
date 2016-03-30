<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change password</title>

<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/apple-touch-icon-114x114.png">

<!-- require, jquery, angular -->
<script type="text/javascript" src="bower_component/requirejs/require.js"></script>
<script type="text/javascript" src="bower_component/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="bower_component/angular/angular.min.js"></script>
<script type="text/javascript" src="bower_component/angular-messages/angular-messages.min.js"></script>
<script type="text/javascript" src="bower_component/angular-resource/angular-resource.min.js"></script>
<script type="text/javascript" src="bower_component/angular-route/angular-route.min.js"></script>


<!-- Bootstrap -->
<link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bower_component/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
<script type="text/javascript" src="bower_component/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- font-awesome -->
<link rel="stylesheet" type="text/css" href="bower_component/fontawesome/css/font-awesome.min.css">

<!-- a customerized js -->
<script src="js/app2.js"></script>

<!-- modernizr -->
<!-- need attention here -->
<!-- <script type="text/javascript" src="bower_component/js/modernizr.custom.js"></script> -->

<!-- owl Slider -->
<!-- need attention here -->
<link href="bower_component/owl/owl-carousel/owl.carousel.css" rel="stylesheet" media="screen">
<link href="bower_component/owl/owl-carousel/owl.theme.css" rel="stylesheet" media="screen">

<!-- animate -->
<link rel="stylesheet" href="bower_component/animate-css/animate.min.css" type="text/css">

<script>
	
		var app = angular.module("changePasswordApp", [ "ngMessages" ]);

		var compareTo = function() {
			return {
				require : "ngModel",
				scope : {
					otherModelValue : "=compareTo"
				},
				link : function(scope, element, attributes, ngModel) {

					ngModel.$validators.compareTo = function(modelValue) {
						return modelValue == scope.otherModelValue;
					};

					scope.$watch("otherModelValue", function() {
						ngModel.$validate();
					});
				}
			};
		};
		app.directive("compareTo", compareTo);
		app.controller("changePasswordCtrl", function() {

		});

	
</script>

</head>
<body ng-app="changePasswordApp" class="forgotpassword">
	<div ng-controller="changePasswordCtrl">
		<div class="content-section-c">
			<div class="container">
				<div class="row">
					<section style="margin-top: 30px;">
						<div class="container">
							<div class="row">
								<div class="col-md-6 col-md-offset-3">
									<div class="panel panel-login">
										<div class="panel-heading"
											style="height: 80px; text-align: center; font-size: 14px; color: #134DEF; font-weight: bold;">
											<h2>Hello,${username}! Please Change Your Password</h2>
										</div>
										<div class="panel-body">
											<div class="row">
												<div class="col-lg-12">
													<form action="change2" method="post" name="registerform">

														<input type="text" name="userName" value="${username}"
															style="display: none" />
														<div class="form-group"
															ng-class="{ 'has-error': registerform.password.$touched && registerform.password.$invalid }">
															<label for="upassword" style="color: black;">
																Password:</label> <input type="password" name="password"
																id="j_passWord" tabindex="2" class="form-control"
																placeholder="Enter your password" ng-model="passWord"
																ng-pattern="/^[a-zA-Z0-9]+$/" ng-minlength="6"
																ng-maxlength="20" required>
															<div class="help-block"
																ng-messages="registerform.password.$error"
																ng-messages-multiple
																ng-if="registerform.password.$dirty">
																<p ng-message="required" style="color: #f05f40;">This
																	field is required</p>
																<p ng-message="minlength" style="color: #f05f40;">This
																	field is too short. Minimum: 6.</p>
																<p ng-message="maxlength" style="color: #f05f40;">This
																	field is too long</p>
																<p ng-message="pattern" style="color: #f05f40;">This
																	field only accept alphabet and numbers</p>
															</div>
														</div>
														<div class="form-group">
															<label for="upassword" style="color: black;">
																Confirm your password:</label> <input type="password"
																name="confirmPassword" id="confirm-password"
																tabindex="2" class="form-control"
																placeholder="Confirm your password"
																ng-model="confirmPassword" compare-to="passWord"
																required>
															<div class="help-block"
																ng-messages="registerform.confirmPassword.$error"
																ng-messages-multiple
																ng-if="registerform.confirmPassword.$dirty">
																<p ng-message="compareTo" style="color: #f05f40;">Must
																	match the previous entry</p>
																<p ng-message="required" style="color: #f05f40;">This
																	field is required</p>
															</div>
														</div>
														<button type="submit" class="btn btn-success" >Submit</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>

</body>
</html>