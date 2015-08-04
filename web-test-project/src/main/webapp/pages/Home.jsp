<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Home</title>
<meta name="description" content="ShivaBlast App">
<!-- Latest compiled and minified CSS -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
</head>

<style>
body {
	padding-top: 40px;
}

.navbar-brand {
	padding-top: 0.2px;
	padding-left: 0px;
}

/* Jumbotron background Image */
.bg {
	background:
		url('<%=request.getContextPath()%>/resources/images/BambooSticks.jpg')
		no-repeat center center;
	position: fixed;
	width: 100%;
	height: 350px; /*same height as jumbotron */
	top: 0;
	left: 0;
	z-index: -1;
}

.jumbotron {
	height: 350px;
	color: white;
	text-shadow: #444 0 1px 1px;
	background: transparent;
}
</style>

<body data-spy="scroll" data-target="#my-navbar">

	<!-- Navbar -->
	<nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>

				<a href="" class="navbar-brand"><img class="img-circle"
					alt="Shiva Blast"
					src="<%=request.getContextPath()%>/resources/images/logo.png">
				</a>
			</div>
			<!-- Navbar Header-->
			<div class="collapse navbar-collapse" id="navbar-collapse">

				<!-- Logout button - START -->
				<c:url value="/j_spring_security_logout" var="logoutUrl" />
				<form action="${logoutUrl}" method="post" id="logoutForm">
					<input type="submit"
						class="btn btn-warning navbar-btn navbar-right" name="logout"
						value="Logout" />
				</form>
				<!-- <a href="" class="btn btn-warning navbar-btn navbar-right">Logout</a> -->
				<!-- Logout button - END -->
				<ul class="nav navbar-nav">
					<li><a href="#feedback">Feedback</a>
					<li><a href="#gallery">Gallery</a>
					<li><a href="#features">Features</a>
					<li><a href="#faq">Faq</a>
					<li><a href="#contact">ContactUs</a>
				</ul>
			</div>
		</div>
		<!-- End Container-->
	</nav>
	<!-- End navbar -->

	<!-- jumbotron-->

	<div class="bg"></div>
	<div class="jumbotron">
		<div class="container text-center">
			<h2>
				<b><u>Shiva Blast</u> </b>
			</h2>
			<p>Application for Stock Management</p>


			<form action="homePageFirstFormAction" class="form-inline"
				id="homePageFirstFormId">
				<div class="btn-group">
					<button type="submit" class="btn btn-lg btn-warning"
						name="product_name" value="Products">Products</button>
					<button type="submit" class="btn btn-lg btn-primary"
						name="client_name" value="Clients">Clients</button>
					<button type="submit" class="btn btn-lg btn-success"
						name="vendor_name" value="Vendors">Vendors</button>
					<button type="submit" class="btn btn-lg btn-default"
						name="transaction_name" value="Transactions">Transactions</button>
					<button type="submit" class="btn btn-lg btn-danger"
						name="stock_name" value="Stock">Stock</button>
					<button type="submit" class="btn btn-lg btn-info"
						name="invoice_name" value="Invoice">Invoice</button>
					<button type="submit" class="btn btn-lg btn-warning"
						name="analysis_name" value="analysis">Analysis</button>
				</div>
			</form>

		</div>
		<!-- End container -->
	</div>
	<!-- End jumbotron-->

	<!-- Feedback-->
	<div class="container">
		<section>
			<div class="page-header" id="feedback">
				<h2>
					Feedback.<small> Check out the Awesome Feedback</small>
				</h2>
			</div>

			<div class="row">
				<div class="col-md-4">
					<blockquote>
						<p>Fire is His head, the sun and moon His eyes, space His
							ears, the Vedas His speech, the wind His breath, the universe His
							heart. From His feet the Earth has originated. Verily, He is the
							inner self of all beings.</p>
						<footer>The Upanishads</footer>
					</blockquote>
				</div>
				<div class="col-md-4">
					<blockquote>
						<p>Don't turn blue all over now.</p>
						<footer>Amish Tripathi</footer>
					</blockquote>
				</div>
				<div class="col-md-4">
					<blockquote>
						<p>OM. Tryambakam yajamahe Sugandhim pushti-vardhanam
							Urvarukamiva bandhanan Mrityor mukshiya mamritat</p>
						<footer>The Upanishads</footer>
					</blockquote>
				</div>
			</div>
			<!-- End row -->
		</section>
	</div>
	<!--End Container-->

	<!-- call to action -->
	<section>
		<div class="well">
			<div class="container text-center">
				<h3>Subscribe for more free stuff</h3>
				<p>Enter your name and email</p>

				<form action="" class="form-inline">
					<div class="form-group">
						<label for="subscription">Subscribe</label> <input type="text"
							class="form-control" id="subscription" placeholder="Your name">
					</div>
					<div class="form-group">
						<label for="email">Email address</label> <input type="text"
							class="form-control" id="email" placeholder="Enter your Email">
					</div>
					<button type="submit" class="btn btn-default">Subscribe</button>
					<hr>
				</form>


			</div>
			<!-- end Container-->

		</div>
		<!-- end well-->
	</section>
	<!-- Call to action -->

	<!-- Gallery -->
	<div class="container">
		<section>
			<div class="page-header" id="gallery">
				<h2>
					Gallery.<small> Check out the Awesome Gallery</small>
				</h2>
			</div>

			<div class="carousel slide" id="screenshot-carousel"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#screenshot-carousel" data-slide-to="0"
						class="active"></li>
					<li data-target="#screenshot-carousel" data-slide-to="1"></li>
					<li data-target="#screenshot-carousel" data-slide-to="2"></li>
					<li data-target="#screenshot-carousel" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img
							src="<%=request.getContextPath()%>/resources/images/highway.jpg"
							alt="Text of the image">
						<div class="carousel-caption">
							<h3>Highway heading</h3>
							<p>This is the caption</p>
						</div>
					</div>
					<div class="item">
						<img
							src="<%=request.getContextPath()%>/resources/images/river.jpg"
							alt="Text of the image">
						<div class="carousel-caption">
							<h3>River heading</h3>
							<p>This is the caption</p>
						</div>
					</div>
					<div class="item">
						<img
							src="<%=request.getContextPath()%>/resources/images/street.jpg"
							alt="Text of the image">
						<div class="carousel-caption">
							<h3>Street heading</h3>
							<p>This is the caption</p>
						</div>
					</div>
					<div class="item">
						<img
							src="<%=request.getContextPath()%>/resources/images/painting.jpg"
							alt="Text of the image">
						<div class="carousel-caption">
							<h3>Painting heading</h3>
							<p>This is the caption</p>
						</div>
					</div>

				</div>
				<!-- End Carousel inner -->
				<a href="#screenshot-carousel" class="left carousel-control"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> </a> <a
					href="#screenshot-carousel" class="right carousel-control"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> </a>
			</div>
			<!-- End Carousel -->

		</section>
	</div>

	<!-- features -->
	<div class="container">
		<section>
			<div class="page-header" id="features">
				<h2>
					Features.<small> Some of the coolest Features of this app.</small>
				</h2>
			</div>
			<!-- End Page Header -->

			<div class="row">
				<div class="col-sm-8">
					<h3>This is the heading</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
						mauris tortor, eleifend sit amet fringilla ac, tincidunt id massa.
						Proin et odio mattis, venenatis lacus vel, faucibus elit</p>
				</div>
				<div class="col-sm-4">
					<img src="<%=request.getContextPath()%>/resources/images/imac.jpg"
						class="img-responsive" alt="image">
				</div>
			</div>
			<!-- End row -->
			<div class="row">
				<div class="col-sm-8">
					<h3>This is the heading</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
						mauris tortor, eleifend sit amet fringilla ac, tincidunt id massa.
						Proin et odio mattis, venenatis lacus vel, faucibus elit</p>
				</div>
				<div class="col-sm-4">
					<img
						src="<%=request.getContextPath()%>/resources/images/smartphone.jpg"
						class="img-responsive" alt="image">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8">
					<h3>This is the heading</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
						mauris tortor, eleifend sit amet fringilla ac, tincidunt id massa.
						Proin et odio mattis, venenatis lacus vel, faucibus elit</p>
				</div>
				<div class="col-sm-4">
					<img src="<%=request.getContextPath()%>/resources/images/user.jpg"
						class="img-responsive" alt="image">
				</div>
			</div>

			<hr>

			<div class="row">
				<div class="col-sm-4">
					<div class="panel panel-default text-center">
						<div class="panel-body">
							<span class="glyphicon glyphicon-ok"></span>
							<h4>This is the Heading</h4>
							<p>Nam velit est, tempor vel posuere et, auctor a lectus.
								Aenean gravida, est accumsan dictum rhoncus, lectus mi suscipit
								lacus, suscipit accumsan augue tellus vitae dolor. Morbi in
								euismod dui</p>
						</div>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="panel panel-default text-center">
						<div class="panel-body">
							<span class="glyphicon glyphicon-star"></span>
							<h4>This is the Heading</h4>
							<p>Nam velit est, tempor vel posuere et, auctor a lectus.
								Aenean gravida, est accumsan dictum rhoncus, lectus mi suscipit
								lacus, suscipit accumsan augue tellus vitae dolor. Morbi in
								euismod dui</p>
						</div>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="panel panel-default text-center">
						<div class="panel-body">
							<span class="glyphicon glyphicon-play-circle"></span>
							<h4>This is the Heading</h4>
							<p>Nam velit est, tempor vel posuere et, auctor a lectus.
								Aenean gravida, est accumsan dictum rhoncus, lectus mi suscipit
								lacus, suscipit accumsan augue tellus vitae dolor. Morbi in
								euismod dui</p>
						</div>
					</div>
				</div>
			</div>
			<!-- end row -->

		</section>
	</div>
	<!-- End Container -->

	<!-- Faq -->

	<div class="container">
		<section>
			<div class="page-header" id="faq">
				<h2>
					FAQ.<small> Engaging with consumers.</small>
				</h2>
			</div>
			<!-- End Page Header -->

			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title">
							<a href="#collapse-1" data-toggle="collapse"
								data-parent="#accordion"> Question one? </a>
						</div>
						<!-- End panel title -->
						<div id="collapse-1" class="panel-collapse collapse in">
							<div class="panel-body">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Donec egestas non urna in
								fringilla. Praesent consequat est at feugiat faucibus</div>
						</div>
						<!-- End Panel collapse -->
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title">
							<a href="#collapse-2" data-toggle="collapse"
								data-parent="#accordion"> Question Two? </a>
						</div>
						<!-- End panel title -->
						<div id="collapse-2" class="panel-collapse collapse">
							<div class="panel-body">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Donec egestas non urna in
								fringilla. Praesent consequat est at feugiat faucibus</div>
						</div>
						<!-- End Panel collapse -->
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title">
							<a href="#collapse-3" data-toggle="collapse"
								data-parent="#accordion"> Question Three? </a>
						</div>
						<!-- End panel title -->
						<div id="collapse-3" class="panel-collapse collapse">
							<div class="panel-body">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Donec egestas non urna in
								fringilla. Praesent consequat est at feugiat faucibus</div>
						</div>
						<!-- End Panel collapse -->
					</div>
				</div>
			</div>
			<!-- End panel group -->

		</section>
	</div>
	<!-- End container -->


	<!-- Contact -->

	<div class="container">
		<section>
			<div class="page-header" id="contact">
				<h2>
					Contact Us.<small> Contact us for more.</small>
				</h2>
			</div>
			<!-- End Page Header -->

			<div class="row">
				<div class="col-lg-4">
					<p>Send us a message, or contact us from the address below</p>


					<address>
						<strong>Shiva Blast Pvt Ltd.</strong></br> Flat No. 1 </br> Baner, Pune-45</br>
						P: +91 8600799099
					</address>
				</div>

				<div class="col-lg-8">
					<form action="" class="form-horizontal">
						<div class="form-group">
							<label for="user-name" class="col-lg-2 control-label">Name</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="user-name"
									placeholder="Enter you name">
							</div>
						</div>
						<!-- End form group -->

						<div class="form-group">
							<label for="user-email" class="col-lg-2 control-label">Email</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="user-email"
									placeholder="Enter you Email Address">
							</div>
						</div>
						<!-- End form group -->

						<div class="form-group">
							<label for="user-url" class="col-lg-2 control-label">Your
								Website</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="user-email"
									placeholder="If you have Any.">
							</div>
						</div>
						<!-- End form group -->

						<div class="form-group">
							<label for="user-message" class="col-lg-2 control-label">Any
								Message</label>
							<div class="col-lg-10">
								<textarea name="user-message" id="user-message"
									class="form-control" cols="20" rows="10"
									placeholder="Enter your Message"></textarea>
							</div>
						</div>
						<!-- End form group -->

						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</div>



					</form>
				</div>
			</div>
			<!-- End the row -->

		</section>
	</div>

	<!-- Footer -->

	<footer>
		<hr>
		<div class="container text-center">
			<h3>Subscribe for more free stuff</h3>
			<p>Enter your name and email</p>

			<form action="" class="form-inline">
				<div class="form-group">
					<label for="subscription">Subscribe</label> <input type="text"
						class="form-control" id="subscription" placeholder="Your name">
				</div>
				<div class="form-group">
					<label for="email">Email address</label> <input type="text"
						class="form-control" id="email" placeholder="Enter your Email">
				</div>
				<button type="submit" class="btn btn-default">Subscribe</button>

			</form>

			<hr>
			<ul class="list-inline">
				<li><a href="http://www.twitter.com/shivablast">Twitter</a></li>
				<li><a href="http://www.facebook.com/shivablast">Facebook</a></li>
				<li><a href="http://www.youtube.com/shivablast">YouTube</a></li>
			</ul>

			<p>&copy; Copyright @ Shiva Blast - 2015</p>

		</div>
		<!-- end Container-->


	</footer>

	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		var jumboHeight = $('.jumbotron').outerHeight();
		function parallax() {
			var scrolled = $(window).scrollTop();
			$('.bg').css('height', (jumboHeight - scrolled) + 'px');
		}

		$(window).scroll(function(e) {
			parallax();
		});
	</script>
</body>
</html>