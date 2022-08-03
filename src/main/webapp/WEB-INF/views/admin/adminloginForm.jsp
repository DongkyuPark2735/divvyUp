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
	<div>
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
	</div>
</body>
</html>