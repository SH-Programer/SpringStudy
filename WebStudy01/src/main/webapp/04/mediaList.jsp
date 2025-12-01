<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/app/04/mediaList.js"></script>
</head>
<body data-cpath="${ pageContext.request.contextPath }">

	<form 
		id="media-form"
		action="${ pageContext.request.contextPath }/media/stream"
		method="get">
		<select id="imageListBox" name="media">
			<option value="">미디어선택</option>
		</select>
		<button>전송</button>
	</form>
	
	<div id="viewer-area"></div>

</body>
</html>

