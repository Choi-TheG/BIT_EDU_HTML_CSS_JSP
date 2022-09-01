
<%@page import="gntp.model2.lesson1.vo.MemberVO"%>
<%@page import="gntp.model2.lesson1.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>generate member info</title>
</head>
<body>
<%
	//id에 대한 멤버정보 가져오기
	String id = request.getParameter("id");

	MemberDAO dao = new MemberDAO();
	MemberVO member = dao.selectOne(id);
	request.setAttribute("member", member);
%>
<jsp:forward page="../member/viewMemberInfo.jsp"></jsp:forward>
</body>
</html>