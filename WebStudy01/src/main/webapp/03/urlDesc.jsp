<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/urlDesc.jsp</title>
<link href="<%=request.getContextPath()%>/resources/css/03/urlDesc.css" />
</head>
<body>

	<pre>
	
		웹 상의 자원을 식별하는 방법 : URI
		URI(Uniform Resurce Identifier)	:	네크워크 상의 자원을 식별하기 위한 방법에 포괄적인 명칭
		↓
		URN(Uniform Resurce Naming)		:	자원의 이름으로 식별 (안씀)
		↓
		URC(Uniform Resurce Content)	:	자원이 가진 여러가지 속성으로 자원을 식별 (특정상황에 가끔 쓰임)
		↓
		URL(Uniform Resurce Locator)	:	자원이 가진 경로를 통해 식별
	
		URL 구성 요소
		scheme://DomainName[IP]:port[ContextPath][ResourcePath]#[Fragment]?[Query]
		
		1. scheme = protocol 
		ex.	http(Hyfer Text Transfer Protocol)
			https(Hyfer Text Transfer Protocol on Secure) // 전송 데이터 암호화
		
		ex. ftp(File Transfer Protocol)
		ex. ftps(File Transfer Protocol on Secure)
		
		ex. data: 한쪽 티어에서 이미 소유하고 있는 data 를 메시지로 사용하고자 할 때 사용
		
		2. DomainName[IP]: 하나의 tier 를 구분하기 위한 주소 = DNS 에 의해 IP 로 변환
		물리적인 주소: IP
			IPv4: 8bit 로 구성된 4개의 sector 로 표현(32bit)
			IPv6: 16bit 로 구성된 8개의 sector 로 표현(128bit)
			Loopback address
				- 127.0.0.1(IPv4)
				- 0:0:0:0:0:0:0:1(IPv6) = 0::1
		논리적인 주소: DomainName(IP 주소를 대체하는 논리 주소)
			ex. www.naver.com - 3level : GTLD(Global Top level Domain) 구조
			ex. www.naver.co.kr - 4level : NTLD(National Top level Domain) 구조
			최 하위 레벨 도메인: hostname 에 대한 표현
			그 상위 레벨 도메인 들: 특정 기관에 대한 표현
			
			ex. 쿠키: setDomain(".name.com")
			ex. 쿠키: setDomain("news.name.com")
			
			Loopback address	
				- localhost
	
		3. Port: 물리적 주소로 식별된 tier 내에서 서비스 하나에 대한 논리 주소
			0 ~ 65,535 (64bit) 범위로 표현됨
			0 ~ 1023(생략가능): well-known 포트 해당 포트를 점유할 수 있는 기본 프로토콜이 정해져 있다.
			ex. http(80), https(433) 등
			1+2+3 = Origin = 현재 document의 출처 : 브라우저상에 랜더링된 자원의 출처
			
			SOP(Same Origin Policy): 
				비동기 요청이 발생하는 경우, 현재 document 의 출처와 request origin이 
				동일한 경우에만 자원이 정상 렌더링 됨(부라우저의 보안정책)
			
			CORS(Cross Origin Resource Sharing)
			: 현재 document 의 출처와 서로 다른 서버로부터 자원을 접근하는 방식
			: 가능하려면, 서버에서 access-aloowed-control 헤더들이 응답으로 전송되어야만 가능해짐
			
		URL 표기 방식
			절대경로: 
				scheme 부터 이후의 모든 경로를 표기함
				Same-Origin 인경우 url 에서 origin 을 생략할 수 있음
				ex. <%=request.getContextPath()%>/resources/images/cat1.jpg
				
			상대경로: 
				현재 도큐먼트의 href 에 따라 기준점이 달라지는 표기
				브라우저에 의해 location 이 가진 property 들과 합쳐진 절대 경로로 변경
				ex. ../resources/images/cat1.jpg
				src, action, href 등의 속성에 url 이 생략된 경우 location.href 가 반영됨
	
	</pre>

	<div>
		<img src="">
		<img src="http://localhost:80/ws01/resources/images/cat1.jpg">
		<img src="<%=request.getContextPath()%>/resources/images/cat1.jpg">
		<img src="../resources/images/cat1.jpg">
	</div>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/app/03/urlDesc.js"></script>

</body>
</html>











