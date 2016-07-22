<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="member.MemberService" %>
    <%@page import="member.MemberServiceImpl" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>회원수</title>
	<link rel="stylesheet" href="${css}/global.css" />
</head>
<body>
	<div class="box">
		<%
		MemberService service = MemberServiceImpl.getInstance();
		%>
		<h1>회원은 <%=service.count() %>명 입니다.</h1>
		<a href="${context}/member/main.do">
			<img src="${img}/member.png" alt="member" style="width: 50px">
		</a>
		<a href="${context}/home.do">
			<img src="${img}/home.png" alt="home" style="width: 50px"/>
		</a>
	</div>
</body>
</html>