<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div id="time-area"></div>

	<form id="clock-form" action="">
		<select name="locale">
			<c:forEach items="${ locales }" var="entry">
				<option value="${ entry.key }">${ entry.value }</option>
			</c:forEach>
		</select>
	
		<select name="timeZone"></select>
		
		<button type="submit">서버시간 가져오기</button>
	</form>
	
	<script type="text/javascript" src="<c:url value='/resources/js/app/world/world-watch.js' />"></script>	

</body>
</html>