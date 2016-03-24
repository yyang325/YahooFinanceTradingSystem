<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<script src="/bower_components/jquery/dist/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var errorMsg = "<c:out value='${param.login_error}'/>"
		if (errorMsg) {
			$("#error").show();
		}
	});
</script>
<style>
	h2 {
		color: green;
	}
	#error {
		color: red;
		font-weight: bold;
		font-size: 10px;
	}
</style>
</head>
<body>
<h2>Login with username and password</h2>
<div id="error" style="display: none">
	<p>Invalid username or password</p>
</div>
<form action="j_spring_security_check" method="post">
	<table>
		<tr>
			<td>Username: </td>
			<td><input type="text" name="j_username"/></td>
		</tr>
		<tr>
			<td>password: </td>
			<td><input type="password" name="j_password"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				Remember Me
				<input type="checkbox" name="_spring_security_remember_me"/>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="reset" value="Clear"/>
				<input type="submit" value="Submit"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>