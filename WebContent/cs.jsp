<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course Module</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	

	<!-- imran -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" type="text/css" href="videos.css">
  <!-- end -->
  <link rel="stylesheet" type="text/css" href="coursecontentcss.css">
  
  
  <!-- Discussion -->
  <link rel="stylesheet" type="text/css" href="discussioncss.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

   <script>
    function abrete() {
      const c = $(window).width()
      const p = c - 30;
      if ($(window).width() <= 750) {
        $("#dialog").dialog({ width: p, margin: 'auto' }, { position: { my: 'top', at: 'top+50' } });
      }
      else {
        $("#dialog").dialog({ width: 500, margin: 'auto' }, { position: { my: 'top', at: 'top+50' }, });
      }
    }
  </script>
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
          <a href="cs.jsp" class="nav" >Dashboard</a>
          <a href="mentors.jsp" class="nav">Mentors</a>
          <a href="mycourses.jsp" class="nav">My Courses</a>
          <a href="#" class="nav">Profile</a>
          <a href="Logout_servlet" class="nav">Logout</a>
      </div>
    </div>
	
	
	
	<!-- <button class="button button1">&laquo; Back</button> -->
	<div class="btns buttons ">
		<button class="tablink btn button btncolor1" onclick="openCity(event, 'contents')">Course Contents</button>
		<button class="tablink btn button" onclick="openCity(event, 'resources')">Resources</button>
		<button class="tablink btn button" onclick="openCity(event, 'discussions')">Discussion</button>
	</div>
	  
      
      <div id="dialog" title="Add Lecture" style="display:none;width: 400px;">
        <form action="" method="POST">
          <div class="form-group">
            <label>lecture Video File</label>
            <input type="file" class="form-control" name="video" accept="video/*">
          </div>
          <div class="form-group">
            <input type="text" class="form-control" name="title" placeholder="Title">
          </div>
          <div class="form-control">
            <textarea type="text" rows="5" name="description" class="form-control"
              placeholder="Add the Description..."></textarea>
          </div>
          <button class="btn btn-primary">Add</button>
        </form>
      </div>
	<div id="contents" class="container1 module">
			<h1 style="font-size:40px;margin-top: 25px;margin-left: 390px;">Ciber Security</h1>
			<button class="uploadbut"><a href="add_lecture.jsp"><i class="fa fa-plus" aria-hidden="true"></i>Upload lecture</a></button>
			<%try{
			Connection connection1 = null;
		    connection1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement1 = connection1.createStatement();
			String sql1 ="SELECT * FROM lect where subject='Ciber Security' ";
			ResultSet rs1=statement1.executeQuery(sql1);
			String code="";
			while(rs1.next()){
				code=rs1.getString(3);
        		if(code.length()<30)
        		{
        			code=code.replace("https://youtu.be/","");
        		}
        		else if(code.length()<45 && code.length()>30)
        		{
        			code=code.replace("https://www.youtube.com/watch?v=","");
        		}
        		else
        		{
        			code=code.substring(32,43);
        		}
        		System.out.println(code);
			%>
			<div class="box">
				<div class="row">
					<div class="col-md-4">
						<h1 class="display-5"><%=rs1.getString(2) %></h1>
						<p class="text-muted"><%=rs1.getString(4) %></p>
					</div>
					<div class="col-md-7 offset-md-1">
						<div class="video-block">
						<iframe width="100%" height="325px" src="https://www.youtube.com/embed/<%=code %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div>
					</div>
				</div>
			</div>
      <%}connection1.close();}
			catch(Exception e){
			System.out.println(e);
		} %>

      <br>
      <br>
      
	</div>

	<div id="resources" class="container1 module">
			<%try{
			Connection connection1 = null;
		    connection1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			Statement statement1 = connection1.createStatement();
			String sql1 ="SELECT * FROM resources where subject='Ciber Security' ";
			ResultSet rs1=statement1.executeQuery(sql1);
			while(rs1.next()){
			%>
			<div class="card1">
  			<div class="container2">
    			<center><h2><b><%=rs1.getString(2)%></b></h2></center>  
    			<div class="fileicon">
    				<a href="<%=rs1.getString(3)%>"><img src="box.svg" width="100%"></a>
    			</div>
  			</div>
			</div>
		<%}connection1.close();}
			catch(Exception e){
			System.out.println(e);
		} %>

	</div>

	<div id="discussions" class="container1 module">
		
		<br><br>
		<div class="col-md-10 discuss" style="margin: auto;border: 3px solid #000;">
            <div class="panel" id="chat">
                <div class="panel-body">
                    <div class="chats">
                    	<%
                    	try{
                        	Connection connection1 = null;
                        	PreparedStatement pstmt = null;
                			Class.forName("oracle.jdbc.driver.OracleDriver");
                		    connection1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
                		    pstmt = connection1.prepareStatement("select * from questions where subject=?");
                		    pstmt.setString(1,"Artificial Intelligence");
                		    ResultSet rs1 = pstmt.executeQuery();
                        	while(rs1.next()){
                        		int id=rs1.getInt(1);
                    		
                    	%>
                        <div class="chat chat-left" id="student">
                            <div class="chat-avatar">
                                <a class="avatar avatar-online" data-toggle="tooltip" href="#" data-placement="left"
                                    title="" data-original-title="Edward Fletcher">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="student">
                                    <i></i>
                                </a>
                            </div>
                            <div class="chat-body">
                                <div class="chat-content">
                                    <p style="color: #000;"><%= rs1.getString(2) %></p>
                                    <p><%= rs1.getString(3)%></p>
                                    <time class="chat-time"><%= rs1.getString(5) %></time>
                                    <button class="replybut"><a style="color: orange;" href="replyQues.jsp?qid=<%=rs1.getInt(1) %>">Reply</a></button>
                                </div>
                            </div>
                        </div>
	                        <% 
	                        try{
		                        Connection connection2 = null;
		                    	PreparedStatement pstmt1 = null;
		            		    connection2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
		            		    pstmt1 = connection2.prepareStatement("select * from quesreply where id=?");
		            		    pstmt1.setInt(1,id);
		            		    ResultSet rs2 = pstmt1.executeQuery();
		                        while(rs2.next()){
	                        %>
							<div class="chat" id="mentor">
	                            <div class="chat-avatar">
	                                <a class="avatar avatar-online" data-toggle="tooltip" href="#" data-placement="right"
	                                    title="" data-original-title="June Lane">
	                                    <img src="<%=imageurl%>" alt="mentor">
	                                    <i></i>
	                                </a>
	                            </div>
	                            <div class="chat-body">
	                                <div class="chat-content">
	                                    <p style="color: #000;"><%= rs2.getString(2) %> </p>
	                                    <p><%= rs2.getString(3) %></p>
	                                    <time class="chat-time" datetime="2015-07-01T11:37"><%= rs2.getString(4) %></time>
	                                </div>
	                            </div>
	                        </div>
	                        <%
	                        	}connection2.close();}
	                        	catch(Exception e)
	                        	{
	                        		System.out.println(e);
	                        	}
	                        %>
                    	<%}connection1.close();}
                    	catch(Exception e)
                    	{
                    		System.out.println(e);
                    	}
                    	%>
                    </div>
                </div>
        	</div>
        </div>
		
		
		
		
	</div>


	<script>
		document.getElementsByClassName("tablink")[0].click();
		function openCity(evt, each) {
		  var i, x, tablinks;
		  x = document.getElementsByClassName("module");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablink");
		  for (i = 0; i < x.length; i++) {
		    tablinks[i].classList.remove("btncolor1");
		  }
		  document.getElementById(each).style.display = "block";
		  evt.currentTarget.classList.add("btncolor1");
		}
	</script>
</body>
</html>