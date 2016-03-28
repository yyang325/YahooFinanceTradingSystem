
	<div class="container-fluid">
		<div class="top headerLinks">
			
			<ul class="nav navbar-nav navbar-right col-md-2" >
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')?false:true">
				
			        <li style="float:right;">
	                  	<a href="login#login_up">
	                  	 	<span class="glyphicon glyphicon-log-in" ></span> Sign in
	                  	</a> 
		        </li>
		   
		    </sec:authorize>
		    <sec:authorize access="hasRole('ROLE_ADMIN')">
              	<li style="float:right;">	
					<span style="font-size:25px;"><strong></strong></span>
              	</li>  
            </sec:authorize>  
             </ul>
		</div>
		</div>
	
	
      
      <nav id="tf-menu" class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="#tf-home">YFTS</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="home" class="page-scroll">Home</a></li>
					<li><a href="marketdata" class="page-scroll">MarketData</a></li>
					<sec:authorize access="hasRole('ROLE_USER')">
					<li><a href="portfolio" class="page-scroll">My Portfolio</a></li>
					<li><a href="history" class="page-scroll">History</a></li>
					</sec:authorize>
					
					 <sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="pending" class="page-scroll">Recent Transaction</a></li>
					<li><a href="stock" class="page-scroll">Stock Manage</a></li>
						</sec:authorize>
				</ul>
				
				<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')?false:true">
				<ul class="nav navbar-nav navbar-right col-md-2" >
			        <li style="float:right;">
	                  	<a href="#login_up">
	                  	 	<span class="glyphicon glyphicon-log-in" ></span> Sign in
	                  	</a> 	                  	
		        </li>
		    </ul>
		    </sec:authorize>
		     <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                  <ul class="nav navbar-nav pull-right">
                  <!-- user login dropdown start-->
                  <li class="dropdown" ng-controller="headerCtrl">
                      <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                          <span class="profile-ava">
                              <img alt="" src="icon/user.png" width="30" height="30">
                          </span>
                          <span class="username">Hello, {{user.userName}}</span>
                          <b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu extended logout">
                          <li class="prof-info-container">
                          	<div class="profile-ava prof-big"><img alt="" src="icon/user.png" width="50" height="50"></div>
                          	<div class="prof-info">
                          		<ul>
                          			<li>{{user.firstName}} {{user.lastName}}</li>
                          			<li>{{user.email}}
                          		</ul>                          	
                          	</div>
                          </li>
                          <li>
                          	<a href="<c:url value='/j_spring_security_logout'/>"><i class="icon_key_alt"></i>Logout</a>
                          </li>
                      </ul>
                  </li>
                 	</ul>
                  </sec:authorize>
		    
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	