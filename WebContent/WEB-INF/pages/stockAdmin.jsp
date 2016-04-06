<div class="container">
		<section id="main-content">
			<section class="wrapper">
				<!-- page starts -->
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<section class="panel panel-info">
							<header class="panel-heading" align="center">
								<p style="font-size: 20px">Welcome:</p>
							</header>
							<div class="panel-body">
								<div style="text-align: center">
									<span style="font-size: 20px"><b>Admin</b></span>
								</div>
							</div>
						</section>
					</div>
				</div>

				<div class="col-lg-4 col-md-12">
					<section class="panel panel-info">
						<header class="panel-heading" align="center">
							<p style="font-size: 20px">Stock Administration</p>
						</header>
						<div class="panel-body">
							<form>
								<table class="table table-bordered">
									<tr>
										<th>Stock Symbol</th>
										<td><input type="text" ng-model="newStock.symbol" placeholder="Stock Symbol"></td>
									</tr>
									<tr>
										<th>Company Description</th>
										<td><input type="text" ng-model="newStock.stockDesc" placeholder="Company Description"></td>
									</tr>
									<tr>
										<td>
											<button type="reset">Clear</button>
										</td>
										<td>
											<button type="submit" ng-click="addNewStock()">Add Stock</button>
										</td>
									</tr>
								</table>
							</form>
			
						</div>
					</section>
				</div>
				
				<div class="col-lg-8 col-md-12">
					<section class="panel panel-info">
						<header class="panel-heading" align="center">
							<p style="font-size: 20px">Stock Pool</p>
						</header>
						<div class="panel-body">
							<table class="table table-striped">
								<tr>
									<th>Stock Symbol</th>
									<th>Stock Description</th>
								</tr>
								<tr ng-repeat="stock in stockPool | orderBy: 'symbol'">
									<td>{{stock.symbol}}</td>
									<td>{{stock.stockDesc}}</td>
								</tr>
							</table>
						</div>
					</section>
				</div>

		</section>		
	</section>				
  </div>