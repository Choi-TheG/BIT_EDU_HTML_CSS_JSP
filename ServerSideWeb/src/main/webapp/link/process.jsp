<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Process</title>
</head>
<body>
<h1>Process</h1>
<%
	String id = request.getParameter("userId");
	String pwd = request.getParameter("pwd");
	//String a = request.getParameter("a");
	//System.out.println(id+","+pwd);
	//System.out.println(id+","+pwd+","+a);
	if(id.equals("aa")&&pwd.equals("11")){
		//response.sendRedirect("success.jsp");
%>
		<jsp:forward page="success.jsp"></jsp:forward>
<%
	} else{
		//response.sendRedirect("fail.jsp");
%>
		<jsp:forward page="fail.jsp"></jsp:forward>
<%
	}
%>
</body>
</html>