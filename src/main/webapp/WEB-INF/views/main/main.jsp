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
.container2 {
  /* width: 200px;
  height: 200px; */
  position: relative;
  /* background: black; */
  overflow: hidden;
}
.container2:before {
  /* content: "ddd"; */
  display: block;
  position: relative;
  top:0;
  left:0;
  /* width: 200px;
  height: 200px; */
  filter: blur(3px);
  -webkit-filter: blur(3px);
  opacity: 0.7;
}
.modal {
	position: absolute;
}
</style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css"> 
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs({
    	active: 2,
    	activate:  function( event, ui ){
    		var tabIdx = $("#tabs").tabs('option', 'active');
    		if(tabIdx==3){
    			alert('읽은 거로 처리'); 
    		}
    	}
    });
  });
  
  $(document).ready(function(){
	 $modal = $(".modal"); 
 	 $(".modalOpen").click(function(){
 		  $modal.show();
		  $.ajax({
			  url : '${conPath}/notification/notificationConfirmForm.do',
			  type : 'get',
			  dataType : 'html',
			  success : function(data){
					$('.layerpop').html(data);
			  }
		   });
 	   return false;
	   });
 	 
 	 $(".modalClose").click(function(){
 	    $modal.hide();
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
	  
	<div class="modal">
  		<div class="screen">
    		<div class="layerpop">
      			<!-- <p class="layerpop__container">
      				레이어팝업입니다.<br />
      				레이어팝업입니다.<br />
      				레이어팝업입니다.<br />
      				레이어팝업입니다.
      			</p> -->
    		</div>
      		<button type="button" value="close" class="modalClose" onclick="location='${conPath}/notification/updateUncheckNotification.do'">Close</button>
  		</div>
	</div>

	<div class="container2">
  		<button type="button" value="open" class="modalOpen">팝업창 열기</button>
	</div>  
	  
	  
	  
	  
	<%-- <div class="container">
		<div id="tabs">
  		  <ul>
    		<li><a href="#tabs-1">${myFollowingList.size() }팔로잉</a></li>
    		<li><a href="#tabs-2">${myFollowerList.size() }팔로워</a></li>
    		<li><a href="#tabs-3">친구찾기</a></li>
  		  </ul>
  		  <div id="tabs-1">
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
  		  <div id="tabs-2">
  		    <c:forEach items="${myFollowerList }" var="followerMember">
		  		<table>
		    		<tr>
		      			<td>${followerMember.from_mid }</td>
		    		</tr>
		  		</table>
			</c:forEach>
  		  </div>
  		  <div id="tabs-3">
  		    <form action="${conPath}/member/searchMemberList.do?mid=${mid}" method="get" >
					<input type="hidden" name="startRow" value="1">
					<input type="hidden" name="endRow" value="10">
					<select name="schItem" >
						<option value="mid"
							<c:if test="${schItem.mid eq 'mid'}">
								selected="selected"
							</c:if>>아이디 검색</option>
						<option value="mname" 
							<c:if test="${schItem.mname eq 'mname'}">
								selected="selected"
							</c:if>>이름 검색</option>
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
   		
	</div>  --%> 
	</c:if>
	
	
	<div>
		<input type="button" value="UNIE" onclick="location.href='${conPath }/main/unieTestMain.do'"/>
	</div> 
</body>
</html>