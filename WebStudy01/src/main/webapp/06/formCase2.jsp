<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h4>Case2 Form(application/x-www-form-urlencoded)</h4>
	<form action="${ pageContext.request.contextPath }/08/case2" method="post" enctype="application/x-www-form-urlencoded">
		<pre>
			uploader: <input type="text" name="uploader">
			uploadFile: <input type="file" name="uploadFile">
			<button type="submit">send</button>
		</pre>
	</form>
	
	<h4>Case3 Form(multipart/form-data)</h4>
	<form action="${ pageContext.request.contextPath }/08/case3" method="post" enctype="multipart/form-data">
		<pre>
			uploader: <input type="text" name="uploader">
			uploadFile: <input type="file" name="uploadFile">
			<button type="submit">send</button>
		</pre>
	</form>

</body>
</html>