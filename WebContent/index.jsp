<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.regex.*"%>
<%@ page import="Model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//SessionProtection + no Cache
	//protect from back access button as session invalidate is not enough. Need to clear cache
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP                  // 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setDateHeader("Expires", 0); // Proxies.
%>
<!-- run servlet first -->


<html>
<head>
<title>SPMOV</title>
<!-- Custom Theme files -->
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
	href="dependencies/dist/semantic.min.css">
<link rel="stylesheet" href="dependencies/bootstrap/css/menu.css" />
<link rel="stylesheet" href="dependencies/indexJsp/css/style.css"  media="all" />
<link rel="stylesheet" href="dependencies/indexJsp/css/font-awesome.min.css" />
<!--******************************************** start menu 'dont have'
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
	--> 
<!--webfont-->
<link href='//fonts.googleapis.com/css?family=Oxygen:400,700,300'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
					<link rel="stylesheet" href="dependencies/indexJsp/css/flexslider.css" type="text/css"
						media="screen" />
	
<!-- Custom JS files -->
<script src="dependencies/jquery/jquery-1.11.3.js"></script>
<script src="dependencies/jquery/jquery-ui.js"></script>
<script src="dependencies/bootstrap/js/bootstrap.min.js"></script>
<script src="dependencies/bootstrap/js/notify.min.js"></script>
<script src="dependencies/dist/semantic.min.js"></script>
<script src="dependencies/indexJsp/js/megamenu.js" type="text/javascript" ></script>
<script src="dependencies/indexJsp/js/easyResponsiveTabs.js" type="text/javascript"></script>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="dependencies/indexJsp/js/move-top.js"></script>
<script type="text/javascript" src="dependencies/indexJsp/js/easing.js"></script>
<script type="text/javascript" src="dependencies/indexJsp/js/jquery.leanModal.min.js"></script>
<script src="dependencies/indexJsp/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="dependencies/indexJsp/js/jquery.flexisel.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="My Show Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>



<script>
 $(document).ready(function() {
  $(".megamenu").megamenu();
 });
</script>



<script type="text/javascript">
 $(document).ready(function() {
  $('#horizontalTab').easyResponsiveTabs({
   type : 'default', //Types: default, vertical, accordion           
   width : 'auto', //auto or any width like 600px
   fit : true
  // 100% fit in a container
  });
 });
</script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
 jQuery(document).ready(function($) {
  $(".scroll").click(function(event) {
   event.preventDefault();
   $('html,body').animate({
    scrollTop : $(this.hash).offset().top
   }, 1200);
  });
 });
</script>
<!---- start-smoth-scrolling---->

</head>
<body>
	<%
		List<Movie> MovieList = (ArrayList<Movie>) request.getAttribute("movieNameList");
		List<Branch> BranchList = (ArrayList<Branch>) request.getAttribute("branchNameList");
		List<ImagePoster> ImageList = (ArrayList<ImagePoster>) request.getAttribute("posterList");
		List<Banner> BannerList = (ArrayList<Banner>) request.getAttribute("bannerList");
		List<ImagePoster> nowPlayingList = (ArrayList<ImagePoster>) request.getAttribute("nowPlayingList");
		List<ImagePoster> openingThisWeekList = (ArrayList<ImagePoster>) request.getAttribute("openingThisWeekList");
		List<ImagePoster> comingSoonList = (ArrayList<ImagePoster>) request.getAttribute("comingSoonList");
		List<ImagePoster> featuredList = (ArrayList<ImagePoster>) request.getAttribute("featuredList");
		//get existing
		HttpSession Ssession = request.getSession(false);
		String customerName = (String) Ssession.getAttribute("CustomerName");
		String customerUserID = (String)Ssession.getAttribute(("CustomerUserID"));
		
		ArrayList<Ticket> cartList = (ArrayList<Ticket>) Ssession.getAttribute("CartList");
		
		
		
		
		List<SlideShowImage> movieSlideShowList = (ArrayList<SlideShowImage>) request
				.getAttribute("movieSlideShowList");
		List<Genre> genreList = (ArrayList<Genre>) request.getAttribute("genreList");
	
		
		if (MovieList == null) {
			request.getRequestDispatcher("/index").forward(request, response);
		}
		
		boolean log = false;
		if (customerName != null) {
			log = true;
		}
	%>
	<!-- header-section-starts -->
	<div class="header-top-strip">
		<div class="container">

			<div class="clearfix"></div>

			<div class="header-top-right">
				<div class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">Modal title</h4>
							</div>
							<div class="modal-body">
								<p>One fine body&hellip;</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<!-- Button trigger modal  -->

				<div class="clearfix"></div>
			</div>
		</div>

