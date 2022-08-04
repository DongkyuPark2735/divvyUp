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
	    <form action="${conPath }/qboard/modifyQboard.do" method="post">
	      <input type="hidden" name="qbid" value="${qboard.qbid }">
	      <input type="hidden" name="pageNum" value="${param.pageNum }">
	      <table>
	        <tr>
	          <th>제 목<th>
	          <td colspan="3"><input type="text" name="qbtitle" value="${qboard.qbtitle }"></td>
	        </tr>
	        <tr>
	          <th>작성자</th>
	          <td>${mid }</td>
	          <th>해당글</th>
	          <td>${qboard.qbid }</td>
	        </tr>
	        <tr>
	          <td colspan="4"><textarea rows="5" cols="20" name="qbcontent">${qboard.qbcontent }</textarea></td>
	        </tr>
	        <tr>
	          <td colspan="4">
	            <input type="submit" value="작성">
	          </td>
	        </tr>
	      </table>
	    </form>
	  </div>
</body>
</html>