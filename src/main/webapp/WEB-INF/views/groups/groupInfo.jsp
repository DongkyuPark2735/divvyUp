<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
	<script>
		$(function(){
			$('button').click(function(){
				$('#show').toggle();
			}); 
		});
	</script>
</head>
<body>
	<table id="groupDetail">
			<tr><td colspan="3">group ID : ${groupInfo.gid }</td></tr>
			<tr><td colspan="3">group name : ${groupInfo.gid }</td></tr>
			<tr><td colspan="3">date : ${groupInfo.grdate }</td></tr>
			<tr><td colspan="3">group img : 
				<c:if test="${not empty groupInfo.gimg }">
					<img src="${conPath }/groupsImgFileUpload/${groupInfo.gimg }">
				</c:if>
				<c:if test="${empty groupInfo.gimg }">
					첫번째 첨부파일 첨부 안 함
				</c:if>
			</td></tr>
			<tr><td colspan="3">group summary : ${groupInfo.gcontent }</td></tr>
			<tr><td colspan="3">group leader : ${groupInfo.mid }</td></tr>
			<tr><td colspan="3"> 그룸 멤버 리스트 : </td></tr>
			<th>멤버 아이디</th><th>멤버 balance</th><th>가입일</th>
    		<c:forEach items="${groupDetailList }" var="gMems">
    			<tr>
    				<td style="width:100px;">${gMems.mid } </td>
    				<td style="width:100px;">${gMems.gdbalance } </td>
    				<td style="width:100px;">${gMems.gdrdate } </td>
    				
    				<c:if test="${member.mid eq gMems.mid }">
	    				<c:if test="${gMems.gdbalance < 0 }">
	    					<td><input type="button" id="show" style="display:none;" value="내기" onclick="location='${conPath }/centralSystem/pay.do?gid=${groupInfo.gid }'"></td>
	    				</c:if>
	    				<c:if test="${gMems.gdbalance > 0 }">
	    					<td><input type="button" id="show" style="display:none;" value="받기" onclick="location='${conPath }/centralSystem/pay.do?gid=${groupInfo.gid }'"></td>
	    				</c:if>
    				</c:if>
    			</tr>
    			
    		</c:forEach>
    		
	</table>
	<table>
		<tr><td colspan="2"><input type="button" value="이벤트 목록" onclick="location='${conPath }/event/eventList.do?gid=${groupInfo.gid }'"></td></tr>
		<tr><td><input type="button" value="이벤트 추가" onclick="location='${conPath }/event/selectEventType.do?gid=${groupInfo.gid }'"></td></tr>
		<c:if test="${member.mid eq groupInfo.mid }">
		<tr><td><button >정산하기</button></td></tr>
		</c:if>
	</table>
</body>
</html> 