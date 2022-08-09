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

	<c:forEach var="groups" items="${groupList }">
		<input type="button" value="${groups.gid }" onclick="location='${conPath }/groups/groupInfo.do?gid=${groups.gid }'">
	</c:forEach>
	<input type="hidden" name=mid value="${member.mid }">
	<input type="button" value="그룹 생성" onclick="location='${conPath }/groups/groupInsertForm.do?mid=${member.mid }'">
</body>
</html>


<%-- <body>
	<jsp:forward page="member/loginForm.do"/> --%>