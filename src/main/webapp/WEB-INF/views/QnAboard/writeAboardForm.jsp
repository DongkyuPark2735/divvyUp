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
  	th {
  		border: 1px solid red;
  	}
    td {
    	border: 1px solid red;
    }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <script>
     $(document).ready(function(){
        
     });
  </script>
</head>
<body>
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
    <form action="${conPath }/aboard/writeAboard.do" method="post">
      <input type="hidden" name="pageNum" value="${param.pageNum }">
      <input type="hidden" name="aid" value="${aid }">
      <input type="hidden" name="qbid" value="${qboard.qbid }">
	  <div class="board_write_wrap">
	    <div class="board_title">
          <strong>답변달기</strong>
        </div>
        <div class="board_write_wrap">
          <div class="board_write">
            <div class="title">
              <dl>
                <dt>제목</dt>
                <dd><input type="text" name="abtitle"></dd>
              </dl>
            </div>
            <div class="info">
              <dl>
                <dt>작성자</dt>
                <dd>${aid }</dd>
              </dl>
              <dl>
                <dt>해당글</dt>
                <dd>${qboard.qbid }</dd>
              </dl>
            </div>
            <div class="cont">
              <textarea name="abcontent" placeholder="내용 입력"></textarea>
            </div>
          </div>
  	    </div>
        <div class="bt_wrap">
  	      <input type="submit" value="글쓰기" class="on">
  	      <input type="button" value="뒤로가기" class="btn" onclick="location.href='${conPath }/qboard/viewQboard.do?qbid=${qboard.qbid }&pageNum=${param.pageNum }'">
  	    </div>
      </div>
    </form>
</body>
</html>