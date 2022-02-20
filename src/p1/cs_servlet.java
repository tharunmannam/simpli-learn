package p1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class cs_servlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);  
	    String value=(String)session.getAttribute("email");  
	    try
		{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
    		PreparedStatement  pstmt1= con1.prepareStatement("select * from studentcourses where studemail=?");
    		pstmt1.setString(1,value);
    		ResultSet rs = pstmt1.executeQuery();
    		int flag=0;
    		while (rs.next()) {
//    			System.out.println(rs.getString(1));
//    			System.out.println(rs.getString(2));
    			if(rs.getString(1).equals(value) && rs.getString(2).equals("Ciber Security"))
    			{
    				flag=1;
    				break;
    			}
    		}
    		if(flag==1) {
    			response.sendRedirect("./student.jsp");
    		}
    		else
    		{
    			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
	    		PreparedStatement pstmt=con.prepareStatement("insert into studentcourses values(?,?)");
	    		pstmt.setString(1,value);
	    		pstmt.setString(2,"Ciber Security");
	    		
	    		int n=pstmt.executeUpdate();
	    		if(n>0){
	    			response.sendRedirect("./student.jsp");
				}		
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
