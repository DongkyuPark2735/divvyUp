<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<title>Insert title here</title>
<link href="${conPath}/css/style.css" rel="stylesheet">
<style>
	*{
		margin : 0 auto;
		
	}
	div{
		width : 500px;
		height : 500px;
		border: 1px solid black;
		display: inline-block;
		
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<button onclick="location='${conPath}/main/logout.do'">LOGOUT</button>
	<p>${mid }</p>
	<p>${aid }</p>
	<h1>메인페이지</h1>
	<div>
		<input type="button" value="UNIE" onclick="location.href='${conPath }/main/unieTestMain.do'"/>
	</div>
	<div>
		<p>실시간으로 바뀌면 안되는부분</p>
		<p id="currenttime"></p>
	</div>
	<div>
		<p>구분 2</p>
		
	</div>
	<div>
		<p>실시간으로 바뀌면 안되는부분2</p>
		<p id="currenttime2"></p>
	</div>

	<c:if test="${empty member and not empty admin }">
	  <button onclick="location='${conPath}/qboard/listUncheckedQboardForAdmin.do'">처리대기목록</button>
	  <button onclick="location='${conPath}/qboard/listCheckedQboardForAdmin.do'">처리목록</button>
	  <button onclick="location='${conPath}/adminSearch/adminSearchMain.do'">검색목록가기</button>
	</c:if>
	<c:if test="${not empty member and empty admin }">
	  <button onclick="location='${conPath}/qboard/listQboardForMember.do'">QBOARD</button>
	  <button onclick="location='${conPath}/qboard/listQboardForMe.do?mid=${mid }'">MYQBOARD</button>
	</c:if>
	

</body>
</html>