<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../global/top.jsp"/>
<style>
	div.memberClass{font-size: x-large;}
</style>
<div id="" class="memberClass box">
	<h2>회원관리</h2>
	<div style="width: 300px; margin: 0 auto; text-align: left;">
		<ol>
			<li><a href="${context}/member/regist.do">회원가입</a></li>
			<li><a href="${context}/member/find_by_id.do">내정보보기</a></li>
			<li><a href="${context}/member/update.do">내정보수정</a></li>
			<li><a href="${context}/member/delete.do">탈퇴</a></li>
			<li><a href="${context}/member/login.do">로그인</a></li>
			<li><a href="${context}/member/logout.do">로그아웃</a></li>
			<li><a href="${context}/member/list.do">목록보기</a></li>
			<li><a href="${context}/member/find_by.do">검색(이름)</a></li>
			<li><a href="${context}/member/count.do">회원수</a></li>
		</ol>
	</div>

	<a href="${context}/home.do"> 
		<img alt="home" src="${img}/home.png" style="width: 50px">
	</a>
</div>
