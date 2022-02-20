<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Simpli-learn</title>
<link rel="stylesheet" type="text/css" href="homecss.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    
	<link rel="stylesheet" type="text/css" href="homecss.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script>
	$(document).ready(function(){
	  $("a").on('click', function(event) {
	    if (this.hash !== "") {
	      event.preventDefault();
	      var hash = this.hash;
	      $('html, body').animate({
	        scrollTop: $(hash).offset().top
	      }, 800, function(){
	        window.location.hash = hash;
	      });
	    }
	  });
	});
	</script>
	<style type="text/css">
		
		body, html, .main {
  height: 100%;
  background-size: cover;
}

section {
  min-height: 100%;
}
header{
color:white;
}
	</style>
</head>
<body>
	<header>
		<a style="font-size:40px;"><i class="fa fa-book" style="font-size:70px;color:white;"></i>Simpli-Learn</a>
		<div class="header-right">
			<a href="home.jsp" class="nav" style="background-color: orange;border-radius: 5px;left:10%;">&nbsp;&nbsp;Home</a>
			<a href="admin_login.html" class="nav">&nbsp;&nbsp;Admin</a>
			<a href="#section2" class="nav">&nbsp;&nbsp;Mentors</a>
			<a href="#section3" class="nav">&nbsp;&nbsp;Courses</a>
			<a href="#section4" class="nav">&nbsp;&nbsp;Contact Us</a>
			<a href="#section5" class="nav">&nbsp;&nbsp;About</a>
		</div>
		<div class="title">
			<h1>Simpli Learn</h1>
			<a style="margin-top:-35px;margin-left:50px;">Take the world's best courses and get certified!!</a>
		</div>
		<div class="button">
			<a href="#" class="btn1" style="background-color: Orange;color: #000;">GET STARTED</a>
			<a href="Login.html" class="btn2">LOGIN</a>
		</div>
	</header>
	
	

<div class="main" id="section3">
  <section style="background-color:#f9f9f9;">
	<br><br><br>
  	<center><p class="title1"><b>Courses</b></p></center>	
  		<div class="text">
  			<br><br>
  			<!-- <center>
  			<a>Top instructors from around the world teach millions of students on Simplilearn. We provide the tools and skills to teach what you love. Our Instructors are passionate about sharing their knowledge and helping students. They're experts who stay active in their fields in order to deliver up-to-date content.</a>
  			</center> -->
  		</div>
  		<br>
  		<div class="row">
        	<div class="column">
            	<div class="card">
                	<div class="card-header">
                		<img src="https://hr.mytechmag.com/wp-content/uploads/sites/2/2021/03/artificial-intelligence-trends-2021-what-positive-changes-to-expect.jpg" alt="rover" />
            		</div>
            		<div class="container"> 
                		<h3><b>Artificial Intelligence</b></h3>
                		<h5>Course Mentor</h5>
                		<p>Course Rating :
                		<span class="fa fa-star checked"></span>
                		<span class="fa fa-star checked"></span>
                		<span class="fa fa-star checked"></span>
                		<span class="fa fa-star"></span>
                		<span class="fa fa-star"></span></p>
                		<p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 1hr</p>
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
                		<h5>Course Mentor</h5>
                		<p>Course Rating :
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span></p>
                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 2hr</p>
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
                		<h5>Course Mentor</h5> 
                		<p>Course Rating :
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star "></span>
                <span class="fa fa-star"></span></p>
                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 3hr</p>
                	</div>
            	</div>
            </div>

            <div class="column">
            	<div class="card">
                	<div class="card-header">
                		<img src="https://www.yokogawa.com/eu/blog/oil-gas/app/uploads/2020/04/116137226_s-1440x564_c.jpg" alt="rover" />
            		</div>
            		<div class="container"> 
                		<h3><b>Ciber Security</b></h3>
                		<h5>Course Mentor</h5>
                		<p>Course Rating :
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star "></span>
                <span class="fa fa-star"></span></p>
                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 2hr</p>
                	</div>
            	</div>
            </div>

            <div class="column">
            	<div class="card">
                	<div class="card-header">
                		<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUjI6_XX20wBGbX5DDZFAoQReuzBG-0SUPCSbU_QTfTHCySPJuAmOdFfP9zXvsDpbSd3U&usqp=CAU" alt="rover" />
            		</div>
            		<div class="container"> 
                		<h3><b>Machine Learning</b></h3>
                		<h5>Course Mentor</h5>
                		 <p>Course Rating :
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span></p>
                <p><i class="fa fa-clock-o"></i><span>    </span>Course Duration : 2hr</p>
                	</div>
            	</div>
            </div>



        </div>




  </section>
</div>
  <div class="main">
  <section>
  		<div class="row">
        	<div class="column">
            	<img src="https://s.udemycdn.com/teaching/support-1-v2.jpg">
            </div>
            <div class="column" style="margin-left: 400px;font-size: 20px;margin-right: 70px;">
            	<p style="font-size:30px;"><b>You wont have to do it alone</b></p>
            	<p>Our Instructor Support Team is here to answer your questions and review your test video, while our Teaching Center gives you plenty of resources to help you through the process. Plus, get the support of experienced instructors in our online community.</p>
            	
            </div>
            <div class="column">
            	<img src="https://s.udemycdn.com/teaching/support-2-v2.jpg">
            </div>
        </div>
        <br>
        <br>
        <center><p style="font-size:30px;"><b>So many reasons to start</b></p></center>
         <div class="row">
         	<div class="column">
         		<img src="https://s.udemycdn.com/teaching/value-prop-inspire-v2.svg">
         	</div>
         	<div class="column">
         		<p><b>Inspire learners : </b>Teach what you know and help learners explore their interests, gain new skills, and advance their careers.</p>
         	</div>

         	<div class="column" style="margin-left: 300px;">
         		<img src="https://s.udemycdn.com/teaching/value-prop-be-yourself-v2.svg">
         	</div>
         	<div class="column">
         		<p><b>Teach your way : </b>Publish the course you want, in the way you want, and always have of control your own content.</p>
         	</div>

         </div>   
  </section>
