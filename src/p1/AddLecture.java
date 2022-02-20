package p1;
import java.sql.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddLecture extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			PreparedStatement pst=con.prepareStatement("insert into lect values(?,?,?,?)");

			HttpSession session=request.getSession(false); 
			String user=(String)session.getAttribute("user");
      		String[] arrOfStr=user.split(",",2);
      		
      		String value="";
      		String subject="";
         	value=arrOfStr[0];
          	subject=arrOfStr[1];
			
			
			String title=request.getParameter("title");
			String description=request.getParameter("description");
			String link = request.getParameter("videolink");
			
			
			pst.setString(1, subject);
			pst.setString(2, title);
			pst.setString(3, link);
			pst.setString(4, description);
			int d=pst.executeUpdate();
			if(d>0)
			{
				if(subject.equals("Artificial Intelligence")){
					response.sendRedirect("./ai.jsp");
				}
				else if(subject.equals("Data Science")){
					response.sendRedirect("./ds.jsp");
				}
				else if(subject.equals("Block chaining")){
					response.sendRedirect("./bc.jsp");
				}
				else if(subject.equals("Ciber Security")){
					response.sendRedirect("./cs.jsp");
				}
				else if(subject.equals("Machine Learning")){
					response.sendRedirect("./ml.jsp");
				}
			}
//			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
