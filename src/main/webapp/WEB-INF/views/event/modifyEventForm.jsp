<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath}/css/event/eventModify.css" rel="stylesheet">

<style>
#content {
	width: 800px;
	height: 350px;
	margin: 50px auto;
}
</style>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					showOtherMonths : true,
					selectOtherMonths : false,
					yearSuffix : '년',
				});
	});
</script>
<script>
	function confirmDeleteEvent() {
		let confirmDeleteEvent = confirm("이벤트를 삭제하시겠습니까? 삭제 후 복구 불가합니다");
		if (confirmDeleteEvent) {
			location = '${conPath}/event/deleteEvent.do?eid=${getEvent.eid }&gid=${getEvent.gid }';
		}
	}
</script>

</head>
<body>
	<nav class="header">
		<div class="container">
			<h1 class="logo">
				<a href="${conPath }/main/mainto.do">D<span>U</span></a>
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

			<form action="${conPath }/event/modifyEvent.do?eid=${getEvent.eid }"
				method="post" enctype="multipart/form-data">
				<div class="eventDetail">
					<table>
						<tr>
							<td colspan="2"><h1 style="width: 100%;">
									지출정보 수정 <span>${getEvent.eid }</span>
								</h1></td>
						</tr>
						<tr>
							<td class="titles">이벤트 명</td>
							<td class="values"><input type="text" name="ename"
								value="${getEvent.ename }"></td>
						</tr>
						<tr>
							<td class="titles">설명</td>
							<td class="values"><textarea name="econtent" 
								style="border: 0.5px solid grey; outline: none; text-align: center;">${getEvent.econtent }</textarea>
							</td>
						</tr>
						<tr>
							<td class="titles">사진</td>
							<td class="values"><input type="file" name="tempImage"
								value="${getEvent.eimage }"></td>
						</tr>
						<tr>
							<td class="titles">총 금액</td>
							<td class="values">${getEvent.eamount }</td>
						</tr>
						<tr>
							<td class="titles">주소</td>
							<td class="values"><input type="text" name="eaddress"
								class="eaddress" readonly="readonly"
								value="${getEvent.eaddress }"></td>
						</tr>
						<tr>
							<td class="titles">참여자 수</td>
							<td class="values">${getEvent.ecount }</td>
						</tr>
						<tr>
							<td class="titles">날짜</td>
							<td class="values"><input type="date" name="erdate"
								id="datepicker" value="${getEvent.erdate }"></td>
						</tr>
						<tr>
							<td class="titles">생성자</td>
							<td class="values">${getEvent.mid }</td>
						</tr>
						<tr>
							<td colspan="3"><h1>이벤트 참여자</h1></td>
						</tr>
					</table>
				</div>
				<div class="eventMember">
					<table>
						<tr>
							<td>멤버 아이디</td>
							<td>받을 금액</td>
							<td>지금해야할 금액</td>
						</tr>
						<c:forEach var="edDto" items="${getEventHistory }">
							<tr>
								<td>${edDto.mid } <input type="hidden" name="mids"
									value="${edDto.mid }">
								</td>
								<td><c:if test="${edDto.edshare > 0}"> 
								${edDto.edshare }
								<input type="hidden" name="share" value="${edDto.edshare }">
									</c:if> <c:if test="${edDto.edshare <= 0 }"> 
								0
	    					</c:if></td>
								<td><c:if test="${edDto.edshare < 0}"> 
								${edDto.edshare }
	    					</c:if> <c:if test="${edDto.edshare >= 0 }"> 
								0
	    					</c:if></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="3"><input type="submit" value="수정" class="groupModifyBtn">
								<button onclick=" return confirmDeleteEvent();" class="groupModifyBtn">이벤트 삭제</button>
							</td>
						</tr>
					</table>
				</div>
			</form>

		</div>
	</div>
</body>
</html>