<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="${conPath}/css/event/eventInsert.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function() {
		document
				.getElementById("address_kakao")
				.addEventListener(
						"click",
						function() { //주소입력칸을 클릭하면
							//카카오 지도 발생
							new daum.Postcode(
									{
										oncomplete : function(data) { //선택시 입력값 세팅
											document
													.getElementById("address_kakao").value = data.address; // 주소 넣기
										}
									}).open();
						});
	}
</script>

<script>
	$(document).ready(function() {
		var numberOfChecked = 0;
		$('.mids').click(function() {
			numberOfChecked = $('input:checkbox:checked').length;
			$('#msg').val(numberOfChecked + 1);
		});
	});
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
		<form
			action="${conPath }/event/insertEvent.do?gid=${param.gid }&mid=${member.mid  }"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="method" value="insertEvent">
			<table>
				<tr>
					<td colspan="2"><h1>
							그룹 <span>${param.gid }</span> 지출 추가
						</h1></td>
				</tr>
				<tr>
					<td class="titles">지출명</td>
					<td><input type="text" name="ename" id="ename"  class="ename"></td>
				</tr>
				<tr>
					<td class="titles">지출내용</td>
					<td><textarea name="econtent" rows="6"
								style="border: 0.5px solid grey; outline: none; text-align: center;"></textarea></td>
				</tr>
				<tr>
					<td class="titles">지출총액</td>
					<td><input type="number" name="eamount"  class="eamount" required="required"></td>
				</tr>
				<tr>
					<td class="titles">주소</td>
					<td><input type="text" name="eaddress" class="eaddress"
						id="address_kakao" readonly="readonly"></td>
				</tr>
				<tr>
					<td class="titles">관련사진</td>
					<td><input type="file" name="tempImage"></td>
				</tr>
				<tr>
					<td class="titles">참여멤버</td>
					<td><div class="scrollable">
							<c:forEach items="${printMidList }" var="mids">
								<c:if test="${mids.mid != member.mid }">
									<div>
										<input type="checkbox" id="${mids.mid }" class="mids"
											name="mids" value="${mids.mid }"> <label
											for="${mids.mid }">${mids.mid }</label>
									</div>
								</c:if>
							</c:forEach>
						</div></td>
				</tr>
				<tr>
					<td class="titles">참여수</td>
					<td><input type="number" name="ecount" id="msg"
						readonly="readonly" class="ecount"></td>
				</tr>
				<tr>
					<td class="titles">이벤트 생성자</td>
					<td><input type="text" name="mid" value="${member.mid }"
						readonly="readonly" class="mid"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="지출입력" class="btn_style">
					<input type="button" value="뒤로가기"
							onclick="history.back()" class="btn_style"></td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</body>
</html>