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
<title>Assign Movie Management</title>

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


	<%
		User mUser;
		//getting existing httpSession,check if exist
		HttpSession userSession = request.getSession(false);
		mUser = (User) userSession.getAttribute("USER");
		System.out.println("Theatre_Movie.jsp : " + mUser.getmUsername() + mUser.getmPassword());
		if (mUser == null)
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		
		
	System.out.println("user !=null");
		
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
					<li><a href="DashBoard.jsp"><img src="images/pie-chart7.png"> <span>
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
								<h3 class="title">View Theatre_Movie</h3>
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
									<th>Updated By</th>
									<th>Created At</th>
									<th>Updated At</th>
								</thead>
								<tbody>

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
						<h4 class="modal-title">Assign Movie Management</h4>
					</div>


					<div class="modal-body">
						<form class="form-horizontal">

							<div class="form-group">

								<label class="col-sm-2 control-label">Pick a Theatre:</label>
								<div class="col-sm-10">

									<select class="ui search dropdown" id="ddl">
										<option value="">Theatre</option>
										<%
										System.out.println("ViewTheatre_Movie.jsp getting theatreRecord..");
											List<Threatre> TheatreList = (List<Threatre>) request.getAttribute("mThreatreList");

											if (TheatreList == null) {
											System.out.println("theatreList = null");
												request.setAttribute("command", "Theatre_Movie");
												request.getRequestDispatcher("/theatre").forward(request, response);
											} else {

												for (int i = 0; i < TheatreList.size(); i++) {
										%>
										<option value=<%=TheatreList.get(i).getmThreatreID()%>>
											<%=TheatreList.get(i).getmTheatreName()%>
										</option>
										<%
											}
											}
										%>

									</select>
								</div>

							</div>


							<div class="form-group">
								<label class="col-sm-2 control-label">Movies:</label>
								<div class="col-sm-10">
									<div id="magicsuggest"></div>
								</div>
							</div>


							<div class="form-group">

								<label class="col-sm-2 control-label">TimeSlot:</label>
								<div class="col-sm-5" id="timeSlot">
									<div class="ui vertical menu"></div>
								</div>



							</div>
							<!--  end form-group -->

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
		var mTheatreArray = new Array();
		var mMovieArray = new Array();
	//	var mTimeSlotArray = new Array();
		//init dropdown
		$('.ui.dropdown').dropdown();
		//init magicsuggest
		var ms = $('#magicsuggest').magicSuggest({
			toggleOnClick : true,
			displayField : 'mTitle',
			valueField : 'mMovieID'

		});
		//init datetimepicker
		$('.datetimepicker').datetimepicker();

		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/MovieServlet',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			data : {
				command : 'getAllMovies'
			}
		}).done(function(data, textStatus, jqXHR) {
			mMovieArray = data[0];
	//		mTimeSlotArray = data[1];
			console.log('checking ajax call getAllMovies..');
			console.log('MovieArray: ' + JSON.stringify(mMovieArray));
		//	console.log('TimeSlotArray: ' + JSON.stringify(mTimeSlotArray));
			//set data to magicsuggest
			ms.setData(mMovieArray);

		}).fail(function(data, jqXHR, textStatus, errorThrown) {
			alert('failed');
		})

		/*
		$
				.ajax(
						{
							type : 'POST',
							url : '${pageContext.request.contextPath}/theatre',
							contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
							dataType : 'json',
							data : {
								command : 'getAllTheatre'
							}
						})
				.done(
						function(data, textStatus, jqXHR) {
							for (i = 0; i < data.length; i++) {
								mTheatreArray = data[i];

								var optionElement = document
										.createElement('option');
								$(optionElement).attr('value',
										mTheatreArray[i].mThreatreID);
								console.log('name is: '
										+ mTheatreArray[i].mThreatreName);
								optionElement.innerHTML = mTheatreArray[i].mThreatreName;

								//$('.ui.search.dropdown').append(optionElement);
								//$('#ddlDescription').prepend(optionElement);
								//	document.getElementById('#ddl').appendChild(optionElement);

								html += '<option value="' + mTheatreArray[i].mThreatreID + '" >'
										+ mTheatreArray[i].mThreatreName
										+ '</option>';
							

								/*$('.ui.search.dropdown').html($('<option/>', {
									value : mTheatreArray[i].mThreatreID,
								}).innerHTML = mTheatreArray[i].mThreatreName)
								var optionElement = '<option value > </option>'
								 
							}
							console.log("changes");
								$('.ui.search.dropdown').html(html);
							
							console.log("Theatres taken: \n");
							console.log(mTheatreArray);
							/*
							 //set data to magicsuggest
							 ms.setData(mTheatreArray);
							 
						}).fail(function(data, jqXHR, textStatus, errorThrown) {
					alert('failed');
				})
		 */

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

		//when collapse,check if there is selection,if there is.generate pointer 
		//jquery onclick
		//ddl = dropdownlist
		var mCurrentmsObjs;
		var msObjs = '';

		$(ms).on('selectionchange', function(e, m) {
			//collect all movies
			var dropDownRow;

			mCurrentmsObjs = this.getSelection();
			$('div.ui.vertical.menu').empty();
			console.log('current obj length is:' + mCurrentmsObjs.length);
			console.log('length is:' + msObjs.length);
			//if it is not initial selectionchange and previous selection is smaller than current
			//remove child  		

			//populate to pointer ui based on selection in magicsuggest
			for (i = 0; i < mCurrentmsObjs.length; i++) {

				var pointing = document.createElement('div');
				//$('.dropdown').dropdown();
				$(pointing).addClass('ui left pointing dropdown link item');

				$(pointing).append(mCurrentmsObjs[i].mTitle);
				var icon = document.createElement('i');
				//$('.dropdown').dropdown();
				$(icon).attr('class', 'dropdown icon');

				$(pointing).append(icon);
				var menu = document.createElement('div');
				//$('.dropdown').dropdown();
				$(menu).attr('class', 'menu');
				/*
				 var item = document.createElement('div');
				 //$('.dropdown').dropdown();
				 $(item).attr('class', 'item');
				 item.innerHTML = 'aaa';
				 */

				var item = document.createElement('div');
				$(item).addClass('item');
				var datepicker = document.createElement('input');
				$(datepicker).addClass('datetimepicker');
				$(datepicker).attr('type', 'text');
				$(item).append(datepicker);

				$(menu).append(item);
				$(pointing).append(menu);
				$('div.ui.vertical.menu').append(pointing);

			}//end for

			//need to initialize dropdown again in order for dynamic DOM to work
			//Solution: http://michaelmac.org/semantic-ui,/custom-elements,/ampersand,/backbone/2015/04/08/custom-elements-to-solve-simple-problems.html
			$('.dropdown').dropdown();
			$('.datetimepicker').datetimepicker();
			msObjs = mCurrentmsObjs;
			console.log('end selectionchange');
		});//end on SelectionChange

		//constructor
		function theatre_Movie(inTheatreID, inMovieID, inTimeSlot) {
			this.mTheatreID = inTheatreID;
			this.mMovieID = inMovieID;
			this.mTimeSlot = inTimeSlot;
		}

	

		$('#submitBtn')
				.click(
						function() {
							//gather user input
								var theatre_MovieArray = new Array();
							var theatreID = $('#ddl').find(":selected").attr(
									'value');

							//collect all movies
							var msObjs = ms.getSelection();

							$('.datetimepicker').each(
									function(index) {
										console.log('datetimepicker value is: '
												+ $(this).val());
												
										var Time = $(this).val()+':00';


										var theatreMovie = new theatre_Movie(
												theatreID,
												msObjs[index].mMovieID, Time);

										theatre_MovieArray.push(theatreMovie);
									});
							//end of gather userinput

							//send to ajax call 

							$
									.ajax(
											{
												type : 'POST',
												url : '${pageContext.request.contextPath}/theatre',
												contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
												dataType : 'json',
												data : {
													theatre_MovieArray : JSON
															.stringify(theatre_MovieArray),
													command : 'addTheatreMovieRecord'
												}
											}).done(
											function(data, textStatus, jqXHR) {
											console.log(data);
											
												$
															.notify(
																	'Added successfully',
																	'success');
											}).fail(
											function(data, jqXHR, textStatus,
													errorThrown) {
												alert('failed');
											})

						})
		//delete functionality
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
	</script>




</body>
</html>