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

				<div class="col-lg-12 col-md-12">
					<section class="panel panel-info">
						<header class="panel-heading" align="center">
							<p style="font-size: 20px">Pending Transactions</p>
						</header>
						<div class="panel-body">
							<table class="table table-striped">
								<tr>
									<th>Username</th>
									<th>Stock Symbol</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Type</th>
									<th>Status</th>
									<th>Date</th>
									<th>Operation</th>
								</tr>
								<tr ng-repeat="tran in pendingTran">
									<td>{{tran.username}}</td>
									<td>{{tran.stockSymbol}}</td>
									<td>{{tran.price}}</td>
									<td>{{tran.quantity}}</td>
									<td>{{tran.type}}</td>
									<td>{{tran.status}}</td>
									<td>{{tran.date}}</td>
									<td>
										<button type="button" class="btn btn-default btn-success" ng-click="submitPending($index)">Submit</button>
										<button type="button" class="btn btn-default btn-danger" ng-click="dropPending($index)">Drop</button>
									</td>
								</tr>
							</table>
			
						</div>
					</section>
				</div>
				
				<div class="col-lg-12 col-md-12">
					<section class="panel panel-info">
						<header class="panel-heading" align="center">
							<p style="font-size: 20px">Commited Transactions</p>
						</header>
						<div class="panel-body">
							<table class="table table-striped">
								<tr>
									<th>Username</th>
									<th>Stock Symbol</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Type</th>
									<th>Status</th>
									<th>Date</th>
								</tr>
								<tr ng-repeat="tran in committedTran">
									<td>{{tran.username}}</td>
									<td>{{tran.stockSymbol}}</td>
									<td>{{tran.price}}</td>
									<td>{{tran.quantity}}</td>
									<td>{{tran.type}}</td>
									<td>{{tran.status}}</td>
									<td>{{tran.date}}</td>
								</tr>
							</table>
						</div>
					</section>
				</div>

		</section>		
	</section>				
  </div>
