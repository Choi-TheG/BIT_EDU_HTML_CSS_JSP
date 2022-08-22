<%@page import="lesson.gntp.util.DateTimeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test time service</title>
</head>
<body>
<form method="post" action="../process/data_process.jsp">

	<h2>Log in</h2>
	<br>
	ID <input type="text" placeholder="Identification" name="userId">
	<input type="button" value="check ID">
	<br>
	PW <input type="password" placeholder="Password" name="pwd">
	<input type="submit" value="Log in">
	
</form>
<div>
<%
	// 서버의 현재 시간을 2022/08/19 12:11:09 "YYYY/MM/dd HH:mm:ss"의 형식으로 출력하는 코드 작성
	// DateTimeService 클래스를 만들어서 구현
	DateTimeService dts = new DateTimeService();
	//dts.nowDate();
	out.println(dts.getDateTime());
%>
<br>
<a href="../process/data_process2.jsp">담임코드A, 로컬코드A 조회</a>
</div>
</body>
</html>