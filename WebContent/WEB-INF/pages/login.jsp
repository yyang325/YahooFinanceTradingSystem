<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
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
    
     <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oxygen:400,300,700">

	<style>
		body {
  			height: 100%;
		}
		
		.video {
			margin: 0;
  			padding: 0;
  			position: fixed;
  			top: 50%; left: 50%;
  			z-index: 1;
  			min-width: 100%;
			  min-height: 100%;
			  width: auto;
			  height: auto;
  			transform: translate(-50%, -50%);
		}
		
		.header-content-inner {
			position: relative;
			  top: 30%;
			  z-index: 2;
			  margin: 0 auto;
			  max-width: 720px;
			  text-align: center;
		}
		
	</style>
	
</head>

<body id="page-top" ng-app="mainApp" ng-controller="mainCtrl">

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
                <a class="navbar-brand page-scroll" href="#page-top"> <span style="font-size: 36px">YFTS</span></a>
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
                        <a class="page-scroll" href="#login">Login</a>
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
        	<video id="my-video" class="video" autoplay muted loop>
    			<source src="media/demo.mp4" type="video/mp4">
    	</video>	
            <div class="header-content-inner">
                <h1>Investing Streamlined</h1>
                <hr>
                <p>Simplify your financial life with <b>YFTS</b> -- offering the investment insights plus the convenience of banking. Get
					access to a full range of investments, easy-to-use tools and independent research</p>
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
                    <a href="#login" class="btn btn-default btn-xl">Get Started!</a>
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
    
    <section>
    	<div>
    		<!-- TradingView Widget BEGIN -->
			<script type="text/javascript" src="https://d33t3vvu2t2yu5.cloudfront.net/tv.js"></script>
			<script type="text/javascript">
			new TradingView.widget({
			  "autosize": true,
			  "symbol": "FX:SPX500",
			  "interval": "D",
			  "timezone": "America/New_York",
			  "theme": "White",
			  "style": "3",
			  "locale": "en",
			  "toolbar_bg": "#f1f3f6",
			  "allow_symbol_change": true,
			  "hideideas": true,
			  "show_popup_button": true,
			  "popup_width": "1000",
			  "popup_height": "650",
			  "no_referral_id": true
			});
			</script>
			<!-- TradingView Widget END -->
    	</div>
    </section>
    
    <section>
    	<div id="tv-miniwidget-dfa0f" class="markets_chart">
			<!-- <div id="tf-market" class="markets_chart">-->
			<div id="tradingview_690a3-wrapper"
				style="position: relative; box-sizing: content-box; width: 100%; height: 530px; margin: 0 !important; padding: 0 !important; font-family: Arial, sans-serif;">
				<div
					style="width: 100%; height: 530px; background: #fff; padding: 0 !important;">
					<iframe id="tradingview_690a3"
						src="https://dwq4do82y8xi7.cloudfront.net/miniwidgetembed/?Equities=BABA,DIA,SPY,TWITTER,FACEBOOK,GOOGLE,MICROSOFT,ORACLE&amp;Commodities=GOLD,SILVER,OIL,GAS,BASE%20METALS,URANIUM,LITHIUM,WHEAT&amp;Bonds=1-3%20YEAR,3-7%20YEAR,7-10%20YEAR,20%20YEAR,SHORT%20TERM%20US,EURO%20DEBT,GERMANY%20BOND,ASIA%20LOCAL%20DEBT&amp;Forex=FX%3AEURUSD,FX%3AGBPUSD,FX%3AUSDJPY,FX%3AUSDCHF,FX%3AAUDUSD,FX%3AUSDCAD,FX%3ANZDUSD,FX%3AEURJPY&amp;tabs=Equities%2CCommodities%2CBonds%2CForex&amp;QQQ=NASDAQ%3AQQQ&amp;DIA=AMEX%3ADIA&amp;SPY=AMEX%3ASPY&amp;TWITTER=NYSE%3ATWTR&amp;FACEBOOK=NASDAQ%3AFB&amp;GOOGLE=NASDAQ%3AGOOG&amp;MICROSOFT=NASDAQ%3AMSFT&amp;ORACLE=NYSE%3AORCL&amp;GOLD=AMEX%3AGLD&amp;SILVER=AMEX%3ASLV&amp;OIL=AMEX%3AUSO&amp;GAS=AMEX%3AUNG&amp;BASE%20METALS=AMEX%3ADBB&amp;URANIUM=AMEX%3AURA&amp;LITHIUM=AMEX%3ALIT&amp;WHEAT=AMEX%3AWEAT&amp;1-3%20YEAR=AMEX%3ASHY&amp;3-7%20YEAR=AMEX%3AIEI&amp;7-10%20YEAR=AMEX%3AIEF&amp;20%20YEAR=AMEX%3ATLT&amp;SHORT%20TERM%20US=AMEX%3ASCHO&amp;EURO%20DEBT=AMEX%3AEU&amp;GERMANY%20BOND=FX%3ABUND&amp;ASIA%20LOCAL%20DEBT=AMEX%3AALD&amp;timeAxisBackgroundColor=%23F3F2F3&amp;activeTickerBackgroundColor=%23EDF0F3&amp;trendLineColor=%23FF7965&amp;underLineColor=%23F0F0F0&amp;fontColor=%2383888D&amp;gridLineColor=%23E9E9EA&amp;large_chart_url=http%3A%2F%2Fwww.investopedia.com%2Fmarkets%2Fsymbol-redirect.aspx&amp;width=100%25&amp;height=530px&amp;utmsource=www.investopedia.com&amp;utmmedium=www.investopedia.com/"
						width="100%" height="530px" frameborder="0"
						allowtransparency="true" scrolling="no"
						style="margin: 0 !important; padding: 0 !important;"> </iframe>
				</div>
				<div
					style="position: absolute; display: block; box-sizing: content-box; height: 24px; width: 100%; bottom: 0; left: 0; margin: 0; padding: 0; font-family: Arial, sans-serif;">
					<div
						style="display: block; margin: 0 1px 1px 1px; line-height: 7px; box-sizing: content-box; height: 11px; padding: 6px 10px; text-align: right; background: #fff;">
						<a
							href="https://www.tradingview.com/?utmsource=www.investopedia.com&amp;utmmedium=www.investopedia.com/"
							target="_blank"
							style="color: #0099d4; text-decoration: none; font-size: 11px;">
						</a>
					</div>
				</div>
			</div>
		</div>
    </section>

    <a name="login_up"></a>
	<div id="login" class="banner">
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
														<a href="#login-form" id="login-form-link" ng-click="switchForm(true)">Login</a>
													</div>
													<div class="col-xs-6">
														<a href="#register-form" id="register-form-link" ng-click="switchForm(false)">Register</a>
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
															method="POST" ng-show="showLogin">
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
																			<a href="forgotpassword.html" tabindex="5"
																				class="forgot-password">Forgot Password?</a>
																		</div>
																	</div>
																</div>
															</div>
														</form>

														<!-- Register Form -->
														<form id="register-form" name="registerform"
															action="confirmsignup" method="post" ng-show="!showLogin">
															<div class="form-group">
																<label for="uname" style="color: black;">
																	Username:</label> <input type="text" name="username"
																	id="j_userName" tabindex="1" class="form-control"
																	placeholder="Enter your username">
															</div>
															<div class="form-group">
																<label for="ulname" style="color: black;">
																	Lastname:</label> <input type="text" name="lastName"
																	id="j_lastName" tabindex="1" class="form-control"
																	placeholder="Enter your lastname">
															</div>
															<div class="form-group">
																<label for="ufname" style="color: black;">
																	Firstname:</label> <input type="text" name="firstName"
																	id="j_firstName" tabindex="1" class="form-control"
																	placeholder="Enter your firstname">
															</div>
															<div class="form-group">
																<label for="uemail" style="color: black;">
																	Email:</label> <input type="email" name="email" id="j_email"
																	tabindex="1" class="form-control"
																	placeholder="Enter your email address">
															</div>
															<div class="form-group">
																<label for="upassword" style="color: black;">
																	Password:</label> <input type="password" name="password"
																	id="j_passWord" tabindex="2" class="form-control"
																	placeholder="Enter your password">
															</div>
															<div class="form-group">
																<label for="upassword" style="color: black;">
																	Confirm your password:</label> <input type="password"
																	name="confirmPassword" id="confirm-password"
																	tabindex="2" class="form-control"
																	placeholder="Confirm your password">
															</div>
															<div class="form-group">
																<div class="row">
																	<div class="col-sm-6 col-sm-offset-3"
																		style="padding-top: 10px;">
																		<input type="submit" name="submit2" id="register"
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
    
    <!-- AngularJS -->
    <script src="bower_component/angular/angular.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_component/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="bower_component/js/jquery.easing.min.js"></script>
    <script src="bower_component/js/jquery.fittext.js"></script>
    <script src="bower_component/js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="bower_component/js/creative.js"></script>
    <script type="text/javascript">
    	var app = angular.module("mainApp", []);
    	app.controller("mainCtrl", function($scope){
    		$scope.showLogin = true;
    		$scope.switchForm = function(bool){
    			$scope.showLogin = bool;
    		};
    	});
    </script>

</body>

</html>