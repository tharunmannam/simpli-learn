package p1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class askquestion3 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);  
	    String value=(String)session.getAttribute("email");
	    String firstname="";
		String lastname="";
	    try
		{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
    		PreparedStatement  pstmt1= con1.prepareStatement("select * from studentsinfo where email=?");
    		pstmt1.setString(1,value);
    		ResultSet rs = pstmt1.executeQuery();
    		while (rs.next()) {
    			firstname=rs.getString(1);
    			lastname=rs.getString(2);
    		}
    		con1.close();
		}
		catch(Exception e)
		{		
			System.out.println(e);  
		}
	    
	    String username=firstname+lastname;
//	    long millis=System.currentTimeMillis();  
//		Date date=new Date(millis);
	    
//		Date date = Calendar.getInstance().getTime();  
//		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
//		String strDate = dateFormat.format(date);  
	    String question=(String)request.getParameter("message");
	    
	    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
	    LocalDateTime now = LocalDateTime.now();
	    String strDate=dtf.format(now);
	    
		System.out.println(firstname);
		System.out.println(lastname);
		if(question!=null){
		int qid=0;
		
		try
		{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection con2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
    		PreparedStatement  pstmt2= con2.prepareStatement("select * from questions");
    		
    		ResultSet rs1 = pstmt2.executeQuery();
    		int count=0;
    		int lastrecord=0;
    		while (rs1.next()) {
    			count+=1;
    			lastrecord=rs1.getInt(1);
    		}
    		if(count>0) {
    			qid=lastrecord+1;
    		}
    		else {
    			qid=1;
    		}
    		
    		Connection con3 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
    		PreparedStatement  pstmt3= con3.prepareStatement("insert into questions values(?,?,?,?,?)");
    		pstmt3.setInt(1,qid);
    		pstmt3.setString(2, username);
    		pstmt3.setString(3, question);
    		pstmt3.setString(4, "Block chaining");
    		pstmt3.setString(5, strDate);
    		int n=pstmt3.executeUpdate();
    		System.out.println(n);
    		if(n>0){
    			response.sendRedirect("./bc_coursecontent.jsp");
    		}
    		con2.close();
    		con3.close();
		}
		catch(Exception e)
		{		
			System.out.println(e);  
		}
		}
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
