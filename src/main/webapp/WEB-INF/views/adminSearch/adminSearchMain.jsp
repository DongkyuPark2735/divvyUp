<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8">
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
	*{
		margin: 0 auto;
	}
	div{
		width: 700px;
		overflow: hidden;
		border: 1px solid black; 
	}
	#adminSearchBar ul li{
		list-style: none;	
		display: inline-block;
	}
	#adminSearchBar ul li:hover{
		cursor: pointer;
		background-color: red;
	}

	.adminSearchResult{
		display: none;
		background: #ededed;
		padding: 15px;
	}

	.adminSearchResult.current{
	  display: inherit;
	}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
		$("#adminSearchBar ul li:eq(0)").addClass('current');
		$('.adminSearchResult:eq(0)').addClass("current");
		
		if(${barCheckMSG eq 'memberBar'}){
			$('.searchBar').removeClass('current');
			$('.adminSearchResult').removeClass('current');
			$("#adminSearchBar ul li:eq(0)").addClass('current');
			$('.adminSearchResult:eq(0)').addClass("current");
		}
		if(${barCheckMSG eq 'groupBar'}){
			$('.searchBar').removeClass('current');
			$('.adminSearchResult').removeClass('current');
			$("#adminSearchBar ul li:eq(1)").addClass('current');
			$('.adminSearchResult:eq(1)').addClass("current");
		}
		if(${barCheckMSG eq 'eventBar'}){
			$('.searchBar').removeClass('current');
			$('.adminSearchResult').removeClass('current');
			$("#adminSearchBar ul li:eq(2)").addClass('current');
			$('.adminSearchResult:eq(2)').addClass("current");
		}
		
		$('.searchBar').click(function(){
			var num = $(".searchBar").index($(this));
			
			$('.searchBar').removeClass('current');
			$('.adminSearchResult').removeClass('current');
			 
			$(this).addClass('current');
			$('.adminSearchResult:eq(' + num + ')').addClass("current");
		});
		
		
		
	});
	
</script>
</head>
<body>
	<!-- 검색 전체 -->
	<div id="adminSearchWrap">
		
		<!-- 검색 탭 -->
		<div id="adminSearchBar">
			<ul>
				<li class="searchBar current">회원 검색</li>
				<li class="searchBar">그룹 검색</li>
				<li class="searchBar">이벤트 검색	</li>
			</ul>
		</div>
		
		<!-- 회원 검색 -->
		<div class="adminSearchResult current" >
			<form action="${conPath}/adminSearch/searchMemeber.do" method="get" >
				<input type="hidden" name="startRow" value="1">
				<input type="hidden" name="endRow" value="10">
<%-- 				<input type="hidden" name="searchWord" value="${searchKeyWord.searchResultOrderBy}"> --%>
				<select name="searchSelectItems" >
					<option value="mname" 
							<c:if test="${searchKeyWord.searchSelectItems eq 'mname'}">
									selected="selected"
							</c:if>>회원 이름으로</option>
					<option value="mid"
							<c:if test="${searchKeyWord.searchSelectItems eq 'mid'}">
									selected="selected"
							</c:if>>회원 아이디로</option>
					<option value="memail" 
							<c:if test="${searchKeyWord.searchSelectItems eq 'memail'}">
									selected="selected"
							</c:if>>회원 이메일로</option>
				</select>

				<input type="text" width="400" name="searchWord" value="${searchKeyWord.searchWord}">
				<input type="submit" value="검색">
			</form>
			<p class="wordCheckMSG"></p>
			<hr>
			
			<c:if test="${not empty searchMemberList}">
				<form action="${conPath}/adminSearch/searchMemeber.do" method="get">
					<input type="hidden" name="startRow" value="1">
					<input type="hidden" name="endRow" value="10">
					<input type="hidden" name="searchSelectItems" value="${searchKeyWord.searchSelectItems}">
					<input type="hidden" name="searchWord" value="${searchKeyWord.searchWord}">
					<select onchange="this.form.submit()" name="searchResultOrderBy">
						<option disabled="disabled" selected="selected">정렬 기준 선택</option>
						<option class="searchResultOrderBy" value="orderMnameDESC"  
							<c:if test="${searchKeyWord.searchResultOrderBy eq 'orderMnameDESC'}">
								selected="selected"
							</c:if>
							> 회원 이름오름차순 정렬</option>
						<option class="searchResultOrderBy" value="orderMnameASC"
							<c:if test="${searchKeyWord.searchResultOrderBy eq 'orderMnameASC'}">
								selected="selected"
							</c:if>
							>회원 이름내림차순 정렬</option>
						<option class="searchResultOrderBy" value="orderMrdateDESC"
							<c:if test="${searchKeyWord.searchResultOrderBy eq 'orderMrdateDESC'}">
								selected="selected"
							</c:if>
							>회원 가입일오름차순 정렬</option>
						<option class="searchResultOrderBy" value="orderMrdateASC"
							<c:if test="${searchKeyWord.searchResultOrderBy eq 'orderMrdateASC'}">
								selected="selected"
							</c:if>
							>회원 가입일내림차순 정렬</option>
					</select>
				</form>
				<table>
					<tr>
						<th>회원 아이디</th>
						<th>회원 이름</th>
						<th>회원 이메일</th>
						<th>회원 가입일</th>
					</tr>
				<c:forEach items="${searchMemberList}" var="memberList">
					<tr>
						<td>${memberList.mid}</td>
						<td>${memberList.mname}</td>
						<td>${memberList.memail}</td>
						<td>${memberList.mrdate}</td>
					</tr>
				</c:forEach>
				</table>
			 </c:if>
		</div>
		
		
		<!-- 그룹 검색 -->
		<div class="adminSearchResult">
			<form action="${conPath}/adminSearch/searchGroup.do" method="get" >
				<input type="hidden" name="startRow" value="1">
				<input type="hidden" name="endRow" value="10">
