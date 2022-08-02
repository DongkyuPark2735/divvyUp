<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<style>
		#content {width: 800px; height:350px;margin: 50px auto;}
	</style>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${conPath }/js/address.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<form action="${conPath }/member.do" method="post">
		<input type="hidden" name="method" value="modify">
		<input type="hidden" name="mid" value="${member.mid }">
		<table>
			<tr><td>아이디</td><td>${member.mid }</td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="mpw" value="${member.mpw }"></td></tr>
			<tr><td>이름</td><td><input type="text" name="mname" value="${member.mname }"></td></tr>
			<tr><td>메일</td><td><input type="email" name="memail" value="${member.memail }"></td></tr>
			<tr><td>가입일</td><td><input type="date" name="mrdate" value="${member.mrdate }"></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="수정">
			</td></tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>