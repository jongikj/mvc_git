<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "member.MemberService" %>
    <%@page import = "member.MemberServiceImpl" %>
    <%@page import = "member.MemberBean" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>변경 완료</title>
	<link rel="stylesheet" href="${css}>/global.css" />
</head>
<body>
	<div class = "box">
		<%
		MemberService service = MemberServiceImpl.getInstance();
		MemberBean bean = service.findById(request.getParameter("id"));
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		
		bean.setPw(pw);
		bean.setEmail(email);
		
		service.update(bean);
		response.sendRedirect("");
		%>
		
		<a href="${context}/member/main.do">
			<img src="${img}/member.png" alt="member" style="width: 50px">
		</a>
		<a href="${context}/home.do">
			<img src="${img}/home.png" alt="home" style="width: 50px"/>
		</a>
	</div>
</body>
</html>