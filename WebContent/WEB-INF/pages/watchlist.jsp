<div id="watchlist_section" ng-controller="watchlistCtrl">
    <div class="row-fluid">
        <div class="col-md-12">
            <!-- <div class="page-header">
                <h2>Watch List</h2>
            </div> -->
            <div class="row-fluid">
            	<div class="col-lg-12">
						<section class="panel panel-info">
							<header class="panel-heading" align="center">
							</header>
							<div class="panel-body">
								<div style="text-align: center">
									<span style="font-size: 32px; line-height: 40px; padding-top: 20px; font-weight: 700; font-family: Open Sans; text-align: center;
	    							letter-spacing: 1px;">My Watchlist</span>
								</div>
							</div>
						</section>
					</div>
            </div>
            <div class="row-fluid">
            
            
                <div class="col-md-4">
                	<div ng-controller="ModalCtrl">
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
									
								
									</div>
								</div>
							</div>
						</section>
				</div>
                	
                    <div class="row-fluid">
                    	<section class="panel panel-info">
							<header class="panel-heading" align="center">
							</header>
							<div class="panel-body" class="col-md-12">
								<div class="input-group">
                                <input type="text" class="form-control" placeholder="Stock Symbol" ng-model="searchText">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">Search</button>
                                </span>
                            </div>
							</div>
						</section>
                    	
                    </div>
             
                    <div class="row-fluid">
                 
                       	<section class="panel panel-info">
							<header class="panel-heading" align="center">
							</header>
							<div class="panel-body" class="col-md-12">
								<table class="table table-striped">
                                <tr ng-repeat="searchStock in stockPool | filter:searchText">
                                    <td class="col-md-6">{{ searchStock.companyName }}</td>
                                    <td class="col-md-3">{{ searchStock.stockSymbol }}</td>
                                    <td class="col-md-3"><button class="btn btn-success btn-sm" type="button">Watch</button></td>
                                </tr>
                            </table>
							</div>
						</section>
                           
                    </div>
                </div>

                <div class="col-md-8" ng-controller="ModalCtrlInWatch">
                	<section class="panel panel-info">
							<header class="panel-heading" align="center">
								<p style="font-size: 20px">Watched Stocks</p>
							</header>
							<div class="panel-body" class="col-md-12">
								<table class="table table-bordered table-striped">
			                        <tr>
			                            <th class="col-md-1">Symbol</th>
			                            <th class="col-md-3">Company</th>
			                            <th class="col-md-2">Price</th>
			                            <th class="col-md-2">Change</th>
			                            <th class="col-md-2">Change(%)</th>
			                            <th class="col-md-2">Action</th>
			                        </tr>
			                        <tr ng-repeat="stock in stocks | orderBy: 'stockSymbol'">
			                            <td>{{ stock.stockSymbol }}</td>
			                            <td>{{ stock.companyName }}</td>
			                            <td>
											<b ng-if="stock.change>0" style="color:green">{{stock.price}}</b>
											<b ng-if="stock.change<0" style="color:red">{{stock.price}}</b>
											<b ng-if="stock.change==0" style="color:black">{{stock.price}}</b>
										</td>
			                            <td>
											<b ng-if="stock.change>0" style="color:green">{{stock.change}}</b>
											<b ng-if="stock.change<0" style="color:red">{{stock.change}}</b>
											<b ng-if="stock.change==0" style="color:black">{{stock.change}}</b>
										</td>
										<td>
											<b ng-if="stock.change>0" style="color:green">{{stock.pchange}}</b>
											<b ng-if="stock.change<0" style="color:red">{{stock.pchange}}</b>
											<b ng-if="stock.change==0" style="color:black">{{stock.pchange}}</b>
										</td>
			                            <td>
			                                <div class="btn-group">
												<!--   <a class="btn btn-primary" href="#" ng-click="pass(stock); openBuy()">Buy</a> -->
												<a class="btn btn-success" href="#watchlist"
													ng-click="pass(stock); openBuy()">Buy</a>
											</div>
			                            </td>
			                        </tr>
                    			</table>
							</div>
					</section>
                
                <div>
                
			<script type="text/ng-template" id="buyContentInWatch.html">
        	<div class="modal-header">
			 <button type="button" class="close" ng-click="cancel()">&times;</button>
            <h3 class="modal-title">Buy Stock</h3>
        	</div>
        		<div class="modal-body" style="font-size:15px;">
            <label>Stock Symbol:  </label>
			<b style=" font-family: 'Helvetica', cursive; font-size:25px;"> {{buyItem.stockSymbol}}</b>
			<br/>
			<label>Company Name:  </label>
			<b style=" font-family: 'Helvetica', cursive; font-size:25px;"> {{buyItem.companyName}}</b>
			<br/>
			<label>Unit Price:  </label>
			<b style="font-family: 'Helvetica', cursive; font-size:25px;"> {{buyItem.price}}</b>
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
			{{Math.round(user.cash - buyItem.price * quan) |currency}}</span><strong> </h5>
			</div>
           		 <button class="btn btn-success" type="button" ng-click="ok()">OK</button>
           		 <button class="btn btn-default" type="button" ng-click="cancel()">Cancel</button>
       		 </div>
    	</script>
                    
                </div>
            </div>
        </div>
    </div>
</div>