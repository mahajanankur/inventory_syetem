<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vendor List</title>


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
					<!-- Create Vendor Modal Button to Trigger Modal - Start -->
					<button type="button"
						class="btn btn-warning navbar-btn navbar-right"
						data-toggle="modal" data-target="#createVendorModal">Create
						Vendor</button>
					<!-- Create Vendor Modal Button to Trigger Modal - End -->



					<p class="text-center text-primary">Welcome: ${username}</p>

				</div>
			</div>
		</div>
	</header>


	<!-- Jumbotron - Start-->
	<div class="jumbotron">
		<div class="container">
			<h3>Please fill required details for vendor.</h3>
			<p class="text-center text-danger">${redirectAttribute}</p>

			<!-- Pop up submission parameter -->
			<p class="text-center text-warning">${popUpMessage}</p>


		</div>
	</div>
	<!-- Jumbotron - End-->

	<!--  Modal (Create Vendor Pop Up View and Form) - Start-->

	<div class="container">

		<!-- Modal HTML -->
		<div id="createVendorModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title text-danger">Create Vendor</h4>
					</div>

					<form action="createVendorPopUpAction" id="createVendorPopUpForm"
						method="post">
						<div class="modal-body">

							<div class="form-group">
								<label for="comapny" class="control-label">Company:</label> <input
									type="text" class="form-control" id="comapny" name="company"
									placeholder="Comapny Name">
							</div>

							<div class="form-group">
								<label for="email" class="control-label">E-Mail:</label> <input
									type="text" class="form-control" id="email" name="email"
									placeholder="E-Mail">
							</div>

							<div class="form-group">
								<label for="mobile" class="control-label">Mobile:</label>
								<div class="input-group">
									<span class="input-group-addon">+91</span> <input type="text"
										class="form-control" id="mobile" name="mobile"
										placeholder="Mobile Number">
								</div>
							</div>

							<!-- Dynamic fields for telephone numbers - START -->

							<div class="form-group">
								<div class="btn-group">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										Add more <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#" class="addPhoneButton"
											data-name="phone_home">Home</a></li>
										<li><a href="#" class="addPhoneButton"
											data-name="phone_office">Office</a></li>
									</ul>
								</div>
							</div>

							<!-- Template for dynamic field - START-->

							<div class="form-group" id="template" style="display: none;">
								<label class="control-label"></label> <input
									class="form-control" type="text" />
								<div class="form-group">
									<button type="button" class="btn btn-link removeButton">Remove</button>
								</div>
							</div>

							<!-- Template for dynamic field - END-->

							<!-- Dynamic fields for telephone numbers - END -->

							<div class="form-group">
								<label for="address" class="control-label">Address:</label>
								<textarea class="form-control" rows="5" id="address"
									name="address" placeholder="Address"></textarea>
							</div>
							<div class="form-group">
								<label for="pincode" class="control-label">Pincode:</label> <input
									type="text" class="form-control" id="pincode" name="pincode"
									placeholder="Pincode">
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

	<!-- Vendors dataTable view - Start -->

	<div class="container">
		<form action="vendorTableFormAction" method="post">
			<div class="table-responsive">
				<table id="vendorTable"
					class="table table-striped table-bordered" cellspacing="0"
					width="100%">
					<thead>
						<tr>
							<th>Vendor ID</th>
							<th>Company</th>
							<th>E-mail</th>
							<th>Mobile</th>
							<th>Action</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Vendor ID</th>
							<th>Company</th>
							<th>E-mail</th>
							<th>Mobile</th>
							<th>Action</th>
						</tr>
					</tfoot>
					<tbody>
						<c:if test="${not empty vendorList}">
							<c:forEach items="${vendorList}" var="vendor">
								<tr>
									<td>${vendor.vendorId}</td>
									<td>${vendor.company}</td>
									<td>${vendor.email}</td>
									<td>${vendor.mobile}</td>
									<td align="center">
										<!-- See category Action button -->
										<button type="submit" class="btn btn-primary" id="seeDetails"
											name="seeVendor"
											value="${vendor.vendorId} seeButton"
											data-toggle="tooltip" data-placement="bottom" title="See">
											<span class="glyphicon glyphicon-eye-open"></span>
										</button> <!-- Remove category Action button -->
										<button type="submit" class="btn btn-primary"
											id="removeVendor" name="removeVendorName"
											value="${vendor.vendorId} removeButton"
											data-toggle="tooltip" data-placement="bottom" title="Remove"
											onclick="javascript: getAlertForRemove();">
											<span class="glyphicon glyphicon-remove"></span>
										</button> <!-- Update category Action button -->
										<button type="submit" class="btn btn-primary"
											id="updateVendor" name="updateVendorName"
											value="${vendor.vendorId} updateButton"
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

	<!-- Vendors dataTable view - End -->

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
							// function for product category table view.
							$('#vendorTable').dataTable();

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

							$('.addPhoneButton')
									.on(
											'click',
											function() {
												var $that = $(this), $template = $('#template'), $newRow = $template
														.clone()
														.removeAttr('id')
														.insertBefore($template)
														.show();

												$that.parent().addClass(
														'disabled');

												// Set the label and field name
												var fieldName = $that
														.attr('data-name');
												$newRow
														.find('.control-label')
														.html($that.html())
														.end()
														.find('input')
														.attr('name', fieldName)
														.end()
														.on(
																'click',
																'.removeButton',
																function() {
																	// Remove field when clicking the Remove button
																	$(
																			'#contactForm')
																			.bootstrapValidator(
																					'removeField',
																					fieldName);

																	// Enable the Add button
																	$that
																			.parent()
																			.removeClass(
																					'disabled');

																	// Remove element
																	$newRow
																			.remove();
																});

												// Add new field
												$('#contactForm')
														.bootstrapValidator(
																'addField',
																fieldName,
																{
																	message : 'The phone number is not valid',
																	validators : {
																		digits : {
																			message : 'The value can contain only digits'
																		}
																	}
																});
											});

							$('#createVendorPopUpForm')
									.bootstrapValidator(
											{
												message : 'This value is not valid',
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													phone : {
														message : 'The phone number is not valid',
														validators : {
															notEmpty : {
																message : 'The phone number is required'
															},
															digits : {
																message : 'The value can contain only digits'
															}
														}
													}
												}
											}).on(
											'error.field.bv',
											function(e, data) {
												console.log(data.field,
														data.element,
														'-->error');
											}).on(
											'success.field.bv',
											function(e, data) {
												console.log(data.field,
														data.element,
														'-->success');
											});
						});
	</script>
</body>
</html>