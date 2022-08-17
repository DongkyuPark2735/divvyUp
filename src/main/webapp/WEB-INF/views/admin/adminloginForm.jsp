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
  <link href="${conPath }/css/member/join2.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <script>
     $(document).ready(function(){
        
     });
  </script>
</head>
<body>
	<c:if test="${not empty adminloginResult}">
		<script>alert('${adminloginResult}');</script>
	</c:if>
	
	<nav class="header">
		<div class="container">
			<h1 class="logo">
				<a href="${conPath}/member/loginForm.do">D<span>U</span></a>
			</h1>
			<ul>
				<li><a href="${conPath}/member/loginForm.do">로그인</a></li>
				<li class="joinBtn"><a href="#" >회원가입</a></li>
				<li><a href="${conPath}/qboard/listQboardForMember.do">Q&A</a></li>
			</ul>
		</div>
	</nav>
	
	<div class="mainSection2">
   		<div id="login_wrap">
        	<h2>관리자 모드</h2>
      		<form action="${conPath }/admin/adminlogin.do" method="post">
        		<div class="input-box">
          			<input id="username" class="login_btn" type="text" name="aid" required="required" placeholder="아이디" value="${aid }">
           			<label for="username" style="top:5px; padding-left:13px;">아이디</label>
        		</div>
        
        		<div class="input-box">
          			<input id="password" class="login_btn" type="password" name="apw" required="required" placeholder=" 비밀번호" value="${apw }">
           			<label for="password" style="top:5px;  padding-left:12px;">비밀번호</label>
        		</div>
        		<div id="forgot"></div>
         		<input type="submit" value="로그인">
     		</form>
   		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
	
</body>
</html>