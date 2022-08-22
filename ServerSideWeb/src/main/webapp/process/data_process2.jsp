<%@page import="java.util.ArrayList"%>
<%@page import="lesson.gntp.vo.LoginVO"%>
<%@page import="lesson.gntp.sevice.LoginCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data process 2</title>
</head>
<body>
<%
	// 로직클래스 호출해서 컬렉션을 받아오고 결과페이지로 보냄
	ArrayList<LoginVO> list = new ArrayList<LoginVO>();
	list.add(new LoginVO("admin","1234","kim"));
	list.add(new LoginVO("user1","1234","lee"));
	list.add(new LoginVO("user2","1234","park"));
	list.add(new LoginVO("dev1","1234","choi"));
	list.add(new LoginVO("tester1","1234","sam"));
	request.setAttribute("list", list);
	//System.out.println(list.size());
	//response.sendRedirect("../link/list.jsp");
%>
<jsp:forward page="../link/list.jsp"></jsp:forward>
</body>
</html>