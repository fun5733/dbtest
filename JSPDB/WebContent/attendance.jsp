<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>attendance page</title>
</head>
<body>
<form action="put.jsp">
	사번 : <input type="text" name="txtID"><br>
	이름 : <input type="text" name="txtNAME"><br>
	<input name="content_id" type="submit" value="<%= request.getParameter("content_id") %>">
</form>	
</body>
</html>