<%-- 				<input type="hidden" name="searchWord" value="${searchKeyWord.searchResultOrderBy}"> --%>
				<select name="searchSelectItems" >
					<option value="gname" 
							<c:if test="${searchKeyWord.searchSelectItems eq 'gname'}">
									selected="selected"
							</c:if>>그룹 이름으로</option>
					<option value="gid"
							<c:if test="${searchKeyWord.searchSelectItems eq 'gid'}">
									selected="selected"
							</c:if>>그룹 아이디로</option>
				</select>

				<input type="text" width="400" name="searchWord" value="${searchKeyWord.searchWord}">
				<input type="submit" value="검색">
			</form>
			<p class="wordCheckMSG"></p>
			<hr>
			
			<c:if test="${not empty searchGroupList}">
				<form action="${conPath}/adminSearch/searchGroup.do" method="get">
					<input type="hidden" name="startRow" value="1">
					<input type="hidden" name="endRow" value="10">
					<input type="hidden" name="searchSelectItems" value="${searchKeyWord.searchSelectItems}">
					<input type="hidden" name="searchWord" value="${searchKeyWord.searchWord}">
					<select onchange="this.form.submit()" name="searchResultOrderBy">
						<option disabled="disabled" selected="selected">정렬 기준 선택</option>
						<option class="searchResultOrderBy" value="orderGnameDESC"  
							<c:if test="${searchKeyWord.searchResultOrderBy eq 'orderGnameDESC'}">
								selected="selected"
							</c:if>
							> 그룹 이름오름차순 정렬</option>
						<option class="searchResultOrderBy" value="orderGnameASC"
							<c:if test="${searchKeyWord.searchResultOrderBy eq 'orderGnameASC'}">
								selected="selected"
							</c:if>
							>그룹 이름내림차순 정렬</option>
						<option class="searchResultOrderBy" value="orderGrdateDESC"
							<c:if test="${searchKeyWord.searchResultOrderBy eq 'orderGrdateDESC'}">
								selected="selected"
							</c:if>
							>그룹 생성일오름차순 정렬</option>
						<option class="searchResultOrderBy" value="orderGrdateASC"
							<c:if test="${searchKeyWord.searchResultOrderBy eq 'orderGrdateASC'}">
								selected="selected"
							</c:if>
							>그룹 생성일내림차순 정렬</option>
					</select>
				</form>
				
				<table>
					<tr>
						<th>그룹 아이디</th>
						<th>그룹명</th>
						<th>그룹생성일</th>
						<th>그룹 설명</th>
						<th>그룹 생성회원</th>
					</tr>
				<c:forEach items="${searchGroupList}" var="groupsList">
					<tr>
						<td>${groupsList.gid}</td>
						<td>${groupsList.gname}</td>
						<td>${groupsList.grdate}</td>
						<td>${groupsList.gcontent}</td>
						<td>${groupsList.mid}</td>
					</tr>
				</c:forEach>
				</table>
			 </c:if>
		</div>
		
		
		<!-- 이벤트 검색 -->
		<div class="adminSearchResult">
			<form action="${conPath}/adminSearch/searchEvent.do" method="get" >
				<input type="hidden" name="startRow" value="1">
				<input type="hidden" name="endRow" value="10">
