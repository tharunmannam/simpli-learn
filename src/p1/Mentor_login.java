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
import javax.servlet.http.HttpSession;

public class Mentor_login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(email);
		System.out.println(password);
		try
		{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
    		PreparedStatement pstmt=con.prepareStatement("select * from mentorsinfo where email=? and password=?");
    		pstmt.setString(1,email);
    		pstmt.setString(2,password);
 
    		int n=pstmt.executeUpdate();
    		if(n>0){	
        		Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
        		PreparedStatement pstmt1=con.prepareStatement("select course from mentorsinfo where email=? and password=?");
        		pstmt1.setString(1,email);
        		pstmt1.setString(2,password);
        		
        		ResultSet rs = pstmt.executeQuery();
    			while(rs.next()){
    				String user=email+','+rs.getString(3);
    				HttpSession session=request.getSession();  
        	        session.setAttribute("user",user);
    				if(rs.getString(3).equals("Artificial Intelligence")){
    					response.sendRedirect("./ai.jsp");
    				}
    				else if(rs.getString(3).equals("Data Science")){
    					response.sendRedirect("./ds.jsp");
    				}
    				else if(rs.getString(3).equals("Block chaining")){
    					response.sendRedirect("./bc.jsp");
    				}
    				else if(rs.getString(3).equals("Ciber Security")){
    					response.sendRedirect("./cs.jsp");
    				}
    				else if(rs.getString(3).equals("Machine Learning")){
    					response.sendRedirect("./ml.jsp");
    				}
    			}
    		}
			else {
				out.println("Login Failed");
				response.sendRedirect("./login.html");
			}				
		}
		catch(Exception e)
		{		
			System.out.println(e);  
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
