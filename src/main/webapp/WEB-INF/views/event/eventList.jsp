<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="${conPath}/css/event/eventList.css" rel="stylesheet">
<meta charset="UTF-8">
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
				<li><a href="${conPath }/main/mainto.do">홈으로</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="${conPath}/main/logout.do"> <img
						src="${conPath}/icon/logout.png" class="imgLogout" />
				</a></li>
			</ul>
		</div>
	</nav>
	<div id="totalWrap">
		<div id="content">
		<h1>지출내역</h1>
			<table class="scrollable">
				<c:if test="${empty eventList }">
					<tr><td colspan="3"><h4 style="width:100%; text-align:center;">지출없음</h4></td></tr>
				</c:if>
				<c:forEach var="event" items="${eventList }">
					<tr>
						<td colspan="3" class="ename">지출 (${event.erdate })</td>
					</tr>
					<tr>
						<td class="titles">지출명</td>
						<td class="values">${event.ename } </td>
						
							<td rowspan="6" >
								<img src="${conPath }/eventImgFileUpload/${event.eimage }">
							</td>
					</tr>
					<tr>
						<td class="titles">지출내용</td>
						<td class="scrollable2" style="width:230px;">${event.econtent }</td>
					</tr>
					<tr>
						<td class="titles">총지출액</td>
						<td class="values">${event.eamount }</td>
					</tr>
					<tr>
						<td class="titles">주소</td>
						<td class="values">${event.eaddress }</td>
					</tr>
					<tr>
						<td class="titles">참여자 수</td>
						<td class="values">${event.ecount }</td>
					</tr>
					<tr>
						<td class="titles">지불한 사람</td>
						<td class="values">${event.mid }</td>
					</tr>
					<c:if test="${check !=1 }">
						<tr>
							<td colspan="3"><input type="button" value="이벤트 정보수정" class="btn_style" 
								onclick="location='${conPath }/event/modifyEventForm.do?eid=${event.eid }&gid=${event.gid }'">
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>