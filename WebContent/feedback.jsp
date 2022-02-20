<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Add Resource</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="coursecontent_css.css">
</head>
<body>
	<div class="header">
	<div class="header-left">
		<a style="font-size: 40px; color:white;"><b>Simpli-Learn</b></a>
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
      	  
          <a style="color:white;">Hello, <%=rs.getString("firstname") %> <%=rs.getString("lastname") %></a>
          
          <%
				}
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
          <a href="student.jsp" class="nav" >Dashboard</a>
          <a href="mentors.jsp" class="nav">Mentors</a>
          <a href="mycourses.jsp" class="nav">My Courses</a>
          <a href="#" class="nav">Profile</a>
          <a href="Logout_servlet" class="nav">Logout</a>
      </div>
    </div>
	
	<br>
	<br>
	<br>
	 
	 
	 <div class="container">
        <div>
            
                <h3 class="heading">Feedback</h3>
                <div class="main">
                    <div class="form-group">
                        <textarea rows="10" name="description" class="form-control" placeholder="Add the Description..." required></textarea>
                    </div>
                    <h4>Rate Our Course</h4>
                    <div class="form-group">
                        <span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
                    </div>
                    <button class="btn btn-primary button" type="submit">Save</button>
                    <span class="btn btn-light button" onclick="cancel()">Cancel</span>
                </div>
          
        </div>
    </div>
    
	<script>
    	function cancel()
    	{
    		window.history.back();
    	}
    </script>
</body>
</html>