<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
</head>
<body>
		<table>
			<caption>EVENT LIST</caption>
			
			<c:forEach var="event" items="${eventList }">
			<tr>
				<td>
				   이벤트 아이디: ${event.eid }<br>
				   이벤트 이름:  ${event.ename }<br></a>
				   이벤트 내용:  ${event.econtent }<br>
				   이벤트 사진: <img src="${conPath }/eventImgFileUpload/${event.eimage}"><br>
				   이벤트 총지출:  ${event.eamount }<br>
				   이벤트 주소:  ${event.eaddress }<br>
				   이벤트 참여 자 (${event.ecount }) : <br>
				   날짜:  ${event.erdate }<br>
				   낸 사람:  ${event.mid }<br>
				  <c:if test="${check !=1 }">
				    <input type="button" value="정보수정" onclick="location='${conPath }/event/modifyEventForm.do?eid=${event.eid }&gid=${event.gid }'">
				</c:if>
				</td>
				</tr>
			</c:forEach>
			
		</table>
	
</body>
</html>