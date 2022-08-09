<%@ page language="java" contentType="text/html; charset= UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
   <title>Home</title>
   <meta charset="UTF-8">
   <link href="${conPath }/css/style.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
   <script>
      $(document).ready(function(){
         
      });
   </script>
</head>
<body>
	<h2>404</h2>
	<h2>죄송합니다 요청하신 페이지는 존재하지 않습니다.</h2>
	<h3>에러 명 ${errorName }</h3>
	<h3>에러 메시지 ${errorMSG }</h3>
</body>
</html>