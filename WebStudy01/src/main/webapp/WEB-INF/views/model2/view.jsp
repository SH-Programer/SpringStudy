<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<pre>
	
		attr1: ${ attr1 }, ${ requestScope.attr1 }
		att1: ${ att1 }, ${ sessionScope.att1 }
		att2: ${ att2 }, ${ applicationScope.att2 }
		att3: ${ att3 }
	
	</pre>

</body>
</html>