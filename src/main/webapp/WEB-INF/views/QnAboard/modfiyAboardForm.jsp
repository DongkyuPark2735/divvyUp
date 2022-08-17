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
	</div>
	<div class="board_list_wrap">
	<form action="${conPath }/aboard/modifyAboard.do" method="post">
	  <input type="hidden" name="abid" value="${aboard.abid }">
	  <input type="hidden" name="aid" value="${aid }">
	  <input type="hidden" name="qbid" value="${qboard.qbid }">
	  <input type="hidden" name="pageNum" value="${param.pageNum }">
	  <div class="board_write_wrap">
	    <div class="board_title">
          <strong>답변글 수정하기</strong>
        </div>
        <div class="board_write_wrap">
          <div class="board_write">
            <div class="title">
              <dl>
                <dt>제목</dt>
                <dd><input type="text" name="abtitle" value="${aboard.abtitle }"></dd>
              </dl>
            </div>
            <div class="info">
              <dl>
                <dt>작성자</dt>
                <dd>${aboard.aid }</dd>
              </dl>
              <dl>
                <dt>해당글</dt>
                <dd>${qboard.qbid }</dd>
              </dl>
            </div>
            <div class="cont">
              <textarea name="abcontent">${aboard.abcontent }</textarea>
            </div>
          </div>
          <div class="bt_wrap">
            <input type="submit" value="글 수정" class="on">
          </div>
        </div>
	  </div>
	</form>
    </div>    
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>