<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>put page</title>
</head>
<body>
<p >교육 번호 : <%= request.getParameter("content_id") %></p>
<%@ page import = "java.sql.*" %>
<%
	String content_id = request.getParameter("content_id");
	String id, name;
	id = request.getParameter("txtID");
	name = request.getParameter("txtNAME");
	Connection con = null;
	PreparedStatement stmt = null;
	try {
		Class.forName("org.sqlite.JDBC");
		con = DriverManager.getConnection("jdbc:sqlite:C:/Users/tmpl/test.db");
		String sql = "insert into '"+content_id+"' values(?,?)";
		stmt = con.prepareStatement(sql);
		stmt.setString(1, id);
		stmt.setString(2, name);
		stmt.executeUpdate();
		out.println("" + content_id + "테이블에 새로운 레코드 추가 완료");
	}
	catch(Exception e) {
		e.printStackTrace();
		System.out.println("실패");
	}
	finally {
		if(stmt != null) try{stmt.close();} catch(SQLException sqle){}
		if(con != null) try{con.close();} catch(SQLException sqle){}
	}
%>	
</body>
</html>