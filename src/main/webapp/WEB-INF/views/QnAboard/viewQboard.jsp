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
	<c:if test="${not empty modifyQboardResult }">
	  <script>alert('문의글 수정 성공');</script>
	</c:if>
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
    </div>
	</c:if>
          
	<c:if test="${not empty member and empty admin and (qboard.qbreplycheck eq 0) and (qboard.mid eq mid)}">
	  <div class="bt_wrap">
	    <button onclick="location='${conPath}/qboard/modifyQboardForm.do?qbid=${qboard.qbid}&pageNum=${param.pageNum}'">MODIFY_QBOARD</button>
		<button onclick="location='${conPath}/qboard/listQboardForMe.do?mid=${mid }'">MYLIST</button>
	  </div>
	</c:if>
	
	<c:if test="${(empty admin) and (mid != qboard.mid) }">
	  <div class="bt_wrap">
		<button onclick="location='${conPath}/qboard/listQboardForMember.do?pageNum=${param.pageNum }'">LIST</button>
	  </div>
	</c:if>
	
	<c:if test="${(empty admin) and (mid eq qboard.mid) and (qboard.qbreplycheck eq 1)  }">
	  <div class="bt_wrap">
		<button onclick="location='${conPath}/qboard/listQboardForMe.do?mid=${mid }'">MYLIST</button>
	  </div>
	</c:if>
	
	<c:if test="${not empty member and empty admin }">
	  <div class="bt_wrap">
	  </div>
	</c:if>
	
	<c:if test="${not empty admin and empty member and (qboard.qbreplycheck == 0) }">
	  <div class="bt_wrap">
	    <button onclick="location='${conPath}/aboard/writeAboardForm.do?qbid=${qboard.qbid }&pageNum=${param.pageNum }'">답변처리폼</button>
	    <button onclick="location='${conPath}/qboard/listUncheckedQboardForAdmin.do?pageNum=${param.pageNum }'">UNCHECKED_LIST</button>
	  </div>
	</c:if>
	<c:if test="${not empty admin and empty member and (qboard.qbreplycheck == 1) }">
	  <div class="bt_wrap">
	    <button onclick="location='${conPath}/aboard/modifyAboardForm.do?qbid=${qboard.qbid }&abid=${aboard.abid }&pageNum=${param.pageNum }'">답변수정폼</button>
	    <button onclick="location='${conPath}/qboard/listCheckedQboardForAdmin.do?pageNum=${param.pageNum }'">CHECKED_LIST</button>
	  </div>
	</c:if>
	      <%-- <table>
	        <tr>
	          <th>제 목<th>
	          <td colspan="3">${qboard.qbtitle }</td>
	        </tr>
	        <tr>
	          <th>작성자</th>
	          <td>${qboard.mid }</td>
	          <th>등록일</th>
	          <td>${qboard.qbrdate }</td>
	        </tr>
	        <tr>
	        <th>글번호</th>
	        <td>${qboard.qbid }</td>
	        <th>처리상태</th>
	        <td>
	          <c:if test="${qboard.qbreplycheck == 1 }">
	            처리완료
	          </c:if>
	          <c:if test="${qboard.qbreplycheck == 0 }">
	            접수
	          </c:if>
	        </td>
	      </tr>
	  </table>
	    <div>
	    ${qboard.qbcontent }
	    </div> --%>
	  <!-- 답변글 상세보기 -->
	  <%-- <c:if test="${not empty aboard }">
	  <div>
	    <table>
	      <tr>
	        <th>제 목<th>
	        <td colspan="3">${aboard.abtitle }</td>
	      </tr>
	      <tr>
	        <th>작성자</th>
	        <td>${aboard.aid }</td>
	        <th>등록일</th>
	        <td>${aboard.abdate }</td>
	      </tr>
	      <tr>
	        <th>글번호</th>
	        <td>${aboard.abid }</td>
	        <th>해당글</th>
	        <td>${aboard.qbid }</td>
	      </tr>
	    </table>
	    <div>
	    ${aboard.abcontent }
	    </div>
	  </div>
	  </c:if> --%>
	   <!-- 답변글 상세보기 -->
</body>
</html>