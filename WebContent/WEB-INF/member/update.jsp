<%@page import="sun.print.resources.serviceui"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class ="box" style="width:500px;margin: 0 auto;text-align: center;">
		<h1>회원 정보수정</h1><br/>
		
		<form action="${context}/member.do" method="post">
		<table id="member_detail">
			<tr>
				<td rowspan="5" width="30%"><img src="${img}/member/${update.id}.jpg" alt="W3Schools.com" width="104" height="142"><br/></td>
				<td style="width: 20%" class="font_bold bg_color_yellow">ID</td>
				<td style="width: 40%">${update.id }</td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">이름</td>
				<td>${update.name}</td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">비밀번호</td>
				<td><input type="text" name="pw" value=""/></td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">성별</td>
				<td>${update.gender}</td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">이메일</td>
				<td><input type="text" name="email" value="${update.email}"/></td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">생년월일</td>
				<td colspan="2">${update.ssn}</td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">등록일</td>
				<td colspan="2">${update.regDate}</td>
			</tr>
		</table>
		<input type="hidden" name="action" value="update" />
		<input type="hidden" name="directory" value="member" />
		<input type="submit" value="수정"/>
		<input type="reset" value="취소"/>
		</form>
		
		<a href="${context}/member/main.do">
			<img src="${img}/member.png" alt="member" style="width: 50px">
		</a>
		<a href="${context}/home.do">
			<img src="${img}/home.png" alt="home" style="width: 50px"/>
		</a>
	</div>	
</body>
</html>