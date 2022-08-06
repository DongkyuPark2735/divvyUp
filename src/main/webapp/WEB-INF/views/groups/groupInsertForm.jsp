<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
	<script>
	   $(document).ready(function(){
		   var numberOfChecked = 1;
		   $('.mids').click(function() {
			   numberOfChecked = $('input:checkbox:checked').length;
				$('#msg').val(numberOfChecked+1);
			});
		   var g = document.getElementById("unclickable").disabled= false;
	   });
	</script>
	
	
	<meta charset="UTF-8">
</head>
<body>
	<div id="content">
		<form action="${conPath }/groups/groupInsert.do?mid=${member.mid  }" method="post" enctype="multipart/form-data">
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<input type="hidden" name="method" value="insertEvent">
		<table>
		<caption>그룹 생성하기</caption>
			<tr><td>그룹 아이디</td><td><input type="text" name="gid" id="gid" value="${nextGid}" readonly="readonly"></td></tr>
			<tr><td>그룹 이름</td><td><input type="text" name="gname"></td></tr>
			<tr><td>그룹 이미지 첨부</td><td><input type="file" name="tempImage" ></td></tr>
			<tr><td>그룹 설명</td><td><input type="text" name="gcontent"></td></tr>
			
			<tr><td>그룹 멤버 추가</td>
			<td>
    			<c:forEach items="${memberList }" var="mids" >
    				<div>
    					<input type="checkbox" class="mids" name="mids" id="${mids.mid }" value="${mids.mid }" <c:if test="${mids.mid eq member.mid }"> 
    																								onclick="return false" checked="checked"
    																								style="accent-color:grey; color:grey;"
    																							</c:if>>
   					  	<label for="${mids.mid }">${mids.mid }</label>
     				</div>	
				</c:forEach>
			</td></tr>
			<tr><td>그룹 생성자</td><td><input type="text" name="mid"  value="${member.mid }" readonly="readonly"></td></tr>
			<tr><td>생성일</td><td><fmt:formatDate type="date"  value="${now}" /></td></tr>
			<tr><td colspan="2"><input type="submit" value="가입"></td></tr>
		</table>
		</form>
	</div>
</body>
</html>