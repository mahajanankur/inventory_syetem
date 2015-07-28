<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!-- fn tag library for escaping strings- Start-->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- fn tag library - END-->

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
	href="<%=request.getContextPath()%>/resources/css/bootstrapValidator.min.css" />
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

<!-- jQuery flot Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.flot.js"></script>

<!-- jQuery flot pie Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.flot.pie.js"></script>

<!-- TransactionList Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/Analysis.js"></script>

<style>
body {
	padding-top: 40px;
}

.navbar-brand {
	padding-top: 0.2px;
	padding-left: 0px;
}

#placeholder {
	width: 450px;
	height: 300px;
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

	<!-- Panel with product analysis details and PIE Chart -- START -->
	<c:if test="${not empty totalStock}">
		<div class="container">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Product Analysis</h3>
				</div>
				<div class="panel-body">
					<div class="pull-left">

						<c:if test="${not empty totalStock}">
							<p>
								<b>Total Stock :</b> ${totalStock}
							</p>
						</c:if>

						<c:if test="${not empty totalSoldProducts}">
							<p>
								<b>Total sold products :</b> ${totalSoldProducts}
							</p>

							<input type="hidden" id="totalSoldProducts"
								value="${totalSoldProducts}">

						</c:if>

						<c:if test="${not empty sumOfCP}">
							<p>
								<b>Total sum of cost price :</b> ${sumOfCP}
							</p>
							<input type="hidden" id="sumOfCP" value="${sumOfCP}">
						</c:if>

						<c:if test="${not empty sumOfSP}">
							<p>
								<b>Total sum of sale price :</b> ${sumOfSP}
							</p>

							<input type="hidden" id="sumOfSP" value="${sumOfSP}">

							<p id="profitPerc"></p>

						</c:if>

						<c:if test="${not empty maxSoldProductDetails}">
							<p>
								<b>Maximum sold product :</b> ${maxPName}
							</p>
							<p>
								<b>Maximum sold quantities :</b> ${maxPCount}
							</p>

							<input type="hidden" id="maxPName" value="${maxPName}">
							<input type="hidden" id="maxPCount" value="${maxPCount}">
						</c:if>

						<c:if test="${not empty minSoldProductDetails}">
							<p>
								<b>Minimum sold product :</b> ${minPName}
							</p>
							<p>
								<b>Minimum sold quantities :</b> ${minPCount}
							</p>

							<input type="hidden" id="minPName" value="${minPName}">
							<input type="hidden" id="minPCount" value="${minPCount}">
						</c:if>

						<input type="hidden" id="jsonData" value="${fn:escapeXml(data)}">

					</div>
					<div id="placeholder" class="pull-right"></div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- Panel with product analysis details and PIE Chart -- END -->

	<br>
	<footer>
		<div class="container text-center">
			<ul class="list-inline">
				<li><a href="http://www.twitter.com/shivablast">Twitter</a>
				</li>
				<li><a href="http://www.facebook.com/shivablast">Facebook</a>
				</li>
				<li><a href="http://www.youtube.com/shivablast">YouTube</a>
				</li>
			</ul>

			<p>&copy; Copyright @ Shiva Blast - 2015</p>

		</div>
	</footer>

</body>
</html>