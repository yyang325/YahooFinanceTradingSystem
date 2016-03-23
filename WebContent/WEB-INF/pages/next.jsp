<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="com.mercury.beans.User" %>
	<jsp:useBean id="userInfo" scope="request" class="com.mercury.dtos.UserInfo"/>
	<h2><jsp:getProperty name="userInfo" property="message"/></h2>
	<table border="1" style="width:200px">
	<tr>
		<th>Name</th>
		<th>Age</th>
	</tr>
	<c:forEach var="user" items="${userInfo.users}">
		<tr>
			<td>${user.username}</td>
			<td>${user.firstName}</td>
		</tr>
	</c:forEach>
	<%-- 
		<%
		for (User user:userInfo.getUsers()) {
			out.print("<tr>");
			out.print("<td>" + user.getName() + "</td>");
			out.print("<td>" + user.getAge() + "</td>");
			out.print("</tr>");
		}
	%>
	--%>
	
</table>
</body>
</html>