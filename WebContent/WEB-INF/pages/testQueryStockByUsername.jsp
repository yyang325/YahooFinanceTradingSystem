<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test Transaction</title>
</head>
<body>
<h1>This is to test Query Stock by Username & Email</h1><hr>
<form action="testTran3.html" method="post">
	<table>
		<tr>
			<td>Username</td>
			<td><input type="text" name="username" placeholder="Username"></td>
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

<form action="testTran4.html" method="post">
	<table>
		<tr>
			<td>Email</td>
			<td><input type="text" name="email" placeholder="Email"></td>
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

<h1>This is to test Query User by Stock Symbol</h1><hr>
<form action="testTran5.html" method="post">
	<table>
		<tr>
			<td>Symbol</td>
			<td><input type="text" name="symbol" placeholder="Stock Symbol"></td>
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
<h1>Test Adding and Query Watch List</h1>
<form action="testWatchlist1.html" method="post">
	<table>
		<tr>
			<td>UserId</td>
			<td><input type="number" name="userId" placeholder="User Id"></td>
		</tr>
		<tr>
			<td>StockId</td>
			<td><input type="number" name="stockId" placeholder="Stock Id"></td>
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