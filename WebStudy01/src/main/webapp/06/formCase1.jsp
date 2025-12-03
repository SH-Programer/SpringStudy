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

	<form action="<c:url value='/08/case1' />" method="get">
		<pre>
			textParam: <input type="text" name="textParam">
			numParam: <input type="number" name="numParam">
			dateParam: <input type="date" name="dateParam">
			datetimenumParam: <input type="datetime-local" name="datetimeParam">
			radioParam: <input type="radio" name="radioParam" value="R-V1"> <input type="radio" name="radioParam" value="R-V2">
			checkParam: <input type="checkbox" name="checkParam" value="C-V1"> <input type="checkbox" name="checkParam" value="C-V2">
			singleSel: <select name="singleSel">
				<option value="">선택</option>
				<option value="S-V1">S-V1</option>
				<option value="S-V2">S-V2</option>
			</select>
			
			multiSel: <select name="multiSel" multiple="multiple">
				<option value="M-V1">M-V1</option>
				<option value="M-V2">M-V2</option>
			</select>
		</pre>
		<button type="submit">get 전송</button>
	</form>
	
	
	
	<form action="<c:url value='/08/case1' />" method="post">
		<pre>
			textParam: <input type="text" name="textParam">
			numParam: <input type="number" name="numParam">
			dateParam: <input type="date" name="dateParam">
			datetimenumParam: <input type="datetime-local" name="datetimeParam">
			radioParam: <input type="radio" name="radioParam" value="R-V1"> <input type="radio" name="radioParam" value="R-V2">
			checkParam: <input type="checkbox" name="checkParam" value="C-V1"> <input type="checkbox" name="checkParam" value="C-V2">
			singleSel: <select name="singleSel">
				<option value="">선택</option>
				<option value="S-V1">S-V1</option>
				<option value="S-V2">S-V2</option>
			</select>
			
			multiSel: <select name="multiSel" multiple="multiple">
				<option value="M-V1">M-V1</option>
				<option value="M-V2">M-V2</option>
			</select>
		</pre>
		<button type="submit">post 전송</button>
	</form>

</body>
</html>