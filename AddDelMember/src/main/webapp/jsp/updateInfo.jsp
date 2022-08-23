<%@page import="lesson.gntp.dao.DataAccessObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update info</title>
</head>
<body>
<%
	DataAccessObject dao = new DataAccessObject();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	dao.updateMember(id, pw, name, email);
%>
<jsp:forward page="process.jsp"></jsp:forward>
</body>
</html>