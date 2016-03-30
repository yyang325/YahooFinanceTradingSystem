<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Portfolio</title>
	<script src="js/angular.min.js"></script>
    <script src="js/ui-bootstrap-tpls-0.13.4.min.js"></script>
    <script src="js/angular-animate.min.js"></script>
    
    <script src="js/activity-portfolio.js"></script>
    
    <script src="js/angular-resource.min.js"></script>
    <script	src="js/jquery.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- for header and footer -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/extra/bootstrap-theme.css" rel="stylesheet">
<link href="css/extra/elegant-icons-style.css" rel="stylesheet" />
<link href="css/extra/font-awesome.min.css" rel="stylesheet" />    
<link href="css/extra/style.css" rel="stylesheet">
<script src="js/angular.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

    <!-- Bootstrap CSS -->    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css/style-responsive.css" rel="stylesheet" />
    
    <script src="js/Chart.js"></script>
	<!-- <script src="js/Chart.Doughnut.js"></script>
 -->	
	<script src="js/angular-chart.js"></script>
	<link rel="stylesheet" href="css/angular-chart.css">
	 <link href='https://fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>
	 <link href='https://fonts.googleapis.com/css?family=Sonsie+One' rel='stylesheet' type='text/css'>
	 <link href='https://fonts.googleapis.com/css?family=Indie+Flower|Montserrat' rel='stylesheet' type='text/css'>

<style>

	#chartdiv {
		width		: 100%;
		height		: 435px;
		font-size	: 11px;
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
<body ng-app="ui.bootstrap.demo">
<c:import url="pageComponent/header.jsp"/>

      <section id="main-content">
          <section class="wrapper" ng-controller="mainController">
			<!-- page start-->
			   <div class="row">
			   	 
			   	 
			   	 <div class="col-lg-3" >
                      <section class="panel panel-info">
                          <header class="panel-heading" align="center">
                              <p style="font-size:20px">Balance</p>
                          </header>
                          <div class="panel-body">
								<div ng-controller="ModalDemoCtrl" style="text-align:center">
										<span>Current Balance: <b style="color: #27B63F;vertical-align: sub;font-size: 28px;margin-left: 5px;">
										<br>
										 {{user.balance | currency}}</b></span>	
										<div id="addSuccess" ng-show="addSuccess&&!sellSuccess&&!sellSuccess">Adding money Success!</div>	
										<br>
										<button id="addBalance" class="btn btn-primary btn-sm"
											ng-click="openAdd()">Manage Balance</button>
								</div>
								
							</div>
                      </section>
                 </div>
			   	 
			   	 
                  <div class="col-lg-9" ng-controller="ModalDemoCtrl">
                      <section class="panel panel-info">
                          <header class="panel-heading" align="center">
                              <p style="font-size:20px">Stock</p>
                          </header>
                          <div class="panel-body">
                        <form action="portfolio" id="listUserStocks" method="post">
                          <table class="table table-striped table-bordered table-advance table-hover" >
                           <tbody>
                              <tr class="success" >
                                 <!-- <th><i class="icon_star"></i> Stock Id</th> -->
                                 <th>Action</th>
                                 <th>StockSymbol</th>
                                 <th>StockName</th>
                                 <th>Quantity</th>
                                 <th>Price</th>
                                 <th>Change</th>
                                 <th>Change%</th>
                                 
                                 
                              </tr>
                              <tr ng-repeat=" stock in stockInfo | orderBy:predicate:reverse | filter:stock.symbol track by $index">
								<!-- <td>{{stock.stock.sid}}</td> -->
								<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                                 <td>
                                  <div class="btn-group">
                                    <!--   <a class="btn btn-primary" href="#" ng-click="pass(stock); openBuy()">Buy</a> -->
                                      <a class="btn btn-success" href="#" ng-click="pass(stock); openSell()" >Sell</a> 
                                  </div>
                                  </td>
                                 </sec:authorize>
								<td>{{stock.stock.symbol}}</td>
								<td>{{stock.stockName}}</td>
								<td>{{stock.quantity}}</td>
								<td ng-if="stock.change>0" highlighter="stock.price">&#36{{stock.price| number:2}}</td>
								<td ng-if="stock.change<0" highlighter2="stock.price" >  &#36{{stock.price| number:2}}</td>
								<td  ng-if="stock.change==0" style="color:black">&#36{{stock.price| number:2}}</td>
								<!-- <b ng-if="stock.change>0" highlighter="stock.price" >&#36{{stock.price| number:2}}</b>
									<b ng-if="stock.change<0" highlighter2="stock.price" >&#36{{stock.price| number:2}}</b>
									<b ng-if="stock.change==0" style="color:black">&#36{{stock.price| number:2}}</b>
								</td> -->
								
								
					     		<td >
									<b ng-if="stock.change>0" style="color:green">+{{stock.change| number:2}} <span class="glyphicon glyphicon-arrow-up"></span></b>
									<b ng-if="stock.change<0"  style="color:red">{{stock.change| number:2}} <span class="glyphicon glyphicon-arrow-down"></span></b>
									<b ng-if="stock.change==0"  style="color:black">{{stock.change| number:2}}</b>
								</td>
								<td >
									<b ng-if="stock.pchange.indexOf('-')>-1" style="color:red">{{stock.pchange}} <span class="glyphicon glyphicon-arrow-down"></span></b>
									<b ng-if="stock.pchange.indexOf('+')>-1"  style="color:green">{{stock.pchange}} <span class="glyphicon glyphicon-arrow-up"></span></b>
									<b ng-if="stock.pchange.indexOf('0')==0" style="color:black">{{stock.pchange}}</b>
								</td>
								
								
								
                              </tr>

                           </tbody>
                        </table>
                        
                        </form>
                        <!-- Loading -->

                       
                       <!--  <!-- loading bar 
						<div class = "loadbox" ng-hide="loading">
							<div class = "loadbar">
								<div class="progress progress-striped active progress-sm" >
							    	<div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:{{percent}}">
							        	<span class="sr-only">45% Complete</span>
							        </div>
					    		</div>
					     		<p>Loading...</p>
					    	</div>
					   </div>  -->
                        
                        
                  <div id="buySuccess" ng-show="buySuccess&&!sellSuccess&&!addSuccess">Buying Transaction Success!</div>
		          <div id="sellSuccess" ng-show="sellSuccess&&!buySuccess&&!addSuccess">Selling Transaction Success!</div>
	              </div>
                      </section>
                  </div>
                  
                  
                  
                  
                  
              </div>
              
    <!-- <div ng-controller="mainController">
		<div ng-controller="ModalDemoCtrl">
				<button id="addBalance" class="btn btn-primary btn-sm"
					ng-click="openAdd()">Add Balance</button>
				<span>Current Balance: <b style="color: red">{{user.balance}}</b></span>	
				<div id="addSuccess" ng-show="addSuccess&&!sellSuccess&&!sellSuccess">Adding money Success!</div>	
			
		</div>
		
	</div> -->
	
