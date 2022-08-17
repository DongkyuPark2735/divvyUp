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
	 <link href="${conPath }/css/main/main.css" rel="stylesheet">
	 
   <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
   <script>
      $(document).ready(function(){
      });
   </script>
</head>
<body>

<nav class="header">
		<div class="container">
			<h1 class="logo">
				<a href="${conPath}/main/main.jsp">D<span>U</span></a>
			</h1>


			<c:if test="${param.windowType eq 0}">
				<div style="left: 350px; align-items: left; position: absolute;"
					class="section mt-5">
					<div class="row">
						<div class="col-12">
							<div id="switch">
								<div id="circle"></div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${empty param.windowType}">
				<div style="left: 350px; align-items: left; position: absolute;"
					class="section mt-5">
					<div class="row">
						<div class="col-12">
							<div id="switch">
								<div id="circle"></div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${param.windowType eq 1}">
				<div style="left: 350px; align-items: left; position: absolute;"
					class="section mt-5">
					<div class="row">
						<div class="col-12">
							<div id="switch" class="switched">
								<div id="circle"></div>
							</div>
						</div>
					</div>
				</div>
			</c:if>

			<ul>
				<li><a href="${conPath}/member/modifyMemberForm.do?mid=${mid }">${mid }님
						▶</a></li>
				<li><a
					href="${conPath}/notification/notificationConfirmForm.do"
					class="notification"> <img src="${conPath}/icon/noti.png"
						class="imgNoti" />
						<div class="badge">${uncheckdNotificationCnt }</div>
				</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="${conPath}/main/logout.do"> <img
						src="${conPath}/icon/logout.png" class="imgLogout" />
				</a></li>
			</ul>
		</div>
	</nav>



	<div id="backIMG">
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
			
			<div id="ARDMemberGroupDetail" style="overflow: auto; height: 415px;">
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
										<th>그룹 생성일</th>
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
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>










