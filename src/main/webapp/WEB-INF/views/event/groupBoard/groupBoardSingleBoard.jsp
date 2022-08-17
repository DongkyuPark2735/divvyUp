<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<td class="gidClick">${singleLatestGroupboard.gbid }</td>
<td>${singleLatestGroupboard.gid }</td>
<td>${singleLatestGroupboard.mid }</td>
<c:if test="${not empty singleLatestGroupboard.gbfilename}">
	<c:if test="${not empty singleLatestGroupboard.gbcontent}">
		<td><img
			src="${conPath }/groupFileBoardUploadFiles/${singleLatestGroupboard.gbfilename}"
			alt="첨부이미지" width="100" height="100"><br>
			${singleLatestGroupboard.gbcontent}</td>
	</c:if>
	<c:if test="${empty singleLatestGroupboard.gbcontent}">
		<td><img
			src="${conPath }/groupFileBoardUploadFiles/${singleLatestGroupboard.gbfilename}"
			alt="첨부이미지" width="100" height="100"><br></td>
	</c:if>
</c:if>
<c:if test="${empty singleLatestGroupboard.gbfilename}">
	<td>${singleLatestGroupboard.gbcontent}</td>
</c:if>
<td>${singleLatestGroupboard.gbrdate }</td>
<td hidden="" class="joinMList">접속 회원 : ${sessionMList }</td>
