<%@page import="lesson.gntp.vo.ValueObject"%>
<%@page import="lesson.gntp.dao.DataAccessObject"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보변경</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	DataAccessObject dao = new DataAccessObject();
	
	String id = request.getParameter("id");
	
	ValueObject vo = dao.onlySelectMember(id);
	
	String pw = vo.getPw();
	String name = vo.getName();
	String email = vo.getEmail();
	// dao.insertMember(id, pw, name, email);
%>
<form action="./updateInfo.jsp" method="post">
ID : <input type="text" name="id" 
value="<%= id %>">
<br>
PW : <input type="password" name="pw"
value="<%= pw %>">
<br>
Name : <input type="text" name="name"
value="<%= name %>">
<br>
Email : <input type="text" name="email"
value="<%= email %>">
<br>
<input type="submit" value="변경">
</form>
</body>
</html>