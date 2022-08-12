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
  <style>
/*     ul {
    	list-style: none;
    } */
table.type06 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin: 20px 10px;
}

table.type06 tr {
	border-bottom: 1px solid #ccc;
}

table.type06 td {
  width: 400px;
  padding: 10px;
  vertical-align: top;
  
}
table.type06 .uncheck {
  background: #efefef;
}

i {
  font-size: 0.8em;
}
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <script>
     $(document).ready(function(){
        
     });
  </script>
  <script type='text/javascript'>
    window.onload = function(){
     if((parseInt(document.getElementById('body').offsetHeight)
        - parseInt(window.document.body.clientHeight)) > 20) {
        window.document.body.scroll = "auto";
        window.resizeBy(18,0);
      }
    }
  </script>
</head>
<body>
  <div id="body">
	<table class="type06">
		<c:if test="${paging.totCnt eq 0}">
	      <tr>
	        <th>알림이 없습니다</th>
	      </tr>
	    </c:if>
	    <c:if test="${paging.totCnt != 0 }">
	    <c:forEach items="${allNotification }" var="notification">
	      <tr>
	      <c:if test="${notification.notcheck eq 0 }">
	      	<td class="uncheck"><b>${notification.notsender }${notification.notcontent }</b><br><i><fmt:formatDate value="${notification.notdate }" pattern="M월dd일(EE)"/></i></td>
	      </c:if>
	      <c:if test="${notification.notcheck eq 1 }">
	      	<td><b>${notification.notsender }${notification.notcontent }</b><br><i><fmt:formatDate value="${notification.notdate }" pattern="M월dd일(EE)"/></i></td>
	      </c:if>
	      </tr>
	    </c:forEach>
	  </c:if>
  		<!-- <tr>
    		<th scope="row" class="even">항목명</th>
    		<td class="even">내용이 들어갑니다.</td>
  		</tr> -->
	</table>
  </div>


<%-- 	<ul>
	<c:if test="${paging.totCnt eq 0}">
	  <li>알림이 없습니다</li>
	</c:if>
	<c:if test="${paging.totCnt != 0 }">
	  <c:forEach items="${uncheckedNotificationList }" var="notification">
	    <li><b>${notification.notsender }${notification.notcontent }</b>   <fmt:formatDate value="${notification.notdate }" pattern="M월dd일(EE)"/></li>
	  </c:forEach>
	</c:if>
	</ul> --%>
	
	
	
	<%-- <table>
	  <c:if test="${paging.totCnt eq 0}">
	    <tr>
	      <th>알림이 없습니다</th>
	    </tr>
	  </c:if>
	  <c:if test="${paging.totCnt != 0 }">
	    <c:forEach items="${allNotification }" var="notification">
	    <c:forEach items="${uncheckedNotificationList }" var="notification">
	      <tr>
	      	 <td>${notification.notsender }${notification.notcontent }</td>
	      </tr>
	    </c:forEach>
	  </c:if>
	</table>
	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/notification/notificationConfirmForm.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/notification/notificationConfirmForm.do?pageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/notification/notificationConfirmForm.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div> --%> 
	<%-- <button onclick="location='${conPath}/main/mainto.do'">MAIN</button> --%>
</body>
</html>