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
<!-- 헤더 -->
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
				<h2>${groupDetail.gid} 그룹 상세정보</h2>
			</div>
			
			<div id="ARDGroupDetail"> 
			<table>
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
			</div>
			
			<!-- 지출기록 -->
			<div id="ARDGroupEventDetail" style="overflow: auto; height: 600px;">
				<h3>지출 기록</h3>
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
			</div>
	
			<!-- 그룹 맴버 리스트 -->
			<div id="ARDGroupMList" style="overflow: auto; height: 425px;" >
				<table>
					<caption><b>그룹 회원 목록</b></caption>
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
			</div>
			
		</div>
			
			<p id="ARDBtn">
				<input type="button" value="검색결과 가기" onclick="history.back();" >	
			</p>
	<!-- 푸터 -->
	<jsp:include page="../main/footer.jsp"/>
	
	</div>
	</body>
</html>