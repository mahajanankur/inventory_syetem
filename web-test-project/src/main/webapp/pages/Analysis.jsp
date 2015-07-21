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

<style>
body {
	padding-top: 40px;
}

.navbar-brand {
	padding-top: 0.2px;
	padding-left: 0px;
}

#placeholder {
	width: 550px;
	height: 400px;
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
		<b> Product Analysis </b>

		<div class="well">

			<c:if test="${not empty totalStock}">
				<p>Total Stock : ${totalStock}</p>
			</c:if>
			<c:if test="${not empty totalSoldProducts}">
				<p>Total sold products : ${totalSoldProducts}</p>
				<input type="hidden" id="totalSoldProducts"
					value="${totalSoldProducts}">

			</c:if>
			<c:if test="${not empty sumOfCP}">
				<p>Total sum of cost price : ${sumOfCP}</p>
			</c:if>
			<c:if test="${not empty sumOfSP}">
				<p>Total sum of sale price : ${sumOfSP}</p>
			</c:if>

			<c:if test="${not empty maxSoldProductDetails}">
				<p>Maximum sold product : ${maxPName}, Maximum sold quantities :
					${maxPCount}</p>
				<input type="hidden" id="maxPName" value="${maxPName}">
				<input type="hidden" id="maxPCount" value="${maxPCount}">
			</c:if>
			<c:if test="${not empty minSoldProductDetails}">
				<p>Minimum sold product : ${minPName}, Minimum sold quantities :
					${minPCount}</p>
				<input type="hidden" id="minPName" value="${minPName}">
				<input type="hidden" id="minPCount" value="${minPCount}">
			</c:if>

			<input type="hidden" id="jsonData" value="${fn:escapeXml(data)}">

		</div>

		<br>

		<!-- Portlet with PIE Chart -- START -->

		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Pie Chart</h3>
			</div>
			<div class="panel-body">
				<div id="placeholder" class="demo-placeholder"></div>
			</div>

			<!-- Portlet with PIE Chart -- END -->
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

							// Function for flot pie chart.
							var placeholder = $('#placeholder');
							//var json = $('#jsonData').val();
							var maxLabel = $('#maxPName').val(), maxData = $(
									'#maxPCount').val(), minLabel = $(
									'#minPName').val(), minData = $(
									'#minPCount').val(), restData = $(
									'#totalSoldProducts').val();
							var dataForm = dataFormatter(maxLabel, maxData,
									minLabel, minData, restData);
							//var series = $.parseJSON(JSON.stringify(json));
							alert(dataForm);
							$.plot(placeholder, dataForm, {
								series : {
									pie : {
										show : true,
										radius : 1,
										label : {
											show : true,
											radius : 2 / 3,
											formatter : labelFormatter,
											background : {
												opacity : 0.5
											}
										}
									}
								},
								legend : {
									show : false
								}
							});

							// A custom label formatter used by pie plots
							function labelFormatter(label, series) {
								return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>"
										+ label
										+ "<br/>"
										+ Math.round(series.percent)
										+ "%</div>";
							}
							;

							// A custom data formatter used to get required data in proper format as the flot wants.
							function dataFormatter(maxLabel, maxData, minLabel,
									minData, restData) {

								var data = [], size = 3;

								for (var i = 0; i < size; i++) {
									if (i == 0) {
										if (maxLabel != '' && maxData != '') {
											data[i] = {
												label : '"' + maxLabel + '"',
												data : parseInt(maxData)
											};
										}
									}

									if (i == 1) {
										if (minLabel != '' && minData != '') {
											data[i] = {
												label : '"' + minLabel + '"',
												data : parseInt(minData)
											};
										}
									}

									if (i == 2) {
										if (restData != '') {
											var restD = parseInt(restData)
													- (parseInt(maxData) + parseInt(minData));
											data[i] = {
												label : "Other",
												data : restD
											};
										}
									}

								}
								return data;
							}
							;

						});
	</script>
</body>
</html>