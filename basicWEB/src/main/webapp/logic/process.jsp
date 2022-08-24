<%@page import="gntp.lesson.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gntp.lesson.dao.MemberDAO"%>
<%@page import="gntp.lesson.util.ConnectionManager"%>
<%@page import="java.sql.Connection"%>
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
	//Test
/*	Connection con = ConnectionManager.getConnection();
	if(con!=null){
		System.out.println("good");
	} else{
		System.out.println("fail");
	}
*/
%>

<%!
	public void jspInin(){
		System.out.println("jspInit");
	}

	public void jspDestroy(){
		System.out.println("jspDestory");
	}
%>
<%
	//logic process
	//System.out.print("logic");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> list = dao.selectAll();
	request.setAttribute("list", list);
/*	for(MemberVO member: list){
		System.out.println(member.toString());
	}
*/
%>
<%--<jsp:forward page="../member/list.jsp"></jsp:forward> --%>
<jsp:forward page="../member/list.jsp"></jsp:forward>
</body>
</html>