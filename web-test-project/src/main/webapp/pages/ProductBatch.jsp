<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Batch</title>

<!-- Bootstrap and Jquery CSS Library - Start-->
<!-- jQuery UI -css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jquery-ui.css" />
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

<!-- jQuery UI (necessary for Bootstrap's JavaScript plugins) - Start-->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- BootstrapValidator JS Library -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>
<!-- Jquery data table JS Library -->
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) - End-->

<!-- ProductBatch Script -->

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/ProductBatch.js"></script>

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
					<p class="text-right text-primary">Welcome: ${username}</p>
				</div>
			</div>
		</div>
	</header>

	<!-- Jumbotron - Start-->
	<div class="jumbotron">
		<div class="container">
			<h3>Please fill required details for product batch.</h3>
			<p class="text-center text-danger">${redirectAttribute}</p>

			<!-- Pop up submission parameter -->
			<p class="text-center text-warning">${popUpMessage}</p>
		</div>
	</div>
	<!-- Jumbotron - End-->

	<!-- Product Details - START -->
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="well">
					<p style="color: blue">
						<b>Product ID : </b> ${pId}
					</p>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="well">
					<p style="color: blue">
						<b>Product Name : </b> ${pName}
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Product Details - END -->

	<!-- Section for see product batch detail - START -->
	<c:choose>
		<c:when test="${not createEnable}">
			<div class="container" id="seeBatchList">
				<div class="table-responsive">
					<table id="seeProductBatchTable" class="display table" width="100%">
						<thead>
							<tr>
								<th>Batch Id</th>
								<th>Product Name</th>
								<th>Vendor</th>
								<th>Stock Id</th>
								<th>Manufacture</th>
								<th>Expire</th>
								<th>Status</th>
								<th>Sold On</th>
								<th>Client Id</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty pBatchList}">
								<c:forEach items="${pBatchList}" var="batch">
									<tr>
										<td>${batch.batchId}</td>
										<td>${batch.productName}</td>
										<td>${batch.vendorId}</td>
										<td>${batch.stockId}</td>
										<td>${batch.manfDate}</td>
										<td>${batch.expiryDate}</td>
										<td>${batch.status}</td>
										<td>${batch.soldOn}</td>
										<td>${batch.clientId}</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>

			<!-- Section for see product batch detail - END -->
		</c:when>

		<c:otherwise>
			<!-- Section for create product batch detail - START -->

			<div class="container" id="createBatchList">

				<form action="createProductBatchFormAction"
					id="createProductBatchForm" method="post" class="form-horizontal">

					<div class="form-group">
						<div class="col-lg-4">
							<select name="status" id="status" class="form-control">
								<option value="">----Please select the status----</option>
								<option value="IN PROCESS">IN PROCESS</option>
								<option value="AVAILABLE">AVAILABLE</option>
								<option value="SOLD">SOLD</option>
							</select>
						</div>

						<div class="col-lg-4">
							<input type="text" id="manufacture" name="manufacture"
								class="form-control" placeholder="Manufacture Date">
						</div>

						<div class="col-lg-4">
							<input type="text" id="expiry" name="expiry" class="form-control"
								placeholder="Expiry Date">
						</div>
					</div>

					<button type="button" id="addRow">Add New Row</button>
					<button type="button" id="deleteRow">Delete Selected Row</button>
					<br> <br>
					<table id="createProductBatchTable"
						class="table table-striped table-bordered" cellspacing="0"
						width="100%">
						<thead>
							<tr>
								<th>Manufacture</th>
								<th>Expire</th>
								<th>Status</th>
							</tr>
						</thead>

						<tfoot>
							<tr>
								<th>Manufacture</th>
								<th>Expire</th>
								<th>Status</th>
							</tr>
						</tfoot>
						<tbody>
						</tbody>
					</table>
					<br> <input type="hidden" id="quantityRequired"
						value="${quantity}"> <input type="hidden"
						class="form-control" id="jsonData" name="json">
					<!-- <button type="submit" class="btn btn-primary" id="submit">Submit</button> -->
					<button type="button" class="btn btn-primary" id="submit">Submit</button>
				</form>
			</div>
			<!-- Section for create product batch detail - END -->
		</c:otherwise>
	</c:choose>

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