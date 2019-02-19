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
	<link rel="stylesheet" type="text/css"
	href="dependencies/dist/semantic.min.css">
	
<script src="dependencies/jquery/jquery-1.11.3.js"></script>
<script src="dependencies/jquery/jquery-ui.js"></script>
<script src="dependencies/dist/semantic.min.js"></script>

</head>
<body>
<div class="ui floating labeled icon dropdown button">
  <i class="dropdown icon"></i>
  <span class="text">Menu</span>
  <div class="menu">
    <div class="item">
      <i class="left dropdown icon"></i>
      <span class="text">Left</span>
      <div class="left menu">
        <div class="item">1</div>
        <div class="item">2</div>
        <div class="item">3</div>
      </div>
    </div>
    <div class="item">
      <i class="dropdown icon"></i>
      <span class="text">Right</span>
      <div class="right menu">
        <div class="item">1</div>
        <div class="item">2</div>
        <div class="item">3</div>
      </div>
    </div>
  </div>
</div>


<script>
$('.ui.dropdown')
  .dropdown()
;

</script>
</body>
</html>