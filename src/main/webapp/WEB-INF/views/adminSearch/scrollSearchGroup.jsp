<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<c:forEach items="${scrollSearchGroupList}" var="groupList">
	<tr>
		<td>${groupList.gid}</td>
		<td>${groupList.gname}</td>
		<td>${groupList.grdate}</td>
		<td>${groupList.gcontent}</td>
		<td>${groupList.mid}</td>
	</tr>
</c:forEach>