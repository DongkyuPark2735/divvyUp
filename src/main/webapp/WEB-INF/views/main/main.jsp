<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<title>Insert title here</title>
<link href="${conPath}/css/style.css" rel="stylesheet">
<style>
	/* *{
		margin : 0 auto;
		
	}
	div{
		width : 500px;
		height : 500px;
		border: 1px solid black;
		display: inline-block;
		
	}
	#myFollowing {
		width : 500px;
		height : 500px;
	}
	#myFollower {
		width : 500px;
		height : 500px;
	} */
	
	
	ul.tabs{
  		margin: 0px;
  		padding: 0px;
  		list-style: none;
	}
	ul.tabs li{
  		background: none;
 		color: #222;
  		display: inline-block;
  		padding: 10px 15px;
  		cursor: pointer;
	}

	ul.tabs li.current{
  		background: #ededed;
  		color: #222;
		}

	.tab-content{
  		display: none;  
  		padding: 15px 0;
  		border-top:3px solid #eee;
	}

	.tab-content.current{
  		display: inherit;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
     $(document).ready(function(){
    	 $('ul.tabs li').click(function(){
    		    var tab_id = $(this).attr('data-tab');
    		 
    		    $('ul.tabs li').removeClass('current');
    		    $('.tab-content').removeClass('current');
    		 
    		    $(this).addClass('current');
    		    $("#"+tab_id).addClass('current');
    	 })
     });
  </script>
</head>
<body>
	<c:if test="${modifyMemberResult eq 1 }">
	  <script>alert('회원정보 수정 성공');</script>
	</c:if>
	<c:if test="${modifyMemberResult eq 0 }">
	  <script>alert('회원정보 수정 실패');</script>
	</c:if>
	<c:if test="${not empty member and empty admin }">
		<h1>회원용 메인페이지 : 현재 접속한 ID는 ${mid }</h1>
	</c:if>
	<c:if test="${empty member and not empty admin }">
		<h1>관리자용 메인페이지 : 현재 접속한 ID는 ${aid }</h1>
	</c:if>
	<button onclick="location='${conPath}/main/logout.do'">LOGOUT</button>
	<c:if test="${not empty member and empty admin }">
	  <button onclick="location='${conPath}/member/modifyMemberForm.do?mid=${mid }'">MODIFY_MEMBER</button>
	</c:if>
	<c:if test="${empty member and not empty admin }">
	  <button onclick="location='${conPath}/qboard/listUncheckedQboardForAdmin.do'">처리대기목록</button>
	  <button onclick="location='${conPath}/qboard/listCheckedQboardForAdmin.do'">처리목록</button>
	</c:if>
	<c:if test="${not empty member and empty admin }">
	  <button onclick="location='${conPath}/qboard/listQboardForMember.do'">QBOARD</button>
	  <button onclick="location='${conPath}/qboard/listQboardForMe.do?mid=${mid }'">MYQBOARD</button>
	</c:if>
	<div>&nbsp;</div>
	<div class="container">
  		<ul class="tabs">
    		<li class="tab-link current" data-tab="tab-1">${myFollowingList.size() }팔로잉</li>
    		<li class="tab-link" data-tab="tab-2">${myFollowerList.size() }팔로워</li>
    		<li class="tab-link" data-tab="tab-3">친구찾기</li>
  		</ul>
 
  		<div id="tab-1" class="tab-content current">
  			<c:if test="${not empty member and empty admin }">
				<c:forEach items="${myFollowingList }" var="followingMember">
		  			<table>
		    			<tr>
		      				<td>${followingMember.to_mid } </td>
		      				<td><button onclick="location='${conPath}/follow/unfollowMember.do?from_mid=${mid }&to_mid=${followingMember.to_mid }'">UNFOLLOW</button></td>
		    			</tr>
		  			</table>
				</c:forEach>
			</c:if>
  		</div>
  
  		<div id="tab-2" class="tab-content">
  			<c:if test="${not empty member and empty admin }">
				<c:forEach items="${myFollowerList }" var="followerMember">
		  			<table>
		    			<tr>
		      				<td>${followerMember.from_mid }</td>
		    			</tr>
		  			</table>
				</c:forEach>
			</c:if>
  		</div>
  
  		<div id="tab-3" class="tab-content">
			<form action="${conPath }/member/searchMember.do">
				<input type="text" name="searchedMid">
				<input type="submit" value="SEARCH">
				<table>
				  <%-- <c:if test="${empty memberList }">
				    <b>해당 ID는 존재하지 않습니다</b>
				  </c:if>
				  <c:if test="${empty memberList }">
				    <c:forEach items="memerList" var="member">
				      <tr>
				        <td></td>
				      </tr>
				    </c:forEach>
				  </c:if> --%>
				</table>
			</form>
   		</div>
	</div>
	
	<div>
		<input type="button" value="UNIE" onclick="location.href='${conPath }/main/unieTestMain.do'"/>
	</div>
</body>
</html>