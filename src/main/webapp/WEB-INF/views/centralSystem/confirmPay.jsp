
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
<link href="${conPath }/css/centralSystem/pay.css" rel="stylesheet">
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
<div id="wrap">
	<form action="${conPath}/centralSystem/pay.do?mid=${member.mid }&gid=${gid }" method="post">
		<table>
			<tr>
				<td colspan="2">
					<img src="https://cdn.logojoy.com/wp-content/uploads/2018/05/30160306/447.png">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="pay">${member.mid }님결제진행</div>
				</td>
			</tr>
			<tr>
				<td>지불 금액 확인 :</td>
				<td ><b>${gdbalance}</b></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="mpw" required="required" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="pwChkResult">&nbsp;</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="btnPay" value="결제진행" size="8" ></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>
