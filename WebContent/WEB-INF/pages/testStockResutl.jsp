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

<%@page import="com.mercury.beans.Stock" %>
<table border="1" style="width: 200px">
	<tr>
		<th>Stock Symbol</th>
		<th>Stock Desc</th>
	</tr>
	
	<c:forEach var="stock" items="${stocks}">
		<tr>
			<td>${stock.symbol}</td>
			<td>${stock.stockDesc}</td>
		</tr>
	</c:forEach>
	 
</table>
</body>
</html>