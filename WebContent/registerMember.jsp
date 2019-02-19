<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, net.spmov.*, Model.*, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SPMOV</title>

<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/jquery/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/jquery/jquery-ui.theme.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootstrap/css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootstrap/css/bootstrap-table.css" />

<link rel="stylesheet" type="text/css"
	href="dependencies/datetimepicker-master/jquery.datetimepicker.css" />



<!-- Administrator side -->
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootsnipp/style.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/magicsuggest/css/magicsuggest-min.css" />
<link rel="stylesheet" type="text/css"
	href="dependencies/dist/semantic.min.css">
<!-- end admin side-->

<script src="dependencies/jquery/jquery-1.11.3.js"></script>
<script src="dependencies/jquery/jquery-ui.js"></script>
<script src="dependencies/bootstrap/js/bootstrap.min.js"></script>
<script src="dependencies/bootstrap/js/bootstrap-table.js"></script>
<script src="dependencies/magicsuggest/js/magicsuggest-min.js"></script>
<script src="dependencies/bootstrap/js/bootstrap-table-zh-CN.js"></script>
<script src="dependencies/bootstrap/js/notify.min.js"></script>
<script src="dependencies/dist/semantic.min.js"></script>
<script
	src="dependencies/datetimepicker-master/build/jquery.datetimepicker.full.min.js"></script>


</head>
<body>
	<input type="button" value="Click Me" data-toggle="modal"
		href="#myModal">

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<input type="hidden" name="modalHidden">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Registration</h4>

				</div>

				<div class="modal-body">

					<!-- form  tag start here -->
					<form class="ui form" method="post" action="member">
						<div class="field">
							<label>Username</label> <input name="username" type="text">
						</div>

						<div class="two fields">
							<div class="field">
								<label>Password</label> <input name="pwd" type="text">
							</div>
							<div class="field">
								<label>*Confirm Password</label> <input name="cfmpwd"
									type="text">
							</div>
						</div>


						<div class="two fields">
							<div class="field">
								<label>First Name</label> <input name="firstname" type="text">
							</div>
							<div class="field">
								<label>Last Name</label> <input name="lastname" type="text">
							</div>
						</div>

						<div class="two fields">
							<div class="field">
								<label>NRIC/FIN</label> <input name="nric" type="text">
							</div>
							<div class="field">
								<label>Gender</label>
								
								
								<div class="ui fluid selection dropdown">
									<input name="gender" type="hidden">
									<div class="default text">Gender</div>
									<i class="dropdown icon"></i>
									<div class="menu">
										<div class="item" data-value="1">Male</div>
										<div class="item" data-value="0">Female</div>
									</div>
								</div>
								
								
							</div>
						</div>


						<div class="two fields">
							<div class="field">
								<label>Email</label> <input name="email" type="text">
							</div>
							<div class="field">
								<label>Contact No</label> <input name="contact" type="text">
							</div>
						</div>

						<div class="two fields">
							<div class="field">
								<label>Block</label> <input name="block" type="text">
							</div>
							<div class="field">
								<label>Street</label> <input name="street" type="text">
							</div>
						</div>
						<div class="two fields">
							<div class="field">
								<label>Unit</label> <input name="unit" type="text">
							</div>
							<div class="field">
								<label>Postal Code</label> <input name="postalCode" type="text">
							</div>
						</div>

						<div class="inline field">
							<div class="ui checkbox">
								<input name="terms" type="checkbox"> <label>I
									agree to the Terms and Conditions</label>
							</div>
						</div>
						<div class="ui blue submit button">Submit</div>
						<div class="ui reset button">Reset</div>
						<div class="ui clear basic button">Clear</div>
						<div class="ui error message"></div>
					</form>
				</div>
				<!-- end modal-body -->


			</div>
			<!-- end of modal content -->
		</div>
	</div>
	<!-- end modal -->

	<script>
		$('.ui.dropdown').dropdown();
		//init checkbox needed. Problem poses if not = cant tick
		$('.ui.checkbox').checkbox();

	
	</script>





</body>
</html>