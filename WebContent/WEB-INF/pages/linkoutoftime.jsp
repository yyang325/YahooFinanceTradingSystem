<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- for header and footer -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/extra/bootstrap-theme.css" rel="stylesheet">
<link href="css/extra/elegant-icons-style.css" rel="stylesheet" />
<link href="css/extra/font-awesome.min.css" rel="stylesheet" />    
<link href="css/extra/style.css" rel="stylesheet">
<script src="js/angular.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
#time, p {
	text-align:center;
	font-family: 'Unkempt', cursive;
	letter-spacing: 2px;
	font-weight: 700;
}
</style>
</head>
<body>
<section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-8" style="float:none;margin:auto;text-align:center">
				 <section class="panel">
				 <div class="panel-body">
				 <h1><span id="time">10</span></h1>
	<br>
<h1>linkoutoftime!!!!!!!!!!!!!!!!!</h1>
<script type="text/javascript">
	function delayURL(url) {
   		var delay=document.getElementById("time").innerHTML;
   		if(delay>0){
   			delay--;
   			document.getElementById("time").innerHTML=delay;
   		} else {
   			window.top.location.href=url;
   		}
		setTimeout("delayURL('" + url + "')", 1000);
	}
</script>
	
	<h2><a href="http://localhost:8080/YFTS/login.html">This page will goto Yahoo Finance page after 10 seconds, if not click this link</a></h2>
	</div>
	</section>
	</div>
	</div>
	</section>
	</section>
<script type="text/javascript">
	delayURL("http://localhost:8080/YFTS/login.html");
</script>
</body>
</html>