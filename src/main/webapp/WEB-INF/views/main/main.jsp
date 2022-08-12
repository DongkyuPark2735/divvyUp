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
<<<<<<< HEAD
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
=======
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
>>>>>>> 6bb5051dbb697d01cc69bf8061d978f3b60069f3
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs({
<<<<<<< HEAD
       active: 2,
       activate:  function( event, ui ){
          var tabIdx = $("#tabs").tabs('option', 'active');
          if(tabIdx==3){
/*              alert('읽은 거로 처리'); */
          }
       }
    });
  } );
  </script>

	<script>
	const nav = document.querySelector('.nav')
	window.addEventListener('scroll', fixNav)
	 
	function fixNav() {
	    if(window.scrollY > nav.offsetHeight + 150) {
	        nav.classList.add('active')
	    } else {
	        nav.classList.remove('active')
	    }
	}
	</script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <link href="${conPath }/css/main/main.css" rel="stylesheet">
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
	
  	
  
      <nav class="header">
      <div class="container">
      <h1 class="logo"><a href="${conPath}/main/main.jsp">D<span>U</span></a></h1>
           	   
           	  
           	<c:if test="${param.windowType eq 0}">
           	   <div style="left:350px; align-items: left; position:absolute;" class="section mt-5">
					<div class="row" >
						<div class="col-12" >
							<div id="switch" >
								<div id="circle"></div>
							</div>
						</div>	
				</div>			
			</div>  
			</c:if>
			  <c:if test="${empty param.windowType}">
           	      <div style="left:350px; align-items: left; position:absolute;" class="section mt-5">
					<div class="row" >
						<div class="col-12" >
							<div id="switch" >
								<div id="circle"></div>
							</div>
						</div>	
				</div>			
			</div>  
			</c:if>
			 <c:if test="${param.windowType eq 1}">
			 	<div style="left:350px; align-items: left; position:absolute;" class="section mt-5">
					<div class="row" >
						<div class="col-12" >
							<div id="switch" class="switched" >
								<div id="circle"></div>
							</div>
						</div>	
				</div>			
			</div>  
			</c:if>
        
        <ul>
			<li>
				<a href="${conPath}/member/modifyMemberForm.do?mid=${mid }">${mid }님 ▶</a>
			</li> 
			<li>
	         	<a href="${conPath}/notification/notificationConfirmForm.do" class="notification">
					<img src= "${conPath}/icon/noti.png" class="imgNoti" />
					<div class="badge">${uncheckdNotificationCnt }</div>
				</a>
			</li>
			<li>
				<a href="#">공지사항</a>
			</li>
			<li>
				<a href="${conPath}/main/logout.do">
					<img src= "${conPath}/icon/logout.png" class="imgLogout"/>
				</a>
			</li>
        </ul>
      </div>
    </nav>
 
 
 
 
    <div class="mainSection">
      	<div class="oldDiv"> <!-- slide:before -->
       		<h1>${person.mname }님<span> 어서오세요<span></h1>
        	<p>Keep track of your shared expenses and balances with housemates, trips, groups, friends, and family. </p>
      	 </div>
      	 
       <div class="newDiv">

      <div id="friends">
    
      <h3>Following (${myFollowingList.size()})</h3>
      <div class="scrollable" style="height:100px;">
      <c:forEach items="${myFollowingList }" var="followingMember">
              <ul>
              	<li>▶  ${followingMember.to_mid }
              		<button class="friendsButton" onclick="location='${conPath}/follow/unfollowMember.do?from_mid=${mid }&to_mid=${followingMember.to_mid }&windowType=${param.windowType }'">UNFOLLOW</button>
              	</li>
              </ul>
         </c:forEach>
         </div>
         <hr>
      <h3>Followers (${myFollowerList.size() })</h3>
      <div class="scrollable" style="height:100px;">
      <c:forEach items="${myFollowerList }" var="followerMember">
              <ul>
              	<li>▶  ${followerMember.from_mid }</li>
              </ul>
         </c:forEach>
         </div>
          <hr>
    
      <form action="${conPath}/member/searchMemberList.do?mid=${mid}" method="get" >
               <input type="hidden" name="startRow" value="1">
               <input type="hidden" name="endRow" value="10">
               <input type="hidden" name="windowType" id="windowType" value="${windowType}">
                <div id="findFriend">
    				<h4> 친구찾기</h4>
               <select name="schItem" class="schItem" >
                  <option value="mid"
                     <c:if test="${schItem.mid eq 'mid'}">
                        selected="selected" style="background-color:black;"
                     </c:if>>아이디 검색</option>
                  <option value="mname" 
                     <c:if test="${schItem.mname eq 'mname'}">
                        selected="selected"
                     </c:if>>이름 검색</option>
               </select>
                </div>
               <input type="text" name="schWord" class="schWord"  value="${schItem.schWord }">
               <input type="submit" value="검색" class="searchBtn" onclick="return showResult()">
            
            </form>
            
             <div class="scrollable">
            <table>
            <c:forEach items="${searchedMemberList }" var="member">
            <c:set var="i" value="0"/>
              <tr>
                <td style="font-weight:bold;">${member.mid }</td>
                <c:forEach items="${FollowingList }" var="Member">
               <c:if test="${member.mid eq Member.to_mid }">
                 <td rowspan="2">
                 	<button style="color: red; margin-left:3px;"  class="friendsButton2" onclick="location='${conPath }/follow/unfollowMember.do?from_mid=${mid }&to_mid=${member.mid }&windowType=${param.windowType }'">-</button> 
                 </td>
               <c:set var="i" value="${i + 1 }"/>
               </c:if>
            </c:forEach>
              <c:if test="${(i eq 0) and (Member.to_mid != member.mid) }">
                <td rowspan="2">
                  <button style="color:#1DBF73;" class="friendsButton2" onclick="location='${conPath}/follow/followMember.do?from_mid=${mid }&to_mid=${member.mid }&windowType=${param.windowType }'">+</button>
                </td>
              </c:if>
          
              </tr>
              <tr>
               <td style="color:grey; font-size:0.8em;">&nbsp; &nbsp;${member.mname }</td>
               </tr>
             </c:forEach>
            </table>
             </div>
             
      </div>
     <div id="groups">
    	<c:forEach var="groups" items="${groupList }">
			<input type="button" value="${groups.gid }" onclick="location='${conPath }/groups/groupInfo.do?gid=${groups.gid }'">
		</c:forEach>
		<input type="hidden" name=mid value="${mid }">
		<input type="button" value="그룹 생성" onclick="location='${conPath }/groups/groupInsertForm.do?mid=${mid}'">
      </div>
      	
		</div> <!-- new -->
      </div>
    <div id="buttons">
    	<input type="button" value="MY GROUPS" onclick="location='${conPath }/groups/groupList.do?mid=${mid}'" class="btn1">
      	<input type="button" value="FAQ" onclick="location='${conPath}/qboard/listQboardForMember.do'" class="btn2">
    </div>
 

     
 

