<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form id="currency-form" method="post">
		원화: <input type="number" name="amount" />
		<button type="submit">전송</button>
	</form>
	
	<div>
	달러: <span id="result-area"></span>
	</div>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/app/03/currencyForm.js"></script>

</body>
</html>