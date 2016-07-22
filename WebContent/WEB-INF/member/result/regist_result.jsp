<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.MemberBean" %>
    <%@ page import="member.MemberService" %>
    <%@ page import="member.MemberServiceImpl" %>
    
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>회원가입</title>
	<link rel="stylesheet" href="${css}/global.css" />
	<style type="text/css">
	div.joinDiv{border: 1px dotted gray;width: 80%;margin:10px 50px 10px 50px;}
	span.meta{width: 200px; background-color: yellow; float: left;}	
	</style>
</head>
<body>
	<div class="box">
	<%
	MemberService service = MemberServiceImpl.getInstance();
	MemberBean bean = new MemberBean();
	
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String ssn = request.getParameter("ssn");
	String email = request.getParameter("email");
	
	if(name == "" || id == "" || pw == "" || ssn == "" || email == "" || service.existId(id)){
		%>
		<h2>회원가입 실패</h2>
		<a href="${context}/member/regist.do">다시 시도하기</a><br />
		<%
	} else {
		bean.setName(name);
		bean.setId(id);
		bean.setPw(pw);
		bean.setSsn(ssn);
		bean.setEmail(email);
		bean.setRegDate();
		String str = service.regist(bean);
		if(str == ""){
		%>
		<h2>회원가입 실패</h2>
		<a href="${context}/member/regist.do">다시 시도하기</a><br />
		<%
		} else {
		%>
			<span class="meta">이름</span> <%=request.getParameter("name")%> <br/>
			<span class="meta">ID</span> <%=request.getParameter("id")%> <br/>
			<span class="meta">비밀번호</span> <%=request.getParameter("pw")%> <br/>
			<span class="meta">SSN</span> <%=request.getParameter("ssn")%> <br />
			<span class="meta">이메일</span> <%=request.getParameter("email") %><br />
			<span class="meta">전공</span> <%=request.getParameter("major") %><br />
			<span class="meta">수강과목</span>
			<% 
			String[] subjects = request.getParameterValues("subject");
			if(subjects != null){
				for(int i=0; i<subjects.length; i++){
			%>
					<%=subjects[i] %> 
			<% 
				}
			}
			%>
			<br /><br />
			회원가입을 축하드립니다. <%=request.getParameter("name") %> 님<br />
			<% 
		}
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