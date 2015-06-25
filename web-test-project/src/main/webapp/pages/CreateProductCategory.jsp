<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html>
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

<!-- Manual Script -->
<%-- <%=request.getContextPath()%> --%>
<script type="text/javascript" src="/resources/js/manualScript.js"></script>

<!-- CreateProductCategory Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/CreateProductCategory.js"></script>

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
					<button type="button"
						class="btn btn-warning navbar-btn navbar-right"
						data-toggle="modal" data-target="#createCategoryModal">Create
						Category</button>
					<!-- Create product category Modal Button to Trigger Modal - End -->

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

	<!-- Form Components - Start-->
	<div class="container">
		<form action="createProductCategoryAction"
			id="createProductCategoryForm" method="post" class="form-horizontal">
			<div class="form-group">
				<label for="pId">Product Category ID</label> <input type="text"
					id="pId" class="form-control" name="productCatId_name"
					placeholder="Enter Id" disabled="disabled">
			</div>
			<p class="help-block">Product category id is auto generated.</p>
			<div class="form-group">
				<label for="pNameId">Product Category Name</label> <input
					type="text" id="pNameId" class="form-control"
					name="productCatName_name" placeholder="Enter Name">
			</div>
			<button type="submit" class="btn btn-primary" name="create_name">Create</button>
			<a href="" class="">Cancel</a>
		</form>
	</div>
	<!-- Form Components - End-->

	<br>
	<br>
	<!--Product category Table Grid - Start -->
	<div class="container">
		<form action="createCategoryFormAction" method="post">
			<div class="table-responsive">
				<table id="createCategory"
					class="table table-striped table-bordered" cellspacing="0"
					width="100%">
					<thead>
						<tr>
							<th>Category ID</th>
							<th>Name</th>
							<th>User ID</th>
							<th>Action</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Category ID</th>
							<th>Name</th>
							<th>User ID</th>
							<th>Action</th>
						</tr>
					</tfoot>
					<tbody>
						<c:if test="${not empty categoryList}">
							<c:forEach items="${categoryList}" var="productCategory">
								<tr>
									<td>${productCategory.pCatrgoryId}</td>
									<td>${productCategory.pCategoryName}</td>
									<td>${productCategory.userId}</td>
									<td align="center">
										<!-- See category Action button -->
										<button type="submit" class="btn btn-primary" id="seeDetails"
											name="seeDetailsName"
											value="${productCategory.pCatrgoryId} seeButton"
											data-toggle="tooltip" data-placement="bottom" title="See">
											<span class="glyphicon glyphicon-eye-open"></span>
										</button> <!-- Remove category Action button -->
										<button type="submit" class="btn btn-primary"
											id="removeCategory" name="removeCategoryName"
											value="${productCategory.pCatrgoryId} removeButton"
											data-toggle="tooltip" data-placement="bottom" title="Remove"
											onclick="javascript: getAlertForRemove();">
											<span class="glyphicon glyphicon-remove"></span>
										</button> <!-- Update category Action button --> <span
										data-placement="bottom" data-toggle="tooltip" title="Update">
											<button type="button" class="btn btn-primary"
												id="updateCategory" data-toggle="modal"
												data-target="#updateCategoryModal"
												onclick="update_click('${productCategory.pCatrgoryId}','${productCategory.pCategoryName}');">
												<span class="glyphicon glyphicon-edit"></span>
											</button>
									</span>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	<!--Product category Table Grid - End -->
	<br>
	<br>


	<!--  Modal (Create Category Pop Up View and Form) - Start-->

	<div class="container">

		<!-- Modal HTML -->
		<div id="createCategoryModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title text-danger">Create Product Category</h4>
					</div>

					<form action="createProductCategoryPopUpAction"
						id="createProductCategoryPopUpForm" method="post">
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

	<!--  Modal (Create Category Pop Up View and Form) - End-->


	<!--  Modal (Update Category Pop Up View and Form) - Start-->

	<div class="container">
		<!-- Modal HTML -->
		<div id="updateCategoryModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title text-danger">Update Product Category</h4>
					</div>

					<form action="updateProductCategoryPopUpAction"
						id="updateProductCategoryPopUpForm" method="post">
						<div class="modal-body">

							<div class="form-group">
								<label for="catName" class="control-label">Product
									Category Name:</label> <input type="text" class="form-control"
									id="catName" name="catName">
							</div>
							<input type="hidden" class="form-control" id="catId" name="catId">
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

	<!--  Modal (Update Category Pop Up View and Form) - End-->

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
		//this function is called when the update button in the table
		//is clicked.
		function update_click(id, name) {
			$('#catName').val(name);
			$('#catId').val(id);
		}
	</script>

</body>
</html>