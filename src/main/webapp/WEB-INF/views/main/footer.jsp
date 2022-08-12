<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/footer.css" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;400&display=swap" rel="stylesheet">
</head>
<body>
	<footer>
			<ul>
				<br><br><br>
				<li><img src="${conPath }/img/logoWhite.png" ></li>
				<br>
				<li>서울시 XX구 XX로 000 XXX빌딩 8F | TEL : 02-999-9999 | FAX : 02-999-9998</li>
				<li>사업자등록번호 : 000-12-00000 | 통신판매업신로 : 종로 제0000호 | <a href="${conPath }/adminLoginView.do">관리자모드</a></li>
				<li>좋은시스템 문의 메일 : webmaster@joeun.com</li>
				<li>ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All Rights Reserved.</li>
			</ul>
		</div>
	</footer>
</body>
</html>
