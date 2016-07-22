<%@page import="sun.print.resources.serviceui"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="member.MemberService" %>
    <%@page import="member.MemberServiceImpl" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>내정보 수정</title>
	<link rel="stylesheet" href="${css}/global.css" />
	<style>
		#member_detail{border: 1px solid gray; width:90%; height: 400px; margin:0 auto;border-collapse: collapse;}
		#member_detail tr{border: 1px solid gray;height: 20%}
		#member_detail tr td{border: 1px solid gray;}
		.font_bold{font-weight: bold;}
		.bg_color_yellow{background-color: yellow}
	</style>
</head>
<body>
<!-- id, birth, name, regDate, gender, profileImg 
	findBy().getName()이 null이면 접근 안되게 수정
-->
	<div class ="box" style="width:500px;margin: 0 auto;text-align: center;">
		<%
		MemberService service = MemberServiceImpl.getInstance(); 
		if(service.findBy() == null || service.findBy().getId() == null){
			%>
			<h1>로그인을 해주세요</h1>
			<a href="${context}/member/login.do">로그인 하기</a><br/>
			<%
		} else {
			
		%>
		<h1>회원 정보수정</h1><br/>
		<form action="${context}/member/result/update_result.jsp" method="post">
		<table id="member_detail">
			<tr>
				<td rowspan="5" width="30%"><img src="${img}/member/<%=service.findBy().getProfileImg() %>" alt="W3Schools.com" width="104" height="142"><br/></td>
				<td style="width: 20%" class="font_bold bg_color_yellow">ID</td>
				<td style="width: 40%"><%=service.findBy().getId() %></td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">이름</td>
				<td><%=service.findBy().getName() %></td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">비밀번호</td>
				<td><input type="text" name="pw" value="<%=service.findBy().getPw() %>"/></td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">성별</td>
				<td><%=service.findBy().getGender() %></td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">이메일</td>
				<td><input type="text" name="email" value="<%=service.findBy().getEmail() %>"/></td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">생년월일</td>
				<td colspan="2"><%=service.findBy().getBirth() %></td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">등록일</td>
				<td colspan="2"><%=service.findBy().getRegDate() %></td>
			</tr>
		</table>
		<input type="hidden" name="id" value="<%=service.findBy().getId() %>"/>
		<input type="submit" value="수정"/>
		<input type="reset" value="취소"/>
		</form>
	<% 
		}
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