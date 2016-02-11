<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>See Vendor</title>


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
<!-- Multiselect css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jQuery.multiselect.css" />

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

<!-- Multi-Select Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jQuery.multiselect.js"></script>

<!-- SeeVendor Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/SeeVendor.js"></script>

<style>
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
					<!-- Create product category Modal Button to Trigger Modal - Start -->
					<!-- <button type="button"
						class="btn btn-warning navbar-btn navbar-right"
						data-toggle="modal" data-target="#myCreateModal">Create
						Category</button> -->
					<!-- Create product category Modal Button to Trigger Modal - End -->

					<p class="text-right text-primary">Welcome: ${username}</p>

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

	<!-- Wall for address details of a vendor -->
	<div class="container">
		<div class="wall">
			<p>
				<b><u>Address Informations</u></b>
			</p>

		</div>
	</div>

	<!-- Vendor Details -Start -->
	<div class="container">
		<div class="well">
			<p>
				<b>Vendor ID : </b>${vendor.vendorId}
				<!-- Link products - Modal Button to Trigger Modal - Start -->
				<button type="button" class="btn btn-success btn-xs pull-right"
					data-toggle="modal" data-target="#linkProducts">Link
					Products</button>
				<!-- Link products - Modal Button to Trigger Modal - End -->
			</p>

			<p>
				<b>Company : </b>${vendor.company}
			</p>
			<p>
				<b>E-Mail : </b>${vendor.email}
			</p>
			<p>
				<b>Mobile : </b>${vendor.mobile}

			</p>
			<p>
				<b>Address : </b>${vendor.address}
			</p>
			<p>
				<b>Pincode : </b>${vendor.pincode}
			</p>
			<p>
				<b>Created On : </b>${vendor.createdOn}
			</p>
			<p>
				<b>User ID : </b>${vendor.userId}
			</p>
		</div>

	</div>
	<!-- Vendor Details -End -->


	<!-- Wall for product details of a vendor -->
	<div class="container">
		<div class="wall">
			<p>
				<b><u>Product Informations</u></b>
			</p>

		</div>
	</div>

	<!-- Vendor product Details -Start -->
	<div class="container">
		<div class="well">

			<c:choose>
				<c:when test="${not empty pName}">
					<p>
						<b>Products Linked : </b>${pName}
					</p>
				</c:when>
				<c:otherwise>
					<p>No Product is linked to this vendor.</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- Vendor product Details -End -->


	<!--  Modal (Link Products Pop Up View and Form) - Start-->

	<div class="container">

		<!-- Modal HTML -->
		<div id="linkProducts" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title text-danger">Link Products</h4>
					</div>

					<form action="LinkProductsToVendorPopUpAction"
						id="LinkProductsToVendorPopUpForm" method="post">
						<div class="modal-body">

							<div class="form-group">
								<label for="id" class="control-label">Id:</label>
								<p id="id" style="color: blue">${vendor.vendorId}</p>
								<input type="hidden" class="form-control" name="hId"
									value="${vendor.vendorId}">
							</div>
							<div class="form-group">
								<label for="company" class="control-label">Company:</label>
								<p id="company" style="color: blue">${vendor.company}</p>
								<input type="hidden" class="form-control" name="hCompany"
									value="${vendor.company}">
							</div>

							<div class="form-group">
								<label for="product" class="control-label">Products:</label> <select
									id="product" multiple="multiple" name="productDetails">
									<c:if test="${not empty productList}">
										<c:forEach items="${productList}" var="products">
											<option id="productDetail"
												value="${products.productId}|${products.productName}">${products.productName}</option>
										</c:forEach>
									</c:if>

								</select>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-primary">Send</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--  Modal (Link Products Pop Up View and Form) - End-->


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