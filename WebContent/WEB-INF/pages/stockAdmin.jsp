<h1>Stock Admin Part</h1>
<hr>
<!-- Add new stock into the stock pool -->
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
				<button type="submit" ng-click="addNewStock()">Add Stock</button>
			</td>
		</tr>
	</table>
</form>

<!-- Query All Stock in the stock pool -->
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