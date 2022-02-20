<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mentor Students</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="mentorstudents_css.css"> 


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background: #f9f9f9;">
	<% 
	session=request.getSession(false); 
	String user=(String)session.getAttribute("user");
	String[] arrOfStr=user.split(",",2);
	String email="";
	String course="";
    email=arrOfStr[0];
    course=arrOfStr[1];
	%>
	<div class="header">
	<div class="header-left">
		<a style="font-size: 40px; color:white;"><b>Simpli-Learn</b></a>
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
      	  
          <a style="color:white;">Hello, <%=rs.getString("firstname") %> <%=rs.getString("lastname") %></a>
          
          <%
				}
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
          <a href="ai.jsp" class="nav">Dashboard</a>
          <a href="mentorstudents.jsp" class="nav" style="background-color: red; border-radius: 10px;">StudentList</a>
          <a href="mentorprofile.jsp" class="nav">Profile</a>
          <a href="Logout_servlet" class="nav">Logout</a>
      </div>
    </div>
    <br><br><br>
	<center><h1>Student Details <i style="font-size:40px" class="fa">&#xf007;</i></h1></center>
	<section class="main-content">
		<div class="container">
			<table class="table">
				<thead>
					<tr>
						<th>FIRST NAME</th>
        				<th>LAST NAME</th>
        				<th>EMAIL</th>
        				<th>COURSE</th>
					</tr>
				</thead>
				<tbody>
				<%
		try{
			Connection connection2 = null;
			PreparedStatement pstmt = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    connection2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
		    pstmt=connection2.prepareStatement("select * from studentcourses where course=?");
			pstmt.setString(1,course);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
			%>
					<tr>
						
						<% 
						try{
							Connection connection1 = null;
							PreparedStatement pstmt1 = null;
							Class.forName("oracle.jdbc.driver.OracleDriver");
		    				connection1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");		
							pstmt1=connection1.prepareStatement("select * from studentsinfo where email=?");
							pstmt1.setString(1,rs.getString(1));
							ResultSet rs1=pstmt1.executeQuery();
							while(rs1.next()){
						%>
						<td>
							<div class="user-info">
								<div class="user-info__basic">
									<h6 class="mb-0"><%=rs1.getString("firstname") %></h6>
								</div>
							</div>
						</td>
						<td>
							<div class="user-info">
								<div class="user-info__basic">
									<h6 class="mb-0"><%=rs1.getString("lastname") %></h6>
								</div>
							</div>
						</td>
						<td>
							<h6 class="mb-0"><i style="font-size:20px" class="fa">&#xf0e0;</i> <%=rs.getString("studemail") %></h6>
						</td>
						<td>
							<h6 class="mb-0"><%=course%></h6>
						</td>
						
					</tr>
					<%
							}
							connection1.close();
						}
						catch (Exception e) {
							e.printStackTrace();
						}
			}
			connection2.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>