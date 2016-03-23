<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- Form -->
	<form action="next.html" method="post" id="loginForm">
		<table>
			<tr>
				<td>Username:</td>
				<td><input type="text" name="username" id="j_userName" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" id="j_passWord" /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="email" name="email" id="j_email" /></td>
			</tr>
			<tr>
				<td>Firstname:</td>
				<td><input type="text" name="firstName" id="j_firstName" /></td>
			</tr>
			<tr>
				<td>Lastname:</td>
				<td><input type="text" name="lastName" id="j_lastName" /></td>
			</tr>
			<tr>
				<td>Cash:</td>
				<td><input type="number" name="cash" id="j_cash" min="0" /></td>
			</tr>
			<tr>
				<td>Balance:</td>
				<td><input type="number" name="balance" id="j_balance" min="0" /></td>
			</tr>
			<tr>
				<td>Authority:</td>
				<td><input type="text" name="authority" id="j_autority" /></td>
			</tr>
			<tr>
				<td>Enabled:</td>
				<td><input type="number" name="enabled" id="j_enabled" min="0"
					max="1" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="reset" value="Clear" /> <input type="submit"
					value="Submit" /></td>
			</tr>
		</table>
	</form>

</body>
</html>