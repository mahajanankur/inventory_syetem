<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>


<!-- Bootstrap CSS Library -->
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- BootstrapValidator CSS Library -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrapvalidator.min.css" />
<!-- Optional theme -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.min.css">


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Bootstrap.min.js -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- BootstrapValidator JS Library -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>

<!-- Not Working -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%-- <script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.11.2.min.js"></script>
<!-- Bootstrap.min.js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<!-- BootstrapValidator JS Library -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/bootstrapvalidator.min.js"></script>
 --%>
<!-- Login Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/Login.js"></script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<div class="page-header">
					<h2>Welcome to My Application</h2>
				</div>

				<!-- <form id="loginId" class="form-horizontal" action="loginFormAction"> -->
				<form id="loginId" class="form-horizontal"
					action="<c:url value='/j_spring_security_check' />" method='POST'>

					<div class="form-group">
						<div class="well">${failMsg}</div>
						<label class="col-lg-3 control-label">Username</label>
						<div class="col-lg-5">
							<input type="text" class="form-control" name="username" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">Password</label>
						<div class="col-lg-5">
							<input type="password" class="form-control" name="password" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-lg-9 col-lg-offset-3">
							<input type="submit" name="login_name" value="Sign In"
								class="btn btn-primary" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>