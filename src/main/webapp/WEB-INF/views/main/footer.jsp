<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.footer {
	position: fixed;
	background-color: rgba(34, 34, 34, 0.2);
	bottom: 0;
	left: 0;
	right: 0;
	z-index: 100;
}

.footer .container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 80px;
}

.footer .container {
	left: 0;
	width: 100%;
}

.footer p {
	font-size: 0.7em;
	text-align: center;
	color: white;
	list-style: none;
	margin: 0 auto;
	width: 70%;
}

.footer a:hover {
	opacity: 0.5;
}
</style>
</head>
<body>
	<c:if test="${empty admin and empty member }">
		<nav class="footer">
			<div class="container">
				<p>
					서울시 XX구 XX로 000 XXX빌딩 8F | TEL : 02-999-9999 | FAX : 02-999-9998
					사업자등록번호 : 000-12-00000 | 통신판매업신로 : 종로 제0000호 | <a
						href="${conPath}/admin/adminloginForm.do">관리자모드</a> <br>좋은시스템
					문의 메일 : webmaster@joeun.com <br>ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All
					Rights Reserved.
				</p>
			</div>
		</nav>
	</c:if>
	<c:if test="${empty admin and not empty member}">
		<nav class="footer">
			<div class="container">
				<p>
					서울시 XX구 XX로 000 XXX빌딩 8F | TEL : 02-999-9999 | FAX : 02-999-9998
					사업자등록번호 : 000-12-00000 | 통신판매업신로 : 종로 제0000호 <br>좋은시스템 문의 메일 :
					webmaster@joeun.com <br>ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All Rights
					Reserved.
				</p>
			</div>
		</nav>
	</c:if>
	<c:if test="${not empty admin and empty member}">
		<nav class="footer">
			<div class="container">
				<p>
					서울시 XX구 XX로 000 XXX빌딩 8F | TEL : 02-999-9999 | FAX : 02-999-9998
					사업자등록번호 : 000-12-00000 | 통신판매업신로 : 종로 제0000호 | <strong
						style="color: #1DBF73;">관리자모드 접속 중</strong> <br>좋은시스템 문의 메일 :
					webmaster@joeun.com <br>ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All Rights
					Reserved.
				</p>
			</div>
		</nav>
	</c:if>

=======
	<meta charset="UTF-8">
	<title>Insert title here</title>
<style>
.footer {
		position: fixed;
		background-color: rgba(34, 34, 34, 0.2);
		bottom: 0;
		left: 0;
		right: 0;
		z-index: 100;
}
.footer .container {
		display: flex;
		justify-content: space-between;
		align-items: center;
		height: 80px;
}
	
.footer .container {
		left:0;
		width:100%;
}
 
.footer p {
		font-size:0.7em;
		text-align:center;
		color:white;
		list-style: none;
		margin:0 auto;
		width:70%;
}
.footer a:hover {
		opacity:0.5;
}
</style>	
</head>
<body>
<!-- 빈이가 만든 푸터 ------------------------------------------------------------------------------------------------------------------>
	<c:if test="${empty admin and empty member }">
	  <nav class="footer">
		  <div class="container">
			  <p>서울시 XX구 XX로 000 XXX빌딩 8F | TEL : 02-999-9999 | FAX : 02-999-9998
				  사업자등록번호 : 000-12-00000 | 통신판매업신로 : 종로 제0000호 | <a href="${conPath}/admin/adminloginForm.do">관리자모드</a>
				  <br>좋은시스템 문의 메일 : webmaster@joeun.com
				  <br>ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All Rights Reserved.</p>
		  </div>
	  </nav>
	</c:if>
	<c:if test="${empty admin and not empty member}">
	  <nav class="footer">
		  <div class="container">
			  <p>서울시 XX구 XX로 000 XXX빌딩 8F | TEL : 02-999-9999 | FAX : 02-999-9998
				  사업자등록번호 : 000-12-00000 | 통신판매업신로 : 종로 제0000호
				  <br>좋은시스템 문의 메일 : webmaster@joeun.com
				  <br>ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All Rights Reserved.</p>
		  </div>
	  </nav>
	</c:if>
	<c:if test="${not empty admin and empty member}">
	  <nav class="footer">
		  <div class="container">
			  <p>서울시 XX구 XX로 000 XXX빌딩 8F | TEL : 02-999-9999 | FAX : 02-999-9998
				  사업자등록번호 : 000-12-00000 | 통신판매업신로 : 종로 제0000호 | <strong style="color: #1DBF73;">관리자모드 접속 중</strong>
				  <br>좋은시스템 문의 메일 : webmaster@joeun.com
				  <br>ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All Rights Reserved.</p>
		  </div>
	  </nav>
	</c:if>
<!-- 빈이가 만든 푸터 ------------------------------------------------------------------------------------------------------------------>
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
</body>
</html>