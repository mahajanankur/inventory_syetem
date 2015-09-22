<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Product</title>


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
<!-- CreateProduct Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/CreateProduct.js"></script>
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

				<p class="text-right text-primary">Welcome: ${username}</p>

			</div>
		</div>
	</header>


	<!-- Jumbotron - Start-->
	<div class="jumbotron">
		<div class="container">
			<h3>Please fill required details for product.</h3>
			<!-- Pop up submission parameter -->
			<p class="text-center text-warning">${popUpMessage}</p>

		</div>
	</div>
	<!-- Jumbotron - End-->

	<!-- See details container - Start -->

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="well">
					<p>
						<b>Sub-Category ID : </b> ${subCatId}
					</p>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="well">
					<p>
						<b>Sub-Category Name : </b> ${subCatName}
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- See details container - End -->

	<!-- Nav Tabs with form - Start -->

	<div class="container">

		<ul class="nav nav-tabs">
			<li class="active"><a href="#basicProductDetails-tab"
				data-toggle="tab">Basic Details <i class="fa"></i></a></li>
			<li><a href="#specification-tab" data-toggle="tab">Specifications
					<i class="fa"></i>
			</a></li>
		</ul>

		<form id="createProduct" method="post" class="form-horizontal"
			action="createProductAction" style="margin-top: 20px;">
			<div class="tab-content">
				<div class="tab-pane active" id="basicProductDetails-tab">
					<div class="form-group">
						<label class="col-lg-3 control-label">Product name</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" name="productName" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Brand</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" name="brandName" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Cost Price</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" name="costPrice"
								id="costPrice" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">Profit %</label>
						<div class="col-lg-3">
							<input type="text" class="form-control" id="profitPerc"
								name="profitPerc" />
						</div>
						<div class="col-lg-1">
							<button type="button" class="btn btn-success btn-xs" id="pCalc">Calculate</button>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Sale Price</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" name="salePrice"
								id="salePrice" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">Quantity</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" name="quantity" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">Offers</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" name="OffersName" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">Photos</label>
						<div class="col-lg-5">
							<textarea class="form-control" rows="5" id="photos"
								name="photosName"></textarea>
							<p class="help-block">Please use | to separate Photos.</p>
							<p class="help-block">Example : Photo1 xxx|Photo2 sss|..</p>
						</div>
					</div>

				</div>
				<div class="tab-pane" id="specification-tab">
					<div class="form-group">
						<label class="col-lg-3 control-label">Specifications</label>
						<div class="col-lg-5">
							<textarea class="form-control" rows="5" id="specifications"
								name="specificationsName"></textarea>
							<p class="help-block">Please use | to separate
								specifications.</p>
							<p class="help-block">Example : Model xxx|Color White|..</p>
						</div>
					</div>

				</div>
			</div>

			<!-- Hidden Fields category and sub category Id - Start -->

			<input type="hidden" name="catId" value="${catId}" /> <input
				type="hidden" name="subCatId" value="${subCatId}" />

			<!-- Hidden Fields category and sub category Id - End -->

			<div class="form-group">
				<div class="col-lg-5 col-lg-offset-3">
					<button type="submit" class="btn btn-primary">Validate</button>
				</div>
			</div>
		</form>
		<hr>
	</div>

	<!-- Nav Tabs with form - End -->


	<!--Product Table Grid - Start -->

	<div class="container">
		<form action="createProductTableForm" method="post">
			<div class="table-responsive">
				<table id="createProductTable" class="display table" width="100%">
					<thead>
						<tr>
							<th>Batch Id</th>
							<th>Name</th>
							<th>Vendor</th>
							<th>Price</th>
							<th>Offer</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty productList}">
							<c:forEach items="${productList}" var="product">
								<tr>
									<td>${product.productId}</td>
									<td>${product.productName}</td>
									<td>${product.productBrand}</td>
									<td>${product.salePrice}</td>
									<td>${product.productOffer}</td>

									<td>
										<!-- See Sub product Action button -->
										<button type="submit" class="btn btn-primary"
											id="seeProductDetails" name="seeProductDetailsName"
											value="${product.productId} seeButton" data-toggle="tooltip"
											data-placement="bottom" title="See">
											<span class="glyphicon glyphicon-eye-open"></span>
										</button> <!-- Remove product Action button -->
										<button type="submit" class="btn btn-primary"
											id="removeProduct" name="removeProductName"
											value="${product.productId} removeButton"
											data-toggle="tooltip" data-placement="bottom" title="Remove">
											<span class="glyphicon glyphicon-remove"></span>
										</button> <!-- Update product Action button -->
										<button type="submit" class="btn btn-primary"
											id="updateProduct" name="updateProductName"
											value="${product.productId} updateButton"
											data-toggle="tooltip" data-placement="bottom" title="Update">
											<span class="glyphicon glyphicon-edit"></span>
										</button>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	<!--Product Table Grid - End -->


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