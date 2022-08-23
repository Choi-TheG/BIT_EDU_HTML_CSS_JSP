
<%@page import="lesson.gntp.vo.ValueObject"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
<%
// 연결할 객체 생성
//	System.out.println("a");
	ArrayList<ValueObject> list = (ArrayList<ValueObject>)request.getAttribute("list");
//	System.out.println("b");
//	System.out.println(list.size());
%>
<table border="1" width="100%">
	<tr>
		<th>ID</th>
		<th>PW</th>
		<th>Name</th>
		<th>Email</th>
		<th>joinDate</th>
		<th>Delete</th>
	</tr>
<%
	for(ValueObject vo : list){
%>
	<tr>
		<td><%=vo.getId() %></td>
		<td><%=vo.getPw() %></td>
		<td><%=vo.getName() %></td>
		<td><%=vo.getEmail() %></td>
		<td><%=vo.getJoinDate() %></td>
		<td><a href="./delProcess.jsp?id=<%=vo.getId()%>">삭제</a>
		<a href="./infoProcess.jsp?id=<%=vo.getId()%>">변경</a></td>
	</tr>
<%
	}
%>	
</table>
<a href="../html/signUp.html"><input type="button" value="신규생성"></a>
</body>
</html>