<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<nav class="footer">
		<div class="container">
			<p>서울시 XX구 XX로 000 XXX빌딩 8F | TEL : 02-999-9999 | FAX : 02-999-9998
				사업자등록번호 : 000-12-00000 | 통신판매업신로 : 종로 제0000호 | <a href="${conPath}/admin/adminloginForm.do">관리자모드</a>
				<br>좋은시스템 문의 메일 : webmaster@joeun.com
				<br>ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All Rights Reserved.</p>
		</div>
	</nav>
</body>
</html>