<!-- Fixed navbar -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<nav class="navbar navbar-default navbar-fixed-top" ng-controller="headerCtrl">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#home">YFTS</a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li><a href="#home">Home</a></li>
       <sec:authorize access="hasRole('USER')"> 
        	<li><a href="#watchlist">Watch List</a></li>
        	<li><a href="#portfolio">Portfolio</a></li>
        	 <li><a href="#history">History</a></li>
       </sec:authorize>
        <sec:authorize access="hasRole('ADMIN')"> 
	        <li><a href="#stock">Stock Admin</a></li>
	        <li><a href="#transaction">Transaction Admin</a></li>
	    </sec:authorize> 
       
      </ul>
      
      <sec:authorize access="hasAnyRole('ADMIN', 'USER')?false:true">
				<ul class="nav navbar-nav navbar-right col-md-2" >
			        <li style="float:right;">
	                  	<a href="#login_up">
	                  	 	<span class="glyphicon glyphicon-log-in" ></span> Sign in
	                  	</a> 	                  	
		        </li>
		    </ul>
      </sec:authorize>
      
      <sec:authorize access="hasAnyRole('ADMIN', 'USER')">
                  <ul class="nav navbar-nav navbar-right" ng-controller="navCtrl">
                  	<li><a>
      					<span>{{datetime.hours}}</span>:<span>{{datetime.minutes}}</span>:<span>{{datetime.seconds}}</span>
      					</a>
      				</li>
                  	<li>
                  		<a class="fa fa-user fa-2x"></a>
                  	</li>
                  	 <li>
                        <a><b>Hello, {{user.username}}</b></a>
                    </li>
                    <li>
                        <a href="<c:url value='/j_spring_security_logout'/>"><i class="icon_key_alt"></i>Logout</a>
                    </li>
                  </ul>
                  
      </sec:authorize>

      <ul class="nav navbar-nav navbar-right" ng-controller="navCtrl">
      	<li><a>
      		<span>{{datetime.hours}}</span>:<span>{{datetime.minutes}}</span>:<span>{{datetime.seconds}}</span>
      		</a>
      	</li>
        <li><a href="#logout"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a></li>
      </ul> 
    </div><!--/.nav-collapse -->

  </div>
</nav>