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
  <link href="${conPath }/css/style.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <script>
     $(document).ready(function(){
    	 $('tr').click(function() {
 			var qbid = Number($(this).children().eq(1).text());
 			if(!isNaN(qbid)) {
 				/* alert(qbid); */
  				location.href='${conPath}/qboard/viewQboard.do?qbid='+qbid+'&pageNum=${paging.currentPage}';
 			}
 		});
     });
  </script>
</head>
<body>
	<c:if test="${not empty writeAboardResult}">
		<script>alert('답변글 작성 성공');</script>
	</c:if>
	<c:set var="iNum" value="${paging.totCnt - paging.startRow + 1 }"/>
	<table>
	  <tr onclick="trclicked(${qboard.qbid})">
	    <th>NO.</th>
	    <th>글번호</th>
	    <th>제목</th>
	    <th>작성자</th>
	    <th>등록일</th>
	    <th>처리상태</th>
	  </tr>
	  <c:if test="${totCnt eq 0}">
	    <tr>
	      <th colspan="6">처리할 문의글이 없습니다</th>
	    </tr>
	  </c:if>
	  <c:if test="${totCnt != 0 }">
	    <c:forEach items="${listUncheckedQboardForAdmin }" var="qboard">
	      <tr onclick="trclicked(${qboard.qbid})">
	      	<td>${iNum }</td>
	        <td>${qboard.qbid }</td>
	        <td>${qboard.qbtitle }</td>
	        <td>${qboard.mid }</td>
	        <td>${qboard.qbrdate }</td>
	        <td>
	          <c:if test="${qboard.qbreplycheck == 1 }">
	            처리완료
	          </c:if>
	          <c:if test="${qboard.qbreplycheck == 0 }">
	            접수
	          </c:if>
	        </td>
	      </tr>
	      <c:set var="iNum" value="${iNum-1 }"/>
	    </c:forEach>
	  </c:if>
	</table>
	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/qboard/listUncheckedQboardForAdmin.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/qboard/listUncheckedQboardForAdmin.do?pageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/qboard/listUncheckedQboardForAdmin.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
	<c:if test="${empty member and not empty admin }">
	  <button onclick="location='${conPath}/main.do'">MAIN</button>
	</c:if>
</body>
</html>