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
  <style>
  	th {
  		border: 1px solid red;
  	}
    td {
    	border: 1px solid red;
    }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <script>
     $(document).ready(function(){
        
     });
  </script>
</head>
<body>
	<div>
	  <table>
	    <tr>
	      <th>제 목<th>
	      <td colspan="3">${qboard.qbtitle }</td>
	    </tr>
	    <tr>
	      <th>작성자</th>
	      <td>${qboard.mid }</td>
	      <th>등록일</th>
	      <td>${qboard.qbrdate }</td>
	    </tr>
	    <tr>
	      <th>글번호</th>
	      <td>${qboard.qbid }</td>
	      <th>처리상태</th>
	      <td>
	        <c:if test="${qboard.qbreplycheck == 1 }">
	            처리완료
	        </c:if>
	        <c:if test="${qboard.qbreplycheck == 0 }">
	            접수
	        </c:if>
	      </td>
	    </tr>
	  </table>
	  <div>
	  ${qboard.qbcontent }
	  </div>
	</div>
	<div></div>
	<div>
	  <form action="${conPath }/aboard/writeAboard.do" method="post">
	    <table> <!-- 폼태그 안에 감싸야된다! -->
	      <tr>
	        <th colspan="2">제 목<th>
	        <td colspan="3"><input type="text" name="abtitle"></td>
	      </tr>
	      <tr>
	        <th>작성자</th>
	        <td><input type="text" name="aid" value="${aid }" readonly="readonly"></td>
	        <th>해당글</th>
	        <td><input type="number" name="qbid" value="${qboard.qbid }" readonly="readonly"></td>
	      </tr>
	      <tr>
	        <td colspan="4"><textarea rows="5" cols="20" name="abcontent"></textarea></td>
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