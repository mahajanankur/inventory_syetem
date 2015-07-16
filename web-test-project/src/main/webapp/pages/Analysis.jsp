<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Analysis</title>


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
<!-- jQuery UI -css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jquery-ui.css" />


<!-- Bootstrap and Jquery CSS Library - End-->


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) - Start-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- jQuery UI (necessary for Bootstrap's JavaScript plugins) - Start-->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>

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
						src="<%=request.getContextPath()%>/resources/images/logo.png">
					</a>
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
			<h3>Please fill required details for product category.</h3>
			<p class="text-center text-danger">${redirectAttribute}</p>

			<!-- Pop up submission parameter -->
			<p class="text-center text-warning">${popUpMessage}</p>


		</div>
	</div>
	<!-- Jumbotron - End-->


	<div class="container">
		<form action="analysisFormAction" id="analysisForm" method="get">
			<label>Date From</label> <input type="text" id="dFrom" name="dFrom">
			<label>Date To</label> <input type="text" id="dTo" name="dTo">
			<button type="submit" class="btn btn-primary">GET</button>
		</form>
	</div>
	<br>
	<div class="container">
		<b> <u>Product Analysis</u>
		</b>
		<div class="well">
			<c:if test="${not empty sumOfCP}">
				<p>Total sum of cost price : ${sumOfCP}</p>
			</c:if>
			<c:if test="${not empty sumOfSP}">
				<p>Total sum of sale price : ${sumOfSP}</p>
			</c:if>
			<c:if test="${not empty totalSoldProducts}">
				<p>Total sold products : ${totalSoldProducts}</p>
			</c:if>
			<c:if test="${not empty maxSoldProductDetails}">
				<p>Maximum sold product : ${maxSoldProductDetails[1]}, Maximum
					sold quantities : ${maxSoldProductDetails[2]}</p>
			</c:if>
			<c:if test="${not empty minSoldProductDetails}">
				<p>Minimum sold product : ${minSoldProductDetails[1]}, Minimum
					sold quantities : ${minSoldProductDetails[2]}</p>
			</c:if>

		</div>
	</div>


	<br>
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

							//date pickers
							$('#dFrom').datepicker(
									{
										numberOfMonths : 1,
										//dateFormat : 'dd/mm/yy',
										changeMonth : true,
										changeYear : true,
										maxDate : -1,
										onSelect : function(selected) {
											var dt = new Date(selected);
											dt.setDate(dt.getDate() + 1);
											$("#dTo").datepicker("option",
													"minDate", dt);
										}
									});
							$('#dTo').datepicker(
									{
										numberOfMonths : 1,
										//dateFormat : 'dd/mm/yy',
										changeMonth : true,
										changeYear : true,
										maxDate : 0,
										onSelect : function(selected) {
											var dt = new Date(selected);
											dt.setDate(dt.getDate() - 1);
											$("#dFrom").datepicker("option",
													"maxDate", dt);
										}
									});

							// function for product category table view.
							$('#myTable').dataTable();

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

						});
	</script>
</body>
</html>