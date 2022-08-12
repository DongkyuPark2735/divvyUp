<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<c:forEach items="${scrollSearchMemberList}" var="memberList">
	<tr>
		<td>${memberList.mid}</td>
		<td>${memberList.mname}</td>
		<td>${memberList.memail}</td>
		<td>${memberList.mrdate}</td>
	</tr>
</c:forEach>