<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<title>Insert title here</title>
<link href="${conPath}/css/style.css" rel="stylesheet">
<style>
* {
	margin: 0 auto;
}

div {
	width: 500px;
	border: 1px solid black;
	display: inline-block;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
		$(document).ready(function(){
			/* 타이머 새글 가져오기 */
			timer = setInterval( function () {
				console.log('1');
				$.ajax({
					url : "${conPath}/groupboard/singleLatestGroupboard.do",
			    type : "GET",
			    data : {"gid" : 100}, 
			    success: function(data){
						$('#singleLatestGroupboardResult').append(html(data));
			   	
			    }
				});
			}, 1000);
		

			/* 이전글 가져오기  */
			$('#pastList').click(function(){
				 $.ajax({
	       	url : "${conPath}/groupboard/listPast.do",
	       	type : "GET",
	       	data : {"startRow" : 21, "endRow":40, "gid":100}, 
	       	success: function(data){
	   	    	alert(data);
	   	    }
				});
			});
			
			/* 대화 입력 */
			$('#insertGroupBoard').click(function(){
				var gid = $('#tempGid').val();
				var mid = $('#tempMid').val();
				var gbcontent = $('#tempGbcontent').val();
				var gbfilename = $('#tempGbfilename').val();
				$.ajax({
	       	url : "${conPath}/groupboard/insertGroupBoard.do",
	       	type : "POST",
	       	data : {"gid" : gid, "mid":mid, "gbcontent":gbcontent, "gbfilename":gbfilename}, 
	       	success: function(data){
						$('#insertGroupBoardResult').html(data);
						
	       	}
				});
			});

			
			var curDate = new Date();
			var curTime = curDate.getFullYear() + "-" 
			+ (curDate.getMonth() + 1) + "-" 
			+ curDate.getDate() + " " 
			+ curDate.getHours() + ":" 
			+ curDate.getMinutes() + ":" 
			+ curDate.getSeconds();
			
			$('#currenttime').text(curTime);
			$('#currenttime2').text(curTime);
		});
</script>
</head>
<body>
<script >
	console.log('${pastGrouplist}');
</script>

	<h1>메인페이지</h1>
	<div>
		<p>실시간으로 바뀌면 안되는부분</p>
		<p id="currenttime"></p>
	</div>
	<div>
		<p>구분 2</p>
		<table>
			<tr>
				<td>
					<input type="button" value="이전글 더보기" id="pastList">
				</td>
			</tr>
						
			<c:if test="${not empty grouplist}">
				<c:forEach var="glist" items="${grouplist}">
					<tr>
						<td>${glist.gbid}</td>
						<td>${glist.gid}</td>
						<td>${glist.mid}</td>
						<td>${glist.gbcontent}</td>
						<td>${glist.gbfilename}</td>
						<td>${glist.gbrdate}</td>
					</tr>
				</c:forEach>
					<tr id="singleLatestGroupboardResult">
					</tr>
					<tr id="insertGroupBoardResult">
					</tr>
			</c:if>
				
		</table>
	</div>
	<div>
			<input type="hidden" name="gid" value="100" id="tempGid">
			<input type="hidden" name="mid" value="QWE2735" id="tempMid">
			<table>
				<tr>
					<td>
						내용 입력 : <input type="text" name="gbcontent" id="tempGbcontent">
						<input type="file" name="gbfilename" id="tempGbfilename">
					</td>
					<td>
					  <input type="button" value="입력" id="insertGroupBoard">
					</td>
				</tr>		
			</table>
	</div>
	<div>
		<p>실시간으로 바뀌면 안되는부분2</p>
		<p id="currenttime2"></p>
	</div>
</body>
</html>











