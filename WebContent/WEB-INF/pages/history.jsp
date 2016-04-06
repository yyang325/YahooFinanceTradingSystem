
	
	
	
	<div class="container">
		<section id="main-content">
			<section class="wrapper">
				<!-- page starts -->
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<section class="panel panel-info">
							<header class="panel-heading" align="center">
								<p style="font-size: 20px">Transaction History</p>
							</header>
							<div class="panel-body">
								<table class="table table-bordered table-striped">
									<tr>
										<th>Stock Symbol</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Type</th>
										<th>Date</th>
										<th>Status</th>
									</tr>
									<tr ng-repeat="history in historyRecords">
										<td>{{ history.stockSymbol }}</td>
										<td>{{ history.price }}</td>
										<td>{{ history.quantity }}</td>
										<td>{{ history.type }}</td>
										<td>{{ history.date }}</td>
										<td>{{ history.status }}</td>
									</tr>
								</table>
							</div>
						</section>
					</div>
				</div>

		</section>		
	</section>				
  </div>
	
