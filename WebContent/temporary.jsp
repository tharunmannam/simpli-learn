<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
	session=request.getSession(false);  
    String value=(String)session.getAttribute("email");  
    out.print(value);  
 
	%>
</body>
</html>