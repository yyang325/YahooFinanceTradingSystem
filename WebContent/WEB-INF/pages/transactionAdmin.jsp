<h1>Transaction Admin</h1>
<div ng-controller="transactionCtrl">
	<!-- All Pending Transaction -->
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
	<hr>
	
	<!-- All Committed Transaction -->
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