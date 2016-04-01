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

                <div class="col-md-8">
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
                
                    
                </div>
            </div>
        </div>
    </div>
</div>