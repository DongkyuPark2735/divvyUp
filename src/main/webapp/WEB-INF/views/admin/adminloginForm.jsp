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
  <link href="${conPath }/css/member/login.css" rel="stylesheet">
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
	
	<div id="login_wrap">
		<header>
		  <h2>LOGIN</h2>
		</header>
		<form action="${conPath }/admin/adminlogin.do" method="post">
	     <div class="input-box">
	       <input id="username" type="text" name="aid" required="required" placeholder="아이디" value="${aid }">
           <label for="username">ID</label>
	     </div>
	     
	     <div class="input-box">
	       <input id="password" type="password" name="apw" required="required" placeholder="비밀번호" value="${apw }">
           <label for="password">PW</label>
	     </div>
	     <div>&nbsp;</div>
         <input type="submit" value="로그인">
	  </form>
	</div>
	
	
	<%-- <div>
	  <form action="${conPath }/admin/adminlogin.do" method="post">
	    <table>
	      <caption>ALOGIN</caption>
	      <tr>
	        <th>ID</th>
	        <td><input type="text" name="aid" required="required" value="${aid }"></td>
	      </tr>
	      <tr>
	        <th>PW</th>
	        <td><input type="password" name="apw" required="required" value="${apw }"></td>
	      </tr>
	      <tr>
	        <td colspan="2">
	          <input type="submit" value="ALOGIN"> 
	        </td>
	      </tr>
	    </table>
	  </form>
	</div> --%>
</body>
</html>