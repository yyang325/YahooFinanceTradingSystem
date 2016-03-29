<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmation</title>

<!-- for header and footer -->
 <link href="css/landing-page.css" rel="stylesheet"> 
<link href="css/stylesheet.css" rel="stylesheet">
<script src="js/header.js"></script>

<!-- Bootstrap -->
<link href="bower_component/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bower_component/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- font-awesome -->
<link rel="stylesheet" type="text/css" href="bower_component/fontawesome/css/font-awesome.min.css">

<!-- owl Slider -->
<!-- need attention here -->
<link href="bower_component/owl/owl-carousel/owl.carousel.css" rel="stylesheet" media="screen">


</head>
<body>
	<c:import url="page_component/header.jsp"/>	
	
	<div class="confirmation">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="intro-message">
						<h2 style="font-family: 'Dosis', sans-serif; font-size: 75px">
							${userInfo.message}</h2>
						<p style="font-size: 38px">Please check your email.
						</h2>
					</div>
				</div>
			</div>

		</div>
	</div>

	<c:import url="page_component/footer.jsp"></c:import>
	
</body>
</html>