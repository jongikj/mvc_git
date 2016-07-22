<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="member.MemberServiceImpl" %>
    <%@page import="member.MemberService" %>
    <%@page import="member.MemberBean" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>로그아웃</title>
	<link rel="stylesheet" href="${css}/global.css" />
</head>
<body>
	<div class="box">
	<%MemberService service = MemberServiceImpl.getInstance(); %>
		<form action="${context}/member/result/logout_result.do" method="post">
			<input type="hidden" name="id" value="<%=service.findBy().getId() %>" />
			<input type="hidden" name="pw" value="<%=service.findBy().getPw() %>" />
			<input type="submit" value="로그아웃" />
		</form>
	</div>	
</body>
</html>