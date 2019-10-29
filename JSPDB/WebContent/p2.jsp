<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>page P2</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%

	String uid, uname;
	uid = request.getParameter("txtUID");
	uname = request.getParameter("txtUNAME");
	Connection con = null;
	PreparedStatement stmt = null;
	try {
		Class.forName("org.sqlite.JDBC");
		con = DriverManager.getConnection("jdbc:sqlite:C:/Users/tmpl/test.db");
		String sql = "select * from test where userid='"+uid+"' and username='"+uname+"'";
		stmt = con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			//out.println(rs.getString(1) + rs.getString(2));
			response.sendRedirect("http://localhost:8080/JSPDB/welcome.jsp");
		}
		else {
			response.sendRedirect("http://localhost:8080/JSPDB/error.jsp");
		}
	}
	catch(SQLException se) {
		System.out.println("SQL Exception: " + se.getMessage());
	}
	catch(Exception e) {
		System.out.println("Exception: " + e.getMessage());
	}
	finally {
		try {
			if(con!=null) con.close();
		}
		catch(SQLException se) {
			System.out.println("Exception");
		}
	}
%>
</body>
</html>