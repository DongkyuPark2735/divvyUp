<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<c:forEach items="${scrollSearchEventList}" var="eventList">
	<tr>
		<td>${eventList.eid}</td>
		<td>${eventList.ename}</td>
		<td>${eventList.econtent}</td>
		<td>${eventList.eamount}</td>
		<td>${eventList.eaddress}</td>
		<td>${eventList.ecount}</td>
		<td>${eventList.erdate}</td>
		<td>${eventList.mid}</td>
		<td>${eventList.gid}</td>
	</tr>
</c:forEach>