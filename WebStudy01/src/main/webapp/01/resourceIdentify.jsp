<%@page import="java.net.http.HttpResponse"%>
<%@page import="java.net.http.HttpResponse.BodyHandlers"%>
<%@page import="java.net.URI"%>
<%@page import="java.net.http.HttpRequest"%>
<%@page import="java.net.http.HttpClient"%>
<%@page import="java.net.URL"%>
<%@page import="kr.or.ddit.servlet01.DescriptionServlet"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.nio.file.StandardCopyOption"%>
<%@page import="java.nio.file.CopyOption"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01/resourceIdentify.jsp</title>
</head>
<body>

	<h4>자원의 종류와 식별 방법</h4>
	<pre>
		: 자원의 위치와 해당 자원에 접근하기 위한 경로 표현 방식에 따른 분류
		1. 파일 시스템 리소스: 
			- 파일 시스템 상의 자원을 물리 경로를 통해 접근 할 때
			ex. D:\00.medias\images\cute1.PNG
			<%
				Path fileSystemResourcePath = Paths.get("D:/00.medias/images/cute1.PNG");
				long size = Files.size(fileSystemResourcePath);
// 				System.out.println(size);
// 				InputStream inUrl = new FileInputStream("D:/00.medias/images/cute1.PNG");
// 				Path targetUrl = Paths.get("D:/dummy_standalone/cute1.PNG");
// 				Files.copy(fileSystemResourcePath, targetUrl, StandardCopyOption.REPLACE_EXISTING);
				
				Path dirPath = Paths.get("D:/dummy_standalone");
				Path fileName = fileSystemResourcePath.getFileName();
				Path destPath = dirPath.resolve(fileName);
				out.println(destPath);
				Files.copy(fileSystemResourcePath, destPath, StandardCopyOption.REPLACE_EXISTING);
			%>
			
		2. 클래스 패스 리소스: 
			- 클래스 패스 상에 존재하는 자원을 qualified name 을 통해 접근 할 때
			ex. /kr/or/ddit/texts/apt.txt
			
			<%
				String logicalPath = "/kr/or/ddit/texts/apt.txt";
				URL tmpUrl = DescriptionServlet.class.getResource(logicalPath);
				String physicalPath = tmpUrl.getFile();
				File classPathResource = new File(physicalPath);
				
				out.println("파일 크기: " + classPathResource.length());
				out.println("파일 실제 위치: " + physicalPath);
				
				String fileName2 = classPathResource.getName();
				Path destPath2 = Paths.get(dirPath.toString(), fileName2);
				
				out.println("복사할 위치: " + destPath2);
				
				try(FileInputStream fis = new FileInputStream(classPathResource)) {
					Files.copy(fis, destPath2, StandardCopyOption.REPLACE_EXISTING);	
				}
				
// 				InputStream classPathResource = DescriptionServlet.class.getResourceAsStream(logicalPath);
// 				Path dirPath2 = Paths.get("D:/dummy_standalone");
// 				Path destPath2 = dirPath2.resolve("apt.txt.");
// 				Files.copy(classPathResource, destPath2, StandardCopyOption.REPLACE_EXISTING);
				
			%>
			
		3. 웹 리소스:
			- 웹 상의 자원은 URL을 통해 접근 할 때
			ex. https://combo.staticflickr.com/66a031f9fc343c5e42d965ca/66a3e263d52b01e743a74f34_photo-3-hm.avif
			<%
				URI mediaURI = URI.create("https://combo.staticflickr.com/66a031f9fc343c5e42d965ca/66a3e263d52b01e743a74f34_photo-3-hm.avif");
				HttpClient client = HttpClient.newHttpClient();
				HttpRequest mediaReq = HttpRequest.newBuilder().uri(mediaURI).GET().build();
				
				
				HttpResponse<InputStream> mediaResp = client.send(mediaReq, BodyHandlers.ofInputStream());
				
				Path dirPath2 = Paths.get("D:/dummy_standalone");
				String fileName3 = Paths.get(mediaURI.getPath()).getFileName().toString();
				Path destPath3 = Paths.get(dirPath.toString(), fileName3);
				
				try(InputStream is = mediaResp.body()) {
					Files.copy(is, destPath3, StandardCopyOption.REPLACE_EXISTING);
				}
			%>
			
	</pre>

</body>
</html>