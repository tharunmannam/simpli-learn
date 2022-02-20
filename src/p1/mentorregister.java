package p1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class mentorregister extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter(); 
		String firstname=request.getParameter("first_name");
		String lastname=request.getParameter("last_name");
		String course=request.getParameter("course");
		String Email=request.getParameter("email");
		String phonenumber=(String)request.getParameter("phonenumber");
		String imageurl=request.getParameter("imageurl");
		String password=request.getParameter("password");
		System.out.println("--------------------------xxxxxxxx---------");
		System.out.println(firstname);
		System.out.println(lastname);
		System.out.println(course);
		System.out.println(Email);
		System.out.println(phonenumber);
		System.out.println(imageurl);
		System.out.println(password);
		try
		{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","tharun");
    		
    		
    			PreparedStatement pstmt=con.prepareStatement("insert into mentorsinfo values(?,?,?,?,?,?,?)");
    			
    			pstmt.setString(1,firstname);
    			pstmt.setString(2,lastname);
    			pstmt.setString(3,course);
    			pstmt.setString(4,Email);
    			pstmt.setString(5,phonenumber);
    			pstmt.setString(6,imageurl);
    			pstmt.setString(7,password);
    			
    			int n=pstmt.executeUpdate();
    			if(n>0)
    			{
    				response.sendRedirect("./success.html");
    			}
    			else {
    				response.sendRedirect("./fail.html");
    			}
			
		}
		catch(Exception e)
		{		
			System.out.println(e);  
			System.out.println("hirdgreh....................");  
		}
		out.close();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
