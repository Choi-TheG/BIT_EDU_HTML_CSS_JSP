<%@page import="gntp.lesson.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gntp.lesson.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	MemberDAO dao = new MemberDAO();
// 업데이트 준비
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	MemberVO member = new MemberVO(id,pwd,name,email,null);
	
// 업데이트 로직
	boolean flag = dao.updateMember(member);

// 전체 조회
	ArrayList<MemberVO> list = null ;
	if(flag){
		list = dao.selectAll();	
	}
	request.setAttribute("list", list);
%>
<jsp:forward page="./process.jsp"></jsp:forward>
</body>
</html>