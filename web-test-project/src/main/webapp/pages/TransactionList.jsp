<%@page import="com.web.ServiceImpl.UsersServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction List</title>


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

<!-- TransactionList Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/TransactionList.js"></script>

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

				<!-- Button HTML (to Trigger Modal) -->

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
			<h3>Create transactions according to instructions given.</h3>
			<p class="text-center text-danger">${redirectAttribute}</p>

			<!-- Pop up submission parameter -->
			<p class="text-center text-warning">${successMessage}</p>


		</div>
	</div>
	<!-- Jumbotron - End-->


	<!--  Modal (Create Transaction Pop Up View and Form) - Start -- NOT USED YET-->

	<div class="bs-example">

		<!-- Modal HTML -->
		<div id="myCreateModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title text-danger">Create Product Category</h4>
					</div>

					<form action="removeProductCategoryPopUpAction"
						id="removeProductCategoryPopUpForm" method="post">
						<div class="modal-body">

							<div class="form-group">
								<label for="pCatName" class="control-label">Product
									Category Name:</label> <input type="text" class="form-control"
									id="pCatName" name="pCatName">
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

	<!--  Modal (Create Transaction Pop Up View and Form) - End -- NOT USED YET -->

	<!-- create transaction form - starts -->
	<div class="container">
		<form action="transactionFormAction" id="transactionForm"
			method="post" class="form-horizontal">

			<!-- send value of fromClient boolean to controller. -->
			<input type="hidden" id="fromClient" name="fromClient"
				value="${fromClient}">

			<c:choose>
				<c:when test="${fromClient == true}">
					<div class="form-group">
						<label for="clientName" class="col-lg-1 control-label">Client</label>
						<div class="col-lg-4">
							<p style="color: blue">
								<b>${clientDetails.clientName}</b>
							</p>
							<input type="hidden" id="clientId" name="hClientDetails"
								value="${clientDetails.clientId}|${clientDetails.clientName}">
						</div>
					</div>
				</c:when>

				<c:otherwise>

					<div class="form-group">
						<label for="clientFromHome" class="col-lg-1 control-label">Client</label>
						<div class="col-lg-4">
							<select class="form-control" name="clientFromHome"
								id="clientFromHome">
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

				</c:otherwise>
			</c:choose>

			<div class="form-group">
				<label for="subCategory" class="col-lg-1 control-label">Category</label>
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

			<button type="submit" class="btn btn-primary">Send</button>
		</form>
	</div>
	<!-- create transaction form - End -->
	</br>

	<!-- Choose statement for transaction table -->
	<form action="transactionTableAction" id="transactionFormId"
		method="post">
		<c:choose>
			<c:when test="${fromClient == true}">
				<!--Client Table - Start -->
				<div class="container">
					<div class="table-responsive">
						<!-- <table id="transactionFromClientTable" class="display table"
							width="100%"> -->
						<table id="transactionFromClientTable"
							class="table table-striped table-bordered" cellspacing="0"
							width="100%">

							<thead>
								<tr>
									<th>Transaction ID</th>
									<th>Name</th>
									<th>Quantity</th>
									<th>Amount</th>
									<th>Created On</th>
									<th>Action</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Transaction ID</th>
									<th>Name</th>
									<th>Quantity</th>
									<th>Amount</th>
									<th>Created On</th>
									<th>Action</th>
								</tr>
							</tfoot>
							<tbody>
								<c:if test="${not empty clientTransactionList}">
									<c:forEach items="${clientTransactionList}"
										var="clientTransaction">
										<tr>
											<td>${clientTransaction.transactionId}</td>
											<td>${clientTransaction.productName}</td>
											<td>${clientTransaction.quantity}</td>
											<td>${clientTransaction.tAmount}</td>
											<td>${clientTransaction.createdOn}</td>
											<td>
												<!-- See Client Action button -->
												<button type="submit" class="btn btn-primary"
													id="seeDetails" name="seeDetailsName"
													value="${client.clientId} seeButton" data-toggle="tooltip"
													data-placement="bottom" title="See">
													<span class="glyphicon glyphicon-eye-open"></span>
												</button> <!-- Remove Client Action button -->
												<button type="submit" class="btn btn-primary"
													id="removeClient" name="removeClientName"
													value="${client.clientId} removeButton"
													data-toggle="tooltip" data-placement="bottom"
													title="Remove">
													<span class="glyphicon glyphicon-remove"></span>
												</button> <!-- Update Client Action button -->
												<button type="submit" class="btn btn-primary"
													id="updateClient" name="updateClientName"
													value="${client.clientId} updateButton"
													data-toggle="tooltip" data-placement="bottom"
													title="Update" data-toggle="modal"
													data-target="#myCreateModal">
													<span class="glyphicon glyphicon-edit"></span>
												</button>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<!--Transaction Table - End -->

			</c:when>

			<c:otherwise>

				<!--Client Table - Start -->
				<div class="container">
					<div class="table-responsive">
						<table id="transactionTable" class="display table" width="100%">
							<thead>
								<tr>
									<th>Transaction ID</th>
									<th>Client Name</th>
									<th>Name</th>
									<th>Quantity</th>
									<th>Amount</th>
									<th>Created On</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty transactionList}">
									<c:forEach items="${transactionList}" var="transaction">
										<tr>
											<td>${transaction.transactionId}</td>
											<td>${transaction.clientName}</td>
											<td>${transaction.productName}</td>
											<td>${transaction.quantity}</td>
											<td>${transaction.tAmount}</td>
											<td>${transaction.createdOn}</td>
											<td>
												<%-- 						<!-- Create transaction Action button -->
												<button type="submit" class="btn btn-primary"
													id="createTransaction" name="createTransactionName"
													value="${client.clientId} createTransaction"
													data-toggle="tooltip" data-placement="bottom"
													title="Create Transaction">
													<span class="glyphicon glyphicon-usd"></span>
												</button> --%> <!-- See Client Action button -->
												<button type="submit" class="btn btn-primary"
													id="seeDetails" name="seeDetailsName"
													value="${client.clientId} seeButton" data-toggle="tooltip"
													data-placement="bottom" title="See">
													<span class="glyphicon glyphicon-eye-open"></span>
												</button> <!-- Remove Client Action button -->
												<button type="submit" class="btn btn-primary"
													id="removeClient" name="removeClientName"
													value="${client.clientId} removeButton"
													data-toggle="tooltip" data-placement="bottom"
													title="Remove">
													<span class="glyphicon glyphicon-remove"></span>
												</button> <!-- Update Client Action button -->
												<button type="submit" class="btn btn-primary"
													id="updateClient" name="updateClientName"
													value="${client.clientId} updateButton"
													data-toggle="tooltip" data-placement="bottom"
													title="Update" data-toggle="modal"
													data-target="#myCreateModal">
													<span class="glyphicon glyphicon-edit"></span>
												</button>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<!--Transaction Table - End -->

			</c:otherwise>
		</c:choose>
	</form>

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