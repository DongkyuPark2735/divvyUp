<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<style>
		#content {width: 800px; height:350px;margin: 50px auto;}
	</style>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

	
	<script>
		function deleteMember(mid) {
			location='${conPath }/groupDetail/deleteMember.do?gid=${groupInfo.gid }&mid='+mid;
		}
	</script>
	<script>
		function confirmDeleteGroup() {
				let confirmDeleteGroup = confirm("그룹를 삭제하시겠습니까? 삭제 후 복구 불가합니다");
				if (confirmDeleteGroup) {
					location='${conPath}/groups/deleteGroup.do?gid=${groupInfo.gid}';
		}
		}
	</script>
</head>
<body>
	<div id="content">
	<form action="${conPath }/groups/modify.do?mid=${member.mid  }&gid=${groupInfo.gid }" method="post" enctype="multipart/form-data">
		<table>
			<caption>${groupInfo.gid }번 정보 수정하기</caption>
			
			<tr><td>그룹 이름</td><td><input type="text" name="gname" value="${groupInfo.gname }"></td></tr>
			<tr><td>그룹 이미지 첨부</td><td><input type="file" name="tempImage" >${groupInfo.gimg }</td></tr>
			<tr><td>그룹 설명</td><td><textarea name="gcontent">${groupInfo.gcontent }"</textarea></td></tr>
			<tr><td>그룹 멤버 추가</td>
			<td>
    			<c:forEach items="${followList }" var="fids" >
    				<div>
    					<input type="checkbox" class="fids" name="fids" id="${fids}" value="${fids }" <c:forEach items="${groupDetailList }" var="mems" >
	    																									<c:if test="${fids eq mems.mid }"> 
	    																										checked="checked"
	    																										<c:if test="${mems.gdbalance eq 0 }">
	    																											checked="checked" onclick="deleteMember('${mems.mid }');"
	    																										</c:if>
	    																										<c:if test="${mems.gdbalance != 0 }">
	    																											onclick="return false" checked="checked"
    																												style="accent-color:grey; color:grey;"
	    																										</c:if>
	    																									</c:if>
	    																									
    																									</c:forEach>>
   					  	<label for="${fids }">${fids }</label>
     				</div>	
				</c:forEach>
			</td></tr>
			<tr><td>그룹 생성자</td><td><input type="text" name="mid"  value="${groupInfo.mid }" readonly="readonly"></td></tr>
			<tr><td>생성일</td><td><fmt:formatDate type="date"  value="${groupInfo.grdate}" /></td></tr>
			
			
			<tr><td colspan="2">
				<input type="submit" value="수정">
				
			</td></tr>
		</table>
	</form>
	<button onclick=" return confirmDeleteGroup();">그룹 삭제</button>
	</div>
</body>
</html>