</body>
 <script>

   (function($) { "use strict";
	   $("#switch").on('click', function () {
			if ($(".mainSection").hasClass("change")) {
				$(".mainSection").removeClass("change");
				$("#switch").removeClass("switched");
				$(".mainSection").removeClass("change");
				$('.newDiv').css('display','none');
				$('.oldDiv').css('display','block');
				
			}
			else {
				$(".mainSection").addClass("change");
				$("#switch").addClass("switched");	
				$('.newDiv').css('display','block');
				$('.oldDiv').css('display','none');
				
			}
			if ($(".header").hasClass("change")) {
				$(".header").removeClass("change");
				$("#switch").removeClass("switched");
				$(".header").removeClass("change");
				
			}
			else {
				$(".header").addClass("change");
				$("#switch").addClass("switched");	
			}
			if ($("#switch").hasClass("switched")) {
				$(".mainSection").addClass("change");
				$('.newDiv').css('display','block');
				$('.oldDiv').css('display','none');
			}
		});  
	 })(jQuery); 
   </script>
   
   <script>
  /*  var windowType = Number('${param.windowType}'); */
   (function($) { "use strict";
	   $(document).ready(function() {
			if ($("#switch").hasClass("switched")) {
				$(".mainSection").addClass("change");
				$('.newDiv').css('display','block');
				$('.oldDiv').css('display','none');
				$(".header").addClass("change");
				$('#windowType').val(1);
			}
			else {
				$('#windowType').val(0);
			}
		});  
	 })(jQuery); 
   </script>
  


<script>
   (function($) { 
	   $("#switch").on('click', function () {
			if ($(".mainSection").hasClass("change")) {
				$('#windowType').val(1);
			}
			else {
				$('#windowType').val(0);
			}
		});  
	 })(jQuery); 
   </script>
   
  
</html>
   
=======
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
>>>>>>> 6bb5051dbb697d01cc69bf8061d978f3b60069f3
