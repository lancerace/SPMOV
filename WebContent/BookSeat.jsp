<%@page import="Model.BookedSeat"%>
<%@page import="Model.Theatre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<link href="dependencies/bootstrap/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link rel="stylesheet" href="dependencies/bootstrap/css/menu.css" />
<link href="dependencies/style.css" rel="stylesheet" type="text/css" media="all" />



<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<script src="dependencies/jquery/jquery-1.11.3.js"></script>
<script src="dependencies/jquery/jquery-ui.js"></script>


<body style="min-width: 1000px;" onload="BookedSeat()">
	<div class="container">
		<div class="main-content">
			<div class="header">
				<div class="logo">
					<a href="index"><h1>My Show</h1></a>
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
					<a href="index.html" class="navbar-brand"><i class="fa fa-home"></i></a>
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
			</div>
			<!-- end container -->


			<!-- AddThis Smart Layers END -->



			<script>
function myFunction(String) {
    selectedSeatNo.addElement(String);
    System.out.println(String);
}
</script>
			<%
		session = request.getSession(true);
		ArrayList<Theatre> mTheatreList = (ArrayList<Theatre>) request.getAttribute("mtheatreList");
		ArrayList<BookedSeat> mBookedSeatList = (ArrayList<BookedSeat>) request.getAttribute("bookedSeatList");
		String movieId=(String)request.getAttribute("movieID");
		String cinemaId=(String)request.getAttribute("cinemaID");
		String movieName=(String)request.getAttribute("MovieName");
		String branchName=(String)request.getAttribute("BranchName");
		String dateTime=(String)request.getAttribute("dateTime");
		String DateTime=(String)request.getAttribute("DateTime");
		String price=(String)request.getAttribute("Value");
		System.out.println("Data retrieved="+dateTime);
		//session for custoemr details!!
		String name=(String)session.getAttribute("CustomerName");
		String userID=(String)session.getAttribute("CustomerUserID");
		System.out.println("dsdsdsdsdsdsdssdsdsd="+userID);
		//end of session
		System.out.print("BookedSeatjsp bookseatsize:"+mBookedSeatList.size());
		
		int Row = mTheatreList.get(0).getRow();
		int Col = mTheatreList.get(0).getColumn();
		String TheatreName = mTheatreList.get(0).getTheatreName();
		//System.out.println(Col + "  " + Row);
		Vector selectedSeatNo = new Vector(1, 1);
		String number[] = new String[20];
		%>
			<div class="col-xs-12 col-md-8" >
				<div class="col-lg-6 col-md-3" >
					<img src="poster?imgID=<%=movieId%>" class="img-responsive"
						alt"" width="" height="">
				</div>
				<div class="col-lg-6 col-md-9" >
					<h3><%=movieName%></h3>
					<label>Showing on <%=dateTime%></label><br> <label>Location
						<%=branchName%> Theatre <%=TheatreName %></label>
				</div>




				<div style="border: 3px solid red; min-width: 690px;"
					class="col-lg-12 col-md-12" align="center">
					<h3
						style="background: grey none repeat scroll 0% 0%; margin-left: 220px; margin-right: 220px;">Screen</h3>
					<br>
					<%
		for (int i = 0; i <= Col; i++) {//col
			out.print("<td>");
			
			for (int x = 1; x <= Row; x++) {//row
				if(x==1&&i!=0){
					char c = (char) (64 + i);
					out.print(c);
					
				}if(i==0){
					
					out.print("\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0"+(x)+"\u00A0\u00A0\u00A0");
				}
				else if(x>0){
				char myChar = (char) (64 + i);
				String seatNo = myChar + "" + x;
				//the alphabet thing
				//System.out.println(seatNo);
				String saveNum = i + "" + x;	
				
					%>

					<input type="image" src="images/seat_0.png"
						style="width: 50px; height: 50px;" id="<%=seatNo%>"
						value="<%=seatNo%>" onClick="saveNum(<%=saveNum%>,<%=seatNo%>)">
					<%
		}}
			out.print("</td><br>");
			

		}
		String st = "<script>document.writeln(str[0])</script>";
		
		/* 
		for(int x = 1; x <= mBookedSeatList.size(); x++){
			int row = Integer.parseInt(mBookedSeatList.get(x).getRow());
			int num = Integer.parseInt(mBookedSeatList.get(x).getNumber());
			char myChar = (char) (64 + row);
			String seatNo = myChar + "" + num;
			
		} */
	%>
					<div class="row">
						<div class="col-xs-1"
							style="background: grey none repeat scroll 0% 0%; margin-left: 180px; margin-right: 120px;">Exit</div>
						<div class="col-xs-1"
							style="background: grey none repeat scroll 0% 0%; margin-left: 120px; margin-right: 120px;">Exit</div>
					</div>
					<label id="selectedSeats"></label>
				</div>
			</div>
			<div class="col-xs-12 col-md-3" style="border-style: solid;">
				<div class="container-fluid" >
					<h4 style="border-bottom: 2px solid #fff;">Your Basket</h4>
					<div class="row">
						<div class="col-xs-8 col-sm-4"><%=movieName%>
						</div>
						<div class="col-xs-4 col-sm-4">
							Qty <br> <label id="Qty">0</label>
						</div>
						<div class="col-xs-4 col-sm-4">
							Price<br> <label>$<%=price%></label>
						</div>
					</div>

					<br> <br> <br> <br> <br> <br> <label>Total</label>
					<label id="Price"></label> <br> <input type="button"
						id="addBtn" value="Add Cart" data-toggle="modal"
						data-target="#myModal">
				</div>

			</div>
			<div class="clearfix"></div>

			<div id="MyModal" class="modal fade" role="dialog">
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
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="deleteBtn">Delete</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>


			<script>
	
