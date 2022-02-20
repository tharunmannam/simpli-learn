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
      		String user=(String)session.getAttribute("user");
      		String[] arrOfStr=user.split(",",2);
      		String value="";
      		String course="";
         	value=arrOfStr[0];
          	course=arrOfStr[1];
          	String imageurl="";
		  %>
      	  <%
		try{
			Connection connection = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement = connection.createStatement();
			String sql ="SELECT * FROM mentorsinfo";
			
			ResultSet rs=statement.executeQuery(sql);
			while(rs.next()){
				if(rs.getString("email").equals(value)){
					imageurl=rs.getString("imageurl");
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
          <a href="student.jsp" class="nav" style="background-color: red; border-radius: 10px;">Dashboard</a>
          <a href="mentorstudents.jsp" class="nav">StudentList</a>
          <a href="mentorprofile.jsp" class="nav">Profile</a>
          <a href="Logout_servlet" class="nav">Logout</a>
      </div>
    </div>
	<br>
	<br>
	<br>
	 <form class="addform" action="./AddResourceServlet" method=post>
    <div class="container">
           
                <h3 class="heading">Add Resource</h3>
                <div class="main">
                	<div class="form-group">
                        <label>Topic name</label>
						<input type="text" class="form-control" name="title" placeholder="Topic Name" required>
                    </div>
                    <div class="form-group">
						<input type="text" class="form-control" name="link" placeholder="PDF Link" required>
                    </div>
                    <button class="btn btn-primary" type="submit">Save</button>
                    
                </div>
           
    </div>
     </form>
    
	<script>
    	function cancel()
    	{
    		window.history.back();
    	}
    </script>
</body>
</html>