<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	div.memberClass{font-size: x-large;}
</style>
<div id="" class="memberClass box">
	<h2>성적관리</h2>
	<div style="width: 300px; margin: 0 auto; text-align: left;">
		<ol>
			<li><a href="${context}/grade.do?page=regist">등록</a></li>
			<li><a href="${context}/grade.do?page=update">수정</a></li>
			<li><a href="${context}/grade.do?page=delete">삭제</a></li>
			<li><a href="${context}/grade.do?page=list">목록</a></li>
			<li><a href="${context}/grade.do?page=count">카운트</a></li>
			<li><a href="${context}/grade.do?page=search">검색</a></li>
		</ol>
	</div>
	<a href="${context}/index.jsp">
		<img alt="home" src="${img}/home.png" style="width: 50px">
	</a>
</div>	