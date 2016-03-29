<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Creative - Start Bootstrap Theme</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="bower_component/css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="bower_component/font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="bower_component/css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="bower_component/css/creative.css" type="text/css">

</head>

<body id="page-top">

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Start Bootstrap</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#portfolio">Portfolio</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1>Your Favorite Source of Free Bootstrap Themes</h1>
                <hr>
                <p>Start Bootstrap can help you build better websites using the Bootstrap CSS framework! Just download your template and start going, no strings attached!</p>
                <a href="#about" class="btn btn-primary btn-xl page-scroll">Find Out More</a>
            </div>
        </div>
    </header>

    <section class="bg-primary" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">We've got what you need!</h2>
                    <hr class="light">
                    <p class="text-faded">Start Bootstrap has everything you need to get your new website up and running in no time! All of the templates and themes on Start Bootstrap are open source, free to download, and easy to use. No strings attached!</p>
                    <a href="#" class="btn btn-default btn-xl">Get Started!</a>
                </div>
            </div>
        </div>
    </section>

    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">At Your Service</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-diamond wow bounceIn text-primary"></i>
                        <h3>Sturdy Templates</h3>
                        <p class="text-muted">Our templates are updated regularly so they don't break.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-paper-plane wow bounceIn text-primary" data-wow-delay=".1s"></i>
                        <h3>Ready to Ship</h3>
                        <p class="text-muted">You can use this theme as is, or you can make changes!</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-newspaper-o wow bounceIn text-primary" data-wow-delay=".2s"></i>
                        <h3>Up to Date</h3>
                        <p class="text-muted">We update dependencies to keep things fresh.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart wow bounceIn text-primary" data-wow-delay=".3s"></i>
                        <h3>Made with Love</h3>
                        <p class="text-muted">You have to make your websites with love these days!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <a name="login_up"></a>
	<div id="tf-login" class="banner">
		<div class="content-section-c">
			<div class="container">
				<div class="row">
					<section style="margin-top: 30px;">
						<div class="container">
							<div class="row">
								<sec:authorize
									access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')?false:true">
									<div class="col-md-6 col-md-offset-3">
										<div class="panel panel-login">
											<div class="panel-heading"
												style="height: 60px; text-align: center; font-size: 18px; color: #666; font-weight: bold;">
												<div class="row">
													<div class="col-xs-6">
														<a href="#login-form" id="login-form-link" class="active">Login</a>
													</div>
													<div class="col-xs-6">
														<a href="#register-form" id="register-form-link">Register</a>
													</div>
												</div>
												<hr>
											</div>
											<div class="panel-body">
												<div class="row">
													<div class="col-lg-12">
														
														<!-- Login Form -->
														<form id="login-form" name="login-form"
															class="form-validate"
															action="<c:url value='j_spring_security_check'/>"
															method="POST" style="display: block;">
															<div class="form-group">
																<label for="uname" style="color: black;">
																	Username:</label> <input type="text" name="j_username"
																	id="j_username" tabindex="1" class="form-control"
																	placeholder="Username">
															</div>
															<div class="form-group" style="color: black;">
																<label for="uname"> Password:</label> <input
																	type="password" name="j_password" id="j_password"
																	tabindex="2" class="form-control"
																	placeholder="Password">
															</div>
															<div class="form-group text-center">
																<input type="checkbox" tabindex="3" class=""
																	name="_spring_security_remember_me" id="remember-me">
																<label for="remember" style="color: black;">
																	Remember Me</label>
															</div>
															<div class="form-group">
																<div class="row">
																	<div class="col-sm-6 col-sm-offset-3"
																		style="padding-top: 10px; color: #f05f40;">
																		<input type="submit" name="submit1" id="signin"
																			tabindex="4" class="form-control btn btn-login"
																			value="Log In">
																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="row">
																	<div class="col-lg-12">
																		<div class="text-center">
																			<a href="forgotpassword.jsp" tabindex="5"
																				class="forgot-password">Forgot Password?</a>
																		</div>
																	</div>
																</div>
															</div>
														</form>

														<!-- Register Form -->
														<form id="register-form" name="registerform"
															action="confirmation" method="post"
															style="display: none;" novalidate
															ng-submit="registration.submit(registerform.$valid)">
															<div class="form-group"
																ng-class="{ 'has-error': registerform.userName.$touched && registerform.userName.$invalid }">
																<label for="uname" style="color: black;">
																	Username:</label> <input type="text" name="userName"
																	id="j_userName" tabindex="1" class="form-control"
																	placeholder="Enter your username" ng-model="userName"
																	ng-minlength="3" ng-maxlength="10" username-valid
																	required>
																<div class="help-block"
																	ng-messages="registerform.userName.$error"
																	ng-messages-multiple
																	ng-if="registerform.userName.$dirty">
																	<p ng-message="minlength" style="color: #f05f40;">Your
																		username is too short.</p>
																	<p ng-message="maxlength" style="color: #f05f40;">Your
																		username is too long.</p>
																	<p ng-message="required" style="color: #f05f40;">Your
																		username is required.</p>
																	<p ng-message="usernameValid" style="color: #f05f40;">Username
																		Exist!</p>
																</div>
																<!-- <div style="display: none;color:#f05f40;" id="usernameExist">Username Exist!</div> -->
															</div>
															<div class="form-group"
																ng-class="{ 'has-error': registerform.lastName.$touched && registerform.lastName.$invalid }">
																<label for="ulname" style="color: black;">
																	Lastname:</label> <input type="text" name="lastName"
																	id="j_lastName" tabindex="1" class="form-control"
																	placeholder="Enter your lastname" ng-model="lastName"
																	ng-pattern="/^[a-zA-Z]+$/" required>
																<div class="help-block"
																	ng-messages="registerform.lastName.$error"
																	ng-messages-multiple
																	ng-if="registerform.lastName.$dirty">
																	<p ng-message="required" style="color: #f05f40;">Your
																		lastname is required.</p>
																	<p ng-message="pattern" style="color: #f05f40;">This
																		field only accept alphabet.</p>
																</div>
															</div>
															<div class="form-group"
																ng-class="{ 'has-error': registerform.firstName.$touched && registerform.firstName.$invalid }">
																<label for="ufname" style="color: black;">
																	Firstname:</label> <input type="text" name="firstName"
																	id="j_firstName" tabindex="1" class="form-control"
																	placeholder="Enter your firstname" ng-model="firstName"
																	ng-pattern="/^[a-zA-Z]+$/" required>
																<div class="help-block"
																	ng-messages="registerform.firstName.$error"
																	ng-messages-multiple
																	ng-if="registerform.firstName.$dirty">
																	<p ng-message="required" style="color: #f05f40;">Your
																		firstname is required.</p>
																	<p ng-message="pattern" style="color: #f05f40;">This
																		field only accept alphabet.</p>
																</div>

															</div>
															<div class="form-group"
																ng-class="{ 'has-error': registerform.email.$touched && registerform.email.$invalid }">
																<label for="uemail" style="color: black;">
																	Email:</label> <input type="email" name="email" id="j_email"
																	tabindex="1" class="form-control"
																	placeholder="Enter your email address" ng-model="email"
																	email-valid required>
																<div class="help-block"
																	ng-messages="registerform.email.$error"
																	ng-messages-multiple ng-if="registerform.email.$dirty">
																	<p ng-message="required" style="color: #f05f40;">This
																		field is required</p>
																	<p ng-message="email" style="color: #f05f40;">This
																		needs to be a valid email</p>
												
																	<p ng-message="emailValid" style="color: #f05f40;">Email
																		Exists!</p>
																</div>
																<!-- <div style="display: none;color:#f05f40;" id="emailExist">Email Exist!</div>  -->
															</div>
															<div class="form-group"
																ng-class="{ 'has-error': registerform.passWord.$touched && registerform.passWord.$invalid }">
																<label for="upassword" style="color: black;">
																	Password:</label> <input type="password" name="passWord"
																	id="j_passWord" tabindex="2" class="form-control"
																	placeholder="Enter your password" ng-model="passWord"
																	ng-pattern="/^[a-zA-Z0-9]+$/" ng-minlength="6"
																	ng-maxlength="20" required>
																<div class="help-block"
																	ng-messages="registerform.passWord.$error"
																	ng-messages-multiple
																	ng-if="registerform.passWord.$dirty">
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
															<div class="form-group">
																<div class="row">
																	<div class="col-sm-6 col-sm-offset-3"
																		style="padding-top: 10px;">
																		<input ng-disabled="registerform.$invalid"
																			type="submit" name="submit2" id="register"
																			tabindex="4" class="form-control btn btn-register"
																			value="Register Now">
																	</div>
																</div>
															</div>
															<br>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</sec:authorize>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>

    <aside class="bg-dark">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>Free Download at Start Bootstrap!</h2>
                <a href="#" class="btn btn-default btn-xl wow tada">Download Now!</a>
            </div>
        </div>
    </aside>

    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Let's Get In Touch!</h2>
                    <hr class="primary">
                    <p>Ready to start your next project with us? That's great! Give us a call or send us an email and we will get back to you as soon as possible!</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x wow bounceIn"></i>
                    <p>123-456-6789</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
                    <p><a href="mailto:your-email@your-domain.com">feedback@startbootstrap.com</a></p>
                </div>
            </div>
        </div>
    </section>

    <!-- jQuery -->
    <script src="bower_component/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_component/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="bower_component/js/jquery.easing.min.js"></script>
    <script src="bower_component/js/jquery.fittext.js"></script>
    <script src="bower_component/js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="bower_component/js/creative.js"></script>

</body>

</html>