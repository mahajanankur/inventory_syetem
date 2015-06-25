<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Category Detail</title>


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

<!-- SeeProductCategoryDetails Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/SeeProductCategoryDetails.js"></script>

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
				<!-- <button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#myModal" data-title="Feedback">Feedback</button> -->

				<div class="collpase navbar-collpase" id="collpase">
					<!-- Create product category Modal Button to Trigger Modal - Start -->
					<button type="button"
						class="btn btn-warning navbar-btn navbar-right"
						data-toggle="modal" data-target="#myCreateModal">Create
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
			<h3>You Product Category details are :</h3>
			<!-- Pop up submission parameter -->
			<p class="text-center text-danger">${popUpMessage}</p>


		</div>
	</div>
	<!-- Jumbotron - End-->


	<!-- See details container - Start -->

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="well">
					<p>
						<b>Product Category ID : </b> ${pCategory.pCatrgoryId}
					</p>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="well">
					<p>
						<b>Product Category Name : </b> ${pCategory.pCategoryName}
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- See details container - End -->


	<!-- Collapse container for Create Sub Category - Start-->

	<div class="container">
		<div class="row">

			<form id="createSubCategory" method="post" class="form-horizontal"
				action="createSubCategoryAction">
				<div class="panel-group" id="steps">
					<!-- Step 1 -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#steps" href="#stepOne">Create
									Sub-Category</a>
							</h4>
						</div>
						<div id="stepOne" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="form-group">
									<label class="col-lg-2 control-label">Sub-Category Name</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="subCatName"
											id="subCatNameId" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-9 col-lg-offset-3">
										<button type="submit" class="btn btn-primary"
											id="sub_submit_id" name="create_sub_cat_name"
											value="${pCategory.pCatrgoryId}">Create</button>
										<!-- <a href="" class="btn btn-default" id="sub_cancel_id"
											name="sub_cancel_name" value="sub_cancel_value">Cancel</a> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Collapse container for Create Sub Category - End-->

	<!--Sub Product category Table Grid - Start -->
	<div class="container">
		<form action="subCategoryTableForm" method="post">
			<div class="table-responsive">
				<table id="subCategoryTable" class="display table" width="100%">
					<thead>
						<tr>
							<th>Sub Category ID</th>
							<th>Name</th>
							<th>Category Id</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty subCategoryList}">
							<c:forEach items="${subCategoryList}" var="subProductCategory">
								<tr>
									<td>${subProductCategory.subCategoryId}</td>
									<td>${subProductCategory.subCategoryName}</td>
									<td>${subProductCategory.categoryId}</td>
									<!-- <td><button type="submit" class="btn btn-primary"
											id="seeDetails" name="seeDetailsName" value="seeDetailsValue"
											onclick="javascript: getTableContent();"> -->
									<td>
										<!-- Create Product linked to the subCategory Action button -->
										<button type="submit" class="btn btn-primary"
											id="createProduct" name="createProductName"
											value="${subProductCategory.categoryId} ${subProductCategory.subCategoryId} ${subProductCategory.subCategoryName} createButton"
											data-toggle="tooltip" data-placement="bottom"
											title="Create Product">
											<span class="glyphicon glyphicon-leaf"></span>
										</button> <!-- See Sub category Action button -->
										<button type="submit" class="btn btn-primary"
											id="seeSubCategoryDetails" name="seeSubCategoryDetailsName"
											value="${subProductCategory.subCategoryId} seeButton"
											data-toggle="tooltip" data-placement="bottom" title="See">
											<span class="glyphicon glyphicon-eye-open"></span>
										</button> <!-- Remove sub category Action button -->
										<button type="submit" class="btn btn-primary"
											id="removeSubCategory" name="removeSubCategoryName"
											value="${subProductCategory.subCategoryId} removeButton"
											data-toggle="tooltip" data-placement="bottom" title="Remove">
											<span class="glyphicon glyphicon-remove"></span>
										</button> <!-- Update sub category Action button -->
										<button type="submit" class="btn btn-primary"
											id="updateSubCategory" name="updateSubCategoryName"
											value="${subProductCategory.subCategoryId} updateButton"
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
	<!--Sub Product category Table Grid - End -->



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