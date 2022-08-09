
<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="UTF-8">
<link href="${conPath }/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
		$('input[name="mpw"]').keyup(function() {
			var actualPw = ${getMemberinfo.mpw};
			var pwToCheck = $('input[name="mpw"]').val();
				if (actualPw == pwToCheck) {
					$('#pwChkResult').html('<p style="color:green; font-weight:bold;">비밀번호 확인 완료</p>');
				} else {
					$('#pwChkResult').html('<p style="color:red; font-weight:bold;">비밀번호 불일치</p>');
				}
		});
		$('form').submit(function(){
			var pwChkResult     = $('#pwChkResult').text().trim();
			if(pwChkResult !='비밀번호 확인 완료'){
				alert('비밀번호 화인 후 진행 가능합니다');
				return false;
			}
			
			
		});
	});
</script>

</head>
<body>
	<form action="${conPath}/centralSystem/get.do?mid=${member.mid }&gid=${gid }" method="post">
		<table>
			<caption>${getMemberinfo.mname }님 개인정보인증</caption>
			<tr>
				<th>받을 금액 확인 :</th>
				<td >${gdbalance}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mpw" required="required" />
					<div id="pwChkResult">&nbsp;</div></td>
			</tr>
			<tr colspan="2">
				<td><input type="submit" value="받기" size="8" ></td>
			</tr>
		</table>
	</form>
</body>
</html>
