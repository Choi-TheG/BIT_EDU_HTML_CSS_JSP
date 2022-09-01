
<%@page import="gntp.model2.lesson1.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewMemberInfo</title>
</head>
<body>
<%
	MemberVO member = (MemberVO)request.getAttribute("member");
%>

<form action="./MyServlet?command=update" method="post">
	ID: <input type="text" name="id" readonly="readonly" value="<%=member.getId()%>"><br>
	PW: <input type="password" name="pwd" value="<%=member.getPwd()%>"><br>
	Name: <input type="text" name="name"value="<%=member.getName()%>"><br>
	Email: <input type="text" name="email"value="<%=member.getEmail()%>"><br>
	JoinDate: <input type="text" name="joinDate" readonly="readonly"value="<%=member.getJoinDate()%>"><br>
	<input type="submit" value="modify"><br>
</form>
</body>
</html>