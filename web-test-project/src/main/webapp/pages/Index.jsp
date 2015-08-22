<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Basic Page Needs
    ================================================== -->
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Index</title>
<meta name="description" content="Your Description Here">
<meta name="keywords"
	content="free boostrap, bootstrap template, freebies, free theme, free website, free portfolio theme, portfolio, personal, cv">
<meta name="author" content="Jenn, ThemeForces.com">

<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/apple-touch-icon-114x114.png">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/forIndex/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/font-awesome-4.2.0/css/font-awesome.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/forIndex/jasny-bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/forIndex/animate.css">

<!-- Slider
    ================================================== -->
<link
	href="<%=request.getContextPath()%>/resources/css/forIndex/owl.carousel.css"
	rel="stylesheet" media="screen">
<link
	href="<%=request.getContextPath()%>/resources/css/forIndex/owl.theme.css"
	rel="stylesheet" media="screen">

<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/forIndex/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/forIndex/responsive.css">


<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/forIndex/modernizr.custom.js"></script>

<!-- This is used, because url attribute is not able to read in style.css file. -->
<style type="text/css">
#home {
	background:
		url("<%=request.getContextPath()%>/resources/images/forIndex/bg1.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	height: auto;
	min-height: 710px;
	padding-top: 60px;
	color: #ffffff;
}

#overview-video {
	background:
		url("<%=request.getContextPath()%>/resources/images/forIndex/bg2.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: scroll;
	text-align: center;
}

#clients {
	background:
		url("<%=request.getContextPath()%>/resources/images/forIndex/bg3.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	text-align: center;
}

