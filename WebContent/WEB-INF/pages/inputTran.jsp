<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test Transaction</title>
</head>
<body>
<h1>This is to test transaction adding</h1><hr>
<form action="testTran.html" method="post">
	<table>
		<tr>
			<td>Price</td>
			<td><input type="number" name="price" placeholder="Stock Price"></td>
		</tr>
		<tr>
			<td>Quantity</td>
			<td><input type="number" name="quantity" placeholder="Stock Quantity"></td>
		</tr>
		
		<tr>
			<td></td>
			<td>
				<input type="reset" value="Clear">
				<input type="submit" value="Submit">
			</td>
		</tr>
	</table>
</form>


<hr>
<h1>This is to test transaction history</h1><hr>
<form action="testHistoryTransaction.html" method="post">
	<table>
		<tr>
			<td>User Id</td>
			<td><input type="number" name="history_userId" placeholder="User Id"></td>
		</tr>
		<tr>
			<td>Username</td>
			<td><input type="text" name="history_username" placeholder="Username"></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="email" name="history_email" placeholder="Email"></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="reset" value="Clear">
				<input type="submit" value="Submit">
			</td>
		</tr>
	</table>
</form>

</body>
</html>