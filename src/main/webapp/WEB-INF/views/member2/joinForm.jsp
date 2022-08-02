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
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${conPath }/js/address.js"></script>
	<script>
	$(document).ready(function(){
		$('.idconfirm').click(function(){
			$.ajax({
				url : '${conPath}/member.do',
				datatype : 'html',
				data : "method=idConfirm&mid="+$('#mid').val(),
				success : function(data, status){
					$('#idConfirmMsg').html(data);
				}
			});
		});
		$('form').submit(function(){
			var idConfirmResult = $('#idConfirmMsg').text().trim();
			if(idConfirmResult!='사용가능한 ID입니다'){
				alert('사용가능한 ID인지 중복확인후 가입가능');
				$('input[name="mid"]').focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<form action="${conPath }/member2.do?method=join" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="mid" id="mid">
					<input type="button" class="idconfirm" value="중복확인"><br>
					<span id="idConfirmMsg"></span>
				</td>
			</tr>
			<tr><td>비밀번호</td><td><input type="password" name="mpw" required="required"></td></tr>
			<tr><td>이름</td><td><input type="text" name="mname"  required="required"></td></tr>
			<tr><td>메일</td><td><input type="email" name="memail"  required="required"></td></tr>
			<tr><td>가입일</td><td><input type="date" name="mrdate"  required="required"></td></tr>
			<tr><td colspan="2"><input type="submit" value="가입"></td></tr>
		</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
