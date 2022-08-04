<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<table>
			<tr><td>group ID : ${groupInfo.gid }</td></tr>
			<tr><td>group name : ${groupInfo.gid }</td></tr>
			<tr><td>date : ${groupInfo.grdate }</td></tr>
			<tr><td>group img : 
				<c:if test="${not empty groupInfo.gimg }">
					<img src="${conPath }/imgFileUpload/${groupInfo.gimg }">
				</c:if>
				<c:if test="${empty groupInfo.gimg }">
					첫번째 첨부파일 첨부 안 함
				</c:if>
			</td></tr>
			<tr><td>group summary : ${groupInfo.gcontent }</td></tr>
			<tr><td>group leader : ${groupInfo.mid }</td></tr>
			<tr><td><input type="button" value="이벤트 목록" onclick="location='${conPath }/event/eventList.do?gid=${groupInfo.gid }'"></td></tr>
			<tr><td><input type="button" value="이벤트 추가" onclick="location='${conPath }/event/selectEventType.do?gid=${groupInfo.gid }'"></td></tr>
			<tr><td><input type="button" value="이벤트 추가" onclick="location='${conPath }/event/insertEventForm.do?gid=${groupInfo.gid }'"></td></tr>
	</table>	
	
</body>
</html>