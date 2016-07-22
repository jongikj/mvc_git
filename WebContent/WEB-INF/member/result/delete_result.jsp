<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.MemberService" %>
    <%@ page import="member.MemberServiceImpl" %>
    <%@ page import="member.MemberBean" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>탈퇴완료</title>
	<link rel="stylesheet" href="${css}/global.css" />
</head>
<body>
	<div class="box">
	<%
	MemberService service = MemberServiceImpl.getInstance();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals(service.findById(id).getId()) && pw.equals(service.findById(id).getPw())){
		service.delete(service.findById(id));
		response.sendRedirect("");
	} else {
		%>
		<h1>정보를 정확히 입력해주세요</h1>
		<a href="${context}/member/delete.do">다시 시도하기</a><br/>
		<%
	}
	%>
	</div>
</body>
</html>