<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/jquery/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/jquery/jquery-ui.theme.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="dependencies/style.css" />

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
<script src="dependencies/d3/d3.min.js"></script>

</head>
<body>

	<h2>Trying d3.js Bar-char...</h2>
	<div id="bar-chart"></div>

	<script>
		var top10Movie = new Array();
		var chartdata = new Array();
		var chartMovie = new Array();
		//24 element
		//var chartdata1 = [ 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ];
		function top10MovieData(inMovieID, inTotalRevenue, inTitle,
				inReleaseDate, inDuration, inLanguageID) {
			this.mMovieID = inMovieID;
			this.TotalRevenue = inTotalRevenue;
			this.mTitle = inTitle;
			this.mReleaseDate = inReleaseDate;
		}

		var colors = d3.scale.linear().domain(
				[ 0, chartdata.length * .33, chartdata.length * .66,
						chartdata.length ]).range(
				[ '#d6e9c6', '#bce8f1', '#faebcc', '#ebccd1' ])

		$
				.ajax(
						{
							type : 'POST',
							url : '${pageContext.request.contextPath}/MovieServlet',
							contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
							dataType : 'json',
							data : {
								command : 'getTop10'
							}
						})
				.done(
						function(data, textStatus, jqXHR) {
							console.log('getTop10MonthlyAjax invoked');
							//data attribute expected = MovieID,TotalRevenue,Title,releasedate
							for (i = 0; i < data.length; i++) {
								//data[i] return objects of monthly data
								//populate data returned by servlet to top10MovieArray
								console.log('checking element position ' + i
										+ ':' + data[i]);
								top10Movie = data[i];
								for (j = 0; j < top10Movie.length; j++) {
									console.log('revenue:'
											+ top10Movie[j].TotalRevenue);
									chartdata.push(top10Movie[j].TotalRevenue);
									chartMovie.push(top10Movie[j].Title);

								}
							}
							console.log('checking revenueDataChart:'
									+ JSON.stringify(chartdata));
							console.log('checking movieDataChart:'
									+ JSON.stringify(chartMovie));

							//set up barchart here **************************************************************************

							//  height = height of svg
							// width = width of svg
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
							var yScale = d3.scale.linear().domain(
									[ 0, d3.max(chartdata) ]).range(
									[ 0, height ])
							//scale horizontally, so that if array happen to be double.the bar will not go off the chart
							//var xScale = d3.scale.ordinal().domain(test)   

							var xScale = d3.scale.ordinal().domain(
									d3.range(0, chartdata.length))

							//.rangeBands is related to padding between bars and outer padding
							.rangeBands([ 0, width ])

							var d3BarChart = d3.select('#bar-chart').append(
									'svg').attr('width',
									width + margin.left + margin.right).attr(
									'height',
									height + margin.top + margin.bottom).style(
									'background', '#dff0d8').append('g').attr(
									'transform',
									'translate(' + margin.left + ', '
											+ margin.top + ')')

							.selectAll('rect').data(chartdata).enter().append(
									'rect').style({
								//fill up barchart in green color
								'fill' : function(data, i) {
									return colors(i);
								},
								'stroke' : '#31708f',
								'stroke-width' : '5'
							}).attr('width', xScale.rangeBand()).attr('height',
									0).attr('x', function(data, i) {
								return xScale(i);
							}).attr('y', height)

							//transition
							d3BarChart.transition().attr('height',
									function(data) {
										return yScale(data);
									}).attr('y', function(data) {
								return height - yScale(data);
							}).delay(function(data, i) {
								return i * 20;
							}).duration(2000).ease('elastic');

							//labelling axis for x and y
							var verticalGuideScale = d3.scale.linear().domain(
							//domain() to set y axis start to end range
							[ 0, d3.max(chartdata) ]).range([ height, 0 ])
							//height = 340

							//insert d3.scale.linear() orient it to the left with 10 click
							var vAxis = d3.svg.axis().scale(verticalGuideScale)
									.orient('left').ticks(chartdata.length)

							var verticalGuide = d3.select('svg').append('g')

							vAxis(verticalGuide)
							verticalGuide.attr('transform', 'translate('
									+ margin.left + ', ' + margin.top + ')')
							verticalGuide.selectAll('path').style({
								fill : 'none',
								stroke : "#3c763d"
							})
							verticalGuide.selectAll('line').style({
								stroke : "#3c763d"
							})
							//***************************************************************************************************************
							var hAxis = d3.svg.axis().scale(xScale).orient(
									'bottom').ticks(chartdata.size).tickFormat(
									function(d) {
										return chartMovie[d];
									})

							var horizontalGuide = d3.select('svg').append('g')
							hAxis(horizontalGuide)

							horizontalGuide.attr(
									'transform',
									'translate(' + margin.left + ', '
											+ (height + margin.top) + ')')
									.attr("font-size", "11px")

							horizontalGuide.selectAll('path').style({
								fill : 'none',
								stroke : "#3c763d"
							})
							horizontalGuide.selectAll('line').style({
								stroke : "#3c763d"
							});

							//Set title for graph
							d3.select('svg').append('g').attr(
									'transform',
									'translate(' + margin.left + ', '
											+ margin.top + ')').append("text")
									.attr("x", (width / 2)).attr("y",
											0 - (margin.top / 2)).attr(
											"text-anchor", "middle").style(
											"font-size", "16px").style(
											"text-decoration", "underline")
									.text('afafaf')

						}).fail(function(data, jqXHR, textStatus, errorThrown) {

				})
	</script>
</body>
</html>