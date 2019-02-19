<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- importing other package for jsp/scriplet format -->
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
<title>Genre Management</title>

<head>
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/jquery/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/jquery/jquery-ui.theme.css" />


<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootstrap/css/bootstrap-theme.min.css" />

<!-- Administrator side -->
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootsnipp/style.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/magicsuggest/css/magicsuggest-min.css" />

<!-- end admin side-->
<script src="dependencies/jquery/jquery-1.11.3.js"></script>
<script src="dependencies/jquery/jquery-ui.js"></script>
<script src="dependencies/bootstrap/js/bootstrap.min.js"></script>
<script src="dependencies/magicsuggest/js/magicsuggest-min.js"></script>
<script src="dependencies/bootstrap/js/notify.min.js"></script>
</head>
<body>

	<script>
		
	</script>

	
		<%
		HttpSession userSession = request.getSession(false);
		User mUser = (User) userSession.getAttribute("USER");
	System.out.print("ViewGenreRecord.jsp : " + mUser.getmUsername() + mUser.getmPassword());
		if (mUser == null)
			request.getRequestDispatcher("/login.jsp").forward(request, response);
	%>
	
	<!-- (taking the whole body as an entire row) -->
	<div class="row">

		<div class="side-menu">

			<!-- standard creation of nav bar with bootstrap -->
			<nav class="navbar navbar-default" role="navigation">

			<div class="navbar-header">User</div>
			<!-- end navbar-header -->


			<div class="side-menu-container">
					<ul class="nav navbar-nav">
					<li><a href="#"><img src="images/pie-chart7.png"> <span>
								Dashboard</span></a></li>
					<li><a href="ViewMovieRecord.jsp"><img src="images/movie.png"><span>
								Movie</span> Management</a></li>
								<li><a href="ViewGenreRecord.jsp"><img src="images/grid22.png"><span>
								Genre</span> Management</a></li>
								
									<li><a href="ViewThreatreRecord.jsp"><img src="images/theatre.png"><span>
								Threatre</span> Management</a></li>
								<li><a href="ViewTheatre_Movie.jsp"><img src="images/theatre.png"><span>
								Assign</span> Movie</a></li>
								
								
								
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
								<h3 class="title">View Genre	</h3>
								<a id="addBtn" data-toggle="modal" href="#myModal"> <img
									src="images/add139.png" alt="add" width="42" height="42"
									border="0"></a>
							</div>

							<table class="table table-hover ">
								<thead>
									<th>GenreID</th>
									<th>GenreName</th>
									<th>Details</th>
									<th>Created At</th>
									<th>Updated At</th>
								</thead>
								<tbody>
									<%
										List<Genre> GenreList = (List<Genre>) request.getAttribute("mGenres");

										if (GenreList == null) {
											String condition = "getAllData";
											request.setAttribute("run", condition);
											RequestDispatcher rd = request.getRequestDispatcher("/genre");
											rd.forward(request, response);
											condition = "sds";
										}

										else {
											for (int i = 0; i < GenreList.size(); i++) {
									%>
									<tr>
										<td><%=GenreList.get(i).getmGenreID()%></td>
										<td><%=GenreList.get(i).getmGenreName()%></td>
										<td><%=GenreList.get(i).getmDetails()%></td>
										<td><%=GenreList.get(i).getmCreatedAt()%></td>
										<td><%=GenreList.get(i).getmUpdatedAt()%></td>

										<td><a class="btn mini blue-stripe" href="#"
											id="editButton" data-toggle="modal" data-target="#myModal"
											data-id="<%=GenreList.get(i).getmGenreID()%>">Edit</a></td>

										<td><a class="btn mini blue-stripe" href="#"
											id="deleteButton" data-toggle="modal" data-target="#delModal"
											data-id="<%=GenreList.get(i).getmGenreID()%>"
											data-name="<%=GenreList.get(i).getmGenreName()%>">Delete</a></td>
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
						<h4 class="modal-title">Manage Genre</h4>
					</div>


					<div class="modal-body">
						<form class="form-horizontal">

							<div class="form-group">

								<label class="col-sm-2 control-label">Genre name:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="mGenreNameInput"
										placeholder="Name">
								</div>

							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Detail:</label>
								<div class="col-sm-10">
									<textarea type="text" class="form-control" id="mDetailsInput"
										placeholder="Enter here!" cols="25" rows="7"></textarea>
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


		<div id="delModal" class="modal fade" role="dialog">
			<input type="hidden" name="modalHidden">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Delete Genre</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal">

							<div class="form-group">
								<label class="col-sm-4 control-label">Are you sure you
									want to remove</label>
							</div>

						</form>
					</div>
					<!-- end modal-body -->

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="deleteBtn">Delete</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


	</div>
	<!-- end row (taking the whole body as an entire row)-->


	<script>
		var actorArray = [];

		
		
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/ActorServlet',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			data : {
				//command is to filter the controller 
				command : 'getAllData'// not requre over here
			}
		}).done(function(data, textStatus, jqXHR) {
			var a = data;
			

		}).fail(function(data, jqXHR, textStatus, errorThrown) {

			//alert('failed');
		})

		var ID; //store related row movieID
		$('#addBtn').click(function() {
			ID = null;
			$('#mGenreNameInput').val('');
			$('#mDetailsInput').val('');
		})
		$('#submitBtn')
				.click(
						function(event) {
							var collectedGenreName = $('#mGenreNameInput')
									.val();
							var collectedDetails = $('#mDetailsInput').val();
							//alert('submit');
							if(ID !=null){
								//alert('update');
								$
								.ajax(
										{
											type : 'POST',
											url : '${pageContext.request.contextPath}/genre',
											contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
											dataType : 'json',
											data : {
												genreID : JSON
														.stringify(ID),
												genreName : collectedGenreName,
												details : collectedDetails,
												command : 'update'
											}
										}).done(
										function(data, textStatus, jqXHR) {
											alert("update success");
											/* $('tbody').remove(); */
											
										}).fail(
										function(data, jqXHR, textStatus,
												errorThrown) {

										})
							}else{
								//alert('add');
								$
								.ajax(
										{
											type : 'POST',
											url : '${pageContext.request.contextPath}/genre',
											contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
											dataType : 'json',
											data : {
												genreName : collectedGenreName,
												details : collectedDetails,
												command : 'add'
											}
										}).done(
										function(data, textStatus, jqXHR) {
											$.notify("update success");
										}).fail(
										function(data, jqXHR, textStatus,
												errorThrown) {

										})
							}
							
						})

		$('#deleteBtn')
				.click(
						function(event) {
							//alert('delete');
							$
									.ajax(
											{
												type : 'POST',
												url : '${pageContext.request.contextPath}/genre',
												contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
												dataType : 'json',
												data : {
													genreID : JSON
															.stringify(ID),
													command : 'delete'
												}
											}).done(
											function(data, textStatus, jqXHR) {
												alert("delete success");
											}).fail(
											function(data, jqXHR, textStatus,
													errorThrown) {

											})
						})
		//show.bs.modal & data-* attribute technique is use to vary content of a single modal shared by multiple button
		//show.bs.modal event is fire whenever modal is visible to the user 
		$('#myModal')
				.on(
						'show.bs.modal',
						function(event) {

							//using event.relatedTarget and HTML data-* attributes to vary content in modal
							var button = $(event.relatedTarget); //get related button that trigger the modal

							if (button.attr('id') == 'editButton') {//if button clicked contain id=editButton		
								ID = button.data('id');
						//		alert(ID);

								$
										.ajax(
												{
													type : 'POST',
													url : '${pageContext.request.contextPath}/genre',
													contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
													dataType : 'json',
													data : {
														genreID : JSON
																.stringify(ID),
														command : 'get'
													}
												})
										.done(
												function(data, textStatus,
														jqXHR) {
													var mGenre = data;
													console.log(data);
													$('#mGenreNameInput').val(
															mGenre.mGenreName);
													$('#mDetailsInput').val(
															mGenre.mDetails);

												})
										.fail(
												function(data, jqXHR,
														textStatus, errorThrown) {
												})
							}
							//end if
						})
		//end of on 'show.bs.modal'
		$('#delModal').on('show.bs.modal', function(event) {

			//using event.relatedTarget and HTML data-* attributes to vary content in modal
			var button = $(event.relatedTarget); //get related button that trigger the modal

			if (button.attr('id') == 'deleteButton') {//if button clicked contain id=editButton		
				ID = button.data('id');
				//alert(ID);

			}
			//end if
		})
		//delete model
	</script>
</body>
</html>