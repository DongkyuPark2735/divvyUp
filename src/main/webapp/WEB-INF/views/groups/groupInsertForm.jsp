<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<script>
				 $(document).ready(function() {
					 $('#summernote').summernote({
					        height: 300,
					        minHeight: null,
					        maxHeight: null,
					        lang : 'ko-KR',
					        onImageUpload: function(files, editor, welEditable) {
					                sendFile(files[0], editor, welEditable);
					            }
	
					    });
				 });
	</script>
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
			<tr><td>그룹 설명</td><td><textarea name="gcontent" id="summernote"></textarea></td></tr>			
			<tr><td>그룹 멤버 추가</td>
			<td>
    			<c:forEach items="${followList }" var="fids" >
    				<div>
    					<input type="checkbox" class="fids" name="fids" id="${fids}" value="${fids }" <c:if test="${fids eq member.mid }"> 
    																								onclick="return false" checked="checked"
    																								style="accent-color:grey; color:grey;"
    																							</c:if>>
   					  	<label for="${fids }">${fids }</label>
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