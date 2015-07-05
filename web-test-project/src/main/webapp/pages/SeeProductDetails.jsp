<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>See Product</title>


<!-- Bootstrap and Jquery CSS Library - Start-->
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- BootstrapValidator CSS Library -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrapvalidator.min.css" />
<!-- Optional theme -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.min.css" />
<!-- Jquery data table CSS Library -->
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css" />


<!-- Bootstrap and Jquery CSS Library - End-->


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) - Start-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Bootstrap.min.js -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- BootstrapValidator JS Library -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>
<!-- Jquery data table JS Library -->
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) - End-->

<!-- Manual Script -->
<%-- <%=request.getContextPath()%> --%>
<script type="text/javascript" src="/resources/js/manualScript.js"></script>

<!-- SeeProductDetails Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/SeeProductDetails.js"></script>

<style type="text/css">
.img-responsive {
	width: auto;
	height: 225px;
	max-height: 225px;
}

body {
	padding-top: 40px;
}

.navbar-brand {
	padding-top: 0.2px;
	padding-left: 0px;
}
</style>
</head>

<body>
	<header>
		<div class="navbar navbar-default navbar-fixed-top navbar-inverse">
			<div class="container">
				<div class="navbar-header">
					<a href="home" class="navbar-brand"><img class="img-circle"
						alt="Shiva Blast"
						src="<%=request.getContextPath()%>/resources/images/logo.png"></a>
				</div>
				<div class="collpase navbar-collpase" id="collpase">
					<p class="text-center text-primary">Welcome: ${username}</p>
				</div>
			</div>
		</div>
	</header>


	<!-- Jumbotron - Start-->
	<div class="jumbotron">
		<div class="container">
			<h3>Please fill required details for product category.</h3>
			<p class="text-center text-danger">${redirectAttribute}</p>

			<!-- Pop up submission parameter -->
			<p class="text-center text-warning">${popUpMessage}</p>


		</div>
	</div>
	<!-- Jumbotron - End-->

	<div class="container">
		<div class="well">
			<p>ID :: ${product.productId}</p>
			<p>Name :: ${product.productName}</p>
			<p>Brand :: ${product.productBrand}</p>
			<p>Cost Price :: ${product.costPrice}</p>
			<p>Sale Price :: ${product.salePrice}</p>
			<p>Photos :: ${product.productPhotos}</p>
			<p>Offer :: ${product.productOffer}</p>
			<p>Created On :: ${product.createdOn}</p>
			<p>User ID :: ${product.userId}</p>
			<p>Sub Cat ID :: ${product.subCategoryId}</p>
			<p>Cat ID :: ${product.categoryId}</p>

			<p>Specification ID ::
				${product.productSpecifications.specificationId}</p>
			<p>Details ::
				${product.productSpecifications.specificationsDetail}</p>

		</div>
	</div>


	<div class="container">

		<c:if test="${not empty photoList}">
			<c:forEach items="${photoList}" var="photo">

				<div class="row">
					<img src="<%=request.getContextPath()%>/${photo}"
						class="img-responsive" alt="image">
				</div>

			</c:forEach>
		</c:if>

	</div>

	<!-- Photo Carousel - Start -->
	<div class="container">
		<div class="carousel slide" id="screenshot-carousel"
			data-ride="carousel" style="width: 400px; margin: 0 auto">
			<ol class="carousel-indicators">
				<c:if test="${not empty photoList}">
					<c:forEach items="${photoList}" var="photo" varStatus="loop">

						<c:choose>
							<c:when test="${loop.index==0}">
								<li data-target="#screenshot-carousel"
									data-slide-to="${loop.index}" class="active"></li>
							</c:when>

							<c:otherwise>
								<li data-target="#screenshot-carousel"
									data-slide-to="${loop.index}"></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</c:if>
			</ol>

			<div class="carousel-inner">

				<c:if test="${not empty photoList}">
					<c:forEach items="${photoList}" var="photo" varStatus="loop">

						<c:choose>
							<c:when test="${loop.index==0}">
								<div class="item active">
									<img src="<%=request.getContextPath()%>/${photo}"
										alt="Text of the image" class="img-responsive">
									<div class="carousel-caption">
										<h3>Active Tab</h3>
										<p>This is the active tab.</p>
									</div>
								</div>
							</c:when>

							<c:otherwise>
								<div class="item">
									<img src="<%=request.getContextPath()%>/${photo}"
										alt="Text of the image" class="img-responsive">
									<div class="carousel-caption">
										<h3>Other Tabs</h3>
										<p>This is other tabs.</p>
									</div>
								</div>
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</c:if>

			</div>

			<!-- End Carousel inner -->
			<a href="#screenshot-carousel" class="left carousel-control"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left"></span>
			</a> <a href="#screenshot-carousel" class="right carousel-control"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<!-- Photo Carousel - End -->


	<footer>

		<div class="container text-center">
			<ul class="list-inline">
				<li><a href="http://www.twitter.com/shivablast">Twitter</a></li>
				<li><a href="http://www.facebook.com/shivablast">Facebook</a></li>
				<li><a href="http://www.youtube.com/shivablast">YouTube</a></li>
			</ul>

			<p>&copy; Copyright @ Shiva Blast - 2015</p>

		</div>
	</footer>

</body>
</html>