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
			<c:if test="${not empty plist.gbfilename}">
				<c:if test="${not empty plist.gbcontent}">
					<td>
						<img src="${conPath }/groupFileBoardUploadFiles/${plist.gbfilename}" alt="첨부이미지" width="100" height="100"><br>
						${plist.gbcontent}</td>
				</c:if>
				<c:if test="${empty plist.gbcontent}">
					<td>
						<img src="${conPath }/groupFileBoardUploadFiles/${plist.gbfilename}" alt="첨부이미지" width="100" height="100"><br>
					</td>
				</c:if>
			</c:if>
			<c:if test="${empty plist.gbfilename}">
				<td>${plist.gbcontent}</td>
			</c:if>
			<td>${plist.gbrdate }</td>
		</tr>
	</table>
</c:forEach>