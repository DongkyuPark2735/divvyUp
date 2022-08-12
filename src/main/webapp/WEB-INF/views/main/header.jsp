
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
<link href="${conPath }/css/main/header.css" rel="stylesheet">

<body>
	<header>

		<c:if test="${empty member }">
			<div id="header_noMem">
			<div class="logo" onclick="location.href='${conPath}/main/main.jspmember/loginForm.do'">
				<img src="${conPath }/images/logoDummy.png"  onclick="location.href='${conPath}/main/main.jspmember/loginForm.do'">
			</div>	
			<div class="gnb1">
				<ul>
					<li><a href="${conPath}/qboard/listQboardForMember.do">Q&A</a></li>
					<li><a href="${conPath}/member/joinForm.do">회원가입</a></li>
					<li><a href="${conPath }/member/loginForm.do">로그인</a></li>
				</ul>
			</div>
			</div>
		</c:if>
		<c:if test="${not empty member }">
			<div id="header_yesMem">
				<div class="leftHeading">
					<ul>
						<li><a href="${conPath}/qboard/listQboardForMember.do">Q&A</a></li>
						<li><a href="${conPath}/notification/notificationConfirmForm.do" class="notif"><span class="num">${uncheckdNotificationCnt }</span></a></li>
					</ul>
				</div>
				<div class="midHeading">
					<ul>
						<li><img src="${conPath }/images/logoDummy.png"  onclick="location.href='${conPath}/main/main.jspmember/loginForm.do'" class="logo"></li>
					</ul>
				</div>
				<div class="rightHeading">
					<ul>
						<li><a href="${conPath}/main/logout.do">로그아웃</a></li>
						<li><a href="${conPath}/member/modifyMemberForm.do?mid=${mid }">정보수정</a></li>
						<li>${mname }님 ▶</li> 
					</ul>
				</div>
			</div>
		</c:if>
	</header>
</body>
</html>



