<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="top.jsp"/>
<jsp:include page="header.jsp"/>
<script src="${js }/global.js"></script>
<jsp:include page="navi.jsp"/>
	<div id="section">
	    <button id="bt_js_go" style="margin: 0 auto">
	        모던 자바스크립트 GO
	    </button>
	</div>
<jsp:include page="footer.jsp"/>	
<jsp:include page="end.jsp"/>
<script>
	window.onload = global.init("${context}");
</script>