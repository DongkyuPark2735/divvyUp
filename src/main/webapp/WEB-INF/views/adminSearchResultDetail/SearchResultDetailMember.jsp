<%@ page language="java" contentType="text/html; charset= UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
   <title>Home</title>
   <meta charset="UTF-8">
	 <link href="${conPath }/css/admin/adminSearchResult.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
   <script>
      $(document).ready(function(){
      });
   </script>
</head>
<body>
	<div id="adminResultDetailWrap">
		<div id="ARDheader">
			<h2>${memberDetail.mid} 회원 상세정보</h2>
		</div>
		<div id="ARDMemberDetail"> 
			<table>
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
		</div>
		
		<div id="ARDMemberFollowDetail" style="overflow: auto; height: 595px;">
			<c:if test="${not empty followerList}">
					<table>
						<caption><b>follower</b></caption>
						<c:forEach items="${followerList}" var="fList">
						<tr>
							<td> - ${fList.from_mid}</td>						
						</tr>
						</c:forEach>
					</table>				
			</c:if>
			<c:if test="${empty followerList}">
					<table>
						<caption><b>follower</b></caption>
						<tr>
							<td>해당 회원의 팔로워가 없습니다.</td>						
						</tr>
					</table>				
			</c:if>
			
			<c:if test="${not empty followingList}">
					<table>
						<caption><b>following</b></caption>
						<c:forEach items="${followingList}" var="fList">
						<tr>
							<td> - ${fList.to_mid}</td>						
						</tr>
						</c:forEach>
					</table>				
			</c:if>
			<c:if test="${empty followingList}">
					<table>
						<caption><b>following</b></caption>
						<tr>
							<td>해당회원이 팔로잉 하는 회원이 없습니다.</td>						
						</tr>
					</table>				
			</c:if>
		</div>
		
		<div id="ARDMemberGroupDetail" style="overflow: auto; height: 400px;">
			<h3>생성 그룹</h3>
				<c:if test="${not empty groupList}">
				<c:forEach items="${groupList}" var="gList">
					<c:if test="${gList.mid eq memberDetail.mid}">
						<div class="ARDGroupWrap" >
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
				<c:if test="${empty groupList}">
					<h3>해당 회원이 생성한 그룹이 없습니다.</h3>
				</c:if>
		</div>

		<p id="ARDBtn">
			<input type="button" value="검색결과 가기" onclick="history.back();" >	
		</p>
		
	</div>
</body>
</html>










