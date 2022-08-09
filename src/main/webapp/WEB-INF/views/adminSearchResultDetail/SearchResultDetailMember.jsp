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
			<caption>${memberDetail.mid} 회원 상세정보</caption>
			<tr>
				<th>회원 아이디</th>
				<td>${memberDetail.mid}</td>
			</tr>
			<tr>
				<th>회원 이름</th>
				<td>${memberDetail.mname}</td>
			</tr>
			<tr>
				<th>회원 이메일</th>
				<td>${memberDetail.memail}</td>
			</tr>
			<tr>
				<th>회원 가입일</th>
				<td>${memberDetail.mrdate}</td>
			</tr>
		</table>
		
		<h2>${memberDetail.mid} 회원이 생성한 그룹</h2>
		<c:if test="${not empty groupList}">
			<c:forEach items="${groupList}" var="gList">
				<c:if test="${gList.mid eq memberDetail.mid}">
					<div class="groupWrap" >
						<table>
							<caption>그룹ID : ${gList.gid}</caption>
							<tr>
								<th>그룹명</th>
								<td>${gList.gname}</td>						
							</tr>
							<tr>
								<th>그룹명</th>
								<td>${gList.grdate}</td>						
							</tr>
							<tr>
								<th>그룹 설명</th>
								<td>${gList.gcontent}</td>						
							</tr>
						</table>				
					</div>
				</c:if>
			</c:forEach>
		</c:if>
		
		<h2>${memberDetail.mid} 회원 팔로워 목록</h2>
		<c:if test="${not empty followerList}">
			<c:forEach items="${followerList}" var="fList">
				<table>
					<tr>
						<td>ID: ${fList.from_mid}</td>						
					</tr>
				</table>				
			</c:forEach>
		</c:if>
		<c:if test="${empty followerList}">
			<h3>해당 회원의 팔로워가 없습니다.</h3>
		</c:if>
		
		<h2>${memberDetail.mid} 회원 팔로잉 목록</h2>
		<c:if test="${not empty followingList}">
			<c:forEach items="${followingList}" var="fList">
				<table>
					<tr>
						<td>ID: ${fList.to_mid}</td>						
					</tr>
				</table>				
			</c:forEach>
		</c:if>
		<c:if test="${empty followingList}">
			<h3>해당회원이 팔로잉 하는 회원이 없습니다.</h3>
		</c:if>
		
		
		
		
		<input type="button" value="검색결과 가기" onclick="history.back();">	
</body>
</html>










