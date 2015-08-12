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
			<a href="#" class="btn go-to-btn">Check our shop</a>
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
								<h4>Lian Gwapa</h4>
								<p class="small">CEO/Founder</p>
								<hr>
							</div>
						</div>

						<div class="col-md-4 col-sm-4">
							<div class="team">
								<img
									src="<%=request.getContextPath()%>/resources/images/forIndex/team/04.jpg"
									class="img-responsive img-circle" alt="..."> <br>
								<h4>Jenn Pereira</h4>
								<p class="small">Web Coder</p>
								<hr>
							</div>
						</div>

						<div class="col-md-4 col-sm-4">
							<div class="team">
								<img
									src="<%=request.getContextPath()%>/resources/images/forIndex/team/03.jpg"
									class="img-responsive img-circle" alt="..."> <br>
								<h4>Alan Podemski</h4>
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
						<strong>Address</strong><br> <br> ThemeForces.Com<br>
						Igbalangao, Bugasong, Anitque<br> 5704, Philippines<br>
						Phone: (123) 456-7890
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
					2014 © Arcadia. All Rights Reserved. Coded by <a
						href="https://dribbble.com/jennpereira">Jenn</a> & Designed by <a
						href="https://dribbble.com/alanpodemski">Alan</a>
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
		$(function() {
			$("#head-title").typed(
					{
						strings : [ "We make websites^1000",
								"24/7 available for hire^1000",
								"Web design with diffence^1000" ],
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