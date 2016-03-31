<div id="watchlist_section" ng-controller="watchlistCtrl">
    <div class="row-fluid">
        <div class="col-md-12">
            <div class="page-header">
                <h2>Watch List</h2>
            </div>
            <div class="row-fluid">
                <div class="col-md-4">
                    <div class="row-fluid">
                        <div class="col-md-12">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Stock Symbol" ng-model="searchText">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">Search</button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row-fluid">
                        <div class="col-md-12">
                            <table class="table table-striped">
                                <tr ng-repeat="searchStock in stockPool | filter:searchText">
                                    <td class="col-md-6">{{ searchStock.companyName }}</td>
                                    <td class="col-md-3">{{ searchStock.stockSymbol }}</td>
                                    <td class="col-md-3"><button class="btn btn-success btn-sm" type="button">Watch</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th class="col-md-1">Stock Symbol</th>
                            <th class="col-md-3">Company Name</th>
                            <th class="col-md-2">Price</th>
                            <th class="col-md-2">Change</th>
                            <th class="col-md-2">Percentage</th>
                            <th class="col-md-2">Operation</th>
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
                                <button type="button" class="btn btn-primary-outline btn-sm">Buy</button>
                                <button type="button" class="btn btn-primary-outline btn-sm">Sell</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>