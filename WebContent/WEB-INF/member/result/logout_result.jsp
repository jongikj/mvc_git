<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.MemberService" %>
    <%@ page import="member.MemberServiceImpl" %>
    <%@ page import="member.MemberBean" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>로그인</title>
	<link rel="stylesheet" href="${css}/global.css" />
</head>
<body>
	<div class="box">
<%
	MemberService service = MemberServiceImpl.getInstance();
	MemberBean bean = new MemberBean();
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	application.log("넘어온 ID : " + id);
	application.log("넘어온 pw : " + pw);
	bean.setId(id);
	bean.setPw(pw);
	service.logout(bean);
	response.sendRedirect("");	
%>
</div>
</body>
</html>