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
	   });
	</script>
	
	
	<meta charset="UTF-8">
</head>
<body>
	<div id="content">
		<form action="${conPath }/event/insertEvent.do?gid=${param.gid }&mid=${member.mid  }" method="post" enctype="multipart/form-data">
		<input type="hidden" name="method" value="insertEvent">
		<table>
		<caption>그룹 ${param.gid }에 이벤트 추가</caption>
			<tr><td>지출명</td><td><input type="text" name="ename" id="ename"></td></tr>
			<tr><td>econtent</td><td><input type="text" name="econtent"></td></tr>
			<tr><td>eamount</td><td><input type="number" name="eamount"  required="required"></td></tr>
			<tr><td>eaddress</td><td><input type="text" name="eaddress"  required="required"></td></tr>
			<tr><td>image</td><td><input type="file" name="tempImage" ></td></tr>
			
			<tr><td>참여 멤버 선택</td>
			<td>
    			<c:forEach items="${printMidList }" var="mids" >
    				<div>
    					<input type="checkbox" id="${mids.mid }" class="mids" name="mids" value="${mids.mid }">
   					  	<label for="${mids.mid }">${mids.mid }</label>
     				</div>	
				</c:forEach>
			</td></tr>
			<tr><td>ecount</td><td><input type="number" name="ecount" id="msg" readonly="readonly"></td></tr>
			<tr><td>이벤트 생성자</td><td><input type="text" name="mid"  value="${member.mid }" readonly="readonly"></td></tr>
			<tr><td colspan="2"><input type="submit" value="가입"></td></tr>
		</table>
		</form>
	</div>
</body>
</html>