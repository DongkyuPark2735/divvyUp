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
	<form action="${conPath }/qboard/writeQboard.do" method="post">
      <input type="hidden" name="pageNum" value="${param.pageNum }">
      <input type="hidden" name="mid" value="${mid }">
	  <div class="board_write_wrap">
	    <div class="board_title">
          <strong>문의글 작성</strong>
        </div>
        <div class="board_write_wrap">
          <div class="board_write">
            <div class="title">
              <dl>
                <dt>제목</dt>
                <dd><input type="text" name="qbtitle"></dd>
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
              <textarea name="qbcontent" placeholder="내용 입력"></textarea>
            </div>
          </div>
  	    </div>
        <div class="bt_wrap">
  	      <input type="submit" value="글쓰기" class="on">
  	      <input type="button" value="뒤로가기" class="btn" onclick="location='${conPath}/qboard/listQboardForMember.do?pageNum=${param.pageNum }'"/>
  	    </div>
      </div>
    </form>
</body>
</html>