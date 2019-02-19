<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- importing other package for jsp/scriplet format -->
<%@page import="java.sql.*, net.spmov.*, Model.*, java.util.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<%
	//SessionProtection + no Cache
	//protect from back access button as session invalidate is not enough. Need to clear cache
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP																		// 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setDateHeader("Expires", 0); // Proxies.
%>

<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/jquery/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/jquery/jquery-ui.theme.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootstrap/css/bootstrap-theme.min.css" />

<!-- Custom styles for login -->
<link href="dependencies/login/signin.css" rel="stylesheet">

<script src="dependencies/jquery/jquery-1.11.3.js"></script>
<script src="dependencies/jquery/jquery-ui.js"></script>
<script src="dependencies/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">

		<!--action="login" is based by URL Mapping in web.xml -->
		<form class="form-signin" action="LoginServlet1" method="post"
			onsubmit="return validateForm()">
			<h2 class="form-signin-heading text-center">SPMOV</h2>

			<!-- required= mandatory to key in field.validation -->
			<label for="inputEmail" class="sr-only">UserName</label> <input
				type="text" name="inputText" class="form-control" placeholder="John"
				autofocus> <label for="inputPassword" class="sr-only">Password</label>
			<input type="password" name="inputPassword" class="form-control"
				placeholder="Password">



			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
				in</button>
		</form>

	</div>
	<!-- /container -->

	<script>
		console.log("activated");
		function validateForm() {
			var userName = $("input[name='inputText']").val();
			var password = $("input[name='inputPassword']").val();
			console.log("Username and password is:");
			console.log(userName + ":" + password);
			/*var userName = document.getElementById('loginid').value;
			var password = document.getElementById('password').value;*/

			if ((userName == null || userName == "")
					|| (password == null || password == "")) {
				alert("Please input all fields");
				return false;
			} else
				return true;
		}
	</script>


</body>





</html>