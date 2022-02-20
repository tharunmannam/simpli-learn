<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String email = request.getParameter("email");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=null;
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
		PreparedStatement pstmt=con.prepareStatement("update studentsinfo set firstname=?,lastname=? where email=?");
		pstmt.setString(1,firstname);
		pstmt.setString(2,lastname);
		pstmt.setString(3, email);
		int n=pstmt.executeUpdate();
		if(n>0){
			response.sendRedirect("./studentsdata.jsp");
		}
		else {
			response.sendRedirect("./studentsdata.jsp");
		}	
		con.close();
	}
	catch(Exception e)
	{		
		System.out.println(e);  
	}
	
	%>
</body>
</html>