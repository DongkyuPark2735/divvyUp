<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
</head>
<body>
   <c:if test="${param.mid != '' and midConfirmResult == 1 }">
      <b>중복된 ID</b>
   </c:if>
   <c:if test="${param.mid != '' and midConfirmResult == 0 }">
      <i>사용가능 ID</i>
   </c:if>
  <c:if test="${param.mid == '' }">
     
  </c:if>
</body>
</html>