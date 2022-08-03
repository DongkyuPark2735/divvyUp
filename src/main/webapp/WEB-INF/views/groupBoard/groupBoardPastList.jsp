<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
	<c:forEach var="plist" items="${pastList }">
		<table>
			<tr>
				<td>${plist.gbid }</td>
				<td>${plist.gid }</td>
				<td>${plist.mid }</td>
				<td>${plist.gbcontent }</td>
				<td>${plist.gbfilename }</td>
				<td>${plist.gbrdate }</td>
			</tr>
		</table>
	</c:forEach>