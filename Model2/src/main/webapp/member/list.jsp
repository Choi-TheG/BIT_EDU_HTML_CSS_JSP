
<%@page import="gntp.model2.lesson1.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>output MemberList</title>
</head>
<body>
<h1>Member list</h1>
<%
	ArrayList<MemberVO> list = (ArrayList<MemberVO>)request.getAttribute("list");
/*	for(MemberVO member : list){
//		out.print(member.toString()+"<br>");
	} */
%>
<table>
	<tr><th>ID</th><th>PWD</th><th>Name</th><th>Email</th><th>joinDate</th></tr>
<%
	for(MemberVO member : list){
%>
	<tr>
		<td><a href="./MyServlet?command=read&id=<%=member.getId()%>"><%=member.getId()%></a></td>
		<td><%=member.getPwd() %></td>
		<td><%=member.getName() %></td>
		<td><%=member.getEmail() %></td>
		<td><%=member.getJoinDate() %></td>
	</tr>
<%
	}
%>
</table>
</body>
</html>