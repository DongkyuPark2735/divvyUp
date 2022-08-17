<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="${conPath }/css/board/boardWrite.css" rel="stylesheet">
  <style>
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <script>
     $(document).ready(function(){
        
     });
  </script>
</head>
<body>
	<c:if test="${not empty modifyQboardResult }">
	  <script>alert('문의글 수정 성공');</script>
	</c:if>
	
	<c:if test="${(empty member) and (empty admin) }"><!-- 회원과 관리자가 아무도 안들어 왔을 때 -->
	  <nav class="header">
		<div class="container">
			<h1 class="logo">
				<a href="${conPath}/member/loginForm.do">D<span>U</span></a>
			</h1>
			<ul>
				<li><a href="${conPath}/member/loginForm.do">로그인</a></li>
				<li class="joinBtn"><a href="#" >회원가입</a></li>
				<li><a href="${conPath}/qboard/listQboardForMember.do">Q&A</a></li>
			</ul>
		</div>
	  </nav>
	</c:if><!-- 회원과 관리자가 아무도 안들어 왔을 때 -->
	
	<c:if test="${not empty mid }"><!-- 회원만 들어왔을 때 -->
	  <nav class="header">
		<div class="container">
			<h1 class="logo">
				<a href="${conPath}/main/mainto.do">D<span>U</span></a>
			</h1>
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
            	<%-- <a href="${conPath}/notification/notificationConfirmForm.do" class="notification"> --%>
            	<a href="#" class="notification"> 
               	  <img src= "${conPath}/icon/noti.png" class="imgNoti" />
               	  <div class="badge">${uncheckdNotificationCnt }</div>
                </a>
           	  </li>
           	  <!-- <li>
                <a href="#">공지사항</a>
              </li> -->
              <li>
            	<a href="${conPath}/main/logout.do">
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
	
	
	<div class="board_wrap">
	  <div class="board_title">
        <strong>${qboard.qbid }번 글 상세보기</strong>
      </div>
      <div class="board_view_wrap">
        <div class="board_view">
          <div class="title">
            ${qboard.qbtitle }
          </div>
          <div class="info">
            <dl>
              <dt>글번호</dt>
              <dd>${qboard.qbid }</dd>
            </dl>
            <dl>
              <dt>작성자</dt>
              <dd>${qboard.mid }</dd>
            </dl>
            <dl>
              <dt>등록일</dt>
              <dd>${qboard.qbrdate }</dd>
            </dl>
            <dl>
              <dt>처리상태</dt>
              <dd>
                <c:if test="${qboard.qbreplycheck == 1 }">
	              처리완료
	            </c:if>
	            <c:if test="${qboard.qbreplycheck == 0 }">
	              접수
	            </c:if> 
              </dd>
            </dl>
          </div>
          <div class="cont">
            ${qboard.qbcontent }
          </div>
	    </div>
	  </div>
	  <c:if test="${not empty aid and (qboard.qbreplycheck == 0) }">
	    <div class="bt_wrap">
	      <button onclick="location='${conPath}/aboard/writeAboardForm.do?qbid=${qboard.qbid }&pageNum=${param.pageNum }'">답변글 처리하기</button>
	    </div>
	  </c:if>
	  <c:if test="${not empty member and empty admin and (qboard.qbreplycheck eq 0) and (qboard.mid eq mid)}">
	    <div class="bt_wrap">
	      <button onclick="location='${conPath}/qboard/modifyQboardForm.do?qbid=${qboard.qbid}&pageNum=${param.pageNum}'">문의글 수정하기</button>
	    </div>
	  </c:if>
	</div>
	
	
	<c:if test="${not empty aboard }">
    <div class="board_wrap">
	  <div class="board_title">
        <strong>${qboard.qbid }번 글에 대한 답변글</strong>
      </div>
       <div class="board_view_wrap">
          <div class="board_view">
            <div class="title">
              ${aboard.abtitle }
            </div>
            <div class="info">
              <dl>
                <dt>작성자</dt>
                <dd>${aboard.aid }</dd>
              </dl>
              <dl>
                <dt>등록일</dt>
                <dd>${aboard.abdate }</dd>
              </dl>
              <dl>
                <dt>글번호</dt>
                <dd>${aboard.abid }</dd>
              </dl>
              <dl>
                <dt>해당글</dt>
                <dd>${aboard.qbid }</dd>
              </dl>
            </div>
            <div class="cont">
              ${aboard.abcontent }
            </div>
          </div>
       </div>
	   <c:if test="${not empty aid and (qboard.qbreplycheck == 1) }">
	     <div class="bt_wrap">
	       <button onclick="location='${conPath}/aboard/modifyAboardForm.do?qbid=${qboard.qbid }&abid=${aboard.abid }&pageNum=${param.pageNum }'">답변글 수정하기</button>
	     </div>
	   </c:if>
      </div>
	</c:if>
          
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>