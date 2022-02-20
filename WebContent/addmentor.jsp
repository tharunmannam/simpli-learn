<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="addmentorcss.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>Mentor Registration</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<body>
	<div class="header">
	<div class="header-left">
		<a style="font-size: 40px;color:white;"><b>Simpli-Learn</b></a>
	</div>
  <div class="header-right"> 
  <a>Hello, Admin</a>
  <a href="admin.html" class="nav">Home</a>
  <a href="admincoursepage.html" class="nav">Courses</a>
  <a href="addstudent.html" class="nav">Add Student</a>
  <a href="studentsdata.jsp" class="nav">Students List</a>
  <a href="addmentor.jsp" class="nav" style="background-color: red; border-radius: 10px;">Add Mentor</a>
  <a href="mentorsdata.jsp" class="nav">Mentors List</a>
  <a href="home.jsp" class="nav">Logout</a>
  </div>

</div>
	

        <div class="signup-form">
    <form action="mentorregister" method="post">
        <h2>Mentor Registration</h2>
        <div class="form-group">
            <div class="row">
                <div class="col"><input type="text" class="form-control" name="first_name" placeholder="First Name" required="required"></div>
                <div class="col"><input type="text" class="form-control" name="last_name" placeholder="Last Name" required="required"></div>
            </div>          
        </div>

      <select class="form-control" id="sel1" name="course">
        <option>Select course</option>
        
        <%
		try{
			Connection connection = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement = connection.createStatement();
			String sql ="SELECT * FROM subjects";
			
			ResultSet rs=statement.executeQuery(sql);
			while(rs.next()){
			%>
			
	       	<option><%=rs.getString("subname") %></option>
		   <%
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
	    </select><br>
        <div class="form-group">
            <input type="email" class="form-control" name="email" placeholder="Email" required="required">
        </div>
        <div class="form-group">
            <input type="number" class="form-control" name="phonenumber" placeholder="Phone Number" required="required">
        </div>
         <div class="form-group">
            <input type="text" class="form-control" name="imageurl" placeholder="Image url" required="required">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>   
        <div class="form-group">
            <label class="form-check-label"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">Register Now</button>
        </div>
    </form>
</div>
</body>