<div id class="col-md-0" id="cartDiv">
<button class="btn btn-primary" data-toggle="modal"
    id="cartDetailsBtn" data-target="#viewCart">View Cart</button></div>
  	<div id class="col-md-0" id="historyDiv">  
  
   </div>
   
<!-- View history modal -->
  <div id="viewHistory" class="modal fade" role="dialog">
   <input type="hidden" name="modalHidden">
   <div class="modal-dialog">
    <div class="modal-content">
     <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
      <h4 class="modal-title">View History</h4>
     </div>
      <div id ="historyBody">
      <h2>sdsd</h2>
      </div>
     <!-- end modal-body -->
     <div class="modal-footer">

      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
     </div>
    </div>
    </div>
   </div>

   <!-- View cart modal -->

   

   <div id="viewCart" class="modal fade" role="dialog">
    <input type="hidden" name="modalHidden">
    <div class="modal-dialog">

     <!-- Modal content-->
     <%
      if (cartList != null) {
     %>
     <form action="payMovie.jsp">
      <div class="modal-content">
       <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">View Cart</h4>
       </div>
       <div id="viewCartBody">
        <table class="table table-hover ">
         <thead>
          <th>Movie Name</th>
          <th>Branch</th>
          <th>Seat</th>
          <th>Date</th>
          <th>Price</th>
          <th>Remove</th>
         </thead>
         <tbody id="cartBody">

          <%
           double total = 0.00;
            for (int i = 0; i < cartList.size(); i++) {
             String branchID = cartList.get(i).getRow() + "" + cartList.get(i).getColumn();
             char myChar = (char) (64 + (Integer.parseInt(cartList.get(i).getRow())));
             String seatNo = myChar + "" + cartList.get(i).getColumn();
             total = Double.parseDouble(cartList.get(i).getValue()) * cartList.size();
             System.out.println(total);
          %>
          <tr>
           <td><%=cartList.get(i).getTitle()%></td>
           <td><%=cartList.get(i).getCinemaName()%></td>
           <td><%=seatNo%></td>
           <td><%=cartList.get(i).getTime()%></td>
           <td><%=cartList.get(i).getValue()%></td>
           <td><input type="button" id=<%=i%> value="Delete"
            onclick="deleteCartItem(this.id)"></td>
           <%
            }
           %>
          </tr>
         </tbody>

        </table>
        <p id="totalPrice" align="right">
         Total price $<%=total%>0
        </p>
       </div>

       <!-- end modal-body -->

       <div class="modal-footer">
        <input type="submit" class="btn btn-default" id=checkOutBtn
         value="Check Out">
        <button type="button" class="btn btn-default"
         data-dismiss="modal">Close</button>
       </div>
      </div>
     </form>
     <%
      }
     %>
    </div>
   </div>
		<!-- Large modal -->
	
