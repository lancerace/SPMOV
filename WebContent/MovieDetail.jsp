<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="java.sql.*, net.spmov.*, Model.*, java.util.*, org.json.simple.*,com.google.gson.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Movie Detail</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/jquery/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/jquery/jquery-ui.theme.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootstrap/css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/style.css" />
	<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/bootstrap/css/star-rating.css" />
	
	

<script src="dependencies/jquery/jquery-1.11.3.js"></script>
<script src="dependencies/jquery/jquery-ui.js"></script>
<script src="dependencies/bootstrap/js/bootstrap.min.js"></script>
<script src="dependencies/bootstrap/js/star-rating.js"></script>



</head>
<body>
	<div class="container-fluid">
		<div>
			<div class="panel-body">

				<!--Navigation  -->
				<nav class="navbar navbar-default w3_megamenu" role="navigation">
				<div class="navbar-header">
					<button type="button" data-toggle="collapse"
						data-target="#defaultmenu" class="navbar-toggle">
						<span class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a href="index.html" class="navbar-brand"><i class="fa fa-home"></i></a>
				</div>
				<!-- end navbar-header -->

				<div id="defaultmenu" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="dropdown w3_megamenu-fw"><a href="index.jsp">Home</a></li>
						<!-- Mega Menu -->
						<li class="dropdown w3_megamenu-fw"><a href="index.jsp">Movies</a></li>


					</ul>
					<!-- end nav navbar-nav -->

					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" data-toggle="dropdown"
							class="dropdown-toggle">Contact Us<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li>
									<form id="contact1" action="#" name="contactform" method="post">
										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
											<input type="text" name="name" id="name1"
												class="form-control" placeholder="Name"> <input
												type="text" name="email" id="email1" class="form-control"
												placeholder="Email">
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
											<input type="text" name="phone" id="phone1"
												class="form-control" placeholder="Phone"> <input
												type="text" name="subject" id="subject1"
												class="form-control" placeholder="Subject">
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<textarea class="form-control" name="comments" id="comments1"
												rows="6" placeholder="Your Message ..."></textarea>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="pull-right">
												<input type="submit" value="SEND" id="submit1"
													class="btn btn-primary small">
											</div>
										</div>
										<div class="clearfix"></div>
									</form>
								</li>
							</ul></li>
					</ul>
					<!-- end nav navbar-nav navbar-right -->
				</div>
				<!-- end #navbar-collapse-1 --> </nav>
				<!-- end navbar navbar-default w3_megamenu -->


				<%
				Gson gson = new Gson();
					//From MovieDetailController Servlet
					JSONArray jArray = (JSONArray) request.getAttribute("outjArray");
					Movie mMovie = (Movie) request.getAttribute("mMovie");
					System.out.println("Checking movie:" + gson.toJson(mMovie));
					List<Cast> mCastList = (List<Cast>) request.getAttribute("mCastList");
					Language mLanguage = (Language) request.getAttribute("mLanguage");
					List<Crew> mCrewList = (List<Crew>) request.getAttribute("mCrews");

					//
					JSONObject obj = new JSONObject();
					
					String movieID=request.getParameter("movie");
				
					String genre = "";
					String castList = "";
					String director = "";

					//Craft out string for Genre
					for (int i = 0; i < jArray.size(); i++) {
						obj = (JSONObject) jArray.get(i);
						genre += "/" + obj.get("genrename");
					}
					if(!genre.equals(""))
					genre = genre.substring(1);
					//

					//Craft out string for Casts
					for (int i = 0; i < mCastList.size(); i++) {
						castList += "/" + mCastList.get(i).getmName();
					}
					if(!castList.equals(""))
					castList = castList.substring(2);
					//

					//Craft out string for Crews that is director only
					for (int i = 0; i < mCrewList.size(); i++) {

						if (mCrewList.get(i).getmRole().equals("Director"))

							director += "/" + mCrewList.get(i).getmName();
						System.out.print("director is" + director);
					}
					if(!director.equals(""))
						director = director.substring(1);
						
						
						
				%>


				<div class="col-xs-6 col-md-4">
					<div class="panel" style="box-shadow: 1px 1px 10px #888888">
						<div class="panel-body">
							<img class="img-responsive" src="poster?imgID=<%=request.getAttribute("mMoviePhotoID")%>"  >

						</div>
					</div>
				</div>

				<div class="panel col-xs-12 col-md-8"
					style="box-shadow: 1px 1px 10px #888888; background: white">


					<br>
					<h1><%=mMovie.getmTitle()%></h1>
					<hr>



					<h4>Photo</h4>
					<br>
					<h4>Details</h4>
					<br>




					<!-- Detail Left Border -->
					<div class="col-xs-6 col-sm-6 col-md-6">
						<div class="row">

							<!-- First Row Content -->
							<div class="row">
								<div class="col-md-4 col-sm-5 col-xs-5">Cast:</div>
								<div class="col-md-8 col-sm-7 col-xs-7">
									J<%=castList%></div>
							</div>
							<br>

							<div class="row">
								<div class="col-md-4 col-sm-5 col-xs-5">Director:</div>
								<div class="col-md-8 col-sm-7 col-xs-7"><%=director%></div>
							</div>
							<br>


							<div class="row">
								<div class="col-md-4 col-sm-5 col-xs-5">Genre:</div>
								<div class="col-md-8 col-sm-7 col-xs-7"><%=genre%></div>
							</div>

						</div>
					</div>


					<!-- Detail Right Border -->
					<div class="col-xs-6 col-sm-6 col-md-6">
						<div class="row">



							<!-- First Row Content -->
							<div class="row">
								<div class="col-md-4 col-sm-5 col-xs-5">Release:</div>
								<div class="col-md-8 col-sm-7 col-xs-7"><%=mMovie.getmReleaseDate()%></div>
							</div>
							<br>

							<div class="row">
								<div class="col-md-4 col-sm-5 col-xs-5">Running Time:</div>
								<div class="col-md-8 col-sm-7 col-xs-7"><%=mMovie.getmDuration() + " mins"%></div>
							</div>
							<br>


							<div class="row">
								<div class="col-md-4 col-sm-5 col-xs-5">Language:</div>
								<div class="col-md-8 col-sm-7 col-xs-7"><%=mLanguage.getmLanguageName()%></div>
							</div>


						</div>
					</div>



					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="row">
							<br>
							<h4>Synopsis</h4>
							<br>
							<%=mMovie.getmSynopsis()%>

						</div>
					</div>




				</div>
			</div>


		</div>
		
		 
			<div class="panel col-xs-12 col-md-8"
					style="box-shadow: 1px 1px 10px #888888; background: white">
					<h3>Review</h3>
					<br>
					<form class="form-horizontal">

						<div class="form-group">

							<label class="col-sm-2 control-label">Name:</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="mNameInput"
									placeholder="Name">
							</div>
							<label class="col-sm-2 control-label">Contact:</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="mContactInput"
									placeholder="Name">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">Detail:</label>
							<div class="col-sm-8">
								<textarea type="text" class="form-control" id="mDetailInput"
									placeholder="Enter here!" cols="1" rows="5"></textarea>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">rating:</label>
							<div class="col-sm-7 rating-stars" id="rating">
								<input id="mRatingInput" type="number" class="rating" min="0"
									max="5" step="1" data-stars=5 data-symbol="&#xe005;"
									data-default-caption="{rating} hearts" data-star-captions="{}">
							</div>
							<input type="button" class="col-sm-1 btn btn-default"
								value="Submit" id="submitBtn">
								<input type="hidden" id="mMovieIDInput" value="<%=movieID%>">
					

						</div>
					</form>

				</div>
		
		
		
		
	</div>

	<script>
		
	$('#submitBtn').click(
			
			
			function(event) {
				
				var collectedMovieID =$("#mMovieIDInput").val();
				var collectedName = $('#mNameInput').val();
				var collectedDetail = $('#mDetailInput').val();
				var collectedContact = $('#mContactInput').val();
				var collectedRating = $('#mRatingInput').val();
					$.ajax(
							{
								type : 'POST',
								url : '${pageContext.request.contextPath}/review',
								contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
								dataType : 'json',
								data : {
									movieID : collectedMovieID,
									name : collectedName,
									detail : collectedDetail,
									contact :collectedContact,
									rating : collectedRating,
									command : 'add'
								}
							}).done(
							function(data, textStatus, jqXHR) {
								alert("Thank you for your feedback.");
								/* $('tbody').remove(); */
								
							}).fail(
							function(data, jqXHR, textStatus,
									errorThrown) {

							})
							});
	
	
	</script>




</body>

</html>