<div>
    <script type="text/ng-template" id="buyContent.html">
        <div class="modal-header">
			 <button type="button" class="close" ng-click="cancel()">&times;</button>
            <h3 class="modal-title">Buy Stock</h3>
        </div>
        <div class="modal-body" style="font-size:15px;">
            <label>Stock Symbol:  </label>
			<b style=" font-family: 'Indie Flower', cursive; font-size:25px;"> {{buyItem.stock.symbol}}</b>
			<br/>
			<label>Stock Name:  </label>
			<b style=" font-family: 'Indie Flower', cursive; font-size:25px;"> {{buyItem.stockName}}</b>
			<br/>
			<label>Unit Price:  </label>
			<b style="font-family: 'Indie Flower', cursive; font-size:25px;"> {{buyItem.price}}</b>
			<br/>
			<label>Quantity:  </label>
			<input type="number" min="1" max={{upper}} value={{quan}} ng-model="quan"/>
			<br/>	
        </div>				
        <div class="modal-footer">
		<div>		
			<h5 style="margin-right:50px"><strong>Ready to buy <span style="color:red">{{quan}}</span>
			shares of <span style="color:red">{{buyItem.stock.symbol}}</span> ? <strong></h5>
			<h5><strong>Balance after transaction: <span style="color:red">
			{{Math.round(user.balance - buyItem.price * quan) |currency}}</span><strong> </h5>
		</div>
            <button class="btn btn-success" type="button" ng-click="ok()">OK</button>
            <button class="btn btn-default" type="button" ng-click="cancel()">Cancel</button>
        </div>
    </script>
    <script type="text/ng-template" id="sellContent.html">
        <div class="modal-header">
 		<button type="button" class="close" ng-click="cancel()">&times;</button>
            <h3 class="modal-title">Sell Stocks </h3> 
        </div>
        <div class="modal-body" style="font-size:15px;">
            <label>Stock Symbol: </label>
			<b style=" font-family: 'Indie Flower', cursive; font-size:25px;">{{sellItem.stock.symbol}}</b><br/>
			<label>Stock Name: </label>
			<b style=" font-family: 'Indie Flower', cursive; font-size:25px;">{{sellItem.stockName}}</b><br/>
			<label>Unit Price: </label>
			<b style=" font-family: 'Indie Flower', cursive; font-size:25px;">{{sellItem.price}}</b><br/>
			<label>Currently Own: </label>
			<b style=" font-family: 'Indie Flower', cursive; font-size:25px;">{{getAmount(sellItem)}}</b><br/>
			<label>Quantity: </label>
			<input type="number" min="1" max={{getAmount(sellItem)}} value={{quan}} ng-model="quan"/>
			<br/>	
        </div>				
        <div class="modal-footer">
		<div>		
			<h5 style="margin-right:50px"><strong>Ready to sell <span style="color:red">{{quan}}</span>
			shares of <span style="color:red">{{sellItem.stock.symbol}}</span>? </strong></h5>
			<h5><strong>Balance after transaction: <span style="color:red">$
			{{Math.round(user.balance + sellItem.price * quan) | currency}}</span></strong></h5>
		</div><br/>
            <button class="btn btn-danger" type="button" ng-click="ok()">Sell</button>
            <button class="btn btn-default" type="button" ng-click="cancel()">Cancel</button>
        </div>
    </script>
    <script type="text/ng-template" id="addContent.html">
        <div class="modal-header">
            <h3 class="modal-title" style="font-family:'Sonsie One', cursive;">Add Balance</h3>
        </div>
        <div class="modal-body">
			<div class="modal-inner" style="text-align:center;padding:10px">
				<label style="text-center;font-family:'Sonsie One',cursive;font-size: 25px;color: #184636;">Amount: </label>
				<input type="number" min="1" max={{2147483647-balance}} value={{quan}} ng-model="quan"/>
				<br><br>
				<p style="text-center;font-family: 'Montserrat', sans-serif; font-size: medium;color: #184636;">You will have <span style="color:red">$ {{balance + quan}}</span> in your account,
				<br>after adding <span style="color:red">$ {{quan}}</span></p>
				<br>

				<button class="btn btn-primary" type="button" ng-click="ok()">  Add  </button>
            	<button class="btn btn-warning" type="button" ng-click="cancel()">Cancel</button>
			</div>
        </div>		
        <div class="modal-footer">
		<div>		
        <button type="button" class="btn btn-danger" ng-click="cancel()">Close</button>
        </div>
    </script>
