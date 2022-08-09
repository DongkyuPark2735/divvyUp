<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	window.onload = function(){
	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("address_kakao").value = data.address; // 주소 넣기
	            }
	        }).open();
	    });
	}
	</script>
	<script>
	   $(document).ready(function(){
		   var numberOfChecked = 0;
		   $('.mids').click(function() {
			   numberOfChecked = $('input:checkbox:checked').length;
				$('#msg').val(numberOfChecked);
			});
	   });
	</script>
</head>
<body>
	<div id="content">
		<form action="${conPath }/event/insertEvent.do?gid=${param.gid }&mid=${member.mid  }" method="post" enctype="multipart/form-data">
		<input type="hidden" name="method" value="insertEvent">
		<table>
		<caption>그룹 ${param.gid }에 이벤트 추가</caption>
			<tr><th>지출명</th><td><input type="text" name="ename" id="ename"></td></tr>
			<tr><th>내용</th><td><textarea name="econtent" ></textarea></td></tr>
			<tr><th>eamount</th><td><input type="number" name="eamount"  required="required"></td></tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="eaddress"  class="eaddress" id="address_kakao" readonly="readonly">
				</td>
			</tr>
			
			<tr><th>참여 멤버 선택</th>
			<td>
    			<c:forEach items="${printMidList }" var="mids" >
    			<c:if test="${mids.mid != member.mid }"> 
    				<div>
    					<input type="checkbox" id="${mids.mid }" class="mids" name="mids" value="${mids.mid }" >
   					  	<label for="${mids.mid }">${mids.mid }</label>
     				</div>	
     				</c:if>
				</c:forEach>
			</td></tr>
			<tr><th>ecount</th><td><input type="number" name="ecount" id="msg" readonly="readonly"></td></tr>
			<tr><th>이벤트 생성자</th><td><input type="text" name="mid"  value="${member.mid }" readonly="readonly"></td></tr>
			<tr><td colspan="2"><input type="submit" value="가입"></td></tr>
		</table>
		</form>
	</div>
</body>
</html>