#testimonials {
	background:
		url("<%=request.getContextPath()%>/resources/images/forIndex/bg4.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: scroll;
	text-align: center;
}
</style>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<!-- Off Canvas Navigation
    ================================================== -->
	<div class="navmenu navmenu-default navmenu-fixed-left offcanvas">
		<!--- Off Canvas Side Menu -->
		<div class="close" data-toggle="offcanvas" data-target=".navmenu">
			<span class="fa fa-close"></span>
		</div>
		<div class="add-margin"></div>
		<ul class="nav navmenu-nav">
			<!--- Menu -->
			<li><a href="#home" class="page-scroll">Home</a></li>
			<li><a href="#meet-us" class="page-scroll">Overview</a></li>
			<li><a href="#services" class="page-scroll">Services</a></li>
			<li><a href="#works" class="page-scroll">Portfolio</a></li>
			<li><a href="#about-us" class="page-scroll">About Us</a></li>
			<li><a href="#contact" class="page-scroll">Contact Us</a></li>
		</ul>
		<!--- End Menu -->
	</div>
	<!--- End Off Canvas Side Menu -->

	<!-- Home Section -->
	<div id="home">
		<div class="container text-center">
			<!-- Navigation -->
			<nav id="menu" data-toggle="offcanvas" data-target=".navmenu">
				<span class="fa fa-bars"></span>
			</nav>

			<div class="content">
				<h4>We've got the special power</h4>
				<hr>
				<div class="header-text btn">
					<h1>
						<span id="head-title"></span>
					</h1>
				</div>
			</div>

			<a href="#meet-us" class="down-btn page-scroll"> <span
				class="fa fa-angle-down"></span>
			</a>
		</div>
	</div>

	<!-- Meet Us Section -->
	<div id="meet-us">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-8 col-md-offset-2">
					<div class="section-title">
						<h2>Meet Us</h2>
						<hr>
					</div>
					<p>At vero eos et accusamus et iusto odio dignissimos ducimus
						qui blanditiis praesentium voluptatum deleniti atque corrupti quos
						dolores et quas molestias excepturi sint occaecati cupiditate non
						provident.</p>
					<a href="#services" class="down-btn page-scroll"> <span
						class="fa fa-angle-down"></span>
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Overview Video Section -->
	<div id="overview-video">
		<div class="overlay">
			<div class="container">
				<a href="#"> <span class="fa fa-play"></span>
				</a>
			</div>
		</div>
	</div>

	<!-- Services Section -->
	<div id="services">
		<div class="container text-center">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="section-title">
						<h2>Services</h2>
						<hr>
					</div>
					<p>At vero eos et accusamus et iusto odio dignissimos ducimus
						qui blanditiis praesentium voluptatum deleniti atque corrupti quos
						dolores et quas molestias excepturi sint occaecati cupiditate non
						provident.</p>
				</div>
			</div>

			<div class="space"></div>

			<div class="row">
				<div class="col-md-4 col-sm-4">
					<div class="service">
						<span class="fa fa-book fa-3x"></span>
						<h4>Branding</h4>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit. At vero eos et
							accusamus et iusto odio dignissimos ducimus qui blanditiis.</p>
					</div>
				</div>

				<div class="col-md-4 col-sm-4">
					<div class="service">
						<span class="fa fa-bicycle fa-3x"></span>
						<h4>Web Devepment</h4>
						<p>Donec sed odio dui. Nullam quis risus eget urna mollis
							ornare vel eu leo. Cum sociis natoque penatibus et magnis dis
							parturient montes, nascetur ridiculus mus. Accusamus et. At vero
							eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
						</p>
					</div>
				</div>

				<div class="col-md-4 col-sm-4">
					<div class="service">
						<span class="fa fa-plug fa-3x"></span>
						<h4>App Design</h4>
						<p>Nulla vitae elit libero, a pharetra augue. At vero eos et
							accusamus et iusto odio dignissimos ducimus. Aenean lacinia
							bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque
							ornare sem lacinia quam venenatis vestibulum.</p>
					</div>
				</div>
			</div>
			<a href="#works" class="down-btn page-scroll"> <span
				class="fa fa-angle-down"></span>
			</a>
		</div>
	</div>

	<!-- Call-to-Action Section -->
	<div id="cta">
		<div class="container text-center">

			<!-- Test Login Functionality. - START -->

			<a class="btn go-to-btn" href="javascript:;" data-toggle="modal"
				data-target="#loginModal">User</a>

			<!-- -Login Modal -->
			<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
				aria-labelledby="loginModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content login-modal">
						<div class="modal-header login-modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title text-center" id="loginModalLabel">USER
								AUTHENTICATION</h4>
						</div>
						<div class="modal-body">
							<div class="text-center">
								<div role="tabpanel" class="login-tab">
									<!-- Nav tabs -->
									<ul class="nav nav-tabs" role="tablist">
										<li role="presentation" class="active"><a
											id="signin-taba" href="#login" aria-controls="login"
											role="tab" data-toggle="tab">Sign In</a></li>
										<li role="presentation"><a id="signup-taba"
											href="#profile" aria-controls="profile" role="tab"
											data-toggle="tab">Sign Up</a></li>
										<li role="presentation"><a id="forgetpass-taba"
											href="#forget_password" aria-controls="forget_password"
											role="tab" data-toggle="tab">Forget Password</a></li>
									</ul>

									<!-- Tab panes -->
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane active text-center"
											id="login">
											&nbsp;&nbsp; <span id="login_fail" class="response_error"
												style="display: none;">Loggin failed, please try
												again.</span>
											<div class="clearfix"></div>
											<!-- <form> -->
											<form action="<c:url value='/j_spring_security_check' />"
												method='POST'>
												<div class="form-group">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-user"></i>
														</div>
														<input type="text" class="form-control" name="username"
															id="username" placeholder="Username">
													</div>
													<span class="help-block has-error" id="email-error"></span>
												</div>
												<div class="form-group">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-lock"></i>
														</div>
														<input type="password" class="form-control"
															name="password" id="password" placeholder="Password">
													</div>
													<span class="help-block has-error" id="password-error"></span>
												</div>
												<button type="submit" id="login_btn"
													class="btn btn-block bt-login"
													data-loading-text="Signing In....">Login</button>
												<div class="clearfix"></div>
												<div class="login-modal-footer">
													<div class="row">
														<div class="col-xs-8 col-sm-8 col-md-8">
															<i class="fa fa-lock"></i> <a href="javascript:;"
																class="forgetpass-tab"> Forgot password? </a>

														</div>

														<div class="col-xs-4 col-sm-4 col-md-4">
															<i class="fa fa-check"></i> <a href="javascript:;"
																class="signup-tab"> Sign Up </a>
														</div>
													</div>
												</div>
											</form>
										</div>
										<div role="tabpanel" class="tab-pane" id="profile">
											&nbsp;&nbsp; <span id="registration_fail"
												class="response_error" style="display: none;">Registration
												failed, please try again.</span>
											<div class="clearfix"></div>
											<form>
												<div class="form-group">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-user"></i>
														</div>
														<input type="text" class="form-control" id="username"
															placeholder="Username">
													</div>
													<span class="help-block has-error" data-error='0'
														id="username-error"></span>
												</div>
												<div class="form-group">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-at"></i>
														</div>
														<input type="text" class="form-control" id="remail"
															placeholder="Email">
													</div>
													<span class="help-block has-error" data-error='0'
														id="remail-error"></span>
												</div>
												<button type="button" id="register_btn"
													class="btn btn-block bt-login"
													data-loading-text="Registering....">Register</button>
												<div class="clearfix"></div>
												<div class="login-modal-footer">
													<div class="row">
														<div class="col-xs-8 col-sm-8 col-md-8">
															<i class="fa fa-lock"></i> <a href="javascript:;"
																class="forgetpass-tab"> Forgot password? </a>

														</div>

														<div class="col-xs-4 col-sm-4 col-md-4">
															<i class="fa fa-check"></i> <a href="javascript:;"
																class="signin-tab"> Sign In </a>
														</div>
													</div>
												</div>
											</form>
										</div>
										<div role="tabpanel" class="tab-pane text-center"
											id="forget_password">
											&nbsp;&nbsp; <span id="reset_fail" class="response_error"
												style="display: none;"></span>
											<div class="clearfix"></div>
											<form>
												<div class="form-group">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-user"></i>
														</div>
														<input type="text" class="form-control" id="femail"
															placeholder="Email">
													</div>
													<span class="help-block has-error" data-error='0'
														id="femail-error"></span>
												</div>

												<button type="button" id="reset_btn"
													class="btn btn-block bt-login"
													data-loading-text="Please wait....">Forget
													Password</button>
												<div class="clearfix"></div>
												<div class="login-modal-footer">
													<div class="row">
														<div class="col-xs-6 col-sm-6 col-md-6">
															<i class="fa fa-lock"></i> <a href="javascript:;"
																class="signin-tab"> Sign In </a>

														</div>

														<div class="col-xs-6 col-sm-6 col-md-6">
															<i class="fa fa-check"></i> <a href="javascript:;"
																class="signup-tab"> Sign Up </a>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- - Login Model Ends Here -->

			<!-- Test Login Functionality. - END -->

		</div>
	</div>

	<!-- Portfolio Section -->
	<div id="works">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-8 col-md-offset-2">
					<div class="section-title">
						<h2>Our Latest Projects</h2>
						<hr>
					</div>
					<p>At vero eos et accusamus et iusto odio dignissimos ducimus
						qui blanditiis praesentium voluptatum deleniti atque corrupti quos
						dolores et quas molestias excepturi sint occaecati cupiditate non
						provident.</p>
				</div>
			</div>
			<div class="space"></div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3 col-sm-6 nopadding">
					<div class="portfolio-item">
						<div class="hover-bg">
							<a href="#">
								<div class="hover-text">
									<h5>Logo Design</h5>
									<p class="lead">Client Seal</p>
									<div class="hline"></div>
								</div> <img
								src="<%=request.getContextPath()%>/resources/images/forIndex/portfolio/01.jpg"
								class="img-responsive" alt="...">
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 nopadding">
					<div class="portfolio-item">
						<div class="hover-bg">
							<a href="#">
								<div class="hover-text">
									<h5>Stationery</h5>
									<p class="lead">Design Project</p>
									<div class="hline"></div>
								</div> <img
								src="<%=request.getContextPath()%>/resources/images/forIndex/portfolio/02.jpg"
								class="img-responsive" alt="...">
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 nopadding">
					<div class="portfolio-item">
						<div class="hover-bg">
							<a href="#">
								<div class="hover-text">
									<h5>Branding</h5>
									<p class="lead">Metalbrand</p>
									<div class="hline"></div>
								</div>
							</a> <img
								src="<%=request.getContextPath()%>/resources/images/forIndex/portfolio/03.jpg"
								class="img-responsive" alt="...">
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 nopadding">
					<div class="portfolio-item">
						<div class="hover-bg">
							<a href="#">
								<div class="hover-text">
									<h5>Business Card</h5>
									<p class="lead">Clothing Line</p>
									<div class="hline"></div>
								</div>
							</a> <img
								src="<%=request.getContextPath()%>/resources/images/forIndex/portfolio/04.jpg"
								class="img-responsive" alt="...">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="space"></div>
		<div class="text-center">
			<a href="#" class="btn read-more-btn">Check on Dribbble</a> <br>
			<a href="#about-us" class="down-btn page-scroll"><span
				class="fa fa-angle-down"></span></a>
		</div>
	</div>

	<!-- Clients Section -->
	<div id="clients">
		<div class="overlay">
			<div class="container text-center">
				<div class="section-title">
					<h2>Our Partners</h2>
					<hr>
				</div>

				<ul class="clients">
					<li><a href="#"><img
							src="<%=request.getContextPath()%>/resources/images/forIndex/clients/01.png"
							class="img-responsive" alt="..."></a></li>
					<li><a href="#"><img
							src="<%=request.getContextPath()%>/resources/images/forIndex/clients/02.png"
							class="img-responsive" alt="..."></a></li>
					<li><a href="#"><img
							src="<%=request.getContextPath()%>/resources/images/forIndex/clients/03.png"
							class="img-responsive" alt="..."></a></li>
					<li><a href="#"><img
							src="<%=request.getContextPath()%>/resources/images/forIndex/clients/04.png"
							class="img-responsive" alt="..."></a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- About Us Section -->
	<div id="about-us">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-8 col-md-offset-2">
					<div class="section-title">
						<h2>About Us</h2>
						<hr>
					</div>
					<p>At vero eos et accusamus et iusto odio dignissimos ducimus
						qui blanditiis praesentium voluptatum deleniti atque corrupti quos
						dolores et quas molestias excepturi sint occaecati cupiditate non
						provident.</p>
				</div>
			</div>
			<div class="space"></div>
			<div class="row">
				<div class="col-md-10 col-sm-10">
					<div class="row">
						<div class="col-md-4 col-sm-4">
							<div class="team">
								<img
									src="<%=request.getContextPath()%>/resources/images/forIndex/team/02.jpg"
									class="img-responsive img-circle" alt="..."> <br>
								<h4>Akriti Mahajan</h4>
								<p class="small">CEO/Founder</p>
								<hr>
							</div>
						</div>

						<div class="col-md-4 col-sm-4">
							<div class="team">
								<img
									src="<%=request.getContextPath()%>/resources/images/forIndex/team/lionel-messi.jpg"
									class="img-responsive img-circle" alt="..."> <br>
								<h4>Lionel Messi</h4>
								<p class="small">Web Coder</p>
								<hr>
							</div>
						</div>

						<div class="col-md-4 col-sm-4">
							<div class="team">
								<img
									src="<%=request.getContextPath()%>/resources/images/forIndex/team/03.jpg"
									class="img-responsive img-circle" alt="..."> <br>
								<h4>Abhishek Mahajan</h4>
								<p class="small">Web Designer</p>
								<hr>
							</div>
						</div>

					</div>
				</div>

				<div class="col-md-2 col-sm-2">
					<div class="team hire">
						<h4>We Are Hiring!</h4>
						<hr>
						<div class="space"></div>
						<a href="#"> <span class="fa fa-paper-plane-o fa-2x"></span>
						</a>
					</div>
				</div>
			</div>

			<div class="text-center">
				<a href="#contact" class="page-scroll down-btn"> <span
					class="fa fa-angle-down"></span>
				</a>
			</div>

		</div>
	</div>

	<!-- Testimonial Section -->
	<div id="testimonials">
		<div class="overlay">
			<div class="container">
				<div class="section-title">
					<h2>What my Clients Say...</h2>
					<hr>
				</div>

				<div id="testimonial" class="owl-carousel owl-theme">
					<div class="item">
						<h3>
							Et iusto odio dignissimos ducimus qui blanditiis <br>praesentium
							voluptatum deleniti atque corrupti quos dolores et quas molestias
							excepturi sint <br>occaecati cupiditate non provident.
						</h3>
						<br>
						<h6>LJ, Abc Company</h6>
					</div>

					<div class="item">
						<h3>
							Fusce dapibus, tellus ac cursus commodo, tortor<br> mauris
							condimentum. Duis mollis, est non commodo luctus, nisi erat
						</h3>
						<br>
						<h6>Kai, Web Geekster</h6>
					</div>

					<div class="item">
						<h3>
							Cras justo odio, dapibus ac facilisis in, egestas <br>eget
							quam. Donec id elit non mi porta gravida at eget metus.
						</h3>
						<br>
						<h6>Jenn, Coders' Playground</h6>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact Section -->
	<div id="contact">
		<div class="container">
			<div class="section-title text-center">
				<h2>Contact Us</h2>
				<hr>
			</div>
			<div class="space"></div>

			<div class="row">
				<div class="col-md-3">
					<address>
						<strong>Address</strong><br> <br> ShivaBlast.Com<br>
						123, Baner, Pune<br> 411045, India<br> Phone: (+91)
						86007-99099
						<ul class="social">
							<li><a href="#"><span class="fa fa-facebook"></span></a></li>
							<li><a href="#"><span class="fa fa-google-plus"></span></a></li>
							<li><a href="#"><span class="fa fa-twitter"></span></a></li>
							<li><a href="#"><span class="fa fa-dribbble"></span></a></li>
						</ul>
					</address>
				</div>

				<div class="col-md-9">
					<form autocomplete="off">
						<div class="row">
							<div class="col-md-6">
								<input type="text" class="form-control" placeholder="Your Name">
								<input type="text" class="form-control" placeholder="Phone No.">
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" placeholder="Email">
								<input type="text" class="form-control" placeholder="Subject">
							</div>
						</div>
						<textarea class="form-control" rows="4" placeholder="Message"></textarea>
						<div class="text-right">
							<a href="#" class="btn send-btn">Send</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<nav id="footer">
		<div class="container">
			<div class="pull-left">
				<p>
					2015 © ShivaBlast. All Rights Reserved. Coded & Designed by <a
						href="https://stackoverflow.com/users/3932396/ankur-mahajan?tab=profile">Ankur
						Mahajan</a>
				</p>
			</div>
			<div class="pull-right">
				<a href="#home" class="page-scroll">Back to Top <span
					class="fa fa-angle-up"></span></a>
			</div>
		</div>
	</nav>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/forIndex/jquery.1.11.1.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/forIndex/bootstrap.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/forIndex/SmoothScroll.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/forIndex/jasny-bootstrap.min.js"></script>

	<script
		src="<%=request.getContextPath()%>/resources/js/forIndex/owl.carousel.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/forIndex/typed.js"></script>
	<script>
		$(document).ready(function() {
			$(document).on('click', '.signup-tab', function(e) {
				e.preventDefault();
				$('#signup-taba').tab('show');
			});

			$(document).on('click', '.signin-tab', function(e) {
				e.preventDefault();
				$('#signin-taba').tab('show');
			});

			$(document).on('click', '.forgetpass-tab', function(e) {
				e.preventDefault();
				$('#forgetpass-taba').tab('show');
			});
		});
		$(function() {
			$("#head-title").typed(
					{
						strings : [
								"We create dreams, one pixel at a time.^1000",
								"Navigating YOU to future success.^1000",
								"A thousand dimensions for web apps.^1000" ],
						typeSpeed : 100,
						loop : true,
						startDelay : 100
					});
		});
	</script>

	<!-- Javascripts
    ================================================== -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/forIndex/main.js"></script>

</body>
</html>