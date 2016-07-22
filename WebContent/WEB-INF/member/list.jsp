<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>회원목록</title>
	<link rel="stylesheet" href="${css}/global.css" />
	<style>
		table {
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}
		
		td, th {
			border: 1px solid #dddddd;
			text-align: left;
			padding: 8px;
		}
		
		tr:nth-child(even) {
			background-color: #dddddd;
		}
		div{
			border: 5px soild powderblue; margin: 0 auto; width: 600px;text-align: center;
		}
	</style>
</head>
<body>
	<div class="box">
		<h1>목록보기</h1><br/>
		<table>
			<tr>
				<th>ID</th>
				<th>이 름</th>
				<th>등록일</th>
				<th>생년월일</th>
			</tr>
			<tr>
				<td>hong</td>
				<td><a href="${context}/member/detail.do">홍길동</a></td>
				<td>2016-07-11</td>
				<td>880808</td>
			</tr>
			<tr>
				<td>lee</td>
				<td><a href="${context}/member/detail.do">이순신</a></td>
				<td>2016-07-03</td>
				<td>980801</td>
			</tr>
			<tr>
				<td>jang</td>
				<td><a href="${context}/member/detail.do">장종익</a></td>
				<td>2016-07-01</td>
				<td>940729</td>
			</tr>
			<tr>
				<td>park</td>
				<td><a href="${context}/member/detail.do">박지성</a></td>
				<td>2016-07-02</td>
				<td>800101</td>
			</tr>
			<tr>
				<td>yu</td>
				<td><a href="${context}/member/detail.do">유관순</a></td>
				<td>2016-07-05</td>
				<td>990401</td>
			</tr>								
		</table>
		<a href="${context}/member/main.do">
			<img src="${img}/member.png" alt="member" style="width: 50px">
		</a>
		<a href="${context}/home.do">
			<img src="${img}/home.png" alt="home" style="width: 50px"/>
		</a>
</div>	
</body>
</html>