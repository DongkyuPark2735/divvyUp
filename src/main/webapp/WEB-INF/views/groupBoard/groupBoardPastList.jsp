<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<c:forEach var="plist" items="${pastList }">
		<tr>
			<td>${plist.gbid }</td>
			<td>${plist.gid }</td>
			<td>${plist.mid }</td>
			<c:if test="${not empty plist.gbfilename}">
				<c:if test="${not empty plist.gbcontent}">
					<td>
						<img src="${conPath }/groupFileBoardUploadFiles/${plist.gbfilename}" alt="첨부이미지" width="300" height="200"><br>
						${plist.gbcontent}</td>
				</c:if>
				<c:if test="${empty plist.gbcontent}">
					<td>
						<img src="${conPath }/groupFileBoardUploadFiles/${plist.gbfilename}" alt="첨부이미지" width="300" height="200"><br>
					</td>
				</c:if>
			</c:if>
			<c:if test="${empty plist.gbfilename}">
				<td>${plist.gbcontent}</td>
			</c:if>
			<td>
				<img class="imgForDelete" alt="글삭제" src="${conPath }/groupFileBoardUploadFiles/pngwing.png"	width="10" height="10">
			</td>
			<td>
				<fmt:formatDate value="${plist.gbrdate }" pattern="yy년MM월dd일 HH:mm:ss"/>
			</td>
		</tr>
</c:forEach>