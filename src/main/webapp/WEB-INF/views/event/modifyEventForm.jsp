<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<style>
		#content {width: 800px; height:350px;margin: 50px auto;}
	</style>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

	<script>
	  $( function() {
		  $("#datepicker").datepicker({
			  dateFormat : 'yy-mm-dd',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토'],
				showMonthAfterYear : true,
				showOtherMonths : true,
				selectOtherMonths : false,
				yearSuffix : '년',
		  });
	  } );
	</script>
	<script>
		function confirmDeleteEvent() {
				let confirmDeleteEvent = confirm("이벤트를 삭제하시겠습니까? 삭제 후 복구 불가합니다");
				if (confirmDeleteEvent) {
					location='${conPath}/event/deleteEvent.do?eid=${getEvent.eid }&gid=${getEvent.gid }';
		}
		}
	</script>

</head>
<body>
	<div id="content">
	<form action="${conPath }/event/modifyEvent.do?eid=${getEvent.eid }" method="post" enctype="multipart/form-data">
		<table>
			<caption>${getEvent.eid }번 정보 수정하기</caption>
			<tr>
				<th>이벤트 명</th>
				<td>
					<input type="text" name="ename" value="${getEvent.ename }">
				</td>
			</tr>
			<tr>
				<th>설명</th>
				<td>
					<textarea name="econtent">${getEvent.econtent }</textarea>
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="tempImage" value="${getEvent.eimage }">
				</td>
			</tr>
			<tr>
				<th>총 금액</th>
				<td>
					${getEvent.eamount }
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="eaddress"  class="eaddress" readonly="readonly" value="${getEvent.eaddress }">
				</td>
			</tr>
			<tr>
				<th>참여자 수</th>
				<td>
					${getEvent.ecount }
				</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>
					<input type="date" name="erdate"  id="datepicker" value="${getEvent.erdate }">
				</td>
			</tr>
			<tr>
				<th>생성자</th>
				<td>
					${getEvent.mid }
				</td>
			</tr>
			</table>
			
			<table>
				<caption>${getEvent.ename } 이벤트 참여자</caption>
					<tr>
						<td>멤버 아이디</td><td>받을 금액</td><td>지금해야할 금액</td>
					</tr>
				<c:forEach var="edDto" items="${getEventHistory }">
					<tr>
						<td>
							${edDto.mid }
							<input type="hidden" name="mids" value="${edDto.mid }" >
						</td>
						<td>
							<c:if test="${edDto.edshare > 0}"> 
								${edDto.edshare }
								<input type="hidden" name="share" value="${edDto.edshare }" >
	    					</c:if>
	    					<c:if test="${edDto.edshare <= 0 }"> 
								0
	    					</c:if>
						</td>
						<td>
							<c:if test="${edDto.edshare < 0}"> 
								${edDto.edshare }
	    					</c:if>
	    					<c:if test="${edDto.edshare >= 0 }"> 
								0
	    					</c:if>
						</td>
					</tr>
				</c:forEach>
			<tr><td colspan="2">
				<input type="submit" value="수정">
				
			</td></tr>
		</table>
	</form>
	<button onclick=" return confirmDeleteEvent();">이벤트 삭제</button>
	</div>
</body>
</html>