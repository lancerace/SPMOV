<%@page import="Model.Ticket"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="dependencies/bootstrap/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link rel="stylesheet" href="dependencies/bootstrap/css/menu.css" />
<link href="dependencies/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SPMOV</title>
</head>


<script src="dependencies/jquery/jquery-1.11.3.js"></script>
<script src="dependencies/jquery/jquery-ui.js"></script>


<body style="min-width: 1000px;">
	<div class="container">
		<div class="main-content">
			<div class="header">
				<div class="logo">
					<a href="index"><h1>My Show</h1></a>
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

			<%
				HttpSession Ssession = request.getSession(false);
				String customerName = (String) Ssession.getAttribute("CustomerName");
				String customerUserID = (String) Ssession.getAttribute("CustomerUserID");
				ArrayList<Ticket> cartList = (ArrayList<Ticket>) Ssession.getAttribute("CartList");
				System.out.println("ASDF" + customerName);
			%>
			<div class="col-xs-12 col-md-8" style="border-style: solid;">
				<h3 style="border-bottom-color: grey;">Your Cart</h3>
				<table class="table table-hover ">
					<thead>
						<th>Movie Name</th>
						<th>Branch</th>
						<th>Seat</th>
						<th>Date</th>
						<th>Price</th>
					</thead>
					<tbody id="cartBody">
						<table class="table table-hover ">
							<thead>
								<th>Movie Name</th>
								<th>Branch</th>
								<th>Seat</th>
								<th>Date</th>
								<th>Price</th>
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
						<div class="col-xs-12 col-md-8" style="border-style: solid;">
							<h3>Payment Method</h3>
							<div class="col-xs-12 col-md-4">
							<form action="${initParam['posturl']}" method="post">
								<input type="hidden" name="upload" value="1" /> <input
									type="hidden" name="return" value="${initParam['returnurl']}" />
								<input type="hidden" name="cmd" value="_cart" /> <input
									type="hidden" name="business" value="${initParam['business']}">
								<%
									for (int i = 0; i < cartList.size(); i++) {
										char myChar = (char) (64 + (Integer.parseInt(cartList.get(i).getRow())));
										String seatNo = myChar + "" + cartList.get(i).getColumn();
								%>


								<!-- product 1 -->
								<input type="hidden" name="item_name_<%=i + 1%>"
									value="<%=cartList.get(i).getTitle()%>" /> <input type="hidden"
									name="item_number_<%=i + 1%>" value="<%=seatNo%>" /> <input
									type="hidden" name="amount_<%=i + 1%>"
									value="<%=cartList.get(i).getValue()%>" /> <input
									type="hidden" name="quantity_<%=i + 1%>" value="1" />
									<input type="hidden" name="payment_currency" value="SGD" />
								<%
									}
								%>
								<input type="image" id="paypal"
									src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif"
									border="0" name="submit"
									alt="PayPal - The safer, easier way to pay online!"> <img
									alt="" border="0"
									src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif"
									width="1" height="1">
							</form>
							</div>
								<div class="col-xs-12 col-md-4">
						<input type="button" class="btn btn-default" id=Pay
							value="Pay By Magic">
						</div>
						</div>
					
						
						<div class="clearfix"></div>

					
						<script>
						$('#paypal')
						.click(
								function() {
									
									$
											.ajax(
													{
														type : 'POST',
														url : '${pageContext.request.contextPath}/payment',
														contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
														dataType : 'json',
														data : {
															command : 'pay'

														}
													})
													.done(
															function(
																	data,
																	textStatus,
																	jqXHR) {
																
															})
													.fail(
															function(
																	data,
																	jqXHR,
																	textStatus,
																	errorThrown) {
															

															})
										});
						$('#Pay')
						.click(
								function() {
									
									$
											.ajax(
													{
														type : 'POST',
														url : '${pageContext.request.contextPath}/payment',
														contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
														dataType : 'json',
														data : {
															command : 'pay'

														}
													})
													.done(
															function(
																	data,
																	textStatus,
																	jqXHR) {
																
															})
													.fail(
															function(
																	data,
																	jqXHR,
																	textStatus,
																	errorThrown) {
															

															})
										});
							$('#test')
									.click(
											function() {
												

												$
														.ajax(
																{
																	type : 'POST',
																	url : 'https://api-3t.sandbox.paypal.com/nvp',
																	contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
																	dataType : 'json',
																	data : {

																		USER : 'xiyangLXY-buyer@gmail.com',
																		PWD : '569874123',
																		SIGNATURE : 'A67aDmB8p7P6IE.H.-DQjsuLrjVPAXdnUleZ4MQl1DP3lyVOU3ZFWvdP',
																		METHOD : 'GetTransactionDetails',
																		TRANSACTIONID:'0UJ64884MS9461413',
																		VERSION : '94'

																	}
																})
														.done(
																function(
																		data,
																		textStatus,
																		jqXHR) {
																	console
																			.log(date);
																})
														.fail(
																function(
																		data,
																		jqXHR,
																		textStatus,
																		errorThrown) {
																	

																})
											});
						</script>
</body>
</html>

