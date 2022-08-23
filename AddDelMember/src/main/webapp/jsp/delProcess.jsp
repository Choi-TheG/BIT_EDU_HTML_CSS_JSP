<%@page import="lesson.gntp.dao.DataAccessObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제프로세스</title>
</head>
<body>
<%
	DataAccessObject dao = new DataAccessObject();
	String id = request.getParameter("id");
	//System.out.print(id);
	dao.delMember(id);
	//System.out.print("b");
%>

<jsp:forward page="process.jsp?id=choi&pw=1234"></jsp:forward>
</body>
</html>