<div id="loginDiv">
    <button class="btn btn-primary" data-toggle="modal"
     data-target="#myModal">Login</button>
   </div>
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
    aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
     <div class="modal-content">
      <div class="modal-header">
       <button type="button" class="close" data-dismiss="modal"
        aria-hidden="true">&times;</button>
       <h4 class="modal-title" id="myModalLabel">Don't Wait, Login
        now!</h4>
      </div>
      <div class="modal-body">
       <div class="row">
        <div class="col-md-8"
         style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
         <!-- Nav tabs -->
         <ul class="nav nav-tabs">
          <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
          <li><a href="#Registration" data-toggle="tab">Registration</a></li>
         </ul>
         <!-- Tab panes -->
         <div class="tab-content">
          <div class="tab-pane active" id="Login">
           <form role="form" class="form-horizontal"
            action="CustomerLogin" method="post">
            <div class="form-group">
             <label for="email" class="col-sm-2 control-label">
              username</label>
             <div class="col-sm-10">
              <input type="text" class="form-control" name="loginID"
               placeholder="Username" required/>
             </div>
            </div>
            <div class="form-group">
             <label for="exampleInputPassword1"
              class="col-sm-2 control-label"> Password</label>
             <div class="col-sm-10">
              <input type="password" class="form-control"
               name="loginPwd" placeholder="password" required />
             </div>
            </div>
            <div class="row">
             <div class="col-sm-2"></div>
             <div class="col-sm-10">
              <button type="submit" class="btn btn-primary btn-sm"
               id="login">Submit</button>
              <a href="javascript:;">Forgot your password?</a>
             </div>
            </div>
           </form>
          </div>
									<!-- registration start here -->
									<div class="tab-pane" id="Registration">
										<form role="form" class="form-horizontal ui form"
											method="post" action="member">

											<div class="field">
												<label>*Username</label> <input name="username" type="text">
											</div>

											<div class="two fields">
												<div class="field">
													<label>*Password</label> <input name="pwd" type="password" placeholder="abc123">
												</div>
												<div class="field">
													<label>*Confirm Password</label> <input name="cfmpwd"
														type="password">
												</div>
											</div>

											<div class="two fields">
												<div class="field">
													<label>*First Name</label> <input name="firstname"
														type="text">
												</div>
												<div class="field">
													<label>*Last Name</label> <input name="lastname" type="text">
												</div>
											</div>

											<div class="two fields">
												<div class="field">
													<label>*NRIC/FIN</label> <input name="nric" type="text" placeholder="S1234567C">
												</div>
												<div class="field">
													<label>*Gender</label>
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
													<label>*Email</label> <input name="email" type="text"  placeholder="abc@xyz.com">
												</div>
												<div class="field">
													<label>*Contact No</label> <input name="contact" type="text" placeholder="98765432">
												</div>
											</div>

											<div class="two fields">
												<div class="field">
													<label>*Block</label> <input name="block" type="text" placeholder="123A">
												</div>
												<div class="field">
													<label>*Street</label> <input name="street" type="text">
												</div>
											</div>
											<div class="two fields">
												<div class="field">
													<label>*Unit</label> <input name="unit" type="text" placeholder="#01-111">
												</div>
												<div class="field">
													<label>*Postal Code</label> <input name="postalCode" placeholder="611111"
														type="text">
												</div>
											</div>

											<div class="inline field">
												<div class="ui checkbox">
													<input name="terms" type="checkbox"> <label>I
														agree to the Terms and Conditions</label>
												</div>
											</div>

											<div class="row">
												<div class="col-sm-2"></div>
												<div class="col-sm-10">
													<div class="ui blue submit button">Submit</div>
													<div class="ui reset button">Reset</div>
													<div class="ui clear basic button">Clear</div>
													<div class="ui error message"></div>


												</div>
											</div>
										</form>
									</div>
								</div>
								<div id="OR" class="hidden-xs">OR</div>
							</div>
							<div class="col-md-4">
								<div class="row text-center sign-with">
									<div class="col-md-12">
										<h3 class="other-nw">Sign in with</h3>
									</div>
									<div class="col-md-12">
										<div class="btn-group btn-group-justified">
											<a href="#" class="btn btn-primary">Facebook</a> <a href="#"
												class="btn btn-danger"> Google +</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="clearfix"></div>
	</div>
	</div>
	<div class="container">
		<div class="main-content">
			<div class="header">
				<div class="logo">
					<a href="index"><h1>SPMOV</h1></a>
				</div>
				<div class="search">
					<div class="search2">
						<form>
							<i class="fa fa-search"></i> <input type="text"
								value="Search for a movie, play, event, sport or more"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Search for a movie, play, event, sport or more';}" />
						</form>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="bootstrap_container">
				<nav class="navbar navbar-default w3_megamenu" role="navigation">
				<div class="navbar-header">
					<button type="button" data-toggle="collapse"
						data-target="#defaultmenu" class="navbar-toggle">
						<span class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a href="index.jsp" class="navbar-brand"><i class="fa fa-home"></i></a>
				</div>
				<!-- end navbar-header -->

				<div id="defaultmenu" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="dropdown w3_megamenu-fw"><a href="index.html">Home</a></li>
						<!-- Mega Menu -->
						<li class="dropdown w3_megamenu-fw"><a href="movies">Movies</a></li>


					</ul>
					<!-- end nav navbar-nav -->

					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown w3_megamenu-fw" id="editProfile"></li>

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
												class="form-control" placeholder="Phone"> 
												<input
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
			</div>
			<!-- end container -->


			<!-- AddThis Smart Layers END -->


			<div class="main-banner">
				<div class="banner col-md-8">
					<section class="slider">
					<div class="flexslider">
						<ul class="slides">
							<%
								for (int i = 0; i < BannerList.size(); i++) {
							%>
							<li><img
								src="banner?imgID=<%=BannerList.get(i).getMovieBannerID()%>"
								class="img-responsive" alt="" /></li>
							<%
								}
							%>
						</ul>
					</div>
					</section>
					<!-- FlexSlider -->
					<script defer src="dependencies/indexJsp/js/jquery.flexslider.js"></script>
					<link rel="stylesheet"
						href="dependencies/indexJsp/css/flexslider.css" type="text/css"
						media="screen" />
					<script type="text/javascript">
						/*	$(function() {
								SyntaxHighlighter.all();
							});*/

						$(window).load(function() {
							$('.flexslider').flexslider({
								animation : "slide",
								start : function(slider) {
									$('body').removeClass('loading');
								}
							});
						});
					</script>
				</div>
				<div class="col-md-4 banner-right">
					<h4>Instant Ticket Booking</h4>
					<div role="tabpanel" class="tab-pane fade active
					in"
						id="home" aria-labelledby="home-tab">
						<!--select movie ddl-->
						<form action="bookMovie" method="post">
							<select id="movieNames" name="movieName" class="list_of_movies">
								<option value="0">Select Movie</option>
								<%
									for (int i = 0; i < MovieList.size(); i++) {
										String name = MovieList.get(i).getmTitle();
										int id = MovieList.get(i).getmMovieID();
								%>
								<option value="<%=id%>"><%=name%></option>
								<%
									}
								%>
							</select>
							<!--select cinema ddl  -->
							<select id="cinemaNames" name="cinemaName" class="list_of_movies"><option
									value="0">Select Cinema</option>
								<%
									for (int i = 0; i < BranchList.size(); i++) {
										int branchID = BranchList.get(i).getBranchID();
										String name = BranchList.get(i).getBranchName();
								%>
								<option value="<%=branchID%>"><%=name%></option>
								<%
									}
								%>
							</select>
							<!--select date ddl  -->
							<select id="dateTimes" name="dateTime" class="list_of_movies"><option
									value="">Select Date</option></select>


							<button type="submit" id="InstantBookingBtn"
								class="btn btn-default btn-sm" style="margin-top: 10px;">Proceed</button>
						</form>
					</div>
					
					
					
					
					
					
				</div>
				<div class="clearfix"></div>
				<div class="review-slider">
					<ul id="flexiselDemo1">
						<%
							for (int i = 0; i < movieSlideShowList.size(); i++) {
						%>
						<li><a
							href="MDetailServlet?movie=<%=movieSlideShowList.get(i).getMovieID()%>">
								<img
								src="poster?imgID=<%=movieSlideShowList.get(i).getPhotoID()%>">
						</a>
							<div class="slide-title">
								<h4><%=movieSlideShowList.get(i).getTitle()%></h4>
							</div>
							<div class="date-city">
								<h5><%=movieSlideShowList.get(i).getReleaseDate()%></h5>
								<!-- <h6>Multi-city</h6> -->
								<div class="buy-tickets">
									<a href="movie-select-show.html">BUY TICKETS</a>
								</div>
							</div></li>
						<%
							}
						%>
					</ul>
					<script type="text/javascript">
						$(window).load(function() {

							$("#flexiselDemo1").flexisel({
								visibleItems : 5,
								animationSpeed : 1000,
								autoPlay : true,
								autoPlaySpeed : 3000,
								pauseOnHover : false,
								enableResponsiveBreakpoints : true,
								responsiveBreakpoints : {
									portrait : {
										changePoint : 480,
										visibleItems : 2
									},
									landscape : {
										changePoint : 640,
										visibleItems : 3
									},
									tablet : {
										changePoint : 800,
										visibleItems : 4
									}
								}
							});
						});
					</script>
					<script type="text/javascript"
						src="dependencies/indexJsp/js/jquery.flexisel.js"></script>
				</div>
				<div class="footer-top-grid">
					<div class="list-of-movies col-md-8">
						<div class="tabs">
							<div class="sap_tabs">
								<div id="horizontalTab"
									style="display: block; width: 100%; margin: 0px;">
									<ul class="resp-tabs-list">
										<li class="resp-tab-item" aria-controls="tab_item-2"
											role="tab"><span>Now Playing</span></li>
										<li class="resp-tab-item" aria-controls="tab_item-1"
											role="tab"><span>Opening This Week</span></li>
										<li class="resp-tab-item" aria-controls="tab_item-0"
											role="tab"><span>Coming Soon</span></li>
										<div class="clearfix"></div>
									</ul>
									<div class="resp-tabs-container">
										<div class="tab-1 resp-tab-content"
											aria-labelledby="tab_item-1">
											<ul class="tab_img">
												<%
													for (int i = 0; i < nowPlayingList.size(); i++) {
												%>
												<li>
													<div class="view view-first">
														<a
															href="MDetailServlet?movie=<%=nowPlayingList.get(i).getMovieID()%>">
															<img
															src="poster?imgID=<%=nowPlayingList.get(i).getPhotoID()%>"
															class="img-responsive" alt="" />
														</a>
														<div class="mask">
															<div class="info1"></div>
														</div>
														<div class="tab_desc">
															<a href="movie-select-show.html">Book Now</a>
															<div class="percentage-w-t-s">
																<h5>88</h5>
																<p>
																	% <br> Want to see
																</p>
																<div class="clearfix"></div>
															</div>
														</div>
													</div>
												</li>
												<%
													}
												%>
											</ul>
											<div class="clearfix"></div>
											</ul>
										</div>
										<div class="tab-1 resp-tab-content"
											aria-labelledby="tab_item-1">
											<ul class="tab_img">
												<%
													for (int i = 0; i < openingThisWeekList.size(); i++) {
												%>
												<li>
													<div class="view view-first">
														<a
															href="MDetailServlet?movie=<%=openingThisWeekList.get(i).getMovieID()%>">
															<img
															src="poster?imgID=<%=openingThisWeekList.get(i).getPhotoID()%>"
															class="img-responsive" alt="" />
														</a>
														<div class="mask">
															<div class="info1"></div>
														</div>
														<div class="tab_desc">
															<a href="movie-select-show.html">Book Now</a>
															<div class="percentage-w-t-s">
																<h5>88</h5>
																<p>
																	% <br> Want to see
																</p>
																<div class="clearfix"></div>
															</div>
														</div>
													</div>
												</li>
												<%
													}
												%>
											</ul>
										</div>
										<div class="tab-1 resp-tab-content"
											aria-labelledby="tab_item-2">
											<ul class="tab_img">
												<%
													for (int i = 0; i < comingSoonList.size(); i++) {
												%>
												<li>
													<div class="view view-first">
														<a
															href="MDetailServlet?movie=<%=comingSoonList.get(i).getMovieID()%>">
															<img
															src="poster?imgID=<%=comingSoonList.get(i).getPhotoID()%>"
															class="img-responsive" alt="" />
														</a>
														<div class="mask">
															<div class="info1"></div>
														</div>
														<div class="tab_desc">
															<a href="movie-select-show.html">Book Now</a>
															<div class="percentage-w-t-s">
																<h5>88</h5>
																<p>
																	% <br> Want to see
																</p>
																<div class="clearfix"></div>
															</div>
														</div>
													</div>
												</li>
												<%
													}
												%>
											</ul>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="featured">
							<h4>Featured</h4>
							<form>
								<select name="Filter" class="list_of_genre" id="genreDDL"><option
										value="">Select Genre</option>
									<%
										for (int i = 0; i < genreList.size(); i++) {
											int genreID = genreList.get(i).getmGenreID();
											String name = genreList.get(i).getmGenreName();
									%>
									<option value="<%=genreID%>"><%=name%></option>
									<%
										}
									%>
								</select> <input type="button" class="btn btn-default" value="Search"
									id="filterBtn">
							</form>
							<div id="filterContent">
								<ul>
									<%
										for (int i = 0; i < movieSlideShowList.size(); i++) {
									%>
									<li>
										<div class="f-movie">
											<div class="f-movie-img">
												<a
													href="MDetailServlet?movie=<%=movieSlideShowList.get(i).getMovieID()%>">
													<img
													src="poster?imgID=<%=movieSlideShowList.get(i).getPhotoID()%>"
													class="img-responsive" alt="" />
												</a>
											</div>
											<%-- <div class="f-movie-name">
												<a href="movies.html"><%=movieSlideShowList.get(i).getTitle()%></a>
												<p>Multi city</p>
											</div> --%>
											<div class="f-buy-tickets">
												<a href="movie-select-show.html">BUY TICKETS</a>
											</div>
										</div>
									</li>
									<%
										}
									%>
								</ul>
							</div>
						</div>
					</div>
					<div class="right-side-bar">
						<div class="top-movies-in-india">
							<h4>Top Movies in SP</h4>
							<ul class="mov_list">
								<li><i class="fa fa-star"></i></li>
								<li>77%</li>
								<li><a href="movie-single.html">Jurassic World (3D)
										(U/A)</a></li>
							</ul>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="copy-rights text-center">
				<p>
					© 2015 My Show. All Rights Reserved | Design by <a
						href="http://w3layouts.com/">W3layouts</a>
				</p>
			</div>
			<script type="text/javascript">
					$(document).ready(function() { /* var																																																																													scrollSpeed: 1200, easingType: 'linear' }; */
						$().UItoTop({
							easingType : 'easeOutQuart'
						});
					});
					
				</script>
			<a href="#home" class="scroll" id="toTop" style="display: block;">
				<span id="toTopHover" style="opacity: 1;"> </span>
			</a>


			<script>
			
				//check login already
			    //loginDiv
			    var nameaa=<%=log%>;
			    if(nameaa!=false){
			   
			     $('#loginDiv').empty();
			     $divElement = $('#loginDiv');
			     $divElement2 = $('#historyDiv');	
			     $divElement.append('<button class="btn btn-primary" data-toggle="modal" id="historyBtn" data-target="#viewHistory">View History</button>');
			     $divElement.append('<br>Welcome <%=customerName%>');
			     $divElement
			        .append('<form action="as1235fdf44f44e2dfsdfdrhykyjtrgb" method="post"><input type="submit" id="logout" value="Logout"></form>');
			   
					//my work 

					var aElement = document.createElement('a');
					$(aElement).attr('href', 'EditProfile.jsp');
					aElement.innerHTML = 'Edit Profile';
					$('#editProfile').append(aElement);

				}
				//member constructor
				function Member(inUserName, inPwd, inFirstName, inLastName,
						inNRIC, inGender, inEmail, inContactNo, inBlock,
						inStreet, inUnit, inPostalCode) {
					this.mUserName = inUserName;
					this.mPwd = inPwd;
					this.mFirstName = inFirstName;
					this.mLastName = inLastName;
					this.mNRIC = inNRIC;
					this.mGender = inGender;
					this.mEmail = inEmail;
					this.mContactNo = inContactNo;
					this.mBlock = inBlock;
					this.mStreet = inStreet;
					this.mUnit = inUnit;
					this.mPostalCode = inPostalCode;
				};
				//***************************************************************
				$('.ui.dropdown').dropdown();
				//init checkbox needed. Problem poses if not = cant tick
				$('.ui.checkbox').checkbox();

				$('.ui.form')
						.form(
								{
									inline : true,
									fields : {
										username : {
											identifier : 'username',
											rules : [ {
												type : 'minLength[6]',
												prompt : 'Your username must be at least {ruleValue} characters'
											} ]
										},
										//password alphanumeric, minimum 6-14 characters
										pwd : {
											identifier : 'pwd',
											/*	rules : [ {
													^ - Start of string
													[a-zA-Z0-9]* - multiple characters to include
													$ - End of string
													type : 'regExp[/^[a-zA-Z0-9]{4,16}$/]',
													prompt : 'Your password must be alphanumeric and at least 6-14 characters'
												}] */
											rules : [
											         // () enclosed = Grouping construct
											         {
														type : 	'regExp[/^([a-zA-Z0-9]{6})/]',
														prompt : 'Your password must be alphanumeric and at least 6-14 characters'
													}]
										},

										cfmpwd : {
											identifier : 'cfmpwd',

											rules : [
													{
														type : 'match[pwd]',
														prompt : 'Confirm Password does not match'
													}]
										},

										firstname : {
											identifier : 'firstname',
											rules : [ {
												type : 'empty',
												prompt : 'Please fill up the field'
											} ]
										},
										lastname : {
											identifier : 'lastname',
											rules : [ {
												type : 'empty',
												prompt : 'Please fill up the field'
											} ]
										},
										nric : {
											identifier : 'nric',
											rules : [ {
											// ^ = match must start at beginning of string
											// $ = match occur at end of string
											// [xxxx] = Matches any single character in array bracket
											// \d = match any decimal digit
											// {n} = Matches the previous element exactly n times.
											type: 'regExp[/^[STFG][0-9]{7}[A-Z]/]',
											prompt: 'Invalid NRIC Number'
											} ]
										},
										gender : {
											identifier : 'gender',
											rules : [ {
												type : 'minCount[1]',
												prompt : 'Please select a gender'
											} ]
										},
										email : {
											identifier : 'email',
											rules : [ {
												type : 'email',
												prompt : 'Please enter a valid email'
											} ]
										},
										contact : {
											identifier : 'contact',
											rules : [ {
												type : 'integer',
												prompt : 'Please enter valid contact number'
											} ]
										},
										block : {
											identifier : 'block',
											rules : [ {
												type : 'empty',
												prompt : 'Please fill up the field'
											} ]
										},
										street : {
											identifier : 'street',
											rules : [ {
												type : 'empty',
												prompt : 'Please fill up the field'
											} ]
										},
										unit : {
											identifier : 'unit',
											rules : [ {
												type : 'empty',
												prompt : 'Please fill up the field'
											} ]
										},
										postalCode : {
											identifier : 'postalCode',
											rules : [ {
												type : 'number',
												prompt : 'Please enter valid Postal Code'
											},								
											{											
												type: 'minLength[6]',
												prompt: "Invalid Postal Code. It must be 6 numeric long"				
											}]
										},
										terms:  {
											identifier : 'terms',
											rules : [ {
												type : 'checked',
												prompt : 'You must agree to the terms and condition'
											}
											]
										}

									}
								});
				//***************************************************************

				$('.ui.blue.submit.button')
						.on(
								'click',
								function() {
									console.log('submit button clicked');

									Member
									mMember = new Member($(
											'input[name="username"]').val(), $(
											'input[name="pwd"]').val(), $(
											'input[name="firstname"]').val(),
											$('input[name="lastname"]').val(),
											$('input[name="nric"]').val(), $(
													'input[name="gender"]')
													.val(), $(
													'input[name="email"]')
													.val(), $(
													'input[name="contact"]')
													.val(), $(
													'input[name="block"]')
													.val(), $(
													'input[name="street"]')
													.val(),
											$('input[name="unit"]').val(), $(
													'input[name="postalCode"]')
													.val());
									console.log(mMember);

									$('.ui.form')
											.api(
													{
														method : 'post',
														url : '${pageContext.request.contextPath}/member',
														data : {
															command : 'registerMember',
															Member : JSON
																	.stringify(mMember)
														},

														beforeSend : function(
																settings) {
															console
																	.log('beforesend activation');
															
															$(
																	"[data-dismiss=modal]")
																	.trigger(
																			{
																				type : "click"
																			});
															
															
															
															
															
															return settings;
														},
														onResponse : function(
																response) {

															console
																	.log('onResponse');
															return response;
														},
														successTest : function(
																response) {

							
															console
																	.log('sucessTest');

															return response.success || false;
														},
														onComplete : function(
																response) {
															$
															.notify(
																	'You have registered',
																	'success');
															console
																	.log('onComplete');

														},
														onSuccess : function(
																response) {
															console
																	.log('onSuccess');

														},
														onFailure : function(
																response) {
															console
																	.log('onFailure');
														
														},
														onError : function(
																errorMessage) {
															console
																	.log('onError');

														},
														onAbort : function(
																errorMessage) {
															console
																	.log('onAbort');
															$
															.notify(
																	'Registration failed',
																	'error');
														}
													});

								});
				//*************************************************************

				
				
					$('#movieNames')
							.change(
									function() {
										var collectedMovieNames = $(
												'#movieNames').val();
										var collectedCinemaID = $(
												'#cinemaNames').val();
										//default
										if (collectedCinemaID == '0') {

											$
													.ajax(
															{
																type : 'POST',
																url : '${pageContext.request.contextPath}/instantbooking',
																contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
																dataType : 'json',
																data : {

																	movieID : collectedMovieNames,
																	command : 'getCinema'

																}
															})
													.done(
															function(data,
																	textStatus,
																	jqXHR) {
																$(
																		'#cinemaNames')
																		.empty();
																var $optionElement = $('#cinemaNames');

																var collectedCinemaList = data;
																$optionElement
																		.append('<option value=0>Select Cinemas</option>');

																for (i = 0; i < collectedCinemaList.length; i++) {

																	cinemaName = collectedCinemaList[i].CinemaName;
																	cinemaID = collectedCinemaList[i].cinemaID;
																	$optionElement
																			.append('<option value='+cinemaID+'>'
																					+ cinemaName
																					+ '</option>');
																}

															})
													.fail(
															function(data,
																	jqXHR,
																	textStatus,
																	errorThrown) {
																alert('failed');

															})
										}//--reset filter the movie base on the cinema result
										//this i confusing dont anyhow change!!
										else if (collectedCinemaID != '0') {
											//get the id of cinema
											$
													.ajax(
															{
																type : 'POST',
																url : '${pageContext.request.contextPath}/instantbooking',
																contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
																dataType : 'json',
																data : {

																	movieID : collectedMovieNames,
																	command : 'getCinema'

																}
															})
													.done(
															function(data,
																	textStatus,
																	jqXHR) {
																$(
																		'#cinemaNames')
																		.empty();
																var $optionElement = $('#cinemaNames');

																var collectedCinemaList = data;
																$optionElement
																		.append('<option value=0>Select Cinemas</option>');

																for (i = 0; i < collectedCinemaList.length; i++) {

																	cinemaName = collectedCinemaList[i].CinemaName;
																	cinemaID = collectedCinemaList[i].cinemaID;
																	$optionElement
																			.append('<option value='+cinemaID+'>'
																					+ cinemaName
																					+ '</option>');
																}
																$(
																		'#cinemaNames')
																		.val(
																				collectedCinemaID);
															})
													.fail(
															function(data,
																	jqXHR,
																	textStatus,
																	errorThrown) {

															})
										}

									});

					$('#cinemaNames')
							.change(
									function() {
										var collectedCinemaID = $(
												'#cinemaNames').val();
										var collectedMovieNames = $(
												'#movieNames').val();
										if (collectedMovieNames == '0') {
											$
													.ajax(
															{
																type : 'POST',
																url : '${pageContext.request.contextPath}/instantbooking',
																contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
																dataType : 'json',
																data : {

																	cinemaID : collectedCinemaID,
																	command : 'getMovie'

																}
															})
													.done(
															function(data,
																	textStatus,
																	jqXHR) {
																$('#movieNames')
																		.empty();
																var $optionElement = $('#movieNames');

																var collectedMovieList = data;

																for (i = 0; i < data.length; i++) {
																	movieName = data[i].mTitle;
																	movieID = data[i].mMovieID;
																	$optionElement
																			.append('<option value='+movieID+'>'
																					+ movieName
																					+ '</option>');
																}
															})
													.fail(
															function(data,
																	jqXHR,
																	textStatus,
																	errorThrown) {

															})
										}
										//--reset filter the movie base on the cinema result
										//this i confusing dont anyhow change!!
										else if (collectedMovieNames != '0') {
											//get the id of cinema
											$
													.ajax(
															{
																type : 'POST',
																url : '${pageContext.request.contextPath}/instantbooking',
																contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
																dataType : 'json',
																data : {

																	cinemaID : collectedCinemaID,
																	command : 'getMovie'

																}
															})
													.done(
															function(data,
																	textStatus,
																	jqXHR) {
																$('#movieNames')
																		.empty();
																var $optionElement = $('#movieNames');

																var collectedMovieList = data;

																for (i = 0; i < data.length; i++) {
																	movieName = data[i].mTitle;
																	movieID = data[i].mMovieID;
																	$optionElement
																			.append('<option value='+movieID+'>'
																					+ movieName
																					+ '</option>');
																}

																$('#movieNames')
																		.val(
																				collectedMovieNames);
															})
													.fail(
															function(data,
																	jqXHR,
																	textStatus,
																	errorThrown) {

															})

										}

									});

					$('#dateTimes')
							.click(
									function() {
										var collectedCinemaID = $(
												'#cinemaNames').val();
										var collectedMovieID = $('#movieNames')
												.val();
										$
												.ajax(
														{
															type : 'POST',
															url : '${pageContext.request.contextPath}/instantbooking',
															contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
															dataType : 'json',
															data : {

																cinemaID : collectedCinemaID,
																movieID : collectedMovieID,
																command : 'getDateTime'

															}
														})
												.done(
														function(data,
																textStatus,
																jqXHR) {
															$('#dateTimes')
																	.empty();
															var $optionElement = $('#dateTimes');

															for (i = 0; i < data.length; i++) {
																Theatre_movieId = data[i].Theatre_movieID;
																datetime = data[i].DateTime;
																$optionElement
																		.append('<option value='+Theatre_movieId+'>'
																				+ datetime
																				+ '</option>');
															}

														}).fail(
														function(data, jqXHR,
																textStatus,
																errorThrown) {

														})
									});
				
				$('#filterBtn')
						.click(
								function() {
									alert('filter');
									var collectedGenreID = $('#genreDDL').val();
									$('#filterContent').empty();

									$
											.ajax(
													{
														type : 'POST',
														url : '${pageContext.request.contextPath}/search',
														contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
														dataType : 'json',
														data : {

															genreID : collectedGenreID

														}
													})
											.done(
													function(data, textStatus,
															jqXHR) {

														var filterList = data;
														var photoID = '';
														var movieID = '';
														var $divElement = null;
														var $ulElement = null;
														var $liElement = null;

														$divElement = $('#filterContent');
														$ulElement = $('<ul></ul>');
														for (index = 0; index < filterList.length; index++) {
															photoID = filterList[index].PhotoID;
															movieID = filterList[index].MovieID;
															$ulElement
																	.append('<li> <div class="f-movie"> <div class="f-movie-img"> <a href="MDetailServlet?movie'
																			+ movieID
																			+ '">'
																			+ '<img src="poster?imgID='
																			+ photoID
																			+ '" class="img-responsive" alt="" /></a>'
																			+ '</div><div class="f-buy-tickets"><a href="movie-select-show.html">BUY TICKETS</a>'
																			+ '</div></div></li>');
														}

														$ulElement
																.append($liElement);
														$divElement
																.append($ulElement);

														$divElement
																.append($ulElement)
														$
																.notify(
																		'Filtered',
																		'success');

													}).fail(
													function(data, jqXHR,
															textStatus,
															errorThrown) {

													})
								});
				
				
				$('#historyBtn').click(function() {

				      $('#historyBody').empty();
				      $.ajax(
				        {
				         type : 'POST',
				         url : '${pageContext.request.contextPath}/History',
				         contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				         dataType : 'json',
				         data : {

				          command : 'history'

				         }
				        })
				      .done(
				        function(data,
				          textStatus,
				          jqXHR) {
				         
				         var $optionElement = $('#historyBody');
				         $optionElement.append(data);

				        }).fail(
				        function(data, jqXHR,
				          textStatus,
				          errorThrown) {

				        })
				     });
				
				
				
				
				
				
				function deleteCartItem(id) {
				      $
				        .ajax(
				          {
				           type : 'POST',
				           url : '${pageContext.request.contextPath}/cart',
				           contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				           dataType : 'json',
				           data : {
				            command : 'remove',
				            position : id
				           }
				          })
				        .done(function(data, textStatus, jqXHR) {
				         //console.log('alert run');
				         //alert('ok');
				         $('#viewCartBody').empty();

				         var $optionElement = $('#viewCartBody');
				         $optionElement.append(data);

				         //remove current html and recreate

				        })
				     }
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			</script>
</body>