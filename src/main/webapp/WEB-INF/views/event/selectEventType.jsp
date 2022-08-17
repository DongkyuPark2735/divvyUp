
<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8">
<link href="${conPath }/css/event/select.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<nav class="header">
		<div class="container">
			<h1 class="logo">
				<a href="${conPath}/main/main.jsp">D<span>U</span></a>
			</h1>
			<ul>
				<li><a href="${conPath}/member/modifyMemberForm.do?mid=${mid }">${mid }님
						▶</a></li>
				<li><a
					href="${conPath}/notification/notificationConfirmForm.do"
					class="notification"> <img src="${conPath}/icon/noti.png"
						class="imgNoti" />
						<div class="badge">${uncheckdNotificationCnt }</div>
				</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="${conPath}/main/logout.do"> <img
						src="${conPath}/icon/logout.png" class="imgLogout" />
				</a></li>
			</ul>
		</div>
	</nav>
	<div id="content">
		<input type="button" value="1/n 정산"
			onclick="location='${conPath }/event/insertEventForm.do?gid=${selectEventType }'">
		<input type="button" value="직접 입력"
			onclick="location='${conPath }/event/insertEventForm2.do?gid=${selectEventType }'">
	</div>
</body>
</html>