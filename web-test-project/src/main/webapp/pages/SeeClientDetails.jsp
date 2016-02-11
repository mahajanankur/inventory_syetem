<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>See Client</title>


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

<!-- SeeClientDetails Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/SeeClientDetails.js"></script>
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
			<h3>Please check client details.</h3>
			<p class="text-center text-danger">${redirectAttribute}</p>

			<!-- Pop up submission parameter -->
			<p class="text-center text-warning">${popUpMessage}</p>


		</div>
	</div>
	<!-- Jumbotron - End-->




	<!--  Modal (Create Category Pop Up View and Form) - Start-->

	<div class="bs-example">

		<!-- Modal HTML -->
		<div id="myCreateModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
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

	<div class="container">
		<div class="well">
			<p>
				<b>Client ID : </b>${client.clientId}
			</p>

			<p>
				<b>Client Name : </b>${client.clientName}
			</p>
			<p>
				<b>E-Mail : </b>${client.email}
			</p>
			<p>
				<b>Balance : </b>${client.balance}

				<!-- Add balance - Modal Button to Trigger Modal - Start -->
				<button type="button" class="btn btn-success btn-xs"
					data-toggle="modal" data-target="#addBalanceModal">Add
					Balance</button>
				<!-- Add balance - Modal Button to Trigger Modal - End -->
			</p>
			<p>
				<b>Mobile : </b>${client.mobile}
			</p>
			<p>
				<b>Address : </b>${client.address}
			</p>
			<p>
				<b>Pincode : </b>${client.pincode}
			</p>
			<p>
				<b>Created On : </b>${client.createdOn}
			</p>
			<p>
				<b>User ID : </b>${client.userId}
			</p>
		</div>

	</div>

	<!--  Modal (Add balance Pop Up View and Form) - Start-->

	<div class="container">

		<!-- Modal HTML -->
		<div id="addBalanceModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title text-danger">Add Balance</h4>
					</div>

					<form action="addBalanceFormAction" id="addBalanceForm"
						method="post">
						<div class="modal-body">
							<input type="hidden" id="clientId" name="clientId"
								value="${client.clientId}">

							<div class="form-group">
								<label for="aBalance" class="control-label">Add Balance:</label>
								<div class="input-group">
									<span class="input-group-addon">&#x20B9;</span> <input
										type="text" class="form-control" id="aBalance" name="aBalance"
										placeholder="Add Balance">
								</div>
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
	<!--  Modal (Add balance Pop Up View and Form) - End-->

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