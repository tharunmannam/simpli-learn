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
<link rel="stylesheet" type="text/css" href="student_css.css">
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
          <a href="student.jsp" class="nav" style="background-color: red; border-radius: 10px;">Dashboard</a>
          <a href="mentors.jsp" class="nav">Mentors</a>
          <a href="mycourses.jsp" class="nav">My Courses</a>
          <a href="studentprofile.jsp" class="nav">Profile</a>
          <a href="Logout_servlet" class="nav">Logout</a>
      </div>
    </div>
    <div class="title">
        <a><b>Courses</b></a>
    </div>
    

    <div class="row">
        <div class="column">
            <div class="card">
                
                <div class="card-header">
                <img src="https://hr.mytechmag.com/wp-content/uploads/sites/2/2021/03/artificial-intelligence-trends-2021-what-positive-changes-to-expect.jpg" alt="rover" />
            </div>
            <div class="container"> 
                <h3><b>Artificial Intelligence</b></h3> 
                
                <%
		try{
			Connection connection1 = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement1 = connection1.createStatement();
			String sql1 ="SELECT * FROM mentorsinfo";
			
			ResultSet rs1=statement1.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getString("course").equals("Artificial Intelligence")){
			%>
                
                <p><b>Mentor Name:</b> <%=rs1.getString("firstname") %> <%=rs1.getString("lastname") %> </p>
                <p><b>Mentor Email :</b> <%=rs1.getString("email") %> </p>
			 <%
					}
				}
				connection1.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
                <p>Course Rating :
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span></p>
                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 1hr</p>
                
                <%
		try{
			Connection connection6 = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection6 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement1 = connection6.createStatement();
			String sql6 ="SELECT * FROM studentcourses";
			
			ResultSet rs6=statement1.executeQuery(sql6);
			int flag=0;
			while(rs6.next()){
				if(rs6.getString("course").equals("Artificial Intelligence")){
					flag=1;
			%>
              			<button class="button1">&#10004;Enrolled</button>
              			<button class="button2"><a href="ai_coursecontent.jsp">Get Started</a></button>
			 <%
					}
			}
			if (flag==0){
					%>
					<form action="ai_servlet" method="post">
                		<button class="button1">Enroll</button>
                		
                	</form> 	
					<% 
				}
				connection6.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
            
            </div>
            </div>
        </div>

        <div class="column">
            <div class="card">
                
                <div class="card-header">
                <img src="https://d6vdma9166ldh.cloudfront.net/media/images/4594dcf8-a8c5-4fa7-a6d4-bab2c9081041.jpg" alt="rover" />
            </div>
            <div class="container"> 
                <h3><b>Data Science</b></h3> 
                
                 <%
		try{
			Connection connection2 = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement2 = connection2.createStatement();
			String sql2 ="SELECT * FROM mentorsinfo";
			
			ResultSet rs2=statement2.executeQuery(sql2);
			while(rs2.next()){
				if(rs2.getString("course").equals("Data Science")){
			%>
                
                <p><b>Mentor Name:</b> <%=rs2.getString("firstname") %> <%=rs2.getString("lastname") %> </p>
                <p><b>Mentor Email :</b> <%=rs2.getString("email") %> </p>
			 <%
					}
				}
				connection2.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>

                <p>Course Rating :
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span></p>
                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 2hr</p>
                
                
                <%
		try{
			Connection connection7 = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection7 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement7 = connection7.createStatement();
			String sql7 ="SELECT * FROM studentcourses";
			
			ResultSet rs7=statement7.executeQuery(sql7);
			int flag=0;
			while(rs7.next()){
				if(rs7.getString("course").equals("Data Science")){
					flag=1;
			%>
              			<button class="button1">&#10004;Enrolled</button>
              			<button class="button2"><a href="ds_coursecontent.jsp">Get Started</a></button>
			 <%
					}
			}
			if (flag==0){
					%>
					<form action="ds_servlet" method="post">
                		<button class="button1">Enroll</button>
                	</form> 	
					<% 
				}
				connection7.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
                

            </div>


            </div>
        </div>

        <div class="column">
            <div class="card">
                
                <div class="card-header">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5Uwx29-Xrm8p7dyKdPm-ze6vztLjAiNQ5TENhZXe7yhxJbQ3GUT9n2Hm7mLObYRJrLHI&usqp=CAU" alt="rover" />
            </div>
            <div class="container"> 
                <h3><b>Block chaining</b></h3> 
                
                
                <%
		try{
			Connection connection3 = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection3 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement3 = connection3.createStatement();
			String sql3 ="SELECT * FROM mentorsinfo";
			
			ResultSet rs3=statement3.executeQuery(sql3);
			while(rs3.next()){
				if(rs3.getString("course").equals("Block chaining")){
			%>
                
                <p><b>Mentor Name:</b> <%=rs3.getString("firstname") %> <%=rs3.getString("lastname") %> </p>
                <p><b>Mentor Email :</b> <%=rs3.getString("email") %> </p>
			 <%
					}
				}
				connection3.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
                
                
           

                <p>Course Rating :
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star "></span>
                <span class="fa fa-star"></span></p>
                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 3hr</p>
                
                
                
                <%
		try{
			Connection connection8 = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection8 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement8 = connection8.createStatement();
			String sql8 ="SELECT * FROM studentcourses";
			
			ResultSet rs8=statement8.executeQuery(sql8);
			int flag=0;
			while(rs8.next()){
				if(rs8.getString("course").equals("Block chaining")){
					flag=1;
			%>
              			<button class="button1">&#10004;Enrolled</button>
              			<button class="button2"><a href="bc_coursecontent.jsp">Get Started</a></button>
			 <%
					}
			}
			if (flag==0){
					%>
					<form action="bc_servlet" method="post">
                		<button class="button1">Enroll</button>
                	</form> 	
                	
					<% 
				}
				connection8.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
              
            </div>


            </div>
        </div>


        <div class="column1">
            <div class="card">
                
                <div class="card-header">
                <img src="https://www.yokogawa.com/eu/blog/oil-gas/app/uploads/2020/04/116137226_s-1440x564_c.jpg" alt="rover" />
            </div>
            <div class="container"> 
                <h3><b>Ciber Security</b></h3> 
                
                <%
		try{
			Connection connection4 = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection4 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement4 = connection4.createStatement();
			String sql4 ="SELECT * FROM mentorsinfo";
			
			ResultSet rs4=statement4.executeQuery(sql4);
			while(rs4.next()){
				if(rs4.getString("course").equals("Ciber Security")){
			%>
                
                <p><b>Mentor Name:</b> <%=rs4.getString("firstname") %> <%=rs4.getString("lastname") %> </p>
                <p><b>Mentor Email :</b> <%=rs4.getString("email") %> </p>
			 <%
					}
				}
				connection4.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
                
        

                <p>Course Rating :
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star "></span>
                <span class="fa fa-star"></span></p>
                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 2hr</p>
                
                
                <%
		try{
			Connection connection9 = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection9 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement9 = connection9.createStatement();
			String sql9 ="SELECT * FROM studentcourses";
			
			ResultSet rs9=statement9.executeQuery(sql9);
			int flag=0;
			while(rs9.next()){
				if(rs9.getString("course").equals("Ciber Security")){
					flag=1;
			%>
              			<button class="button1">&#10004;Enrolled</button>
              			<button class="button2"><a href="cs_coursecontent.jsp">Get Started</a></button>
			 <%
					}
			}
			if (flag==0){
					%>
					<form action="cs_servlet" method="post">
                		<button class="button1">Enroll</button>
                	</form> 	
					<% 
				}
				connection9.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
                
                
            </div>


            </div>
        </div>


        <div class="column1">
            <div class="card">
                
                <div class="card-header">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUjI6_XX20wBGbX5DDZFAoQReuzBG-0SUPCSbU_QTfTHCySPJuAmOdFfP9zXvsDpbSd3U&usqp=CAU" alt="rover" />
            </div>
            <div class="container"> 
                <h3><b>Machine Learning</b></h3> 
                
                <%
		try{
			Connection connection5 = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection5 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement5 = connection5.createStatement();
			String sql5 ="SELECT * FROM mentorsinfo";
			
			ResultSet rs5=statement5.executeQuery(sql5);
			while(rs5.next()){
				if(rs5.getString("course").equals("Machine Learning")){
			%>
                
                <p><b>Mentor Name:</b> <%=rs5.getString("firstname") %> <%=rs5.getString("lastname") %> </p>
                <p><b>Mentor Email :</b> <%=rs5.getString("email") %> </p>
			 <%
					}
				}
				connection5.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
                
        
              

                <p>Course Rating :
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span></p>
                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 2hr</p>
                
                
                <%
		try{
			Connection connection10 = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection10 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement10 = connection10.createStatement();
			String sql10 ="SELECT * FROM studentcourses";
			
			ResultSet rs10=statement10.executeQuery(sql10);
			int flag=0;
			while(rs10.next()){
				if(rs10.getString("course").equals("Machine Learning")){
					flag=1;
			%>
              			<button class="button1">&#10004;Enrolled</button>
              			 <button class="button2"><a href="ml_coursecontent.jsp">Get Started</a></button>
			 <%
					}
			}
			if (flag==0){
					%>
					<form action="ml_servlet" method="post">
                		<button class="button1">Enroll</button>
                	</form> 	
					<% 
				}
				connection10.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
               
            </div>
            </div>
        </div>
    </div>
</body>
</html>