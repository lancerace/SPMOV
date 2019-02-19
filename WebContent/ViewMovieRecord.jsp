<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, net.spmov.*, Model.*, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<title>Movie Management</title>

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
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP
																					// 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0); // Proxies.

		HttpSession userSession = request.getSession(false);
		System.out.println("ViewMovieRecord.jsp Session ID:" + userSession.getId());
		User mUser = (User) userSession.getAttribute("USER");
		System.out.println("ViewMovieRecord.jsp : " + mUser.getmUsername() + mUser.getmPassword());
		if (mUser.getmUsername() == null) {
			System.out.println("Invoked ViewMovieRecord if session equals null");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	%>
	<!-- (taking the whole body as an entire row) -->
	<div class="row">

		<div class="side-menu">

			<!-- standard creation of nav bar with bootstrap -->
			<nav class="navbar navbar-default" role="navigation"">

			<div class="navbar-header"><%=mUser.getmUsername()%></div>
			<!-- end navbar-header -->


			<div class="side-menu-container">
				<ul class="nav navbar-nav">
					<li><a href="DashBoard.jsp"><img
							src="images/pie-chart7.png"> <span> Dashboard</span></a></li>
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
					<li class="logout"><a href="#"><img
							src="images/logout13.png"><span> Logout</span></a></li>
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

						<li class="logout"><a href="#"> Log out </a></li>
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
								<h3 class="title">View Movies</h3>
								<a id="addBtn" data-toggle="modal" href="#myModal"> <img
									src="images/add139.png" alt="Add" width="42"
									height="42" border="0"></a>
							</div>

							<table id="movieTable" class="table table-hover"
								data-toggle=table>
								<thead>
									<th>ID</th>
									<th>Title</th>
									<th>Synopsis</th>
									<th>Release Date</th>
									<th>Duration</th>
									<th>Created At</th>
									<th>Updated At</th>
								</thead>
								<tbody>
									<%
										List<Movie> MovieList = (List<Movie>) request.getAttribute("mMovies");

										if (MovieList == null) {
											request.setAttribute("command", "getAllMovies");
											request.getRequestDispatcher("/AdminIndexController").forward(request, response);
										} else {

											for (int i = 0; i < MovieList.size(); i++) {
									%>
									<tr>
										<td><%=MovieList.get(i).getmMovieID()%></td>
										<td><%=MovieList.get(i).getmTitle()%></td>
										<td class="ellipsis"
											title="<%=MovieList.get(i).getmSynopsis()%>"><%=MovieList.get(i).getmSynopsis()%></td>
										<td><%=MovieList.get(i).getmReleaseDate()%></td>
										<td><%=MovieList.get(i).getmDuration()%></td>
										<td><%=MovieList.get(i).getmCreatedAt()%></td>
										<td><%=MovieList.get(i).getmUpdatedAt()%></td>

										<td><a class="btn mini blue-stripe" href="#"
											id="editButton" data-toggle="modal" data-target="#myModal"
											data-id="<%=MovieList.get(i).getmMovieID()%>">Edit</a></td>

										<td><a class="btn mini blue-stripe" href="#"
											id="deleteButton" data-toggle="modal" data-target="#delModal"
											data-id="<%=MovieList.get(i).getmMovieID()%>">Delete</a></td>
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
						<h4 class="modal-title">Manage Movie</h4>
					</div>


					<div class="modal-body">
						<form class="form-horizontal">

							<div class="form-group">

								<label class="col-sm-2 control-label">Title:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="mTitleInput"
										placeholder="Title">
								</div>

							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Synopsis:</label>
								<div class="col-sm-10">
									<textarea type="text" class="form-control" id="mSynopsisInput"
										placeholder="99" cols="25" rows="7"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Release Date:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="mReleaseDateInput"
										placeholder="1991-01-01">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">Duration:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="mDurationInput"
										placeholder="99">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">Actors:</label>
								<div class="col-sm-10">
									<div id="magicsuggest"></div>
								</div>
							</div>


							<div class="form-group">

								<label class="col-sm-2 control-label">Language:</label>

								<div class="dropdown col-sm-10">
									<button class="btn btn-default dropdown-toggle" type="button"
										id="menu1" data-toggle="dropdown">
										Tutorials <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
										<li role="presentation"><a role="menuitem" tabindex="-1"
											href="#">HTML</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1"
											href="#">CSS</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1"
											href="#">JavaScript</a></li>
										<li role="presentation" class="divider"></li>
										<li role="presentation"><a role="menuitem" tabindex="-1"
											href="#">About Us</a></li>
									</ul>
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



		<!-- delmodel start -->

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
							id=deleteBtn>Delete</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!--End of deleted model -->


	</div>
	<!-- end row (taking the whole body as an entire row)-->


	<script>
		var actorArray = new Array();
		var movieArray = [];

		var ms = $('#magicsuggest').magicSuggest({
			toggleOnClick : true,
			displayField : 'mName',
			valueField : 'mCastID'

		});

		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/CastServlet',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			data : {
				command : 'getAllCast'
			}
		}).done(function(data, textStatus, jqXHR) {
			for (i = 0; i < data.length; i++) {
				actorArray.push(data[i]);
			}
			console.log("actor taken: \n");
			console.log(actorArray);

			//set data to magicsuggest
			ms.setData(actorArray);

		}).fail(function(data, jqXHR, textStatus, errorThrown) {
		
		})

		//show.bs.modal & data-* attribute technique is use to vary content of a single modal shared by multiple button
		//show.bs.modal event is fire whenever modal is visible to the user 
		var ID; //store related row movieID
		$('#myModal')
				.on(
						'show.bs.modal',
						function(event) {
							ms.clear();
							//using event.relatedTarget and HTML data-* attributes to vary content in modal
							var button = $(event.relatedTarget); //get related button that trigger the modal
							if (button.attr('id') == 'editButton') {//if button clicked contain id=editButton		
								ID = button.data('id');
								$
										.ajax(
												{
													type : 'POST',
													url : '${pageContext.request.contextPath}/MovieServlet',
													contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
													dataType : 'json',
													data : {
														movieID : ID,
														command : 'get'
													},
													error : function(xhr,
															ajaxOptions,
															thrownError) {
														alert("error status: "
																+ xhr.status);
														alert("error thrown "
																+ thrownError);
													}
												})
										.done(
												function(data, textStatus,
														jqXHR) {
													var movie = data[0];
													//populate
													$('#mTitleInput').val(
															data[0].mTitle);
													$('#mSynopsisInput').val(
															data[0].mSynopsis);
													$('#mReleaseDateInput')
															.val(
																	data[0].mReleaseDate);
													$('#mDurationInput').val(
															data[0].mDuration);

													//populate magicsuggest
													var castList = data[1];
													console.log(data[0]);
													console
															.log("castlist start here");
													for (i = 0; i < castList.length; i++) {

														console
																.log(castList[i]);

													}
													ms.addToSelection(castList);

												})
										.fail(
												function(data, jqXHR,
														textStatus, errorThrown) {
												})
							}
						})//end of on 'show.bs.modal'

		$('#addBtn').click(function() {
			ID = null;
			$('#mTitleInput').val('');
			$('#mSynopsisInput').val('');
			$('#mReleaseDateInput').val('');
			$('#mDurationInput').val('');
			ms.clear();
		})
		//movie constructor
		function Movie(inMovieID, inTitle, inSynopsis, inReleaseDate,
				inDuration, inLanguageID) {
			this.mMovieID = inMovieID;
			this.mTitle = inTitle;
			this.mSynopsis = inSynopsis;
			this.mReleaseDate = inReleaseDate;
			this.mDuration = inDuration;
			this.mLanguageID = inLanguageID;
		}

		$('#submitBtn')
				.click(
						function() {
							var mMovie = new Movie(ID, $('#mTitleInput').val(),
									$('#mSynopsisInput').val(), $(
											'#mReleaseDateInput').val(), $(
											'#mDurationInput').val(), 1);

							//collect all actors
							var msObjs = ms.getSelection();

							if (ID != null)
							//updateMovie
							{
								$
										.ajax(
												{
													type : 'POST',
													url : '${pageContext.request.contextPath}/MovieServlet',
													contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
													dataType : 'json',
													data : {
														movieID : ID,
														mMovie : JSON
																.stringify(mMovie),
														mCasts : JSON
																.stringify(msObjs),
														command : 'update'
													}
												})
										.done(
												function(data, textStatus,
														jqXHR) {

													$
															.notify(
																	'updated successfully',
																	'success');

													alert('submmitted');

												})
										.fail(
												function(data, jqXHR,
														textStatus, errorThrown) {

												})
							} else {
								//addOneMovie

								$
										.ajax(
												{
													type : 'POST',
													url : '${pageContext.request.contextPath}/MovieServlet',
													contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
													dataType : 'json',
													data : {
														movieID : null,
														mMovie : JSON
																.stringify(mMovie),
														mCasts : JSON
																.stringify(msObjs),
														command : 'add'
													}
												})
										.done(
												function(data, textStatus,
														jqXHR) {

													$
															.notify(
																	'added successfully',
																	'success');
													ms.clear();
												})
										.fail(
												function(data, jqXHR,
														textStatus, errorThrown) {

												})

							}

						})

		$('#delModal').on('show.bs.modal', function(event) {

			//using event.relatedTarget and HTML data-* attributes to vary content in modal
			var button = $(event.relatedTarget); //get related button that trigger the modal

			if (button.attr('id') == 'deleteButton') {//if button clicked contain id=editButton		
				ID = button.data('id');
				

			}
			//end if
		})

		$('#deleteBtn')
				.click(
						function(event) {

							$
									.ajax(
											{
												type : 'POST',
												url : '${pageContext.request.contextPath}/MovieServlet',
												contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
												dataType : 'json',
												data : {
													movieID : ID,
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

		$('.logout')
				.on(
						'click',
						function() {

							$
									.ajax(
											{
												type : 'POST',
												url : '${pageContext.request.contextPath}/AdminIndexController',
												contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
												dataType : 'json',
												data : {
													command : 'SessionProtection'
												}
											})
									.done(
											function(data, textStatus, jqXHR) {
												//done if it receive json data
												console.log("ajax invoked");
												console
														.log("data received from ViewMovieRecord.jsp is :"
																+ data);

												if (data == 'success')
													window.location
															.replace('${pageContext.request.contextPath}/login.jsp');
												$.notify("Logged out");
											}).fail(
											function(data, jqXHR, textStatus,
													errorThrown) {
												console.log("ajax failed");
											});

						});
	</script>




</body>
</html>