<%-- 				<input type="hidden" name="searchWord" value="${searchKeyWord.searchResultOrderBy}"> --%>
				<select name="searchSelectItems" >
					<option value="ename" 
							<c:if test="${searchKeyWord.searchSelectItems eq 'ename'}">
									selected="selected"
							</c:if>>지출 기록 이름으로</option>
					<option value="eid"
							<c:if test="${searchKeyWord.searchSelectItems eq 'eid'}">
									selected="selected"
							</c:if>>지출 기록 아이디로</option>
					<option value="mid"
							<c:if test="${searchKeyWord.searchSelectItems eq 'mid'}">
									selected="selected"
							</c:if>>지출 기록 생성회원 아이디로</option>
					<option value="gid"
							<c:if test="${searchKeyWord.searchSelectItems eq 'gid'}">
									selected="selected"
							</c:if>>지출 기록 그룹아이디로</option>
				</select>

				<input type="text" width="400" name="searchWord" value="${searchKeyWord.searchWord}">
				<input type="submit" value="검색">
			</form>
			<p class="wordCheckMSG"></p>
			<hr>
			
			<c:if test="${not empty searchEventList}">
				<form action="${conPath}/adminSearch/searchEvent.do" method="get">
					<input type="hidden" name="startRow" value="1">
					<input type="hidden" name="endRow" value="10">
					<input type="hidden" name="searchSelectItems" value="${searchKeyWord.searchSelectItems}">
					<input type="hidden" name="searchWord" value="${searchKeyWord.searchWord}">
					<select onchange="this.form.submit()" name="searchResultOrderBy">
						<option disabled="disabled" selected="selected">정렬 기준 선택</option>
						<option class="searchResultOrderBy" value="orderEnameDESC"  
							<c:if test="${searchKeyWord.searchResultOrderBy eq 'orderEnameDESC'}">
								selected="selected"
							</c:if>
							> 지출 기록 이름 오름차순 정렬</option>
						<option class="searchResultOrderBy" value="orderEnameASC"
							<c:if test="${searchKeyWord.searchResultOrderBy eq 'orderEnameASC'}">
								selected="selected"
							</c:if>
							>지출 기록 이름 내림차순 정렬</option>
						<option class="searchResultOrderBy" value="orderErdateDESC"
							<c:if test="${searchKeyWord.searchResultOrderBy eq 'orderErdateDESC'}">
								selected="selected"
							</c:if>
							>지출 기록 생성일 오름차순 정렬</option>
						<option class="searchResultOrderBy" value="orderErdateASC"
							<c:if test="${searchKeyWord.searchResultOrderBy eq 'orderErdateASC'}">
								selected="selected"
							</c:if>
							>지출 지록 생성일 내림차순 정렬</option>
					</select>
				</form>
				
				<table>
					<tr>
						<th>지출 기록 아이디</th>
						<th>지출기록 이름</th>
						<th>지출기록 내용</th>
						<th>지출 금액</th>
						<th>지출 장소</th>
						<th>지출 기록 회원수</th>
						<th>지출 기록 생성일</th>
						<th>지출 기록 생성 회원아이디</th>
						<th>지출 기록 생성 그룹</th>
					</tr>
				<c:forEach items="${searchEventList}" var="eventList">
					<tr>
						<td>${eventList.eid}</td>
						<td>${eventList.ename}</td>
						<td>${eventList.econtent}</td>
						<td>${eventList.eamount}</td>
						<td>${eventList.eaddress}</td>
						<td>${eventList.ecount}</td>
						<td>${eventList.erdate}</td>
						<td>${eventList.mid}</td>
						<td>${eventList.gid}</td>
					</tr>
				</c:forEach>
				</table>
			 </c:if>
		</div>
	</div>
</body>
</html>








