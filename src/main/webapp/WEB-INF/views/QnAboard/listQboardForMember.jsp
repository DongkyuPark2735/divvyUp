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
  <link href="${conPath }/css/board/boardList.css" rel="stylesheet">
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Concert+One&family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
<body>
	<c:if test="${not empty writeQboardResult }">
	  <script>alert('문의글 작성 성공');</script>
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
<!---------------------------------------------------- 여기까지 헤더 --------------------------------------------------------->	
	<c:set var="iNum" value="${paging.totCnt - paging.startRow + 1 }"/>
	
	<div class="board_list_wrap">
	<div class="main_title"><h1>고객 센터</h1></div>
	<table class ="board_list">
	  <caption>문의 게시판</caption>
	  <thead>
	    <tr>
	      <th>NO.</th>
	      <th>글번호</th>
	      <th>제 목</th>
	      <th>작성자</th>
	      <th>등록일</th>
	      <th>처리상태</th>
	  </tr>
	  </thead>
	  <tbody>
	  <c:if test="${paging.totCnt eq 0}">
	    <tr>
	      <th colspan="6">등록된 문의글이 없습니다</th>
	    </tr>
	  </c:if>
	  <c:if test="${paging.totCnt != 0 }">
	    <c:forEach items="${listQboardForMember }" var="qboard">
	      <tr onclick="trclicked(${qboard.qbid})">
	      	<td>${iNum }</td>
	        <td>${qboard.qbid }</td>
	        <td class="tit">${qboard.qbtitle }</td>
	        <td>${qboard.mid }</td>
	        <td><fmt:formatDate value="${qboard.qbrdate }" type="date" pattern="yy.MM.dd"/></td>
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
	  </tbody>
	</table>
	
	
	  <div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			<a href="${conPath }/qboard/listQboardForMember.do?pageNum=${paging.startPage-1}" class="btn"><</a>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				<a class="num2"> ${i } </a>
			</c:if>
			<c:if test="${i != paging.currentPage }">
				<a href="${conPath }/qboard/listQboardForMember.do?pageNum=${i}" class="num">${i }</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			<a href="${conPath }/qboard/listQboardForMember.do?pageNum=${paging.endPage+1}" class="btn">></a>
		</c:if>
		<div>&nbsp;</div>
	    <c:if test="${empty member and empty admin }">
	      <div class="bt_wrap">
	      </div>
	    </c:if>
	  </div>
	  
	<c:if test="${not empty member or not empty admin }">
	  <div class="bt_wrap">
	      <c:if test="${not empty member and empty admin }">
	        <input type="button" value="문의글 작성" class="btn" onclick="location='${conPath}/qboard/writeQboardForm.do?pageNum=${paging.currentPage }'"/>
	      </c:if>
	  </div>
	</c:if>
	
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>