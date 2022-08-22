<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JYP Page</title>
<style>
	span {
		color : green;
		font-size : 30px;
	}
</style>
</head>
<body>
<h1>bienvenidos</h1>
<h2>
<%
	Date date = new Date();
	String now = date.toLocaleString();
	// console
	//System.out.println(now);
	// web page
	out.println(now);
	//해당 페이지를 요청할 때 마다 격언을 매변 다르게 보여주는 코드 작성
	// 배열 형식 ?
	String[] phrase = {"물과 같이 생각하고 행동하라","인생은 타이밍","시간은 금","사람이 중요하다","주위 환경을 잘 조성하라"};
	Random r = new Random();
	int index = r.nextInt(5);
	//out.println("<br>"+phrase[index]);
	// 랜덤말고 순서대로
	
%>
</h2>

<span><%=phrase[index]%></span>
</body>
</html>