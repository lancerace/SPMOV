<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="payMovie.jsp" method="post">
			  	   <script>
function myFunction(String) {
    selectedSeatNo.addElement(String);
    System.out.println(String);
}
</script>
<%
Vector selectedSeatNo = new Vector(1, 1);
String number[]=new String[20];
for (int i=0; i < 5; i++) {
    out.print("<td>");
    for(int x =0;x<8;x++){
    	String seatNo=i+""+x;
		String num= "123";
    	%>
    	
    	<button type="button" id="btn<%=seatNo%>" onClick="saveNum(<%=seatNo%>)"> <%=seatNo%></button>
			   
    	<% 
    }
    out.print("</td><br>");
}
String st="<script>document.writeln(str[0])</script>";
out.println("value="+st+"<br>");
%>
<td><input type="hidden" name="hiddenId" value=<%=selectedSeatNo%> ></td>
			   <td><input type="submit"  value=<%="Next" %> ></td>
</form>
<p id="demo"></p>
<script>
var str = [];
function saveNum(num){
	alert(num);
	str.push(num);
	alert(str[0]);
}
$
</script>
</body>
</html>


