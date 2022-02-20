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
	String email=(String)request.getParameter("email");
	try
	{
		Connection connection = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
		PreparedStatement  statement= connection.prepareStatement("delete from mentorsinfo where email=?");
		statement.setString(1,email);
		int n=statement.executeUpdate();
		if(n>0) {
			response.sendRedirect("mentorsdata.jsp");
		}
		connection.close();
	}
	catch(Exception e)
	{		
		System.out.println(e);  
	}
	
	
	%>
</body>
</html>