var str = [];

function BookedSeat(){
	<%-- var  bookedSeatList =<%=mBookedSeatList%>;
	for(v = 1; v <= bookedSeatLists.size(); v++){
		var row = Integer.parseInt(mBookedSeatList.get(v).getRow());
		var num = Integer.parseInt(mBookedSeatList.get(v).getNumber());
		
		$('#\''+row+''+num+'\'').src="images/seat_2.png";
			
		} --%>
	
}

function saveNum(num ,seat){
var duplicate=false;	
//alert(num);
//checking for duplicate
for (i=0;i<str.length;i++){
	
	if(str[i]==seat.value){
		str.splice(i, 1);
		seat.src ="images/seat_0.png";
		duplicate=true;
	}
		}
if(duplicate!=true){
	str.push(seat.value);
	//alert('str'+str.length);
	seat.src ="images/seat_1.png";
	}
	
	$('#selectedSeats').empty();
	$('#Qty').empty();
	$('#Qty').append(str.length);
	$('#Price').empty();
	$('#Price').append('$'+((str.length*<%=price%>).toFixed(2)));
	
	for (i=0;i<str.length;i++){
	
		$('#selectedSeats').append(str[i]);
		if(i<str.length-1){
			
			$('#selectedSeats').append(',');	
		} 
	}
	}
	


$('#addBtn')
.click(
		
		function() {
			var name = '<%= session.getAttribute("CustomerUserID") %>';
			var movieName ='<%=request.getAttribute("MovieName")%>';
			var branchName ='<%=request.getAttribute("BranchName")%>';
			var dateTime ='<%=request.getAttribute("DateTime")%>';
			var value ='<%=request.getAttribute("Value")%>';
			var Theatre_movieID ='<%=request.getAttribute("Theatre_movieId")%>';
			
			
			//str contain array of movie ticket  
			console.log("Click on add cart");
			console.log("asas"+<%=movieId%>+ movieName +branchName+ dateTime +value);

			$.ajax(
							{
								
								type : 'POST',
								url : '${pageContext.request.contextPath}/cart',
								contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
								dataType : 'json',
								data : {
									movieID: <%=movieId%>,
								
									movieName:movieName,
									branchName:branchName,
									datetime:dateTime,
									price:value,
									cinemaID : <%=cinemaId%>,
									userID : name,
									Theatre_movieID :Theatre_movieID,
									seats : JSON.stringify(str),
									command : 'add'
									
									
									
								}
							})
					.done(
							function(data,
									textStatus,
									jqXHR) {
								console.log("Click on add aaaaacart");								
								window.location.replace("index.jsp");
							}).fail(
							function(data, jqXHR,
									textStatus,
									errorThrown) {
								$('#myModal').show();
								console.log("data: "+data+"sds"+textStatus+"error "+errorThrown);

							})
						
		});


</script>
</body>
</html>