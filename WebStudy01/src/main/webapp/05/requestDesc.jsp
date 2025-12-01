<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/requestDesc.jsp</title>
</head>
<body data-cp="${ pageContext.request.contextPath }">

	<div>
	
		<button data-method="get">GET</button>
		<button data-method="post">POST</button>
		<button data-method="put">PUT</button>
		<button data-method="delete">DLETE</button>
		<button data-method="options">OPTIONS</button>
		<button data-method="head">HEAD</button>
		<button data-method="trace">TRACE</button>
		<button id="enable-btn">ENABLE</button>
		
	</div>

	<h4>HttpServletRequest</h4>
	<pre>
	
		: Http 프로토콜에 따라 패키징된 웹상의 요청에 대한 모든 정보를 캡슐화한 객체.
		Http Packet 구성
		1. Request Line: URL, Http Method (서버의 어떤 자원[명사]을 대상으로 무엇을[동사] 할 것인지 표현)
			Http Method: 자원을 대상으로 한 action(행위)[command]을 표현
			동기요청에서는 GET / POST 로만 제한 됨
			
			C(reate): POST body O
			R(ead, *(default)): GET body X
			U(pdate): PUT / PATCH body O
			D(elete): DELETE body X
			
			preFlight 요청: OPTIONS body X
			본문이 없는 응답에 대한 요청: HEAD bosy X
			
			제한된 환경에서 서버를 대항으로 한 Tracing 요청: TRACE
			
			ex. RestFul URI
				/member/memberInsert.do(ful 스럽지 않음)
				/member/memberUpdate.do(ful 스럽지 않음)
				/member/memberList.do
				/member/memberDetail.do?memId=a001
				
				/member GET: 전체 사용자 조회
				/member/a001 GET: a001(Path variable 형태로 전달 경로변수) 사용자 조회
				/member POST: 신규 사용자 등록
				/member/a001 PUT/PATCH: a001 사용자 정보 수정
				/member DELETE: 전체 사용자 정보 삭제
				/member/a001 DELETE: a001 사용자 정보 삭제
			
		2. Request Header: Body 의 Content 나 요청을 전송하는 클라이언트에 대한 metadata
			HttpServletRequest.getHeader(name), .getHeaderNames()
			Accept-*: 클라이언트가 수신 가능한 컨텐츠에 대한 메타 데이터 (클라이언트의 희망사항)
				Accept: Content-Type
					ex. application/json, text/html
					
				Accept-Language Tag(Locale Code) 로 수신 가능한 언어나 지역 설정에 대한 메타 데이터
					ex. ko-KR(한글-한국), en-US(영어-미국)
					
			Content-*: request body 의 컨텐츠에 대한 메타 데이터
				Content-Length: 컨텐츠 길이
				Content-Type: request body 컨텐츠 종류
				ex. application/json (json 컨텐츠 전송 형태)
				ex. application/x-www-formurlencoded (form-data 전송 형태)
				ex. multipart/form-data (multipart 컨텐츠 전송 형태, 주로 파일 업로드시 사용)
				<!-- <form method="post" enctype="application/x-www-form-urlencoded"></form> -->
				
			Cookie: 클라이언트 사이드의 저장소에 저장되어있던 쿠키가 전송될때 사용되는 헤더
			User-Agent: 클라이언트가 사용하는 기기(부라우저)의 종류에 대한 헤더
		
		3. Request Body[Content Body, Message Body]: 요청 본문 (http method 에 따라 조건부 형성)
			1) form-data: application/x-www-formurlencoded / request paramter 형태
				String HttpServletRequest.getPatameter(name)
				String[] HttpServletRequest.getPatameterValues(name)
				Map&lt;String, String[]&gt; HttpServletRequest.getPatameterMap()
				Enumeration&lt;String&gt; HttpServletRequest.getPatameterNames()
				
			2) multipart content: multipart/form-data / request part(부분집합) 형태
				request.getPart(name), request.getParts()
			
			3) payload: application/json, application/xml(, text/plain) / request payload 형태
				request.getInputStream(), request.getReader() 를 통해 트르임 처리
				
		**. 요청 패킷과 무관한 request 기본 객체 활용 케이스
			하나의 요청이 처리되는 동안 동작하는 웹 객체(servlet, jsp, filter)들 사이에 공동으로 접근해야하는
			공유 데이터에 대한 저장소(attribute map = request scope) 에 대한 관리자 역할을 함
			
			request.setAttribute(name-String, vlaue-Object), getAttribute(name), removeAttribute
		
	</pre>
	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/app/05/requestDesc.js"></script>
	
</body>
</html>