<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title></title>
<link href="${conPath}/css/event/eventInsert.css" rel="stylesheet">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	$(document).ready(function() {
		$('input[name="share"], input[name="eamount"]').keyup(function() {
			var sum = 0;
			var tot = $('input[name="eamount"]').val();
			var count = 1;
			$('.share').each(function() {
				sum += Number($(this).val());
				count += 1;
				if ($(this).val() == '') {
					count -= 1;
					$('.share').val(0);
				}
			});
			if (sum < tot) {
				$('#Chk').text('금액 확인완료');
				$('#count').val(count);
			} else {
				$('#Chk').html('<b>금액을 확인해주세요</b>');
				$('#count').val(count);
			}
		});
		$('form').submit(function() {
			var Chk = $('#Chk').text().trim();
			if (Chk != '금액 확인완료') {
				alert('금액을 확인해주세요');
				return false;
			}
		});
	});
</script>
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
				action="${conPath }/event/insertEvent2.do?gid=${param.gid }&mid=${member.mid  }"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="method" value="insertEvent2">
				<table>
					<tr>
						<td colspan="2"><h1>
								그룹 <span>${param.gid }</span> 지출 추가
							</h1></td>
					</tr>
					<tr>
						<td class="titles">지출명</td>
						<td><input type="text" name="ename" class="ename" id="ename"></td>
					</tr>
					<tr>
						<td class="titles">지출내용</td>
						<td><textarea name="econtent" rows="6"
								style="border: 0.5px solid grey; outline: none; text-align: center;"></textarea></td>
					</tr>
					<tr>
						<td class="titles">지출총액</td>
						<td><input type="number" name="eamount" class="eamount"
							required="required"></td>
					</tr>
					<tr>
						<td class="titles">주소</td>
						<td><input type="text" name="eaddress" class="eaddress"
							id="address_kakao" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="titles">관련사진</td>
						<td><input type="file" name="tempImage" class="tempImage"></td>
					</tr>

					<tr>
						<td class="titles">참여멤버</td>
						<td><div class="scrollable">
								<div class="section">
									<c:forEach items="${printMidList }" var="mids">
										<c:if test="${mids.mid != member.mid }">

											<input type="hidden" value="${mids.mid }" name="mids">
    					${mids.mid }:<input type="number" name="share" class="share"
												min=0 >
											<br>
										</c:if>
									</c:forEach>
									<div id="Chk"></div>
								</div>
							</div></td>
							
					</tr>
					<tr>
						<td class="titles">참여수</td>
						<td><input type="number" name="ecount" id="count"
							class="ecount" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="titles">이벤트 생성자</td>
						<td><input type="text" name="mid" class="mid"
							value="${member.mid }" readonly="readonly"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="지출입력"
							class="btn_style"> <input type="button" value="뒤로가기"
							onclick="history.back()" class="btn_style"></td>
					</tr>
				</table>
			</form>

		</div>
	</div>
</body>
</html>










