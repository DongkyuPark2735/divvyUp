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
<!---------------------------------------------------- 여기까지 헤더 --------------------------------------------------------->
	<!-- 작성폼 콘텐츠 시작 -->
	<div class="board_list_wrap">
	<form action="${conPath }/qboard/writeQboard.do" method="post" class="boardWriteForm">
      <input type="hidden" name="pageNum" value="${param.pageNum }">
      <input type="hidden" name="mid" value="${mid }">
	  <div class="board_write_wrap">
	    <div class="board_title">
          <strong>문의글 작성하기</strong>
        </div>
        <div class="board_write_wrap">
          <div class="board_write">
            <div class="title">
              <dl>
                <dt>제목</dt>
                <dd><input type="text" name="qbtitle" required="required"></dd>
              </dl>
            </div>
            <div class="info">
              <dl>
                <dt>작성자</dt>
                <dd>${mid }</dd>
              </dl>
              <dl>
                <dt></dt>
                <dd></dd>
              </dl>
            </div>
            <div class="cont">
              <textarea name="qbcontent" placeholder="내용 입력" required="required"></textarea>
            </div>
          </div>
  	    </div>
        <div class="bt_wrap">
  	      <input type="submit" value="글 작성" class="on">
  	    </div>
      </div>
    </form>
    </div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>