<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

	<script>
	   $(document).ready(function(){
		   $('input[name="share"], input[name="eamount"]').keyup(function(){
			   var sum = 0;
			   var tot = $('input[name="eamount"]').val();
			   var count = 1;
			    $('.share').each(function() {
			        sum += Number($(this).val());
			        count +=1;
			        if($(this).val() == '' ){
			        	 count -=1;
			        	 $('.share').val(0);
			        }
			    }); 
			    if (sum < tot){
						$('#Chk').text('금액 확인완료');
						$('#count').val(count);
					}else{
						$('#Chk').html('<b>금액을 확인해주세요</b>');
						$('#count').val(count);
					}
			 });
		   $('form').submit(function(){
				var Chk = $('#Chk').text().trim();
				if (Chk !='금액 확인완료'){
					alert('금액을 확인해주세요');
					return false;
				}
			});
	   });
	</script>
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
	
</head>
<body>
	<div id="content">
		<form action="${conPath }/event/insertEvent2.do?gid=${param.gid }&mid=${member.mid  }" method="post" enctype="multipart/form-data">
		<input type="hidden" name="method" value="insertEvent2">
		<table>
		<caption>그룹 ${param.gid }에 이벤트 추가</caption>
			<tr><td>지출명</td><td><input type="text" name="ename" id="ename"></td></tr>
			<tr><th>내용</th><td><textarea name="econtent" ></textarea></td></tr>
			<tr><td>eamount</td><td><input type="number" name="eamount"  required="required"></td></tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="eaddress"  class="eaddress" id="address_kakao" readonly="readonly">
				</td>
			</tr>
			<tr><td>image</td><td><input type="file" name="tempImage" ></td></tr>
			
			<tr><td>참여 멤버 선택</td>
			<td>
			<div class="section">
    			<c:forEach items="${printMidList }" var="mids" >
    			<c:if test="${mids.mid != member.mid }"> 
    			
    			 <input type="hidden" value="${mids.mid }" name="mids" >
    					${mids.mid } : <input type="number" name="share" class="share">
						<br>
					</c:if>
				</c:forEach>
				<div id="Chk"></div>
			</div>
			</td></tr>
			<tr><td>ecount</td><td><input type="number" name="ecount" id="count" readonly="readonly"></td></tr>
			<tr><td>이벤트 생성자</td><td><input type="text" name="mid"  value="${member.mid }" readonly="readonly"></td></tr>
			<tr><td colspan="2"><input type="submit" value="가입"></td></tr>
		</table>
		</form>
	</div>
</body>
</html>










