<h1>{{message}}</h1>
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