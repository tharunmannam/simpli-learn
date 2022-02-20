<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%
	String id=request.getParameter("fileid");
	Connection connection = null;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","tharun");
	PreparedStatement st=null;
	st=connection.prepareStatement("select * from resource where id=?");
    st.setString(1,id);
	ResultSet rview=st.executeQuery();
	Blob file=null;
	byte[] filedata=null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		if(rview.next())
		{
			file=rview.getBlob("file");
			filedata=file.getBytes(1, (int)file.length());
		}
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "inline");
		response.setContentLength(filedata.length);
		OutputStream output=response.getOutputStream();
		output.write(filedata);
		output.flush();
	%>
</body>
</html>