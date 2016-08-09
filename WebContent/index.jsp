<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<script src="resources/js/index.js"></script>
</head>
<body>
	<%-- <form action="${context}/home.do">
		<input type="submit" value="홈으로" />
	</form> --%>
	<a href="#" id="atag">홈으로</a>
</body>
<script type="text/javascript">
    window.onload = start("${context}");
</script>
</html>
