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
	<form action="${conPath }/aboard/modifyAboard.do" method="post">
	  <input type="hidden" name="abid" value="${aboard.abid }">
	  <input type="hidden" name="aid" value="${aid }">
	  <input type="hidden" name="qbid" value="${qboard.qbid }">
	  <input type="hidden" name="pageNum" value="${param.pageNum }">
	  <div class="board_write_wrap">
	    <div class="board_title">
          <strong>답변수정</strong>
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
        </div>
        <div class="bt_wrap">
          <input type="submit" value="작성" class="on">
	      <input type="button" value="뒤로가기" class="btn" onclick="location.href='${conPath }/qboard/viewQboard.do?qbid=${qboard.qbid }&pageNum=${param.pageNum }'">
        </div>
	  </div>
	</form>
        
        
	      <%-- <table>
	        <tr>
	          <th>제목<th>
	          <td colspan="3"><input type="text" name="abtitle" value="${aboard.abtitle }"></td>
	        </tr>
	        <tr>
	          <th>작성자</th>
	          <td>${aboard.aid }</td>
	          <th>해당글</th>
	          <td>${qboard.qbid }</td>
	        </tr>
	        <tr>
	          <td colspan="4"><textarea rows="5" cols="20" name="abcontent">${aboard.abcontent }</textarea></td>
	        </tr>
	        <tr>
	          <td colspan="4">
	            <input type="submit" value="작성">
	            <input type="button" value="뒤로가기" class="btn" onclick="location.href='${conPath }/qboard/viewQboard.do?qbid=${qboard.qbid }&pageNum=${param.pageNum }'">
	          </td>
	        </tr>
	      </table> --%>
	
</body>
</html>