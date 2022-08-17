<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title></title>
<link href="${conPath}/css/groups/groupInsert.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	$(document).ready(function() {
		var numberOfChecked = 1;
		$('.mids').click(function() {
			numberOfChecked = $('input:checkbox:checked').length;
			$('#msg').val(numberOfChecked + 1);
		});
		var g = document.getElementById("unclickable").disabled = false;
	});
</script>
<meta charset="UTF-8">
</head>
<body>
	<nav class="header">
		<div class="container">
			<h1 class="logo">
				<a href="${conPath}/main/main.jsp">D<span>U</span></a>
			</h1>
			<ul>
				<li><a href="${conPath}/member/modifyMemberForm.do?mid=${mid }">${mid }님
						▶</a></li>
				<li><a
					href="${conPath}/notification/notificationConfirmForm.do"
					class="notification"> <img src="${conPath}/icon/noti.png"
						class="imgNoti" />
						<div class="badge">${uncheckdNotificationCnt }</div>
				</a></li>
				<li><a href="${conPath }/main/mainto.do">홈으로</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="${conPath}/main/logout.do"> <img
						src="${conPath}/icon/logout.png" class="imgLogout" />
				</a></li>
			</ul>
		</div>
	</nav>
<div id="totalWrap">
	<div id="content">
		<form action="${conPath }/groups/groupInsert.do?mid=${member.mid  }&windowType=${2}"
			method="post" enctype="multipart/form-data">
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<input type="hidden" name="method" value="insertEvent">
			<table>
				<tr><td colspan="2"><h1>그룹 생성 : <span style="color:#1DBF73;">${nextGid}</span></h1></td></tr>
				<tr>
					<td class="titles" style="text-align:left; padding-left:40px;"> 그룹 아이디</td>
					<td>${nextGid}</td>
				</tr>
				<tr>
					<td class="titles" style="text-align:left; padding-left:40px;">그룹 이름<b>&nbsp;*&nbsp;</b></td>
					<td><input type="text" name="gname" class="gname" style="text-align:center;" required="required"></td>
				</tr>
				<tr>
					<td class="titles" style="text-align:left; padding-left:40px;">그룹 이미지 첨부</td>
					<td><input type="file" name="gimage" ></td>
				</tr>
				<tr>
					<td class="titles" style="text-align:left; padding-left:40px; ">그룹 설명</td>
					<td><textarea name="gcontent" rows="6" style=" border: 0.5px solid grey; outline: none; text-align:center;" placeholder= "Please insert here"></textarea></td>
				</tr>
				<tr>
					<td class="titles" style="text-align:left; padding-left:40px;">그룹 멤버 추가<b>&nbsp;*&nbsp;</b></td>
					
					<td><div class="scrollable"><c:forEach items="${followList }" var="fids">
							
								<input type="checkbox" class="fids" name="fids" id="${fids}"
									value="${fids }"style="padding-bottom:5px;" 
									<c:if test="${fids eq member.mid }"> 
    																								onclick="return false" checked="checked"
    																								style="accent-color:grey; color:grey;"
    																							</c:if>>
								<label for="${fids }" >${fids }</label>
								<br>
						</c:forEach></div></td>
						
				</tr>
				<tr> 
					<td class="titles" style="text-align:left; padding-left:40px;">그룹 생성자</td>
					<td>${member.mid }</td>
				</tr>
				<tr>
					<td class="titles" style="text-align:left; padding-left:40px;">생성일</td>
					<td><fmt:formatDate type="date" value="${now}" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="가입" class="btn_style">
					<input type="button" value="뒤로가기" onclick="history.back()" class="btn_style"></td>
				</tr>
			</table>
		</form>
	</div>
	 <div id="content2">
			<img src="https://uploads-ssl.webflow.com/5ebcf5e07ad732bcac1fcb5a/5f9f11924a37c016bf4740fc_pexels-canva-studio-3194519-683x1024.jpeg" >
	</div>
	</div> 
</body>
</html>