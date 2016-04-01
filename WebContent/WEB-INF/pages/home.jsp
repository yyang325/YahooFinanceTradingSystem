<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home Page</title>

    <!-- Bootstrap core CSS -->
    <link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--     <lisnk href="bower_component/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet"> -->

    <!-- Custom styles for this template -->
    <link href="bower_component/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!--     <script src="bower_component/assets/js/ie-emulation-modes-warning.js"></script> -->
    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="bower_component/jquery/dist/jquery.min.js"></script>
<!--     <script>window.jQuery || document.write('<script src="bower_component/assets/js/vendor/jquery.min.js"><\/script>')</script> -->
    <link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="bower_component/bootstrap/dist/js/bootstrap.min.js"></script>
    <link href="bower_component/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="bower_component/angular/angular.min.js"></script>
    <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular-route.min.js"></script>
    <script type="text/javascript" src="bower_component/angular-resource/angular-resource.min.js"></script>
	<script type="text/javascript" src="bower_component/angular-route/angular-route.min.js"></script>
	<script type="text/javascript" src="bower_component/angular-animate/angular-animate.min.js"></script>
	<script type="text/javascript" src="bower_component/angular-bootstrap/ui-bootstrap-tpls.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--     <script src="bower_component/assets/js/ie10-viewport-bug-workaround.js"></script> -->
    
    <!-- for charts-->
    <script src="js/Chart.js"></script>
	<script src="js/angular-chart.js"></script>
	<link rel="stylesheet" href="css/angular-chart.css">
	
	<!-- font-awesome -->
	<link rel="stylesheet" type="text/css" href="bower_component/fontawesome/css/font-awesome.min.css">
    
    <!-- Customize Javascript -->
    <script type="text/javascript" src="bower_component/app.js"></script>
    <script type="text/javascript" src="bower_component/transaction.js"></script>
    
    <style>
    		#chartdiv {
		width		: 100%;
		height		: 435px;
		font-size	: 11px;
	}
	
	#username{
		font-size: 32px;
	    line-height: 40px;
	    padding-top: 20px;
	    font-weight: 700;
	    font-family: Open Sans;
	    text-align: center;
	    letter-spacing: 1px;
	}	
	
	td{
		font-size: 14px;
    	line-height: 30px;
	}
	
	.alert {
		display: none;
	}
	th, td {
		text-align:center;
	}
	input[type="range"] {
    display:inline;
	padding-top:6px;
    width: 200px;
    height:20px;
	}
	input[type="range"]::-webkit-slider-thumb {
    	background-color: #666;
    	padding-top:10px;
    	width: 10px;
    	height: 20px;
	}
	
	.highlight{
    background: lightgreen;
    transition: background 200ms;
    }
    
    .highlight2{
    background: #ff8080;
    transition: background 200ms;
    }
    </style>
    
  </head>

  <body ng-app="mainApp">
  
  	<c:import url="page_component/header.jsp"/>
    

    <div ng-view class="container"></div>
         
    <script type = "text/ng-template" id = "watchlist.html">
        <c:import url="watchlist.jsp"/>
    </script>
    
    <%-- 
     <script type = "text/ng-template" id = "portfolio.html">
        <c:import url="portfolio1.jsp"/>
    </script>
    --%>
   
    
      

      
     
    <c:import url="page_component/footer.jsp"/>
  </body>
</html>