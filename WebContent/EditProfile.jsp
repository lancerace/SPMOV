<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="Model.*, com.google.gson.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	System.out.println("EditProfile.asp invoked..");
%>
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
<script src="dependencies/uitotop/jquery.uitotop.min.js"></script>


<link rel="stylesheet" href="dependencies/bootstrap/css/menu.css" />
<link href="dependencies/indexJsp/css/style.css" rel="stylesheet"
	type="text/css" media="all" />
<!--webfont-->
<link href='//fonts.googleapis.com/css?family=Oxygen:400,700,300'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- start menu -->
<link href="dependencies/css/megamenu.css" rel="stylesheet"
	type="text/css" media="all" />
<script type="text/javascript"
	src="dependencies/indexJsp/js/megamenu.js"></script>
<script type="text/javascript"
	src="dependencies/indexJsp/js/jquery.leanModal.min.js"></script>
<link rel="stylesheet"
	href="dependencies/indexJsp/css/font-awesome.min.css" />
<script src="dependencies/indexJsp/js/easyResponsiveTabs.js"
	type="text/javascript"></script>
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



<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="My Show Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	
	
	
	
	
	
	
	

 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 












</script>



<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

<!---- start-smoth-scrolling---->

</head>
<body>
	<%
		String customerName = "";
		String customerUserID = "";
		boolean log = false;
		Member mMember;

		//get existing
		HttpSession Ssession = request.getSession(false);
		ArrayList<Ticket> cartList = (ArrayList<Ticket>) Ssession.getAttribute("CartList");
		System.out.println("Checking line 127:...");
		if (Ssession != null) {
			customerName = (String) Ssession.getAttribute("CustomerName");
			customerUserID = (Ssession.getAttribute("CustomerUserID") + "");

			if (customerName != null)
				log = true;
		}
		System.out.println("Checking line 138:...");
		// get Member object from memberController

		mMember = (Member) request.getAttribute("Memberobj");

		if (mMember == null) {
			System.out.println("if condition for checking mMember for null invoked");
			request.setAttribute("command", "getMember");
			request.setAttribute("memberID", customerUserID);
			request.getRequestDispatcher("/member").forward(request, response);
		} else {
			Gson gson = new Gson();
			//iterate error starts here
			System.out.println("Line 148:" + gson.toJson(mMember));
	%>
	<!-- header-section-starts -->
	<div class="header-top-strip">











		<!-- View history modal -->


		<div id="viewHistory" class="modal fade" role="dialog">
			<input type="hidden" name="modalHidden">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">View History</h4>
					</div>
					<div id="historyBody">
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

		<!--  -->

		<div class="clearfix"></div>


		<div id class="col-md-" id="cartDiv">
			<button class="btn btn-primary" data-toggle="modal"
				id="cartDetailsBtn" data-target="#viewCart">View Cart</button>
		</div>
		<div id class="col-md-0" id="historyDiv">
			<div id="loginDiv"></div>

		</div>


	</div>


	<div class="clearfix"></div>



	<div class="container">

		<div class="main-content">

			<div class="header">

				<div class="logo">
					<a href="index"><h1>SPMOV</h1></a>
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
						<li class="dropdown w3_megamenu-fw"><a href="EditProfile.jsp">Edit
								Profile</a></li>

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

			<form role="form" class="form-horizontal ui form" method="post"
				action="member">
				<%
					System.out.println("Line348:Checking mMember object again.." + gson.toJson(mMember));
				%>
				<div class="two fields">
					<div class="field">
						<label>Username</label> <input name="username" type="text"
							value=<%=mMember.getmUserName()%>>
					</div>


					<div class="field">
						<label>Password</label> <input name="pwd" type="password"
							value=<%=mMember.getmPassword()%>>
					</div>
				</div>

				<div class="field">
					<label>Credit Card Number (MasterCard)</label> <input
						name="CreditCardNumber" type="text"
						value=<%=mMember.getmCreditCardNumber()%>>
				</div>



				<div class="two fields">
					<div class="field">
						<label>First Name</label> <input name="firstname" type="text"
							value=<%=mMember.getmFirstName()%>>
					</div>
					<div class="field">
						<label>Last Name</label> <input name="lastname" type="text"
							value=<%=mMember.getmLastName()%>>
					</div>
				</div>

				<div class="two fields">
					<div class="field">
						<label>NRIC/FIN</label> <input name="nric" type="text"
							value=<%=mMember.getmNRIC()%>>
					</div>
					<div class="field">
						<label>Gender</label>
						<div class="ui fluid selection dropdown">
							<input name="gender" value=<%=mMember.getmGender()%>
								type="hidden">
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
						<label>Email</label> <input name="emailAddress" type="text"
							value=<%=mMember.getmEmail()%>>
					</div>
					<div class="field">
						<label>Contact No</label> <input name="contact" type="text"
							value=<%=mMember.getmContactNo()%>>
					</div>
				</div>

				<div class="two fields">
					<div class="field">
						<label>Block</label> <input name="block" type="text"
							value=<%=mMember.getmBlock()%>>
					</div>
					<div class="field">
						<label>Street</label> <input name="street" type="text"
							value=<%=mMember.getmStreet()%>>
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>Unit</label> <input name="unit" type="text"
							value=<%=mMember.getmUnit()%>>
					</div>
					<div class="field">
						<label>Postal Code</label> <input name="postalCode" type="text"
							value=<%=mMember.getmPostalCode()%>>
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
	<div class="clearfix"></div>

	<!-- end container -->
	<!--  iterate stop here -->
	<%
		System.out.println("test..");
			System.out.println("Checking mMember again.." + gson.toJson(mMember));
		}
		//end else
	%>
	<script type="text/javascript">
	
	
	
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
		}
		//****************************************************************************************

		$('.ui.dropdown').dropdown();
		//init checkbox needed. Problem poses if not = cant tick
		$('.ui.checkbox').checkbox();
		//member constructor
		function Member(inMemberID, inUserName, inPwd, inFirstName, inLastName,
				inNRIC, inCreditCardNumber, inGender, inEmail, inContactNo,
				inBlock, inStreet, inUnit, inPostalCode) {
			this.mMemberID = inMemberID;
			this.mUserName = inUserName;
			this.mPwd = inPwd;
			this.mFirstName = inFirstName;
			this.mLastName = inLastName;
			this.mNRIC = inNRIC;
			this.mCreditCardNumber = inCreditCardNumber;
			this.mGender = inGender;
			this.mEmail = inEmail;
			this.mContactNo = inContactNo;
			this.mBlock = inBlock;
			this.mStreet = inStreet;
			this.mUnit = inUnit;
			this.mPostalCode = inPostalCode;
		};

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
											{
												/*^ - Start of string
												[a-zA-Z0-9]* - multiple characters to include
												$ - End of string*/
												type : 'minLength[6]',
												prompt : 'Your password must be alphanumeric and at least 6-14 characters'
											},
											{

												/*^ - Start of string
												[a-zA-Z0-9]* - multiple characters to include
												$ - End of string*/
												type : 'maxLength[14]',
												prompt : 'Your password must be alphanumeric and at least 6-14 characters'
											} ]
								},

								firstname : {
									identifier : 'firstname',
									rules : [ {
										type : 'empty',
										prompt : 'pls key in something'
									} ]
								},
								lastname : {
									identifier : 'lastname',
									rules : [ {
										type : 'empty',
										prompt : 'pls key in something'
									} ]
								},
								nric : {
									identifier : 'nric',
									rules : [ {
										type : 'empty',
										prompt : 'pls key in something'
									} ]
								},
								gender : {
									identifier : 'gender',
									rules : [ {
										type : 'empty',
										prompt : 'pls key in something'
									} ]
								},
								email : {
									identifier : 'email',
									rules : [ {
										type : 'empty',
										prompt : 'pls key in something'
									} ]
								},
								contact : {
									identifier : 'contact',
									rules : [ {
										type : 'empty',
										prompt : 'pls key in something'
									} ]
								},
								block : {
									identifier : 'block',
									rules : [ {
										type : 'empty',
										prompt : 'pls key in something'
									} ]
								},
								street : {
									identifier : 'street',
									rules : [ {
										type : 'empty',
										prompt : 'pls key in something'
									} ]
								},
								unit : {
									identifier : 'unit',
									rules : [ {
										type : 'empty',
										prompt : 'pls key in something'
									} ]
								},
								postalCode : {
									identifier : 'postalCode',
									rules : [ {
										type : 'empty',
										prompt : 'pls key in something'
									} ]
								}

							}
						});

		$('.ui.blue.submit.button')
				.on(
						'click',
						function() {
							console.log('submit button clicked');
							console.log('checking MemberID in javascript:'
									+
	<%=mMember.getmMemberID() + ""%>
		);

							Member
							mMember = new Member(
	<%=mMember.getmMemberID() + ""%>
		, $(
											'input[name="username"]').val(), $(
											'input[name="pwd"]').val(), $(
											'input[name="firstname"]').val(),
									$('input[name="lastname"]').val(), $(
											'input[name="nric"]').val(), $(
											'input[name="CreditCardNumber"]')
											.val(),
									$('input[name="gender"]').val(), 
									$('input[name="emailAddress"]').val(), 
									$(
											'input[name="contact"]').val(), $(
											'input[name="block"]').val(), $(
											'input[name="street"]').val(), $(
											'input[name="unit"]').val(), $(
											'input[name="postalCode"]').val()

							);
							
							
							
											
							console.log('checking member object to be send to update ajax call'+mMember);

							$('.ui.form')
									.api(
											{
												method : 'post',
												url : '${pageContext.request.contextPath}/member',
												data : {
													command : 'updateMember',
													Member : JSON
															.stringify(mMember)
												},

												beforeSend : function(settings) {
													console
															.log('beforesend activation');

													return settings;
												},
												onResponse : function(response) {

													console.log('onResponse');
													console
															.log('Response Data:'
																	+ response.data);

													console
															.log('Response Data stringified:'
																	+ JSON
																			.stringify(response.data));
													return response;
												},
												successTest : function(response) {

													console.log('sucessTest');

													return response.success || false;
												},
												onComplete : function(response) {
													$.notify('Update Success',
															'success');
													console.log('onComplete');

												},
												onSuccess : function(response) {
													console.log('onSuccess');

												},
												onFailure : function(response) {
													console.log('onFailure');

												},
												onError : function(errorMessage) {
													console.log('onError');

												},
												onAbort : function(errorMessage) {
													console.log('onAbort');
													$.notify('Update Failed',
															'error');
												}
											});

						});

		$(document).ready(function() {

			$('#horizontalTab').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion           
				width : 'auto', //auto or any width like 600px
				fit : true
			// 100% fit in a container
			});

			//init megamenu
			$(".megamenu").megamenu();

			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1200);

			})
		});

		$('#historyBtn')
				.click(
						function() {

							$('#historyBody').empty();
							$
									.ajax(
											{
												type : 'POST',
												url : '${pageContext.request.contextPath}/History',
												contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
												dataType : 'json',
												data : {

													command : 'history'

												}
											})
									.done(function(data, textStatus, jqXHR) {

										var $optionElement = $('#historyBody');
										$optionElement.append(data);

									}).fail(
											function(data, jqXHR, textStatus,
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
							}).done(function(data, textStatus, jqXHR) {

						$('#viewCartBody').empty();

						var $optionElement = $('#viewCartBody');
						$optionElement.append(data);

						//remove current html and recreate

					})
		}
	</script>
</body>
</html>