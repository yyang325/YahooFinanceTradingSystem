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


    <!-- Custom styles for this template -->
    <link href="bower_component/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="bower_component/jquery/dist/jquery.min.js"></script>
    <link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="bower_component/bootstrap/dist/js/bootstrap.min.js"></script>
    <link href="bower_component/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="bower_component/angular/angular.min.js"></script>
    <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular-route.min.js"></script>
    <script type="text/javascript" src="bower_component/angular-resource/angular-resource.min.js"></script>
	<script type="text/javascript" src="bower_component/angular-route/angular-route.min.js"></script>
	<script type="text/javascript" src="bower_component/angular-animate/angular-animate.min.js"></script>
	<script type="text/javascript" src="bower_component/angular-bootstrap/ui-bootstrap-tpls.min.js"></script>
    
    <!-- for external script -->
    <!-- <script src="bower_component/postscribe/dist/postscribe.min.js"></script>
    <script src="bower_component/postscribe/htmlParser/htmlParser.js"></script> -->
    
    <!-- for charts-->
    <script src="js/Chart.js"></script>
	<script src="js/angular-chart.js"></script>
	<link rel="stylesheet" href="css/angular-chart.css">
	
	<!-- font-awesome -->
	<link rel="stylesheet" type="text/css" href="bower_component/fontawesome/css/font-awesome.min.css">
    
    <!-- Customize Javascript -->
    <script type="text/javascript" src="bower_component/app.js"></script>
    <script type="text/javascript" src="bower_component/transaction.js"></script>
    <script type="text/javascript" src="bower_component/home.js"></script>
    
    <script>
								var nof_headlines = 11; 
								var author_id = '';				</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
	<script src="http://static.amigobulls.com/js/news_widgets.min.js.gz"></script>
	<link rel="stylesheet" type="text/css" href="http://static.amigobulls.com/css/news_widgets.min.css.gz" />
    
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
    
    <script type = "text/ng-template" id = "home.html">
        <c:import url="home1.jsp"/>
    </script>
         
    <script type = "text/ng-template" id = "watchlist.html">
        <c:import url="watchlist.jsp"/>
    </script>
    
    
     <script type = "text/ng-template" id = "history.html">
        <c:import url="history.jsp"/>
    </script>
   
    
      

      
     
    <c:import url="page_component/footer.jsp"/>
  </body>
</html>