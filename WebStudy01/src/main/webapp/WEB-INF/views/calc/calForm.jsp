<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h4>사칙 연산 UI</h4>
	
	   <label><input type="radio" name="accept" checked value="text/html" data-fn-name="renderHtml" />HTML</label>
   <label><input type="radio" name="accept" value="application/json" data-fn-name="renderJson" />JSON</label>
	
	<form id="cal-form" method="post" enctype="application/x-www-form-urlencoded">
		<input type="number" name="left"> <select name="operator">
			<option value="">연산자 선택</option>
			<c:forEach items="${ operatorTypes }" var="single">
				<option value="${ single.name() }">${ single["sign"] }</option>
			</c:forEach>
		</select> <input type="number" name="right">
		<button type="submit">=</button><span id="result-area"></span>
	</form>

	<script type="text/javascript" src='<c:url value="/resources/js/app/calc/calForm.js" />'></script>
	
</body>
</html>