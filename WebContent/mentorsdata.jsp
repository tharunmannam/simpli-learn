<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" type="text/css" href="mentordata_css.css">
<title>Student Data</title>
 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
 
    
<body style="background: #f9f9f9;">
	<div class="header">
	<div class="header-left">
		<a style="font-size: 40px;color:white;"><b>Simpli-Learn</b></a>
	</div>
  <div class="header-right"> 
  <a style="color:white;">Hello, Admin</a>
  <a href="admin.html" class="nav">Home</a>
  <a href="admincoursepage.html" class="nav">Courses</a>
  <a href="addstudent.html" class="nav">Add Student</a>
  <a href="studentsdata.jsp" class="nav">Students List</a>
  <a href="addmentor.jsp" class="nav">Add Mentor</a>
  <a href="mentorsdata.jsp" class="nav" style="background-color: red; border-radius: 10px;">Mentors List</a>
  <a href="Homepage.html" class="nav">Logout</a>
  </div>
</div>


<section class="main-content">
		<div class="container">
		<center><h1>Mentor Details</h1></center>
			<table class="table">
				<thead>
					<tr>
						<th>FIRST NAME</th>
        				<th>LAST NAME</th>
        				<th>COURSE</th>
        				<th>EMAIL</th>
        				<th>CONTACT</th>
        				<th>PASSWORD</th>
        				<th>UPDATE</th>
        				<th>DELETE</th>
					</tr>
				</thead>
				<tbody>
				<%
		try{
			Connection connection = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement = connection.createStatement();
			String sql ="SELECT * FROM mentorsinfo";
			
			ResultSet rs=statement.executeQuery(sql);
			while(rs.next()){
			%>
					<tr>
						<td>
							<div class="user-info">
								<div class="user-info__img">
									<img src="<%=rs.getString("imageurl") %>" alt="User Img">
								</div>
								<div class="user-info__basic">
									<h6 class="mb-0"><%=rs.getString("firstname") %></h6>
								</div>
							</div>
						</td>
						<td>
							<div class="user-info">
								<div class="user-info__basic">
									<h6 class="mb-0"><%=rs.getString("lastname") %></h6>
								</div>
							</div>
						</td>
						<td>
							<h6 class="mb-0"><%=rs.getString("course") %></h6>
						</td>
						<td>
							<h6 class="mb-0"><%=rs.getString("email") %></h6>
						</td>
						<td>
							<h6 class="mb-0"><%=rs.getString("phonenumber") %></h6>
							<a href="#!"><small>Contact</small></a>
						</td>
						<td>
							<h6 class="mb-0"><%=rs.getString("password") %></h6>
						</td>
						<td>
							<span class="btn btn-success"><a href="updatementor_admin.jsp?email=<%=rs.getString("email")%>" style="color:white;">Update</a></span>
						</td>
						<td>
							<span class="button button1"><a href="deletementor_admin.jsp?email=<%=rs.getString("email")%>" style="color:white;">Delete</a></span>
						</td>
					</tr>
					
					
					
					<%
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
				</tbody>
			</table>
		</div>
	</section>
	




</body>