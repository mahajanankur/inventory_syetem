<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Title??</title>


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
	href="<%=request.getContextPath()%>/resources/css/jquery.dataTables.min.css" />

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

<!-- jQuery Table to JSON Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.tabletojson.min.js"></script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) - End-->

<!-- Manual Script -->
<%-- <%=request.getContextPath()%> --%>
<script type="text/javascript" src="/resources/js/manualScript.js"></script>

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
					<!-- Create product wise stock Modal Button to Trigger Modal - Start -->
					<button type="button"
						class="btn btn-warning navbar-btn navbar-right"
						data-toggle="modal" data-target="#createProductWiseStock">Create
						ProductWise Stock</button>
					<!-- Create product wise stock Modal Button to Trigger Modal - End -->

					<p class="text-center text-primary">Welcome: ${username}</p>
				</div>
			</div>
		</div>
	</header>

	<!-- Jumbotron - Start-->
	<div class="jumbotron">
		<div class="container">
			<h3>Please fill required details for product wise stock.</h3>
			<p class="text-center text-danger">${redirectAttribute}</p>

			<!-- Pop up submission parameter -->
			<p class="text-center text-warning">${popUpMessage}</p>


		</div>
	</div>
	<!-- Jumbotron - End-->

	<!--  Modal (Create product wise stock Pop Up View and Form) - Start-->

	<div class="container">

		<!-- Modal HTML -->
		<div id="createProductWiseStock" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title text-danger">Create Product-Wise Stock</h4>
					</div>

					<form action="createProductWiseStockPopUpAction"
						id="createProductWiseStockPopUpForm" method="post">
						<div class="modal-body">

							<div class="form-group">
								<label for="product" class="control-label">Product Name:</label>
								<select class="form-control" name="product" id="product">
									<option value="">--Please select Product--</option>
									<c:if test="${not empty pLinkedList}">
										<c:forEach items="${pLinkedList}" var="pLinked">
											<option id="pLinkedOptionId"
												value="${pLinked.productId}|${pLinked.productName}">${pLinked.productName}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>

							<div class="form-group">
								<label for="quantity" class="control-label">Quantity
									Received:</label> <input type="text" class="form-control"
									name="quantity" id="quantity" placeholder="Quantity Received">
							</div>

							<input type="hidden" id="vendorId" name="vendorId"
								value="${vendorId}" /> <input type="hidden" id="stockId"
								name="stockId" value="${stockId}" />
						</div>
						<div class="container">
							<button type="button" id="addRow">Add New Row</button>
							<button type="button" id="deleteRow">Delete Selected Row</button>
							<br> <br>
							<table id="pwsModalTable"
								class="table table-striped table-bordered"
								style="width: 50%; margin-left: 0px;">
								<thead>
									<tr>
										<th>Product</th>
										<th>Quantity</th>
										<th>PID</th>
										<th>Vendor ID</th>
										<th>Stock ID</th>
									</tr>
								</thead>

								<tfoot>
									<tr>
										<th>Product</th>
										<th>Quantity</th>
										<th>PID</th>
										<th>Vendor ID</th>
										<th>Stock ID</th>
									</tr>
								</tfoot>
								<tbody>
								</tbody>
							</table>
							<input type="hidden" class="form-control" id="jsonData"
								name="json">
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Cancel</button>
							<button type="submit" id="submit" class="btn btn-primary">Send</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--  Modal (Create product wise stock Pop Up View and Form) - End-->

	<br>
	<!--Product-Wise Stock Entry Table - Start -->
	<div class="container">
		<form action="productWiseStockTableFormAction"
			id="productWiseStockTableForm" method="post">
			<div class="table-responsive">
				<table id="productWiseStockTable" class="display table" width="100%">
					<thead>
						<tr>
							<th>PP ID</th>
							<th>Product ID</th>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Vendor ID</th>
							<th>Stock ID</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty productWiseStockList}">
							<c:forEach items="${productWiseStockList}" var="productWiseStock">
								<tr>
									<td>${productWiseStock.ppId}</td>
									<td>${productWiseStock.productId}</td>
									<td>${productWiseStock.productName}</td>
									<td>${productWiseStock.ppQuantities}</td>
									<td>${productWiseStock.vendorId}</td>
									<td>${productWiseStock.stockId}</td>
									<td>
										<!-- See Action button -->
										<button type="submit" class="btn btn-primary" id="seeBatch"
											name="seeBatch"
											value="${productWiseStock.vendorId}|${productWiseStock.stockId}|${productWiseStock.productId}|${productWiseStock.productName}|${productWiseStock.ppQuantities}|seeButton"
											data-toggle="tooltip" data-placement="bottom"
											title="See Batch">
											<span class="glyphicon glyphicon-eye-open"></span>
										</button> <!-- Remove Action button -->
										<button type="submit" class="btn btn-primary"
											id="removeCategory" name="removeCategoryName"
											value="${productCategory.pCatrgoryId} removeButton"
											data-toggle="tooltip" data-placement="bottom" title="Remove">
											<span class="glyphicon glyphicon-remove"></span>
										</button> <!-- Update Action button -->
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
	<!--Product-Wise Stock Entry Table - End -->

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

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							// function for productWiseStockTable view.
							$('#productWiseStockTable').dataTable();

							// validations for remove product popup form.
							$('#removeProductCategoryPopUpForm')
									.bootstrapValidator(
											{
												framework : 'bootstrap',
												icon : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													pCatId_name : {
														row : '.col-xs-4',
														validators : {
															notEmpty : {
																message : 'The product category ID is required.'
															},
															regexp : {
																regexp : /^\d*$/,
																message : 'The product category ID should be integer only.'
															}

														}

													}
												}
											});

							// Dynamic table function

							// Add row function

							var vendorId = $('#vendorId').val();
							var stockId = $('#stockId').val();

							var t = $('#pwsModalTable').DataTable({
								"columnDefs" : [ {
									"targets" : [ 3 ],
									"visible" : false,
									"searchable" : false
								}, {
									"targets" : [ 4 ],
									"visible" : false,
									"searchable" : false
								} ]
							});
							$('#addRow').on(
									'click',
									function() {
										// split method for product
										var product = $('#product').val()
												.split("|");
										var pId = product[0];
										var pName = product[1];

										t.row
												.add(
														[
																pName,
																$('#quantity')
																		.val(),
																pId, vendorId,
																stockId ])
												.draw();
									});

							// Delete row Function
							$('#pwsModalTable tbody').on(
									'click',
									'tr',
									function() {
										if ($(this).hasClass('selected')) {
											$(this).removeClass('selected');
										} else {
											t.$('tr.selected').removeClass(
													'selected');
											$(this).addClass('selected');
										}
									});

							$('#deleteRow').click(function() {
								t.row('.selected').remove().draw(false);

							});

							// converting all the table data into JSON format and send
							// it as request in ajax method.
							$('#submit')
									.click(
											function() {
												var tableData = $(
														'#pwsModalTable')
														.tableToJSON(
																{
																	headings : [
																			'productName',
																			'quantity',
																			'productId',
																			'vendorId',
																			'stockId' ]
																});
												// console.log(data);
												alert(JSON.stringify(tableData));
												var json = JSON
														.stringify(tableData);
												// assign json to a hidden field value.
												$('#jsonData').val(json);
											});

						});
	</script>
</body>
</html>