</div>	

            <div class="row">
              <!-- chart morris start -->
              	<div class="col-lg-12">
                	<section class="panel panel-info">
                    	<header class="panel-heading" style="font-size:20px;" align="center">
                        	Ownership Summary
                      	</header>
                      	<div class="panel-body">
                        	<div class="tab-pane" id="chartjs">
                      			<div class="row">
                          		<!-- Line -->
                          		<div class="col-lg-6">
                              			<section class="panel">
                                  			<header class="panel-heading" align="center">
                                      			Stock Quantity Bar Chart
                                  			</header>
                                  			<div class="panel-body text-center" ng-controller="BarCtrl">
												<canvas id="bar" class="chart chart-bar"
												 		chart-data="data" chart-labels="labels" chart-series="series">
												</canvas>
                                  			</div>
                              			</section>
                          			</div>     
                          			<div class="col-lg-6">
                              			<section class="panel">
                                  			<header class="panel-heading" align="center">
                                      			Stock Value Doughnut Chart
                                  			</header>
                                  			<div class="panel-body text-center" ng-controller="PieCtrl">
												<canvas id="doughnut" class="chart chart-doughnut" chart-data="data" chart-labels="labels" chart-legend="true">
												</canvas> 
                                  			</div>
                              			</section>
                          			</div>   
                          			                       
                      			</div>
                      		</div>
						</div>
                    </section>
              	</div>
              <!-- chart morris start -->
            </div>		
			
		</section>
	</section>
    </div>

<!-- container section end -->
    <!-- javascripts -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
        <!-- nice scroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- chartjs -->
    <script src="assets/chart-master/Chart.js"></script>
    <!-- custom chart script for this page only-->
	<script src="js/angular-chart.js"></script>

    <!--custome script for all page-->
    <script src="js/scripts.js"></script>


</body>
</html>