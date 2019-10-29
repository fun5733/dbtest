<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>content list page</title>
</head>
<body>
<h1>CONTENT_LIST</h1>

<%@ page import = "java.sql.*" %>
<table border="1">
	<tr>
		<td>교육명</td>
		<td>교육 번호</td>
		<td>교육 날짜</td>
		<td>강사</td>
		<td>선택</td>
	</tr>
<%

	String cid, cdate, cteacher;
	cid = request.getParameter("txtCID");
	cdate = request.getParameter("txtCDATE");
	cteacher = request.getParameter("txtCTEACHER");
	Connection con = null;
	PreparedStatement stmt = null;
	try {
		Class.forName("org.sqlite.JDBC");
		// con = DriverManager.getConnection("jdbc:sqlite:C:/Users/tmpl/test.db");
		// 웹에서는
		con = DriverManager.getConnection("jdbc:sqlite:test.db");
		String sql = "select * from content_list";
		String sql2 = "select * from content_list where CONTENT_ID='"+cid+"' and CONTENT_DATE='"+cdate+"' and CONTENT_TEACHER='"+cteacher+"'";
		stmt = con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
%>
	<tr>
		<td><%=rs.getString("CONTENT_NAME") %></td> 
		<td><%=rs.getString("CONTENT_ID") %></td>
		<td><%=rs.getString("CONTENT_DATE") %></td>
		<td><%=rs.getString("CONTENT_TEACHER") %></td>
		<td>
			<form action="attendance.jsp" method="post">
				<input name="content_id" type="submit" value="<%=rs.getString("CONTENT_ID") %>">
			</form>
		</td>
	</tr>			
<%	
		}
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(con != null) con.close();
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
</table>
</body>
</html>
