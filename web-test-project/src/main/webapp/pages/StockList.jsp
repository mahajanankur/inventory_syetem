<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Product Category</title>


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

<!-- Bootstrap NewsBox Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.bootstrap.newsbox.min.js"></script>

<!-- StockList Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/StockList.js"></script>

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
					<!-- Create stock Modal Button to Trigger Modal - Start -->
					<button type="button"
						class="btn btn-warning navbar-btn navbar-right"
						data-toggle="modal" data-target="#stockModal">Stock
						Management</button>
					<!-- Create stock Modal Button to Trigger Modal - End -->

					<p class="text-center text-primary">Welcome: ${username}</p>

				</div>
			</div>
		</div>
	</header>

	<!-- Jumbotron - Start-->
	<div class="jumbotron">
		<div class="container">
			<h3>Please manage your stock here.</h3>
			<p class="text-center text-danger">${redirectAttribute}</p>

			<!-- Pop up submission parameter -->
			<p class="text-center text-warning">${popUpMessage}</p>


		</div>
	</div>
	<!-- Jumbotron - End-->


	<!-- News Ticker for showing product having less quantity - START-->

	<div class="container">
		<div class="row">

			<div class="panel panel-default">
				<div class="panel-heading">
					<span class="glyphicon glyphicon-list-alt"></span><b>News</b>
				</div>
				<div class="panel-body">
					<div class="row">
						<ul class="stockNewsTicker">
							<c:if test="${not empty pListByQuantity}">
								<c:forEach items="${pListByQuantity}" var="product">
									<li class="news-item">
										<p>
											<b>${product.productName},</b> only <b>${product.quantity}</b>
											pieces are left in the stock.
										</p>
									</li>
								</c:forEach>
							</c:if>
						</ul>
					</div>
				</div>
				<div class="panel-footer">Less stock Products.</div>
			</div>
		</div>
	</div>

	<!-- News Ticker for showing product having less quantity - END-->


	<!--  Modal (Create Stock Pop Up View and Form) - Start-->

	<div class="container">
		<!-- Modal HTML -->
		<div id="stockModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title text-danger">Create Stock</h4>
					</div>

					<form action="createStockFormAction" id="createStockPopUpForm"
						method="post" enctype="multipart/form-data">
						<div class="modal-body">

							<!-- FORM Content - Start-->

							<div class="form-group">
								<label for="vendor" class="control-label">Vendor:</label> <select
									class="form-control" name="vendor" id="vendor">
									<option value="">--Please select Vendor--</option>
									<c:if test="${not empty vendorList}">
										<c:forEach items="${vendorList}" var="vendor">
											<option id="vendorOptionId" value="${vendor.vendorId}">${vendor.company}</option>
										</c:forEach>
									</c:if>

								</select>
							</div>

							<div class="container">
								<p id="helpVendor" class="help-block" style="color: orange;"></p>
							</div>

							<div class="form-group">
								<label for="stockName" class="control-label">Stock Name:</label>
								<input type="text" class="form-control" name="stockname"
									id="stockname" placeholder="Name">
							</div>

							<!-- <div class="form-group">
								<label for="quantity" class="control-label">Quantity:</label> <input
									type="text" class="form-control" id="quantity" name="quantity"
									placeholder="Quantity Received">
							</div> -->
							<div class="form-group">
								<label for="file" class="control-label">Upload Excel:</label> <input
									type="file" id="file" name="file" class="form-control" />
							</div>
							<!-- FORM Content - End-->

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

	<!--  Modal (Create Stock Pop Up View and Form) - End-->

	<br>
	<!--Stock Entry Table - Start -->
	<div class="container">
		<form action="stockTableFormAction" id="stockTableForm" method="post">
			<div class="table-responsive">
				<table id="stockTable" class="display table" width="100%">
					<thead>
						<tr>
							<th>Stock ID</th>
							<th>Stock Name</th>
							<th>Stock Received</th>
							<th>Received On</th>
							<th>Vendor ID</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty stockList}">
							<c:forEach items="${stockList}" var="stock">
								<tr>
									<td>${stock.stockId}</td>
									<td>${stock.stockName}</td>
									<td>${stock.stockIn}</td>
									<td>${stock.createdOn}</td>
									<td>${stock.vendorId}</td>
									<td>
										<!-- See category Action button -->
										<button type="submit" class="btn btn-primary"
											id="productWiseStock" name="productWiseStock"
											value="${stock.vendorId}|${stock.stockId}|productWiseStock"
											data-toggle="tooltip" data-placement="bottom"
											title="ProductWiseStock">
											<span class="glyphicon glyphicon-eye-open"></span>
										</button> <!-- Remove category Action button -->
										<button type="submit" class="btn btn-primary"
											id="removeCategory" name="removeCategoryName"
											value="${productCategory.pCatrgoryId} removeButton"
											data-toggle="tooltip" data-placement="bottom" title="Remove">
											<span class="glyphicon glyphicon-remove"></span>
										</button> <!-- Update category Action button -->
										<button type="submit" class="btn btn-primary"
											id="updateCategory" name="updateCategoryName"
											value="${productCategory.pCatrgoryId} updateButton"
											data-toggle="tooltip" data-placement="bottom" title="Update"
											data-toggle="modal" data-target="#myCreateModal">
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
	<!--Stock Entry Table - End -->

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