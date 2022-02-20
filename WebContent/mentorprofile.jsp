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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="studprofilecss.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color:#f9f9f9;">
	<% 
	      	session=request.getSession(false); 
	      	String user=(String)session.getAttribute("user");
	      	String[] arrOfStr=user.split(",",2);
	      	String email="";
	      	String course="";
	        email=arrOfStr[0];
	        course=arrOfStr[1];
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
	<div class="header">
	<div class="header-left">
		<a style="font-size: 40px;"><b>Simpli-Learn</b></a>
	</div>
      <div class="header-right"> 
      	  <%
		try{
			Connection connection = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement = connection.createStatement();
			String sql ="SELECT * FROM mentorsinfo";
			
			ResultSet rs=statement.executeQuery(sql);
			while(rs.next()){
				if(rs.getString("email").equals(email)){
					
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
		<%
		String temp="";
		if(course.equals("Artificial Intelligence")){
			temp="ai";
		}
		else if(course.equals("Data Science")){
			temp="ds";
		}
		else if(course.equals("Block chaining")){
			temp="bc";
		}
		else if(course.equals("Ciber Security")){
			temp="cs";
		}
		else if(course.equals("Machine Learning")){
			temp="ml";
		}

		%>
           <a href="<%=temp%>.jsp" class="nav1">Dashboard</a>
          <a href="mentorstudents.jsp" class="nav1">StudentList</a>
          <a href="mentorprofile.jsp" class="nav1" style="background-color: red; border-radius: 10px;">Profile</a>
          <a href="Logout_servlet" class="nav1">Logout</a>
      </div>
    </div>
    
    
    
    
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
					<form action="./mentorprofile1.jsp" method="post">
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
					<form action="./mentorprofile2.jsp" method="post">
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