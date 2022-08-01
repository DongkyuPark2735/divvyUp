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

	<input type="button" value="그룹디테일로 ㄱㄱ" 
	onclick="location.href='${conPath}/groupboard/groupDetil.do?gid=100'">	
</body>
</html>