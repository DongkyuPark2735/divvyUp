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

table.type06 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  /* border-top: 1px solid #ccc; */
/*   border-bottom: 1px solid #ccc; */
  /* margin: 20px 10px; */
  color: white;
  heigth: 100%;
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
  /* background-color: rgba(c, c, c, 0.38); */
}

i {
  font-size: 0.8em;
}

div.scrollable {
		width:100%;
		/* height: 250px; */
		/* margin-top: 10px; */
		overflow: scroll;
		overflow-x: hidden;
		border:1px solid grey;
		scrollbar-color: dark;
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
  <div class="scrollable" style="height:500px;">
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
	      	<td class="uncheck" style="background: rgba(0, 0, 0, 0.9);"><strong style="color: #1DBF73;">${notification.notsender }</strong><b>${notification.notcontent }</b><br><i><fmt:formatDate value="${notification.notdate }" pattern="M월dd일(EE)"/></i></td>
	      </c:if>
	      <c:if test="${notification.notcheck eq 1 }">
	      	<td style="background: rgba(0, 0, 0, 0.2);"><strong style="color: #1DBF73;">${notification.notsender }</strong><b>${notification.notcontent }</b><br><i><fmt:formatDate value="${notification.notdate }" pattern="M월dd일(EE)"/></i></td>
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
  </div>

</body>
</html>