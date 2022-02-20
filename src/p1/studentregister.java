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

public class studentregister extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter(); 
		String firstname=request.getParameter("first_name");
		String lastname=request.getParameter("last_name");
		String Email=request.getParameter("email");
		String password=request.getParameter("password");
		System.out.println("--------------------------xxxxxxxx---------");
		System.out.println(firstname);
		System.out.println(lastname);
		System.out.println(Email);
		System.out.println(password);
		try
		{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		
    		Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","tharun");
    		PreparedStatement  pstmt1= con1.prepareStatement("select * from studentsinfo where email=?");
    		pstmt1.setString(1,Email);
    		
    		ResultSet rs1 = pstmt1.executeQuery();
//			System.out.println(rs1.next());
			boolean temp=false;
			 if(rs1.next()==temp) { 
				 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","tharun");
    			PreparedStatement pstmt=con.prepareStatement("insert into studentsinfo values(?,?,?,?)");
    			
    			pstmt.setString(1,firstname);
    			pstmt.setString(2,lastname);
    			pstmt.setString(3,Email);
    			pstmt.setString(4,password);
    			
    			int n=pstmt.executeUpdate();
    			if(n>0)
    			{
    				response.sendRedirect("./success.html");
    			}
    			else {
    				response.sendRedirect("./fail.html");
    			}
    			con.close();
			 }
			 else
			 {
				 response.sendRedirect("./fail1.html");
			 }
			 con1.close();
			 
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
