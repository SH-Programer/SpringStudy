<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="${ pageContext.request.contextPath }/03/image-stream" method="get">
		<select id="imageListBox" name="image">
			<option value="">이미지선택</option>
		</select>
		<button>전송</button>
	</form>
	
	<img alt="" src="${ pageContext.request.contextPath }/03/image-stream?image=cute3.JPG">
<!-- 

	1. 이미지스 경로 필요
	2. 파일 목록 필요 (갯수)
	3. 갯수 만큼 반복 
	4. 옵션 동적생성
		- 스크립트립
		- JSTL
		- 비동기
			- ajax
			- axios
			- fetch (선택)

 -->	
 
 	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/app/02/imageList.js"></script>
 
</body>
</html>

