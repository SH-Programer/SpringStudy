<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body data-cp="<%= request.getContextPath() %>">

	<h4>서버의 현재 시간: <span id="server-area"></span></h4>
	
	<lable><input type="radio" name="accept" value="text/html" checked>HTML</lable>
	<lable><input type="radio" name="accept" value="application/json">JSON</lable>
	
	<button id="fetch-time">서버 시간 가져오기</button>
	<button id="fetch-time-stop">시간 멈추기</button>

	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/app/05/contentNegotiation.js"></script>

</body>
</html>