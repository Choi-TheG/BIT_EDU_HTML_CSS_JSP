<%@page import="lesson.gntp.dao.DataAccessObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생성프로세스</title>

</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
DataAccessObject dao = new DataAccessObject();

String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String email = request.getParameter("email");

dao.insertMember(id, pw, name, email);
%>
<jsp:forward page="process.jsp"></jsp:forward>
</body>
</html>