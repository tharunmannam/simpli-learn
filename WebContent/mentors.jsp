<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student</title>
<link rel="stylesheet" type="text/css" href="mentors_css.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="header">
	<div class="header-left">
		<a style="font-size: 40px;"><b>Simpli-Learn</b></a>
	</div>
      <div class="header-right"> 
      	  <% 
				session=request.getSession(false);  
    			String value=(String)session.getAttribute("email");  
		  %>
      	  <%
		try{
			Connection connection = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement = connection.createStatement();
			String sql ="SELECT * FROM studentsinfo";
			
			ResultSet rs=statement.executeQuery(sql);
			while(rs.next()){
				if(rs.getString("email").equals(value)){
			%>
      	  
          <a>Hello, <%=rs.getString("firstname") %> <%=rs.getString("lastname") %></a>
          
          <%
				}
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
          <a href="student.jsp" class="nav">Dashboard</a>
          <a href="mentors.jsp" class="nav" style="background-color: red; border-radius: 10px;">Mentors</a>
          <a href="mycourses.jsp" class="nav">My Courses</a>
          <a href="studentprofile.jsp" class="nav">Profile</a>
          <a href="Logout_servlet" class="nav">Logout</a>
      </div>
    </div>
    
    <div class="title1">
	<a><b>Our Mentors</b></a>
</div>
<%
	try{
		Connection connection1 = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
	    connection1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
		Statement statement1 = connection1.createStatement();
		String sql1 ="SELECT * FROM mentorsinfo";
		
		ResultSet rs1=statement1.executeQuery(sql1);
		while(rs1.next()){%>
		  
	  		<div id="container">	
				<div class="product-details">
					<h1><%=rs1.getString("firstname")%>  <%=rs1.getString("lastname")%> </h1><br>
					<a><%=rs1.getString("course")%></a><br><br>
					<a><i style="font-size:20px" class="fa">&#xf0e0;</i> <%=rs1.getString("email")%> </a><br><br>
					<a><i style="font-size:24px" class="fa">&#xf095;</i>  <%=rs1.getString("phonenumber")%> </a><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#!"><small>Contact</small></a>
					
				
				</div>	
				<div class="product-image">
					<img src="<%=rs1.getString("imageurl")%>" alt="">
				</div>
			</div>
	 
	  <%
		}
		connection1.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
	  %>    
    
</body>
</html>