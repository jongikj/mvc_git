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
	if(id == "" || pw == ""){
		%>
		<h2>로그인 실패</h2>
		<a href="${context}/member/login.do">다시 시도하기</a><br />
		<% 	
	}else{
		bean.setId(id);
		bean.setPw(pw);
		String name = service.login(bean);
		application.log("DB다녀온 이름 : " + name);
		if(name == ""){
			%>
			<h2>로그인 실패</h2>
			<a href="${context}/member/login.do">다시 시도하기</a><br />
			<%
		}else{
			response.sendRedirect("");	
		}
	}
%>
</div>
</body>
</html>