
	
	
	
	<div class="container">
		<section id="main-content">
			<section class="wrapper" ng-controller="transController">
				<!-- page starts -->
				<div class="row">
					<div class="col-lg-4">
						<section class="panel panel-info">
							<header class="panel-heading" align="center">
								<p style="font-size: 20px">Welcome:</p>
							</header>
							<div class="panel-body">
								<div style="text-align: center">
									<span id="username">{{user.username}}</span>
								</div>
							</div>
						</section>
					</div>

					<div class="col-lg-4" ng-controller="ModalCtrl">
						<section class="panel panel-info">
							<header class="panel-heading" align="center">
								<p style="font-size: 20px">Cash:</p>
								
							</header>
							<div class="panel-body">
								<div class="row">
									<div  style="text-align: center" class="col-lg-7">
									<span><b style="color: #27B63F;vertical-align: sub;font-size: 28px;margin-left: 5px;">
										{{user.cash | currency}}
									</b></span>
									
									<div id="addSuccess"
										ng-show="addSuccess&&!sellSuccess&&!sellSuccess">Add
										Credit Success!</div>
									</div>
									<div class="col-lg-3">
										<button id="addBalance" class="btn btn-primary btn-sm"
											ng-click="openAdd()">Add Balance</button>
									</div>
								</div>
							</div>
						</section>
					</div>

					<div class="col-lg-4">
						<section class="panel panel-info">
							<header class="panel-heading" align="center">
								<p style="font-size: 20px">Account Asset:</p>
							</header>
							<div class="panel-body">
								<div style="text-align: center">
									<span><b style="color: #27B63F;vertical-align: sub;font-size: 28px;margin-left: 5px;">
										{{asset | currency}}
									</b></span>
								</div>
							</div>
						</section>
					</div>

				</div>

				<div class="col-lg-12" ng-controller="ModalCtrl">
					<section class="panel panel-info">
						<header class="panel-heading" align="center">
							<p style="font-size: 20px">Open Positions</p>
						</header>
						<div class="panel-body">
							<form action="portfolio" id="listUserStocks" method="post">
								<table
									class="table table-striped table-bordered table-advance table-hover">
									<tbody>
										<tr class="success">
											<!-- <th><i class="icon_star"></i> Stock Id</th> -->
											
											<th>Symbol</th>
											<!--  <th>Stock Name</th> -->
											<th>Quantity</th>
											<th>Average Cost</th>
											<th>Cost</th>
											<th>Market Price</th>
											<th>Daily Change</th>
											<th>Daily Change(%)</th>
											<th>Gain/Loss</th>
											<th>Gain/Loss(%)</th>
											<th>Action</th>
											<!-- <th>Change</th>
		                                 <th>Change%</th> -->

										</tr>
										<tr ng-repeat="stock in ownStocks">
											
											<td style="font-weight: bold;">{{stock.stockSymbol}}</td>
											<td>{{stock.quantity}}</td>
											<td>{{stock.avgCost | number:2}}</td>
											<td>{{stock.avgCost * stock.quantity | number:2}}</td>
											<td>{{stock.stockInfo.price}}</td>
											<td>
									<b ng-if="stock.stockInfo.change>0" style="color:green">&#36{{stock.stockInfo.change| number:2}} <span class="glyphicon glyphicon-arrow-up"></span></b>
									<b ng-if="stock.stockInfo.change<0"  style="color:red">&#36{{stock.stockInfo.change| number:2}} <span class="glyphicon glyphicon-arrow-down"></span></b>
									<b ng-if="stock.stockInfo.change==0"  style="color:black">&#36{{stock.stockInfo.change| number:2}}</b>
								</td>
								<td >
									<b ng-if="stock.stockInfo.pchange.indexOf('-')>-1" style="color:red">{{stock.stockInfo.pchange}} <span class="glyphicon glyphicon-arrow-down"></span></b>
									<b ng-if="stock.stockInfo.pchange.indexOf('+')>-1"  style="color:green">{{stock.stockInfo.pchange}} <span class="glyphicon glyphicon-arrow-up"></span></b>
									<b ng-if="stock.stockInfo.pchange.indexOf('0')==0" style="color:black">{{stock.stockInfo.pchange}}</b>
								</td>
											<td ng-if="stock.stockInfo.price*stock.quantity - stock.avgCost * stock.quantity> 0" style="color: #093; font-weight: bold;">
												&#36{{stock.stockInfo.price*stock.quantity - stock.avgCost * stock.quantity | number:2}}
											</td>
											<td ng-if="stock.stockInfo.price*stock.quantity - stock.avgCost * stock.quantity< 0" style="color: #d14836; font-weight: bold;">
												&#36{{stock.stockInfo.price*stock.quantity - stock.avgCost * stock.quantity | number:2}}
											</td>
											<td ng-if="stock.stockInfo.price*stock.quantity - stock.avgCost * stock.quantity==0" style="color:black; font-weight: bold;">
												&#36{{stock.stockInfo.price*stock.quantity - stock.avgCost * stock.quantity | number:2}}
											</td>
											<td ng-if="stock.stockInfo.price*stock.quantity - stock.avgCost * stock.quantity> 0" style="color: #093; font-weight: bold;">
												{{(stock.stockInfo.price*stock.quantity - stock.avgCost * stock.quantity)*100/ (stock.avgCost * stock.quantity)| number:2}}&#37
											</td>
											<td ng-if="stock.stockInfo.price*stock.quantity - stock.avgCost * stock.quantity< 0" style="color: #d14836; font-weight: bold;">
												{{(stock.stockInfo.price*stock.quantity - stock.avgCost * stock.quantity)*100/ (stock.avgCost * stock.quantity) | number:2}}&#37
											</td>
											<td ng-if="stock.stockInfo.price*stock.quantity - stock.avgCost * stock.quantity==0" style="color:black; font-weight: bold;">
												{{(stock.stockInfo.price*stock.quantity - stock.avgCost * stock.quantity)*100 / (stock.avgCost * stock.quantity) | number:2}}&#37
											</td>
											<sec:authorize access="hasAnyRole('ADMIN', 'USER')">
												<td>
												
													<div class="btn-group">
														<!--   <a class="btn btn-primary" href="#" ng-click="pass(stock); openBuy()">Buy</a> -->
														<a class="btn btn-success" href="#portfolio"
															ng-click="pass(stock); openSell()">Sell</a>
														<!--   <a class="btn btn-primary" href="#" ng-click="pass(stock); openBuy()">Buy</a> -->
														<a class="btn btn-success" href="#portfolio"
															ng-click="pass(stock); openBuy()">Buy</a>
													</div>
												</td>
										
											</sec:authorize>
											
										</tr>


									</tbody>
								</table>

							</form>
						
							<div id="buySuccess" ng-show="buySuccess&&!sellSuccess&&!addSuccess">Buying Transaction Success!</div>
		          			<div id="sellSuccess" ng-show="sellSuccess&&!buySuccess&&!addSuccess">Selling Transaction Success!</div>
						</div>
					</section>

				</div>

				<!-- chart section -->
				<div class="row">
					<div class="col-lg-12">
						<section class="panel panel-info">
							<header class="panel-heading" style="font-size: 20px;"
								align="center"> Asset Analysis </header>
							<div class="panel-body">
								<div class="tab-pane" id="chartjs">
									<div class="row">
										
										<div class="col-lg-6">
											<header class="panel-heading" align="center"> Stock
												Quantity Chart </header>
											<div class="panel-body text-center" ng-controller="BarCtrl">
												<canvas id="bar" class="chart chart-bar" chart-data="data"
													chart-labels="labels" chart-series="series">
												</canvas>
											</div>

										</div>
										<div class="col-lg-6">
											<section class="panel">
												<header class="panel-heading" align="center"> Asset Doughnut Chart </header>
												<div class="panel-body text-center" ng-controller="PieCtrl">
													<canvas id="doughnut" class="chart chart-doughnut"
														chart-data="data" chart-labels="labels"
														chart-legend="true">
												</canvas>
												</div>
											</section>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>

			</section>
		</section>


		<div>
			<script type="text/ng-template" id="buyContent.html">
        <div class="modal-header">
			 <button type="button" class="close" ng-click="cancel()">&times;</button>
            <h3 class="modal-title">Buy Stock</h3>
        </div>
        <div class="modal-body" style="font-size:15px;">
            <label>Stock Symbol:  </label>
			<b style=" font-family: 'Helvetica', cursive; font-size:25px;"> {{buyItem.stockSymbol}}</b>
			<br/>
			<label>Company Name:  </label>
			<b style=" font-family: 'Helvetica', cursive; font-size:25px;"> {{buyItem.stockInfo.companyName}}</b>
			<br/>
			<label>Unit Price:  </label>
			<b style="font-family: 'Helvetica', cursive; font-size:25px;"> {{buyItem.stockInfo.price}}</b>
			<br/>
			<label>Quantity:  </label>
			<input type="number" min="1" max={{upper}} value={{quan}} ng-model="quan"/>
			<br/>	
        </div>				
        <div class="modal-footer">
		<div>		
			<h5 style="margin-right:50px"><strong>Ready to buy <span style="color:red">{{quan}}</span>
			shares of <span style="color:red">{{buyItem.stockSymbol}}</span> ? <strong></h5>
			<h5><strong>Cash after transaction: <span style="color:red">
			{{Math.round(user.cash - buyItem.stockInfo.price * quan) |currency}}</span><strong> </h5>
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
			<b style=" font-family: 'Helvetica'; font-size:25px;">{{sellItem.stockSymbol}}</b><br/>
			<label>Company Name: </label>
			<b style=" font-family: 'Helvetica'; font-size:25px;">{{sellItem.stockInfo.companyName}}</b><br/>
			<label>Unit Price: </label>
			<b style=" font-family: 'Helvetica'; font-size:25px;">{{sellItem.stockInfo.price}}</b><br/>
			<label>Open Position: </label>
			<b style=" font-family: 'Helvetica'; font-size:25px;">{{getAmount(sellItem)}}</b><br/>
			<label>Quantity: </label>
			<input type="number" min="1" max={{getAmount(sellItem)}} value={{quan}} ng-model="quan"/>
			<br/>	
        </div>				
        <div class="modal-footer">
		<div>		
			<h5 style="margin-right:50px"><strong>Ready to sell <span style="color:red">{{quan}}</span>
			shares of <span style="color:red">{{sellItem.stock.symbol}}</span>? </strong></h5>
			<h5><strong>Cash after transaction: <span style="color:red">
			{{Math.round(user.cash + sellItem.stockInfo.price * quan) | currency}}</span></strong></h5>
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

	</div>
	
