<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h4>HttpServletResponse, http 응답 패킷의 구조</h4>
	<pre>
		1. Response Line : Status Code (처리 결과를 표현하는 세자리 숫자)
			1XX : WebSocket 이라는 하위 프로토콜에서 활용
			2XX : OK
			3XX : Body 가 없는 응답을 함 상태코드와 연관된 response header 가 활용됨
				- 302/307 (Moved) 자원의 위치가 변경되었으니 새로운 위치(location header)로 요청을 다시 전송하라.
					. sendRedirect 를 활용한 이동구조나, PRG 패턴에서 활용됨
			4XX : Client Side Failure
				- 400 (BAD_REQUEST) 요청에 대한 검증 로직에서 활용
					. 필수 파라미터, 테이터 타입, 데이터 길이 등의 검증 실패
				- 404 (NOT_FOUND)
				- 405 (METHOD_NOT_ALLOWED) 모든 서블릿의 doXXX 콜백은 기본으로 405 에러를 전송
				- 401/403 (UNAUTHORIZED/FORBIDDEN) 보호자원에 대한 접근 제어구조(보안) 활용
					. 401: 미인증 상태 (로그인, 인증시스템 등)
					. 403: 권한 없음 (인가 처리)
					c.f) 인증: 신원확인과 본인 여부를 확인
						 인가: 적절한 권한을 부여받은 사용자 인지 확인
				- 406/415 (NOT_ACCEPTABLE/UNSUPPORTED_MEDIA_TYPE) 
						  request 나 response에 body content 에 대한 상태코드
					. 406: accept 헤더에 따른 응답 컨텐츠 협상 실해
					. 415: request content-type 을 해석하지 못함
			5XX : Server Side Failure
				- 500 (Internal Server Error)
				- 보통 서버의 오류를 구체적으로 보내지 않아 500 번으로 획일화
		2. Response Header : body 에 있는 본문에 대한 수식(meta data)
			Content-*: Body Content 에 대한 수식
				. Content-Type: mime, Content-Length: length(길이)
			Refresh: auto request 에서 활용 (동기요청에서만 동작함)
			Cache-*: 응답 캐시 정책 재설정
				. Pragma, Cache-Control, Expires
		3. Response Body : response content
			response.getWriter(), response.getOutputStram() - response body 를 매체로 하는 출력 스트림
			c.f) jsp 기반의 응답이 전송될 때는 기본으로 8kb 버퍼를 활용하게 됨
	</pre>

</body>
</html>
















