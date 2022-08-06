<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<c:if test="${not empty result}">
		<script>
			alert('${result}');
		</script>
	</c:if>
	<c:if test="${not empty joinResult}">
		<script>alert('${joinResult}');</script>
	</c:if>
	<div>
	  <form action="${conPath }/member/login.do" method="post">
	    <table>
	      <caption>LOGIN</caption>
	      <tr>
	        <th>ID</th>
	        <td><input type="text" name="mid" required="required" value="${mid }"></td>
	      </tr>
	      <tr>
	        <th>PW</th>
	        <td><input type="password" name="mpw" required="required" value="${mpw }"></td>
	      </tr>
	      <tr>
	        <td colspan="2">
	          <input type="submit" value="LOGIN">
	          <input type="button" value="AMODE" onclick="location='${conPath}/admin/adminloginForm.do'">
	        </td>
	      </tr>
	    </table>
	  </form>
	  <button onclick="location='${conPath}/member/joinForm.do'">JOIN</button>
	  <button onclick="location='${conPath}/qboard/listQboardForMember.do'">QBOARD</button>
	  <p>
		<input type="button" value="임시 그룹게시판 이동 버튼" onclick="location.href='${conPath}/groupboard/groupDetil.do?gid=1'">
	  </p>
	</div>
</body>
</html>