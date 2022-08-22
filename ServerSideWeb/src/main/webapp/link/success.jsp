<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Success ^^7</h1>
nice done
<br>
<br>

<%
	String name = request.getParameter("name");
	out.print("hola "+name+".");
%>

</body>
</html>