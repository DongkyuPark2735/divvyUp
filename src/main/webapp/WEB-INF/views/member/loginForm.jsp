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
	<c:if test="${not empty result}">
		<script>alert('${result}');</script>
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
<<<<<<< HEAD
	        </td>
	      </tr>
	    </table>
	  </form>
	</div>
	<p>
		<input type="button" value="임시 그룹게시판 이동 버튼" onclick="location.href='${conPath}/groupboard/groupDetil.do?gid=100'">
	</p>
=======
	          <input type="button" value="AMODE" onclick="location='${conPath}/admin/adminloginForm.do'">
	        </td>
	      </tr>
	    </table>
	    <button onclick="location='${conPath}/qboard/listQboardForMember.do'">QBOARD</button>
	  </form>
	</div>
>>>>>>> 1cdd6702cab83b23a214fd9ec8601e97792e39dd
</body>
</html>