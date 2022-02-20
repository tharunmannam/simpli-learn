<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%

	Connection connection2 = null;
	PreparedStatement pstmt1 = null;
	connection2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
	int qid=Integer.parseInt(request.getParameter("qid"));
	session.setAttribute("qid", qid);
	
	pstmt1 = connection2.prepareStatement("select * from questions where qid=?");
	pstmt1.setInt(1,qid);
	ResultSet rs1 = pstmt1.executeQuery();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Reply Question</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="quesreply.css">
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
          <a href="student.jsp" class="nav">Dashboard</a>
          <a href="mentorstudents.jsp" class="nav">StudentList</a>
          <a href="mentorprofile.jsp" class="nav">Profile</a>
          <a href="Logout_servlet" class="nav">Logout</a>
      </div>
    </div>
    <br><br><br>
    <div class="container">
        <div>
            <form class="addform" action="./replyques" method="POST">
                <h4 class="heading">Reply Question</h4>
                <div class="main">
                    <div class="form-group">
                      <% while(rs1.next()){ %>
                        <b>Question: </b><label><%=rs1.getString(3) %></label>
                        <%}connection2.close(); %>
                        <br><br>
                        <textarea name="reply" class="form-control" rows="5" placeholder="reply"></textarea>
                    </div>
                    <button class="btn btn-primary button" type="submit">Save</button>
                    <button class="btn btn-light button" onclick="cancel()" type="submit">Cancel</button>
                </div>
            </form>
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