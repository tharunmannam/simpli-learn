package p1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class replyques extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
			
    		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
    	    LocalDateTime now = LocalDateTime.now();
    	    String strDate=dtf.format(now);
    	    
			String reply=(String)request.getParameter("reply");
			HttpSession session=request.getSession();
			String det=(String)session.getAttribute("user");
			String[] details=det.split(",");
			String email=details[0];
			String subject=details[1];
			int qid=(Integer) session.getAttribute("qid");
			String username="";
			PreparedStatement  pstmt= con1.prepareStatement("select * from mentorsinfo where email=?");
			pstmt.setString(1, email);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				username=rs.getString(1)+rs.getString(2);
			}
			
			
			PreparedStatement  pstmt1= con1.prepareStatement("insert into quesreply values(?,?,?,?)");
    		pstmt1.setInt(1,qid);
    		pstmt1.setString(2,username);
    		pstmt1.setString(3,reply);
    		pstmt1.setString(4,strDate);
    		
    		int n=pstmt1.executeUpdate();
    		if(n>0) {
    			if(subject.equals("Artificial Intelligence")) {
    				response.sendRedirect("ai.jsp");}
    			else if(subject.equals("Data Science")) {
    				response.sendRedirect("ds.jsp");}
    			else if(subject.equals("Block chaining")) {
    				response.sendRedirect("bc.jsp");}
    			else if(subject.equals("Ciber Security")) {
    				response.sendRedirect("cs.jsp");}
    			else if(subject.equals("Machine Learning")) {
    				response.sendRedirect("ml.jsp");
    			}
    		}
			
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