</div>

<div class="main" id="section2">
  <section style="background-color:#f9f9f9;">
  		<br>
  		<center><p class="title1"><b>Mentors</b></p></center>	
  		<div class="text">
  			<center>
  			<a>Top instructors from around the world teach millions of students on Simplilearn. We provide the tools and skills to teach what you love. Our Instructors are passionate about sharing their knowledge and helping students. They're experts who stay active in their fields in order to deliver up-to-date content.</a>
  			</center>
  		</div>
  		<br>
  		<div class="row">
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
 
       
        	<div class="column">
            	<div class="card">
                	<div class="card-header">
                		<img src="<%=rs.getString(6)%>" alt="rover" />
            		</div>
            		<div class="container"> 
                		<h3><b><%= rs.getString(1)+rs.getString(2)%></b></h3>
                		<h5><%=rs.getString(3) %></h5> <br>
                		<p><i style="font-size:20px" class="fa">&#xf0e0;</i><%=rs.getString(4)%> </p><br>
                		<p><i style="font-size:24px" class="fa">&#xf095;</i> <%=rs.getString(5)%></p>
                		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#!"><small>Contact</small></a>
                	</div>
            	</div>
            </div>
            
               
          <%
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
        </div>



  </section>
</div>


<div class="main" id="section4">
  <section style="background-color:#f9f9f9;">
  		<br>
  		<center><p class="title1"><b>Contact Us</b></p></center>	
  		
            <div class="container1">
                <div class="contact-parent">
                    <div class="contact-child child1">
                        <p>
                            <i class="fas fa-map-marker-alt"></i> Address <br />
                            <span> Ash Lane 110
                                <br />
                                London, UK
                            </span>
                        </p>

                        <p>
                            <i class="fas fa-phone-alt"></i> Let's Talk <br />
                            <span> 0787878787</span>
                        </p>

                        <p>
                            <i class=" far fa-envelope"></i> General Support <br />
                            <span>contact@example.com</span>
                        </p>
                    </div>

                    <div class="contact-child child2">
                        <div class="inside-contact">
                            <h2>Contact Us</h2>
                            <h3>
                               <span id="confirm">
                            </h3>

                            <p>Name *</p>
                            <input id="txt_name" type="text" Required="required">

                            <p>Email *</p>
                            <input id="txt_email" type="text" Required="required">

                            <p>Phone *</p>
                            <input id="txt_phone" type="text" Required="required">

                            <p>Message *</p>
                            <textarea id="txt_message" rows="4" cols="20" Required="required" ></textarea>
                            
                            <input type="submit" id="btn_send" value="SEND">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
           
        </div>
    </div>
    </div>

  </section>
</div>


<div class="main" id="section5">
  <section style="background-color:#f9f9f9;">
      <br>
      <center><p class="title1"><b>Our Team</b></p></center> 
      <center> <p class="text-center" data-aos="fade-up" data-aos-delay="200">We are very supportive team</p></center>
      <div id="team" class="section-100">
        <div class="container">
            <h1 class="text-center" data-aos="fade-up" data-aos-delay="100"><b>Our Team</b></h1>
            <p class="text-center" data-aos="fade-up" data-aos-delay="200">We are very supportive team</p>
            <br>
            <div class="row">
                <div class="col-lg-4 col-sm-6">
                    <div class="team-box" data-aos="fade-left" data-aos-delay="100">
                        <img src="https://images.vexels.com/media/users/3/128199/isolated/preview/b354bc4707224bd3d15b9ae36eca70c0-male-student-cartoon-by-vexels.png" alt="imran">
                        <div class="team-info">
                            <h4 class="text-muted">Tharun Chowdary</h4>
                            <p class="primary-color">Frontend Developer & Backend Developer</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="team-box" data-aos="fade-left" data-aos-delay="200">
                        <img src="https://static.vecteezy.com/system/resources/previews/002/471/040/non_2x/student-with-books-and-bag-character-cartoon-people-student-university-free-vector.jpg" alt="jurendra" width="400px" height="500px">
                        <div class="team-info">
                            <h4 class="text-muted">Satwika</h4>
                            <p class="primary-color">Frontend Developer</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="team-box" data-aos="fade-left" data-aos-delay="300">
                        <img src="https://as1.ftcdn.net/jpg/02/47/37/90/500_F_247379087_LvTXoDY3hSAI1dRfhhaMM7wbQgpm4S1G.jpg" alt="maneeswar">
                        <div class="team-info">
                            <h4 class="text-muted">Varun Kumar</h4>
                            <p class="primary-color">Frontend Developer</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
      
  </section>
</div>



<div class="footer-dark">
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-3 item">
                        <h3>Services</h3>
                        <ul>
                            <li><a href="#">Resources</a></li>
                            <li><a href="#">Technical</a></li>
                            <li><a href="#">Mentors</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3>About</h3>
                        <ul>
                            <li><a href="#">Company</a></li>
                            <li><a href="#">Team</a></li>
                            <li><a href="#">Careers</a></li>
                        </ul>
                    </div>
                   
                    <div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a></div>
                </div>
                <p class="copyright">Company Name © 2021</p>
            </div>
        </footer>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>