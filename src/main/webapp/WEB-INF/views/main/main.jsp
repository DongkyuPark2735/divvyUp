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
<script>
		$(document).ready(function(){
			var curDate = new Date();
			var curTime = curDate.getFullYear() + "-" 
			+ (curDate.getMonth() + 1) + "-" 
			+ curDate.getDate() + " " 
			+ curDate.getHours() + ":" 
			+ curDate.getMinutes() + ":" 
			+ curDate.getSeconds();
			
			$('#currenttime').text(curTime);
			$('#currenttime2').text(curTime);
		});
</script>
</head>
<body>

	<h1>메인페이지</h1>
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
</body>
</html>