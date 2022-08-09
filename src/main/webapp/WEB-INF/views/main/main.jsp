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
    	 
    	$.ajax({
    		 url : "${conPath}/notification/uncheckedNotificationList.do",
    		 type : "GET",
    		 data : {"startRow" : startRow, "endRow" : endRow},
    		 success : function(data) {
				$('#uncheckedNotificationList').prepend(data);
			}
    	});
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
	<c:if test="${not empty admin or empty member}">
	  <h1>관리자용 메인페이지 : 현재 접속한 ID는 ${aid }</h1>
	  <button onclick="location='${conPath}/qboard/listUncheckedQboardForAdmin.do'">처리대기목록</button>
	  <button onclick="location='${conPath}/qboard/listCheckedQboardForAdmin.do'">처리목록</button>
	  <button onclick="location='${conPath}/adminSearch/adminSearchMain.do'">검색목록가기</button>
	  <button onclick="location='${conPath}/main/logout.do'">로그아웃</button>
	</c:if>
	
	<c:if test="${not empty member and empty admin }">
	  <h1>회원용 메인페이지 : 현재 접속한 ID는 ${mid }, 읽지 않은 알림 갯수 ${uncheckdNotificationCnt }개</h1>
	  <button onclick="location='${conPath}/member/modifyMemberForm.do?mid=${mid }'">MODIFY_MEMBER</button>
	  <button onclick="location='${conPath}/notification/notificationConfirmForm.do'">NOTIFICATION</button>
	  <button onclick="location='${conPath}/qboard/listQboardForMember.do'">QBOARD</button>
	  <button onclick="location='${conPath}/qboard/listQboardForMe.do?mid=${mid }'">MYQBOARD</button>
	  <button onclick="location='${conPath}/main/logout.do'">로그아웃</button>
	  <div>&nbsp;</div>
	<div class="container">
  		<ul class="tabs">
    		<li class="tab-link current" data-tab="tab-1">${myFollowingList.size() }팔로잉</li>
    		<li class="tab-link" data-tab="tab-2">${myFollowerList.size() }팔로워</li>
    		<li class="tab-link" data-tab="tab-3">친구찾기</li>
    		<li class="tab-link" data-tab="tab-4">알림창</li>
  		</ul>
 
  		<div id="tab-1" class="tab-content current">
			<c:forEach items="${myFollowingList }" var="followingMember">
		  		<table>
		    		<tr>
		      			<td>${followingMember.to_mid } </td>
		      			<td>&nbsp;</td>
						<td>&nbsp;</td>
		      			<td><button onclick="location='${conPath}/follow/unfollowMember.do?from_mid=${mid }&to_mid=${followingMember.to_mid }'">UNFOLLOW</button></td>
		    		</tr>
		  		</table>
			</c:forEach>
  		</div>
  
  		<div id="tab-2" class="tab-content">
			<c:forEach items="${myFollowerList }" var="followerMember">
		  		<table>
		    		<tr>
		      			<td>${followerMember.from_mid }</td>
		    		</tr>
		  		</table>
			</c:forEach>
  		</div>
  		
  		
  		<div id="tab-3" class="tab-content">
			<div class="adminSearchResult current" >
				<form action="${conPath}/member/searchMemberList.do?mid=${mid}" method="get" >
					<input type="hidden" name="startRow" value="1">
					<input type="hidden" name="endRow" value="10">
					<select name="schItem" >
						<option value="mid"
							<c:if test="${schItem eq 'mid'}">selected="selected"</c:if>>아이디 검색
						</option>
						<option value="mname" 
							<c:if test="${schItem eq 'mname'}">selected="selected"</c:if>>이름 검색
						</option>
					</select>
					<input type="text" name="schWord" value="${schItem.schWord }">
					<input type="submit" value="검색">
				</form>
				
				<div>&nbsp;</div>
				
				<table>
				<c:forEach items="${searchedMemberList }" var="member">
				<c:set var="i" value="0"/>
				  <tr>
				    <td>${member.mid }</td>
					<td>&nbsp;&nbsp;${member.mname }</td>
				    <c:forEach items="${FollowingList }" var="Member">
					<c:if test="${member.mid eq Member.to_mid }">
					  <td>
					    &nbsp; &nbsp;<button onclick="location='${conPath }/follow/unfollowMember.do?from_mid=${mid }&to_mid=${member.mid }'">UNFOLLOW</button>
					  </td>
					  <c:set var="i" value="${i + 1 }"/>
					</c:if>
				</c:forEach>
				  <c:if test="${(i eq 0) and (Member.to_mid != member.mid) }">
				    <td>
				      &nbsp; &nbsp;<button onclick="location='${conPath}/follow/followMember.do?from_mid=${mid }&to_mid=${member.mid }'">FOLLOW</button>
				    </td>
				  </c:if>
				  </tr>
				</c:forEach>
				</table>
			</div>
   		</div>
   		
   		<div id="tab-4" class="tab-content">
   		  <div id="uncheckedNotificationList">
   		    
   		  </div>
   		</div>
   		
	</div>
	</c:if>
	
	
	<div>
		<input type="button" value="UNIE" onclick="location.href='${conPath }/main/unieTestMain.do'"/>
	</div>
</body>
</html>