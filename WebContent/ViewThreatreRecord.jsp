<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, net.spmov.*, Model.*, java.util.*"%>
<%
	//SessionProtection + no Cache
	//protect from back access button as session invalidate is not enough. Need to clear cache
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP																		// 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setDateHeader("Expires", 0); // Proxies.
%>


<!-- call servlet directing with URL-Mapping through a JSP page -->
<!-- synonymous with the RequestDispatcher -->




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<title>Threatre Management</title>

<head>
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



<!-- Administrator side -->
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootsnipp/style.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/magicsuggest/css/magicsuggest-min.css" />

<!-- end admin side-->
<script src="dependencies/jquery/jquery-1.11.3.js"></script>
<script src="dependencies/jquery/jquery-ui.js"></script>
<script src="dependencies/bootstrap/js/bootstrap.min.js"></script>
<script src="dependencies/bootstrap/js/bootstrap-table.js"></script>
<script src="dependencies/magicsuggest/js/magicsuggest-min.js"></script>
<script src="dependencies/bootstrap/js/bootstrap-table-zh-CN.js"></script>
<script src="dependencies/bootstrap/js/notify.min.js"></script>
</head>
<body>

	<script>
		
	</script>


	<%
		User mUser;
		//getting existing httpSession,check if exist
		HttpSession userSession = request.getSession(false);
		mUser = (User) userSession.getAttribute("USER");
		System.out.println("TheatreRecord.jsp : " + mUser.getmUsername() + mUser.getmPassword());
		if (mUser == null)
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		System.out.println(mUser.getmUsername() + ":" + mUser.getmPassword());
	%>
	<!-- (taking the whole body as an entire row) -->
	<div class="row">

		<div class="side-menu">

			<!-- standard creation of nav bar with bootstrap -->
			<nav class="navbar navbar-default" role="navigation">

			<div class="navbar-header"><%=mUser.getmUsername()%></div>
			<!-- end navbar-header -->


			<div class="side-menu-container">
				<ul class="nav navbar-nav">
					<li><a href="#"><img src="images/pie-chart7.png"> <span>
								Dashboard</span></a></li>
					<li><a href="ViewMovieRecord.jsp"><img
							src="images/movie.png"><span> Movie</span> Management</a></li>
					<li><a href="ViewGenreRecord.jsp"><img
							src="images/grid22.png"><span> Genre</span> Management</a></li>

					<li><a href="ViewThreatreRecord.jsp"><img
							src="images/theatre.png"><span> Threatre</span> Management</a></li>
					<li><a href="ViewTheatre_Movie.jsp"><img
							src="images/theatre.png"><span> Assign</span> Movie</a></li>



					<li><a href="#"><img src="images/gear39.png"><span>
								Settings</span></a></li>
					<li><a href="#"><img src="images/logout13.png"><span>
								Logout</span></a></li>
				</ul>
			</div>
			</nav>
		</div>
		<!-- end side-menu -->

		<!--Content -->
		<div class="side-body">

			<div class="navbar navbar-default navbar-fixed">

				<a class="navbar-brand" href="#">Profile</a>

				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href=""> Account </a></li>

						<li><a href="#"> Log out </a></li>
					</ul>
				</div>
				<!-- end collapse navbar-collapse -->
			</div>
			<!-- end navbar navbar-default navbar-fixed -->


			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default table-responsive">

							<div style="margin-left: 5px">
								<h3 class="title">View Threatre</h3>
								<a id="addBtn" data-toggle="modal" href="#myModal"> <img
									src="images/add139.png" alt="add" width="42" height="42"
									border="0"></a>
							</div>

							<table id="threatreTable" class="table table-hover"
								data-toggle=table>
								<thead>
									<th>ID</th>
									<th>ThreatreName</th>
									<th>Row</th>
									<th>Column</th>
									<th>TotalSeat</th>
									<th>Created By</th>
									<th>Created At</th>
									<th>Updated At</th>
								</thead>
								<tbody>
									<%
										List<Threatre> mThreatreList = (List<Threatre>) request.getAttribute("mThreatreList");
										System.out.println("attempt to get theatrelist");
										if (mThreatreList == null) {
											System.out.println("theatrelist is null");
											request.setAttribute("command", "gettheatres");
											request.getRequestDispatcher("/theatre").forward(request, response);

										} else {
											for (int i = 0; i < mThreatreList.size(); i++) {
									%>
									<tr>
										<td><%=mThreatreList.get(i).getmThreatreID()%></td>
										<td><%=mThreatreList.get(i).getmTheatreName()%></td>

										<td><%=mThreatreList.get(i).getmRow()%></td>
										<td><%=mThreatreList.get(i).getmColumn()%></td>
										<td><%=mThreatreList.get(i).getmTotalSeat()%></td>
										<td><%=mThreatreList.get(i).getmCreatedUserName()%></td>
										<td><%=mThreatreList.get(i).getmCreatedAt()%></td>
										<td><%=mThreatreList.get(i).getmUpdatedAt()%></td>
										<td><a class="btn mini blue-stripe" href="#"
											id="editButton" data-toggle="modal" data-target="#myModal"
											data-id="<%=mThreatreList.get(i).getmThreatreID()%>">Edit</a></td>

										<td><a class="btn mini blue-stripe" href="#"
											id="deleteButton" data-toggle="modal" data-target="#delModal"
											data-id="<%=mThreatreList.get(i).getmThreatreID()%>">Delete</a></td>
									</tr>
									<%
										}
										}
									%>
								</tbody>
							</table>

						</div>
						<!-- end panel panel-default table-responsive -->


					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container-fluid -->



		</div>
		<!-- end content -->


		<!-- Modal -->

		<div id="myModal" class="modal fade" role="dialog">
			<input type="hidden" name="modalHidden">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Manage Theatre</h4>
					</div>


					<div class="modal-body">
						<form class="form-horizontal">

							<div class="form-group">

								<label class="col-sm-2 control-label">Theatre Name:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="mTheatreName"
										placeholder="" required>
								</div>

							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Row:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="mRow"
										placeholder="" required>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">Column:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="mColumn"
										placeholder="" required>
								</div>
							</div>
						</form>
					</div>

					<!-- end modal-body -->

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id=submitBtn>Submit</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end row (taking the whole body as an entire row)-->


	<script>
		var actorArray = new Array();
		var movieArray = [];

		function Theatre(inTheatreName, inRow, inColumn, inCreatedBy) {
			this.mTheatreName = inTheatreName;
			this.mRow = inRow;
			this.mColumn = inColumn;
			this.mCreatedBy = inCreatedBy;
		}

		$('#submitBtn')
				.click(
						function() {
							var mTheatre = new Theatre(
									$('#mTheatreName').val(), $('#mRow').val(),
									$('#mColumn').val(),
	<%=mUser.getmUserID()%>
		)

							//addOneTheatre

							$
									.ajax(
											{
												type : 'POST',
												url : '${pageContext.request.contextPath}/theatre',
												contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
												dataType : 'json',
												data : {
													mTheatre : JSON
															.stringify(mTheatre),
													command : 'add'
												}
											})
									.done(
											function(data, textStatus, jqXHR) {
												console
														.log('ViewThreatreRecord check data..'
																+ data);
												//if (data == 'success') {
													$
															.notify(
																	'Added successfully',
																	'success');
												//}
											}).fail(
											function(data, jqXHR, textStatus,
													errorThrown) {

											})
						})
	</script>




</body>
</html>