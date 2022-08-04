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
	<div>
	  <form action="${conPath }/qboard/writeQboard.do" method="post">
	  	<input type="hidden" name="mid" value="${mid }">
	    <table>
	      <tr>
	        <th>제 목<th>
	        <td><input type="text" name="qbtitle" required="required"></td>
	        <th>작성자</th>
	        <td>${mid }</td>
	      </tr>
	      <tr>
	        <td colspan="4"><textarea rows="5" cols="20" name="qbcontent" required="required"></textarea></td>
	      </tr>
	      <tr>
	        <td colspan="4">
	          <input type="submit" value="작성">
	        </td>
	      </tr>
	    </table>
	  </form>
	  <div>
	  ${qboard.qbcontent }
	  </div>
	</div>
	<button onclick="location='${conPath}/qboard/listQboardForMember.do?pageNum=${param.pageNum }'">LIST</button>
</body>
</html>