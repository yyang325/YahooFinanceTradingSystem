<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result Page</title>
<style type="text/css">
	h2{
		color: green;
	}
</style>
</head>
<body>

<%@page import="com.mercury.beans.UserStockTransaction" %>
<table border="1" style="width: 200px">
	<tr>
		<th>TranId</th>
		<th>UserId</th>
		<th>StockId</th>
		<th>TimeStamp</th>
		<th>Price</th>
		<th>Quantity</th>
	</tr>
	
	<c:forEach var="tran" items="${trans}">
		<tr>
			<td>${tran.tid}</td>
			<td>${tran.uid}</td>
			<td>${tran.sid}</td>
			<td>${tran.ts}</td>
			<td>${tran.price}</td>
			<td>${tran.quantity}</td>
		</tr>
	</c:forEach>
	 
</table>
</body>
</html>