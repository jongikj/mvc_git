<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>이름으로 찾기</title>
	<link rel="stylesheet" href="${css}/global.css" />
	<style>
		iframe.ifrm{border:none;width: 400px;height: 400px}
	</style>
</head>
<body>
	<div class="box">
		이름으로 찾기 화면<br/>
		<iframe src="${context}/member/image.do" class="ifrm" style="border:none"></iframe><br/>
		<a href="${context}/member/main.do">
			<img src="${img}/member.png" alt="member" style="width: 50px">
		</a>
		<a href="${context}/home.do">
			<img src="${img}/home.png" alt="home" style="width: 50px"/>
		</a>
	</div>
</body>
</html>