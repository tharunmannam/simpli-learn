<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	session=request.getSession(false);  
	String email=(String)session.getAttribute("email");  
	String cname=(String)request.getParameter("cname");
	try
	{
		Connection connection = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
		PreparedStatement  statement= connection.prepareStatement("delete from studentcourses where studemail=? and course=?");
		statement.setString(1,email);
		statement.setString(2, cname);
		int n=statement.executeUpdate();
		if(n>0) {
			response.sendRedirect("mycourses.jsp");
		}
	}
	catch(Exception e)
	{		
		System.out.println(e);  
	}
	
	
	%>
</body>
</html>