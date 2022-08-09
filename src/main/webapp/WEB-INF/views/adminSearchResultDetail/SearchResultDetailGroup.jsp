<%@ page language="java" contentType="text/html; charset= UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
   <title>Home</title>
   <meta charset="UTF-8">
   <link href="${conPath }/css/style.css" rel="stylesheet">
	 <style>
	 	.groupWrap{
	 		width: 250px;
	 		text-align: center;
			display: inline-block;
	 	}
	 	
	 </style>   
   <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
   <script>
      $(document).ready(function(){
         
      });
   </script>
</head>
<body>
		<table>
			<caption>${groupDetail.gid} 그룹 상세정보</caption>
			<tr>
				<th>그룹명</th>
				<td>${groupDetail.gname}</td>
			</tr>
			<tr>
				<th>그룹생성일</th>
				<td>${groupDetail.grdate}</td>
			</tr>
			<tr>
				<th>그룹 설명</th>
				<td>${groupDetail.gcontent}</td>
			</tr>
			<tr>
				<th>그룹 생성회원</th>
				<td>${groupDetail.mid}</td>
			</tr>
		</table>

		<!-- 그룹 맴버 리스트 -->
		<table>
			<caption>${groupDetail.gid} 그룹 회원 목록</caption>
			<tr>
				<th>회원 ID</th>
				<th>회원 그룹 가입일</th>
			</tr>
			<c:forEach items="${groupMemeberList}" var="groupMList">
			<tr>
				<td>${groupMList.mid}</td>
				<td>${groupMList.gdrdate}</td>
			</tr>
			</c:forEach>
		</table>
		
		
		<h2>${groupDetail.gid} 그룹 지출 기록</h2>
			<c:if test="${not empty evetsList}">
				<table>
					<tr>
						<th>지출 기록 번호</th>
						<th>지출 기록 이름</th>
						<th>지출 기록 내용</th>
						<th>지출 기록 금액</th>
						<th>지출 기록 장소</th>
						<th>지출 기록 회원수</th>
						<th>지출 기록 생성일</th>
						<th>지출 기록 생성회원</th>
					</tr>
				<c:forEach items="${evetsList}" var="eList">
					<tr>
						<td>${eList.eid}</td>
						<td>${eList.ename}</td>
						<td>${eList.econtent}</td>
						<td>${eList.eamount}</td>
						<td>${eList.eaddress}</td>
						<td>${eList.ecount}</td>
						<td>${eList.erdate}</td>
						<td>${eList.mid}</td>
					</tr>
				</c:forEach>
				</table>				
			</c:if>
		<c:if test="${empty evetsList}">
		 	<table>
				<tr>
					<th>해당 그룹의 지출 기록이 없습니다.</th>
				</tr>
		 	</table>
		</c:if>
		
		<input type="button" value="검색결과 가기" onclick="history.back();">	
</body>
</html>