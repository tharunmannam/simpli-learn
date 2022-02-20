package p1;

import java.io.IOException;

import java.io.InputStream;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddResourceServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			PreparedStatement pst=con.prepareStatement("insert into resources values(?,?,?)");
			
			
			HttpSession session=request.getSession(false); 
			String user=(String)session.getAttribute("user");
      		String[] arrOfStr=user.split(",",2);
      		
      		String value="";
      		String subject="";
         	value=arrOfStr[0];
          	subject=arrOfStr[1];
          	
          	String title=request.getParameter("title");
          	String link=request.getParameter("link");
			
			
				pst.setString(1, subject);
				pst.setString(2, title);
				pst.setString(3, link);
			
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
			con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
