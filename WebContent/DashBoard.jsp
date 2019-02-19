<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, net.spmov.*, Model.*, java.util.*"%>


<!-- call servlet directing with URL-Mapping through a JSP page -->
<!-- synonymous with the RequestDispatcher -->




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<title>DashBoard Management</title>

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
<script src="dependencies/d3/d3.min.js"></script>
<script src="dependencies/dist/semantic.min.js"></script>
</head>
<body>



	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP
																					// 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0); // Proxies.
	
	
		HttpSession userSession = request.getSession(false);
		User mUser = (User) userSession.getAttribute("USER");

		if (mUser == null)
			request.getRequestDispatcher("/login.jsp").forward(request, response);
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
							<div class="panel-body" style="min-height: 500px;">

								<div class="row" style="margin-bottom: 40px">

									<div class="col-md-1">
										<div style="margin-left: 5px">
											<h3 class="title">Statistics</h3>
										</div>
									</div>

									<div class="col-md-1 col-md-offset-8">
										<select class="ui search dropdown" id="ddl">
											<option value="">Date</option>
											<option value="0">January</option>
											<option value="1">February</option>
											<option value="2">March</option>
											<option value="3">April</option>
											<option value="4">May</option>
											<option value="5">June</option>
											<option value="6">July</option>
											<option value="7">August</option>
											<option value="8">September</option>
											<option value="9">October</option>
											<option value="10">November</option>
											<option value="11">December</option>
										</select>
									</div>

								</div>

								<div id="bar-chart"></div>


							</div>
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




	</div>
	<!--  end of row -->



	<script>
		$('.ui.dropdown').dropdown();
		var top10Movie = new Array();
		var chartdata = new Array();
		var chartMovie = new Array();

		var colors = d3.scale.linear().domain(
				[ 0, chartdata.length * .33, chartdata.length * .66,
						chartdata.length ]).range(
				[ '#d6e9c6', '#bce8f1', '#faebcc', '#ebccd1' ])

		function drawBarChart(inChartData, inChartMovie) {
			//set up barchart here **************************************************************************
			//height = height of svg
			//width = width of svg
			//barWidth a single numeric value holding the width of each bar
			//barOffset a single numeric value holding the space between bars
			var margin = {
				top : 30,
				right : 10,
				bottom : 30,
				left : 50
			}
			var height = 400 - margin.top - margin.bottom, width = 1050
					- margin.left - margin.right, barWidth = 40, barOffset = 20;
			console.log('changed made');
			//linear and ordinal scale in d3 help to scale barchart properly.
			// making barchart more 'presentable' where it will make use of the spaces more efficiently with mathematical calculation etc...
			var yScale = d3.scale.linear().domain([ 0, d3.max(inChartData) ])
					.range([ 0, height ])
			//scale horizontally, so that if array happen to be double.the bar will not go off the chart
			//var xScale = d3.scale.ordinal().domain(test)   

			var xScale = d3.scale.ordinal().domain(
					d3.range(0, inChartData.length))

			//.rangeBands is related to padding between bars and outer padding
			.rangeBands([ 0, width ])
			
			
			d3.select('svg').remove();
			
			
			var d3BarChart = d3.select('#bar-chart').append('svg').attr(
					'width', width + margin.left + margin.right).attr('height',
					height + margin.top + margin.bottom).style('background',
					'#dff0d8').append('g').attr('transform',
					'translate(' + margin.left + ', ' + margin.top + ')')
					.selectAll('rect').data(inChartData).enter()	
					.append('rect')
					.style({
						//fill up barchart in green color
						'fill' : function(data, i) {
							return colors(i);
						},
						'stroke' : '#31708f',
						'stroke-width' : '5'
					}).attr('width', xScale.rangeBand()).attr('height', 0)
					.attr('x', function(data, i) {
						return xScale(i);
					}).attr('y', height)

			//transition
			d3BarChart.transition().attr('height', function(data) {
				return yScale(data);
			}).attr('y', function(data) {
				return height - yScale(data);
			}).delay(function(data, i) {
				return i * 20;
			}).duration(2000).ease('elastic');

			//labelling axis for x and y
			var verticalGuideScale = d3.scale.linear().domain(
			//domain() to set y axis start to end range
			[ 0, d3.max(inChartData) ]).range([ height, 0 ])
			//height = 340

			//insert d3.scale.linear() orient it to the left with 10 click
			var vAxis = d3.svg.axis().scale(verticalGuideScale).orient('left')
					.ticks(inChartData.length)

			var verticalGuide = d3.select('svg').append('g')
			vAxis(verticalGuide)
			verticalGuide.attr('transform', 'translate(' + margin.left + ', '
					+ margin.top + ')')
			verticalGuide.selectAll('path').style({
				fill : 'none',
				stroke : "#3c763d"
			})
			verticalGuide.selectAll('line').style({
				stroke : "#3c763d"
			})
			//***************************************************************************************************************
			var hAxis = d3.svg.axis().scale(xScale).orient('bottom').ticks(
					inChartData.size).tickFormat(function(d) {
				return inChartMovie[d];
			})

			var horizontalGuide = d3.select('svg').append('g')
			hAxis(horizontalGuide)

			horizontalGuide.attr(
					'transform',
					'translate(' + margin.left + ', ' + (height + margin.top)
							+ ')').attr("font-size", "11px")

			horizontalGuide.selectAll('path').style({
				fill : 'none',
				stroke : "#3c763d"
			})
			horizontalGuide.selectAll('line').style({
				stroke : "#3c763d"
			});
			//Set title for graph
			d3.select('svg').append('g').attr('transform',
					'translate(' + margin.left + ', ' + margin.top + ')')
					.append("text").attr("x", (width / 2)).attr("y",
							0 - (margin.top / 2)).attr("text-anchor", "middle")
					.style("font-size", "16px").style("text-decoration",
							"underline").text('Top 10 Movies Sale');
		}

		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/MovieServlet',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			data : {
				command : 'getTop10',
			}
		}).done(
				function(data, textStatus, jqXHR) {
					console.log('getTop10MonthlyAjax invoked');
					//data attribute expected = MovieID,TotalRevenue,Title,releasedate

					top10Movie = data;
					for (i = 0; i < data.length; i++) {
						//data[i] return objects of monthly data
						//populate data returned by servlet to top10MovieArray
						console.log('checking element position ' + i + ':'
								+ data[i]);
						//get jan to dec monthly top sale

						/*for (j = 0; j < top10Movie.length; j++) {
							console
									.log('revenue:'
											+ top10Movie[j].TotalRevenue);
							chartdata.push(top10Movie[j].TotalRevenue);
							chartMovie.push(top10Movie[j].Title);
						}*/
					}

					console.log('checking revenueDataChart:'
							+ JSON.stringify(chartdata));
					console.log('checking movieDataChart:'
							+ JSON.stringify(chartMovie));

				}).fail(function(data, jqXHR, textStatus, errorThrown) {

		})

		$('.dropdown').change(function() {
			//get value of selected option
			var valSelected = $(this).find('option:selected').val();

			//empty the area as it is global
			chartdata = [];
			chartMovie = [];

			//this variable contain top 10 movies for specific month
			var recentMonthArray = new Array();
			console.log("check valSelected October:" + top10Movie[9]);
			console.log("check valSelected:" + top10Movie[valSelected]);
			recentMonthArray = top10Movie[valSelected];
			for (j = 0; j < recentMonthArray.length; j++) {
				chartdata.push(recentMonthArray[j].TotalRevenue);
				chartMovie.push(recentMonthArray[j].Title);
			}

			//
			drawBarChart(chartdata, chartMovie);

		})
	</script>
</body>
</html>