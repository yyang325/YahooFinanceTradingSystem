<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello Page</title>

<style>
	h1{
		color: red;
		text-shadow: 5px 5px 5px orange;
	}
	
	.round {
		border-radius: 10px;
	}
	
	#error{
		color: red;
		font-size: 10px;
	}
	
</style>
</head>
<body>

<h1>This is a Test for adding stock</h1>

<form action="testStock.html" method="post">
	<table>
		<tr>
			<td>Stock Symbol</td>
			<td><input type="text" name="symbol" placeholder="Your Stock Symbol"></td>
		</tr>
		<tr>
			<td>Stock Desc</td>
			<td><input type="text" name="stockDesc" placeholder="Your Stock Desc"></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="reset" value="Clear" class="round">
				<input type="submit" value="Submit" class="round">
			</td>
		</tr>
	</table>
</form>

</body>
</html>