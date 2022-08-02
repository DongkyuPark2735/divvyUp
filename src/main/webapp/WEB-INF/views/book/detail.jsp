<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
	#content {
		width: 800px; height:350px;
		margin: 50px auto;
	}
	img{width: 100px;}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<table>
		<caption>${bDto.bnum }번 책 상세보기</caption>
		<tr><td colspan="2">
			<c:if test="${not empty bDto.bimg1 }">
				<img src="${conPath }/bookImgFileUpload/${bDto.bimg1 }">
			</c:if>
			<c:if test="${empty bDto.bimg1 }">
				첫번째 첨부파일 첨부 안 함
			</c:if>
			<c:if test="${not empty bDto.bimg2 }">
				<img src="${conPath }/bookImgFileUpload/${bDto.bimg2 }">
			</c:if>
			<c:if test="${empty bDto.bimg2 }">
				두번째 첨부파일 첨부 안 함
			</c:if>
			</td></tr>
			<tr>
				<td>제목</td>
				<td>${bDto.btitle }</td>
			</tr>
			<tr>
				<td>작가</td>
				<td>${bDto.bwriter }</td>
			</tr>
			<tr>
				<td>설명</td>
				<td>${bDto.binfo }</td>
			</tr>
			<tr>
				<td colspan="2">
					<button onclick="location='book.do?method=modifyForm&bnum=${bDto.bnum}&pageNum=${param.pageNum}'">수정</button>
					<input type="button" value="목록보기" class="btn" onclick="history.back()">
				</td>
			</tr>
		</table>
		</div>
</body>
</html>

















				
				
			</td></tr>
		</table>
	
	
		
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
