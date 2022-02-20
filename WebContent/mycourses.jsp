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
<link rel="stylesheet" type="text/css" href="mycourses_css.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
          <a href="mentors.jsp" class="nav">Mentors</a>
          <a href="mycourses.jsp" class="nav" style="background-color: red; border-radius: 10px;">My Courses</a>
          <a href="studentprofile.jsp" class="nav">Profile</a>
          <a href="#" class="nav">Logout</a>
      </div>
    </div>
    <div class="title">
        <a><b>My Courses</b></a>
    </div>
    

  
	
	  
                <%
		try{
			Connection connection1 = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement1 = connection1.createStatement();
			String sql1 ="SELECT * FROM studentcourses";
			
			ResultSet rs1=statement1.executeQuery(sql1);%>
			<div class="row">
			<%
			while(rs1.next()){
				%>
			
           
				<%
				if(rs1.getString("studemail").equals(value) && rs1.getString("course").equals("Artificial Intelligence")){
			%>
			
			 <div class="column">
	 		<div class="card">
             <div class="card-header">
                <img src="https://hr.mytechmag.com/wp-content/uploads/sites/2/2021/03/artificial-intelligence-trends-2021-what-positive-changes-to-expect.jpg" alt="rover" />
            </div>
            <div class="container">
                <h3><b>Artificial Intelligence</b></h3> 
                <% 
                Connection connection2 = null;
                 connection2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
				 Statement statement2 = connection2.createStatement();
			     String sql2 ="SELECT * FROM mentorsinfo";
                 ResultSet rs2=statement2.executeQuery(sql2);
                 while(rs2.next()){
     				if(rs2.getString("course").equals("Artificial Intelligence")){
                 %>
                 
                <p><b>Mentor Name:</b> <%=rs2.getString("firstname") %> <%=rs2.getString("lastname") %> </p>
                <p><b>Mentor Email :</b> <%=rs2.getString("email") %> </p>
                <%}}connection2.close(); %>
                <p>Course Rating :
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span></p>
                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 1hr</p>
                <p>Course Fee : Free</p>
              	<button class="button1"><a href="unenrollcourse.jsp?cname=<%=rs1.getString(2)%>">&#10006; Un-Enroll</a></button>
              	</div>
				</div>
				</div>
                
			 <%
					}
				%>
				
				
				<%
				
				if(rs1.getString("studemail").equals(value) && rs1.getString("course").equals("Data Science")){
					%>
					
					<div class="column">
	 		<div class="card">
             <div class="card-header">
                <img src="https://d6vdma9166ldh.cloudfront.net/media/images/4594dcf8-a8c5-4fa7-a6d4-bab2c9081041.jpg" alt="rover" />
            </div>
            <div class="container">
					<h3><b>Data Science</b></h3>
					
					<% 
                Connection connection2 = null;
                 connection2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
				 Statement statement2 = connection2.createStatement();
			     String sql2 ="SELECT * FROM mentorsinfo";
                 ResultSet rs2=statement2.executeQuery(sql2);
                 while(rs2.next()){
     				if(rs2.getString("course").equals("Data Science")){
                 %>
                 
                <p><b>Mentor Name:</b> <%=rs2.getString("firstname") %> <%=rs2.getString("lastname") %> </p>
                <p><b>Mentor Email :</b> <%=rs2.getString("email") %> </p>
                <%}}connection2.close(); %>
	                <p>Course Rating :
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star"></span></p>
	                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 2hr</p>
	                <p>Course Fee : Free</p>
	              	<button class="button1"><a href="unenrollcourse.jsp?cname=<%=rs1.getString(2)%>">&#10006; Un-Enroll</a></button>
	              	</div>
	              </div>
	              </div>
	              	
	              	<%
	              }	 %>
	              
	              
	              <%
				 if(rs1.getString("studemail").equals(value) && rs1.getString("course").equals("Block chaining")){
	              %>
	              <div class="column">
	 		<div class="card">
             <div class="card-header">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5Uwx29-Xrm8p7dyKdPm-ze6vztLjAiNQ5TENhZXe7yhxJbQ3GUT9n2Hm7mLObYRJrLHI&usqp=CAU" alt="rover" />
            </div>
            <div class="container">
	              <h3><b>Block chaining</b></h3> 
	              
	              <% 
                Connection connection2 = null;
                 connection2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
				 Statement statement2 = connection2.createStatement();
			     String sql2 ="SELECT * FROM mentorsinfo";
                 ResultSet rs2=statement2.executeQuery(sql2);
                 while(rs2.next()){
     				if(rs2.getString("course").equals("Block chaining")){
                 %>
                 
                <p><b>Mentor Name:</b> <%=rs2.getString("firstname") %> <%=rs2.getString("lastname") %> </p>
                <p><b>Mentor Email :</b> <%=rs2.getString("email") %> </p>
                <%}}connection2.close(); %>
	   
	                <p>Course Rating :
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star"></span>
	                <span class="fa fa-star"></span></p>
	                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 3hr</p>
	                <p>Course Fee : Free</p>
	              	<button class="button1"><a href="unenrollcourse.jsp?cname=<%=rs1.getString(2)%>">&#10006; Un-Enroll</a></button>
	              	</div>
	              	</div>
	              	</div>
	              <%
	              }%>
	              
	             
	              
	              <%
				
				 if(rs1.getString("studemail").equals(value) && rs1.getString("course").equals("Ciber Security")){				
					
				%>
				 <div class="column">
	 		<div class="card">
             <div class="card-header">
                <img src="https://www.yokogawa.com/eu/blog/oil-gas/app/uploads/2020/04/116137226_s-1440x564_c.jpg" alt="rover" />
            </div>
            <div class="container">
				<h3><b>Ciber Security</b></h3> 
				
				<% 
                Connection connection2 = null;
                 connection2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
				 Statement statement2 = connection2.createStatement();
			     String sql2 ="SELECT * FROM mentorsinfo";
                 ResultSet rs2=statement2.executeQuery(sql2);
                 while(rs2.next()){
     				if(rs2.getString("course").equals("Ciber Security")){
                 %>
                 
                <p><b>Mentor Name:</b> <%=rs2.getString("firstname") %> <%=rs2.getString("lastname") %> </p>
                <p><b>Mentor Email :</b> <%=rs2.getString("email") %> </p>
                <%}}connection2.close(); %>
	                
	                <p>Course Rating :
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star"></span>
	                <span class="fa fa-star"></span></p>
	                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 2hr</p>
	                <p>Course Fee : Free</p>
	              	<button class="button1"><a href="unenrollcourse.jsp?cname=<%=rs1.getString(2)%>">&#10006; Un-Enroll</a></button>
	              	</div>
				</div>
				</div>
				
				
				
				<%} %>
				
				
				<%
				if (rs1.getString("studemail").equals(value) && rs1.getString("course").equals("Machine Learning"))
				{
				%>
				<div class="column">
	 		<div class="card">
             <div class="card-header">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUjI6_XX20wBGbX5DDZFAoQReuzBG-0SUPCSbU_QTfTHCySPJuAmOdFfP9zXvsDpbSd3U&usqp=CAU" alt="rover" />
            </div>
            <div class="container">
				
				<h3><b>Machine Learning</b></h3> 
				
				<% 
                Connection connection2 = null;
                 connection2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
				 Statement statement2 = connection2.createStatement();
			     String sql2 ="SELECT * FROM mentorsinfo";
                 ResultSet rs2=statement2.executeQuery(sql2);
                 while(rs2.next()){
     				if(rs2.getString("course").equals("Machine Learning")){
                 %>
                 
                <p><b>Mentor Name:</b> <%=rs2.getString("firstname") %> <%=rs2.getString("lastname") %> </p>
                <p><b>Mentor Email :</b> <%=rs2.getString("email") %> </p>
                <%}} connection2.close();%>
                
	               
	                <p>Course Rating :
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star checked"></span>
	                <span class="fa fa-star"></span>
	                <span class="fa fa-star"></span></p>
	                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 2hr</p>
	                <p>Course Fee : Free</p>
	              	<button class="button1"><a href="unenrollcourse.jsp?cname=<%=rs1.getString(2)%>">&#10006; Un-Enroll</a></button>
				
					</div>
				</div>
			</div>
				
           
				<%
				}
				%>
				
				<%
				}
			%>
			</div>
			<%
				connection1.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
			 
			
        
			
</body>
</html>