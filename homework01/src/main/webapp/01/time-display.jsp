<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" 
		src="<%=request.getContextPath()%>/resources/js/lib/axios/axios.min.js"></script>

</head>
<body>

	<h1 id="clientSide">현재 클라이언트의 시각: </h1>
	<h1 id="serverSide">현재 서버의 시각: </h1>
	
	<a href="" id="click">서버의 현재 시간 가져오기</a>

	<script type="text/javascript">
		const CONTEXTPATH = "<%=request.getContextPath()%>"
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/01/time-display.js"></script>
</body>
</html>