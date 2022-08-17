<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<title>Insert title here</title>
<<<<<<< HEAD
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link href="${conPath}/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


<script>
	const nav = document.querySelector('.nav')
	window.addEventListener('scroll', fixNav)

	function fixNav() {
		if (window.scrollY > nav.offsetHeight + 150) {
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
=======
<<<<<<< HEAD
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"> -->
<style>

/* .modal {
	position: absolute;	
	background-color: rgba(f, f, f, 0.4);
	right: 0;
	top: 20px; 
	width: 450px;
	margin-top: 60px;
 	z-index: 70;
} */
</style>

=======
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link href="${conPath}/css/style.css" rel="stylesheet">

  <link rel="stylesheet" href="/resources/demos/style.css"> 
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  

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
   
   $(document).ready(function(){
		 $modal = $(".modal"); 
	 	 $(".notification").click(function(){
	 		  $modal.fadeIn('slow');
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
	 	 
	 	$('.modal').click(function(e){
			var target = e.target; // 이벤트가 적용된 부분
			  $('.modal').fadeOut('slow');
			  location.href='${conPath}/notification/updateUncheckNotification.do?windowType=${param.windowType }';
		});
	 	
	  });
   </script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="${conPath }/css/main/main2.css" rel="stylesheet">
  </head>
  <body>
<<<<<<< HEAD
   <c:if test="${modifyMemberResult eq 1 }">
     <script>alert('회원정보 수정 성공');</script>
=======

>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
	<c:if test="${modifyMemberResult eq 1 }">
		<script>
			alert('회원정보 수정 성공');
		</script>
	</c:if>

	<c:if test="${modifyMemberResult eq 0 }">
		<script>
			alert('회원정보 수정 실패');
		</script>
	</c:if>
	<c:if test="${not empty admin or empty member}">
		<h1>관리자용 메인페이지 : 현재 접속한 ID는 ${aid }</h1>
		<button
			onclick="location='${conPath}/qboard/listUncheckedQboardForAdmin.do'">처리대기목록</button>
		<button
			onclick="location='${conPath}/qboard/listCheckedQboardForAdmin.do'">처리목록</button>
		<button onclick="location='${conPath}/adminSearch/adminSearchMain.do'">검색목록가기</button>
		<button onclick="location='${conPath}/main/logout.do'">로그아웃</button>
	</c:if>
<<<<<<< HEAD



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




	<div class="mainSection">
		<div class="oldDiv">
			<!-- slide:before -->
			<h1>${person.mname }님<span> 어서오세요<span>
			</h1>
			<p>Keep track of your shared expenses and balances with
				housemates, trips, groups, friends, and family.</p>
		</div>

		<div class="newDiv">

			<div id="friends">

				<h3>Following (${myFollowingList.size()})</h3>
				<div class="scrollable" style="height: 100px;">
					<c:forEach items="${myFollowingList }" var="followingMember">
						<ul>
							<li>▶ ${followingMember.to_mid }
								<button class="friendsButton"
									onclick="location='${conPath}/follow/unfollowMember.do?from_mid=${mid }&to_mid=${followingMember.to_mid }&windowType=${param.windowType }'">UNFOLLOW</button>
							</li>
						</ul>
					</c:forEach>
				</div>
				<hr>
				<h3>Followers (${myFollowerList.size() })</h3>
				<div class="scrollable" style="height: 100px;">
					<c:forEach items="${myFollowerList }" var="followerMember">
						<ul>
							<li>▶ ${followerMember.from_mid }</li>
						</ul>
					</c:forEach>
				</div>
				<hr>

				<form action="${conPath}/member/searchMemberList.do?mid=${mid}"
					method="get">
					<input type="hidden" name="startRow" value="1"> <input
						type="hidden" name="endRow" value="10"> <input
						type="hidden" name="windowType" id="windowType"
						value="${windowType}">
					<div id="findFriend">
						<h4>친구찾기</h4>
						<select name="schItem" class="schItem">
							<option value="mid"
								<c:if test="${schItem.mid eq 'mid'}">
=======
	 <c:if test="${not empty admin or empty member}">
     <h1>관리자용 메인페이지 : 현재 접속한 ID는 ${aid }</h1>
     <button onclick="location='${conPath}/qboard/listUncheckedQboardForAdmin.do'">처리대기목록</button>
     <button onclick="location='${conPath}/qboard/listCheckedQboardForAdmin.do'">처리목록</button>
     <button onclick="location='${conPath}/adminSearch/adminSearchMain.do'">검색목록가기</button>
     <button onclick="location='${conPath}/main/logout.do'">로그아웃</button>
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
   </c:if>
   
   <c:if test="${modifyMemberResult eq 0 }">
     <script>alert('회원정보 수정 실패');</script>
   </c:if>
    
    <c:if test="${not empty mid }"><!-- 회원만 들어왔을 때 -->
	  <nav class="header">
		<div class="container">
			<h1 class="logo">
				<a href="${conPath}/main/mainto.do">D<span>U</span></a>
			</h1>
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
                <a href="#">${mid }님 ▶</a>
                <ul class="submenu">
                  <li><a href="${conPath}/member/modifyMemberForm.do?mid=${mid }">회원 정보 관리</a></li>
          	      <li><a href="${conPath}/qboard/listQboardForMe.do?mid=${mid }">나의 문의 내역</a></li>
                  <!-- <li><a href="#">#</a></li> -->
                </ul>
              </li>
              <li>
            	<a href="${conPath}/notification/notificationConfirmForm.do" class="notification">
               	  <img src= "${conPath}/icon/noti.png" class="imgNoti" />
               	  <div class="badge">${uncheckdNotificationCnt }</div>
                </a>
           	  </li>
           	  <!-- <li>
                <a href="#">공지사항</a>
              </li> -->
              <li>
            	<a href="${conPath}/main/logoutForAdmin.do">
                  <img src= "${conPath}/icon/logout.png" class="imgLogout"/>
            	</a>
         	  </li>
            </ul>
		</div>
	  </nav>
	</c:if><!-- 회원만 들어왔을 떄 -->
	
	<c:if test="${not empty aid}"><!-- 관리자만 들어왔을 때 -->
	  <nav class="header">
	    <div class="container">
      	  <h1 class="logo"><a href="${conPath}/main/mainforAdmin.do">D<span>U</span></a></h1>
      	  <ul>
      	    <li>
      	      <a href="#">${aid }님 ▶</a>
      	        <ul class="submenu">
               	  <li><a href="${conPath}/qboard/listUncheckedQboardForAdmin.do">처리 대기 목록</a></li>
          	   	  <li><a href="${conPath}/qboard/listCheckedQboardForAdmin.do">처리 완료 목록</a></li>
                  <li><a href="${conPath}/adminSearch/adminSearchMain.do">회원검색목록</a></li>
             	</ul>
      	    </li>
      	    <li>
      	      <a href="${conPath}/main/logoutForAdmin.do">
                <img src= "${conPath}/icon/logout.png" class="imgLogout"/>
              </a>
      	    </li>
      	      
      	  </ul>
      	</div>
	  </nav>
	</c:if>
<!---------------------------------------------------- 여기까지 헤더 --------------------------------------------------------->
 
   	<div class="modal">
  	  <div class="screen">
        <div class="layerpop">
      			
    	</div>
  	  </div>
	</div>
	
<!---------------------------------------------------- 여기까지 모달창 --------------------------------------------------------->	
    <div class="mainSection">
    
      <div class="oldDiv"> <!-- slide:before -->
        <c:if test="${not empty person }">
          <h1>${person.mname }님<span> 어서오세요<span></h1>
        </c:if>
        
        <c:if test="${not empty admin }">
          <h1>${aid }님<span> 관리자 모드 접속<span></h1>
        </c:if>
        
        <p>Keep track of your shared expenses and balances with housemates, trips, groups, friends, and family. </p>
      </div>
          
          
      <c:if test="${not empty person }">
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
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
                        selected="selected" style="background-color:black;"
                     </c:if>>아이디
								검색</option>
							<option value="mname"
								<c:if test="${schItem.mname eq 'mname'}">
                        selected="selected"
<<<<<<< HEAD
                     </c:if>>이름
								검색</option>
						</select>
					</div>
					<input type="text" name="schWord" class="schWord"
						value="${schItem.schWord }"> <input type="submit"
						value="검색" class="searchBtn" onclick="return showResult()">

				</form>

				<div class="scrollable">
					<table>
						<c:forEach items="${searchedMemberList }" var="member">
							<c:set var="i" value="0" />
							<tr>
								<td style="font-weight: bold;">${member.mid }</td>
								<c:forEach items="${FollowingList }" var="Member">
									<c:if test="${member.mid eq Member.to_mid }">
										<td rowspan="2">
											<button style="color: red; margin-left: 3px;"
												class="friendsButton2"
												onclick="location='${conPath }/follow/unfollowMember.do?from_mid=${mid }&to_mid=${member.mid }&windowType=${param.windowType }'">-</button>
										</td>
										<c:set var="i" value="${i + 1 }" />
									</c:if>
								</c:forEach>
								<c:if test="${(i eq 0) and (Member.to_mid != member.mid) }">
									<td rowspan="2">
										<button style="color: #1DBF73;" class="friendsButton2"
											onclick="location='${conPath}/follow/followMember.do?from_mid=${mid }&to_mid=${member.mid }&windowType=${param.windowType }'">+</button>
									</td>
								</c:if>

							</tr>
							<tr>
								<td style="color: grey; font-size: 0.8em;">&nbsp;
									&nbsp;${member.mname }</td>
							</tr>
						</c:forEach>
					</table>
				</div>

			</div>
			<div id="groups">
				<c:forEach var="groups" items="${groupList }">
					<input type="button" value="${groups.gid }"
						onclick="location='${conPath }/groups/groupInfo.do?gid=${groups.gid }'">
				</c:forEach>
				<input type="hidden" name=mid value="${mid }"> <input
					type="button" value="그룹 생성"
					onclick="location='${conPath }/groups/groupInsertForm.do?mid=${mid}'">
			</div>

		</div>
		<!-- new -->
	</div>
	<div id="buttons">
		<input type="button" value="MY GROUPS"
			onclick="location='${conPath }/groups/groupList.do?mid=${mid}'"
			class="btn1"> <input type="button" value="FAQ"
			onclick="location='${conPath}/qboard/listQboardForMember.do'"
			class="btn2">
	</div>




=======
                     </c:if>>이름 검색</option>
                </select>
              </div>
              <input type="text" name="schWord" class="schWord"  value="${schItem.schWord }">
              <input type="submit" value="검색" class="searchBtn" onclick="return showResult()">
            </form>
            
<<<<<<< HEAD
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
			  <table>
			    <tr onclick="location='${conPath }/groups/groupInfo.do?gid=${groups.gid }'">
				  <td>${groups.gid }</td>
				  <td>
				    <p class="groupTitle">${groups.gname }</p><br>
					<p class="groupContent">${groups.gcontent }<br>
					생성자 : ${groups.mid }</p><br>
				  </td>
				  <td>
				    <p class="groupDate">${groups.grdate}<p>
				  </td>
				</tr>
			  </table>
			</c:forEach>
				
			<div class="paging" >
			<c:if test="${paging.startPage > paging.blockSize }">
			  <a href="${conPath }/main/mainto.do?pageNum=${paging.startPage-1}&windowType=${1}" class="btn">이전</a>
			</c:if>
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			  <c:if test="${i eq paging.currentPage }">
			    <a class="num2"> ${i } </a>
			  </c:if>
			  <c:if test="${i != paging.currentPage }">
			    <a href="${conPath }/main/mainto.do?pageNum=${i}&windowType=${1}" class="num">${i }</a>
			  </c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
			  <a href="${conPath }/main/mainto.do?pageNum=${paging.endPage+1}&windowType=${1}" class="btn">다음</a>
			</c:if>
			<div>&nbsp;</div>
			
	    	<%-- <c:if test="${empty member and empty admin }">
	      	  <div class="bt_wrap">
	            <input type="button" value="LOGIN" class="btn" onclick="location='${conPath}/member/loginForm.do'"/>
	      	  </div>
	    	</c:if> --%>
	  	    </div>
	  			
			<input type="hidden" name=mid value="${mid }"> 
			<input type="button" value="그룹 생성" onclick="location='${conPath }/groups/groupInsertForm.do?mid=${mid}'">
		</div>
=======
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
      <div style="z-index:100">
		<input type="button" value="UNIE" onclick="location.href='${conPath }/main/unieTestMain.do'"/>
	</div> 
 

     
 
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d

		</div>
		<!-- new -->
      </div>
   	  <div id="buttons">
	    <input type="button" value="MY GROUPS" onclick="location='${conPath }/groups/groupList.do?mid=${mid}'" class="btn1"> 
		<input type="button" value="FAQ" onclick="location='${conPath}/qboard/listQboardForMember.do'" class="btn2">
	  </div>
	  </c:if>
 	
	<jsp:include page="../main/footer.jsp"/>
</body>
<<<<<<< HEAD
<script>
	(function($) {
		"use strict";
		$("#switch").on('click', function() {
			if ($(".mainSection").hasClass("change")) {
				$(".mainSection").removeClass("change");
				$("#switch").removeClass("switched");
				$(".mainSection").removeClass("change");
				$('.newDiv').css('display', 'none');
				$('.oldDiv').css('display', 'block');

			} else {
				$(".mainSection").addClass("change");
				$("#switch").addClass("switched");
				$('.newDiv').css('display', 'block');
				$('.oldDiv').css('display', 'none');

			}
			if ($(".header").hasClass("change")) {
				$(".header").removeClass("change");
				$("#switch").removeClass("switched");
				$(".header").removeClass("change");

			} else {
				$(".header").addClass("change");
				$("#switch").addClass("switched");
			}
			if ($("#switch").hasClass("switched")) {
				$(".mainSection").addClass("change");
				$('.newDiv').css('display', 'block');
				$('.oldDiv').css('display', 'none');
			}
		});
	})(jQuery);
</script>

<script>
	/*  var windowType = Number('${param.windowType}'); */
	(function($) {
		"use strict";
		$(document).ready(function() {
			if ($("#switch").hasClass("switched")) {
				$(".mainSection").addClass("change");
				$('.newDiv').css('display', 'block');
				$('.oldDiv').css('display', 'none');
				$(".header").addClass("change");
				$('#windowType').val(1);
			} else {
				$('#windowType').val(0);
			}
		});
	})(jQuery);
</script>



<script>
	(function($) {
		$("#switch").on('click', function() {
			if ($(".mainSection").hasClass("change")) {
				$('#windowType').val(1);
			} else {
				$('#windowType').val(0);
			}
		});
	})(jQuery);
</script>

<div>
	<input type="button" value="UNIE"	onclick="location.href='${conPath }/groupboard/groupDetil.do?gid=1&mid=${mid }'" />
	<input type="button" value="UNIE"	onclick="location.href='${conPath }/groupboard/groupDetil.do?gid=2&mid=${mid }'" />
	<input type="button" value="검색기능 메인"	onclick="location.href='${conPath }/adminSearch/adminSearchMain.do'" />
</div>
</body>
</html>
=======
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
<<<<<<< HEAD
</body>
</html>
=======
   

	
	
</body>
</html>
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
