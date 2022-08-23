
<%@page import="java.util.ArrayList"%>
<%@page import="lesson.gntp.dao.DataAccessObject"%>
<%@page import="lesson.gntp.vo.ValueObject"%>
<%@page import="lesson.gntp.service.LoginCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>process</title>
</head>
<body>
<%

// idCheck
	String id = request.getParameter("id");
//	System.out.println("id: "+id);
	String pw = request.getParameter("pw");
//	System.out.println("pw :"+pw);

 	LoginCheck check = new LoginCheck();
	ValueObject vo = check.getMember(id, pw);
	String url = "./fail.jsp";
	if(vo!=null){
		DataAccessObject dao = new DataAccessObject();
		ArrayList<ValueObject> list = dao.loadMember();
		request.setAttribute("list", list);
		//System.out.println(vo.getName());	
%>
		<jsp:forward page="main.jsp"></jsp:forward>
<%
	} else {
%>
		<jsp:forward page="fail.jsp"></jsp:forward>
<%
	}
%>
</body>
</html>