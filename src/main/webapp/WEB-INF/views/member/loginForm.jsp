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
<link href="${conPath }/css/member/login.css" rel="stylesheet">
<style>
   
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
   $(document).ready(function() {
     
   });
</script>
<script>
</script>
 <!-- <meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0"> -->
</head>
<body>
<<<<<<< HEAD
   <c:if test="${not empty result}">
      <script>
         alert('${result}');
      </script>
   </c:if>
   <c:if test="${not empty searchMidResult}">
      <script>
         alert('${searchMidResult}');
      </script>
   </c:if>
   <c:if test="${not empty searchMpwResult}">
      <script>
         alert('${searchMpwResult}');
      </script>
   </c:if>
   <c:if test="${not empty joinResult}">
      <script>alert('${joinResult}');</script>
   </c:if>
     
   <div id="login_wrap">
      <header>
        <h2>LOGIN</h2>
      </header>
      <form action="${conPath }/member/login.do" method="post">
        <div class="input-box">
          <input id="username" type="text" name="mid" required="required" placeholder="아이디" value="${mid }">
           <label for="username">ID</label>
        </div>
        
        <div class="input-box">
          <input id="password" type="password" name="mpw" required="required" placeholder="비밀번호" value="${mpw }">
           <label for="password">PW</label>
        </div>
        <div id="forgot"><a href="${conPath}/member/searchIdPwForm.do">ID/PW 찾기</a></div>
         <input type="submit" value="로그인">
     </form>
   </div>
     <button class="joinBtn">JOIN</button>
<%--      <button onclick="location='${conPath}/member/joinForm.do'" class="joinBtn">JOIN</button> --%>
     
     
     
     
     <button onclick="location='${conPath}/admin/adminloginForm.do'">AMODE</button>
     <button onclick="location='${conPath}/qboard/listQboardForMember.do'">QBOARD</button>

    <%--  <form action="${conPath }/member/login.do" method="post">
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
           </td>
         </tr>
       </table>
     </form> --%>
     <%-- <button onclick="location='${conPath}/member/searchIdPwForm.do'">FIND ID&PW</button> --%>
=======
	<c:if test="${not empty result}">
		<script>
			alert('${result}');
		</script>
	</c:if>
	<c:if test="${not empty searchMidResult}">
		<script>
			alert('${searchMidResult}');
		</script>
	</c:if>
	<c:if test="${not empty searchMpwResult}">
		<script>
			alert('${searchMpwResult}');
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
	  <button onclick="location='${conPath}/member/searchIdPwForm.do'">FIND ID&PW</button>
	  <button onclick="location='${conPath}/qboard/listQboardForMember.do'">QBOARD</button>
	  <p>
		<input type="button" value="임시 그룹게시판 이동 버튼 그룹 1 회원 aaa" onclick="location.href='${conPath}/groupboard/groupDetil.do?gid=1&mid=aaa'">
		<input type="button" value="임시 그룹게시판 이동 버튼 그룹 1 회원 bbb" onclick="location.href='${conPath}/groupboard/groupDetil.do?gid=1&mid=bbb'">
		<input type="button" value="임시 그룹게시판 이동 버튼 그룹 1 회원 ccc" onclick="location.href='${conPath}/groupboard/groupDetil.do?gid=1&mid=ccc'">
		<input type="button" value="임시 그룹게시판 이동 버튼 그룹 2 회원 aaa" onclick="location.href='${conPath}/groupboard/groupDetil.do?gid=2&mid=aaa'">
		<input type="button" value="임시 그룹게시판 이동 버튼 그룹 2 회원 bbb" onclick="location.href='${conPath}/groupboard/groupDetil.do?gid=3&mid=bbb'">
	  </p>
	</div>
>>>>>>> babeadf72e944c959f5ccb566d2ecbc1c2b1cb4b
</body>
</html>