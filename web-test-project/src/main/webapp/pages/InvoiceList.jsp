<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice List</title>


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

<!-- jQuery Table to JSON Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.tabletojson.min.js"></script>

<!-- Data table sum Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/datatable.sum.js"></script>

<!-- InvoiceList Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/InvoiceList.js"></script>

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

					<!-- Get Invoice Details Modal Button to Trigger Modal - Start -->
					<button type="button"
						class="btn btn-warning navbar-btn navbar-right"
						data-toggle="modal" data-target="#seeInvoiceModal">See
						Invoice</button>
					<!-- Get Invoice details Modal Button to Trigger Modal - End -->
					<p class="text-center text-primary">Welcome: ${username}</p>

				</div>
			</div>
		</div>
	</header>


	<!-- Jumbotron - Start-->
	<div class="jumbotron">
		<div class="container">
			<h3>Please fill required details for invoice.</h3>
			<p class="text-center text-danger">${redirectAttribute}</p>

			<!-- Pop up submission parameter -->
			<p class="text-center text-warning">${popUpMessage}</p>


		</div>
	</div>
	<!-- Jumbotron - End-->


	<!-- create invoice form - starts -->
	<div class="container">
		<form action="createInvoiceFormAction" id="createInvoiceForm"
			method="post" class="form-horizontal">


			<div class="form-group">
				<label for="client" class="col-lg-1 control-label">Client</label>
				<div class="col-lg-4">
					<select class="form-control" name="client" id="client">
						<option value="">--Please select client--</option>
						<c:if test="${not empty clientList}">
							<c:forEach items="${clientList}" var="client">
								<option id="catOptionId"
									value="${client.clientId}|${client.clientName}">${client.clientName}</option>
							</c:forEach>
						</c:if>

					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="category" class="col-lg-1 control-label">Category</label>
				<div class="col-lg-4">
					<select class="form-control" name="category" id="category">
						<option value="">--Please select category--</option>
						<c:if test="${not empty productCategoryList}">
							<c:forEach items="${productCategoryList}" var="productCategory">
								<option id="catOptionId" value="${productCategory.pCatrgoryId}">${productCategory.pCategoryName}</option>
							</c:forEach>
						</c:if>

					</select>
				</div>
			</div>

			<div class="container">
				<p id="helpSubCat" class="help-block" style="color: orange;"></p>
			</div>

			<div class="form-group">
				<label for="subCategory" class="col-lg-1 control-label">SubCategory</label>
				<div class="col-lg-4">
					<select class="form-control" name="subCategory" id="subCategory">
						<option value="">--Please select sub-category--</option>
					</select>
				</div>
			</div>

			<div class="container">
				<p id="helpProduct" class="help-block" style="color: orange;"></p>
			</div>

			<div class="form-group">
				<label for="product" class="col-lg-1 control-label">Product</label>
				<div class="col-lg-4">
					<select class="form-control" name="product" id="product">
						<option value="">--Please select product--</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="quantity" class="col-lg-1 control-label">Quantity:</label>
				<div class="col-lg-4">
					<input type="text" class="form-control" id="quantity"
						name="quantity" placeholder="Quantity">
				</div>
			</div>

			<div class="form-group">
				<label for="quantity" class="col-lg-1 control-label">Amount:</label>
				<div class="col-lg-4">
					<input type="hidden" class="form-control" id="hAmount"
						name="amount">
					<div class="container">
						<p id="amount" class="help-block">Enter Quantity amount will
							automatically visible.</p>
					</div>
				</div>
			</div>
			<button type="button" id="addRow">Add New Row</button>
			<button type="button" id="deleteRow">Delete Selected Row</button>
			<br> <br>
			<table id="invoiceTable" class="table table-striped table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Client Id</th>
						<th>Client Name</th>
						<th>Product Id</th>
						<th>Product Name</th>
						<th>Quantity</th>
						<th>Price</th>
					</tr>
				</thead>

				<tfoot>
					<tr>
						<th>Client Id</th>
						<th>Client Name</th>
						<th>Product Id</th>
						<th>Product Name</th>
						<th>Quantity</th>
						<th>Price</th>
					</tr>
				</tfoot>
				<tbody>
				</tbody>
			</table>
			<br>
			<p id="priceSum" class="help-block text-right"></p>

			<input type="hidden" class="form-control" id="jsonData" name="json">

			<button type="submit" class="btn btn-primary" id="submit">Submit</button>
		</form>
	</div>
	<!-- create invoice form - End -->


	<!--  Modal (see Invoice detail Pop Up View and Form) - Start-->
	<div class="container">
		<!-- Modal HTML -->
		<div id="seeInvoiceModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title text-danger">See Invoice Details</h4>
					</div>

					<form action="seeInvoicePopUpAction" id="seeInvoicePopUpForm"
						method="get">
						<div class="modal-body">

							<div class="form-group">
								<label for="invoiceDetails">Invoice Id</label> <select
									class="form-control" name="invoiceDetails" id="invoiceDetails">
									<option value="">--Please select invoice--</option>
									<c:if test="${not empty invoiceList}">
										<c:forEach items="${invoiceList}" var="invoice">
											<option id="invoiceId" value="${invoice.invoiceId}">${invoice.invoiceId}</option>
										</c:forEach>
									</c:if>

								</select>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-primary">PDF</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--  Modal (see Invoice details Pop Up View and Form) - End-->

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