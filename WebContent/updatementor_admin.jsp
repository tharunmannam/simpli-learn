<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="studprofilecss.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="header">
	<div class="header-left">
		<a style="font-size: 40px;color:white;"><b>Simply-Learn</b></a>
	</div>
  <div class="header-right"> 
  <a style="color:white;">Hello, Admin</a>
  <a href="admin.html" class="nav">Home</a>
  <a href="admincoursepage.html" class="nav">Courses</a>
  <a href="addstudent.html" class="nav">Add Student</a>
  <a href="studentsdata.jsp" class="nav" style="background-color: red; border-radius: 10px;">Students List</a>
  <a href="addmentor.jsp" class="nav">Add Mentor</a>
  <a href="mentorsdata.jsp" class="nav">Mentors List</a>
  <a href="home.jsp" class="nav">Logout</a>
  </div>
</div>

<% 
			String email=(String)request.getParameter("email");
	      	String course="";
	        String imageurl="";
	        String firstname="";
	        String lastname="";
	        String password="";
	        try{
	    		Connection connection1 = null;
	    		Class.forName("oracle.jdbc.driver.OracleDriver");
	    	    connection1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
	    		Statement statement1 = connection1.createStatement();
	    		String sql1 ="SELECT * FROM mentorsinfo";
	    		
	    		ResultSet rs1=statement1.executeQuery(sql1);
	    		while(rs1.next()){
	    			if(rs1.getString("email").equals(email)){
	    				firstname=rs1.getString("firstname");
	    				lastname=rs1.getString("lastname");
	    				imageurl=rs1.getString("imageurl");
	    				password=rs1.getString("password");
	    			}
	    		}
	    		connection1.close();
	    		} catch (Exception e) {
	    		e.printStackTrace();
	    		}
	        
		  %>
			<section class="py-5 my-5">
		<div class="container">
			<h1 class="mb-5">My Profile</h1>
			<div class="bg-white shadow rounded-lg d-block d-sm-flex">
				<div class="profile-tab-nav border-right">
					<div class="p-4">
						<div class="img-circle text-center mb-3">
							<img src="<%=imageurl%>" alt="Image" class="shadow">
						</div>
						<h4 class="text-center"><%=firstname+" "+lastname%></h4>
						<center><p>Mentor</p></center>
					</div>
					<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link active" id="account-tab" data-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true">
							<i class="fa fa-home text-center mr-1"></i> 
							Account
						</a>
						<a class="nav-link" id="password-tab" data-toggle="pill" href="#password" role="tab" aria-controls="password" aria-selected="false">
							<i class="fa fa-key text-center mr-1"></i> 
							Password
						</a>
					</div>
				</div>
			<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
					<form action="./updatementor_admin1.jsp" method="post">
						<h3 class="mb-4">General Information</h3>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
								  	<label>First Name</label>
								  	<input type="text" class="form-control" name="firstname" value="<%=firstname%>">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Last Name</label>
								  	<input type="text" class="form-control" name="lastname" value="<%=lastname%>">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Email</label>
								  	<input type="text" class="form-control" name="email" value="<%=email%>" disabled>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Imageurl</label>
								  	<input type="text" class="form-control" name="imageurl" value="<%=imageurl%>">
								</div>
							</div>
						</div>
						<div>
							<button class="btn btn-primary">Update</button>
						</div>
					</form>
					</div>
					<div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
					<form action="./updatementor_admin2.jsp" method="post">
						<h3 class="mb-4">Password Settings</h3>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Old password</label>
								  	<input type="password" class="form-control" name="oldpassword">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
								  	<label>New password</label>
								  	<input type="password" class="form-control" name="newpassword">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Confirm new password</label>
								  	<input type="password" class="form-control">
								</div>
							</div>
						</div>
						<div>
							<button class="btn btn-primary" type="submit">Update</button>
							<!-- <button class="btn btn-light">Cancel</button> -->
						</div>
					</form>
					</div>

				</div>
			</div>
		</div>
	</section>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>