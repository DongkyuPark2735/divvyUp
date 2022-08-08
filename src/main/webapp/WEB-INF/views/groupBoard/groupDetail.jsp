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
#GroupBoardWrap{
	height: 500px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
		$(document).ready(function(){
			/* 타이머 새글 가져오기 */
			timer = setInterval( function () {
				console.log('새글 가져오기 타이머 작동 중');
				
				var exsitingGidByList = $("table#exsitingList tr:last td:nth-child(1)").text();
				var exsitingGidByTimer = $("table#singleLatestGroupboardResult tr:last td:nth-child(1)").text();
				$.ajax({
					url : "${conPath}/groupboard/singleLatestGroupboard.do",
			    type : "GET",
			    data : {"gid" : 1}, 
			    success: function(data){
			    	var mlist = ${applicationScope.sessionMList};
			    	if(){
							$('#currentMemebers').html(mlist);
			    	}
			    	
				    var checkGid = $.trim(data).substring(4, 7);
				    console.log(data.indexOf("<"));
				    console.log("입력한 글번호 :"+checkGid);
				    console.log("접속하자마자 맨 마지막 뜨는 글번호 "+exsitingGidByList);
				    console.log("뿌리는 맨마지막 번호: "+exsitingGidByTimer);
			    	if(checkGid != exsitingGidByList && checkGid != exsitingGidByTimer){
							$('#singleLatestGroupboardResult').append("<tr>"+data+"</tr>");
			    	}
			    }
				});
			}, 1000);
			
			
			/* 이전글 가져오기  */
			var cnt;
			$('#pastGroupBoardList').click(function(){
				if(isNaN(cnt)){
					cnt = 1;
				}
				var startRow = (cnt*20)+1;
				var endRow = (cnt*20)+20;
				 $.ajax({
	       	url : "${conPath}/groupboard/pastGroupBoardList.do",
	       	type : "GET",
	       	data : {"startRow" : startRow, "endRow":endRow, "gid":1}, 
	       	success: function(data){
	       		var tmpData = $.trim(data);
	       		if(data){
							$('#pastGroupBoardResult').prepend(data);
						  cnt = cnt+1;
	       		}else if(tmpData == ""){
							$('#pastGroupBoardResult').prepend("<b>이전 대화가 없습니다.</b>");
	       		}
	   	    }
				 });
			});
			
			/* 글 입력 */
			$('#insertGroupBoard').click(function(){
		    const tempGbfilename = $("#tempGbfilename")[0].files[0];
				var gid = $('#tempGid').val();
				var mid = $('#tempMid').val();
				var gbcontent = $('#tempGbcontent').val();
		    
		    var formData = new FormData();
		    formData.append("gid", gid);
		    formData.append("mid", mid);
		    formData.append("gbcontent", gbcontent);
		    formData.append("tempGbfilename", $("#tempGbfilename")[0].files[0]);
		    
				$.ajax({
	       	url : "${conPath}/groupboard/insertGroupBoard.do",
	       	type : "POST",
	       	data : formData,
	        enctype : 'multipart/form-data', 
	        processData: false,
	        contentType: false,
	        cache: false,
	       	success: function(data){
	       		$('#tempGbcontent').val('');
						$('#tempGbfilename').val('');
	       	}
				});
			});
			
			/* 글삭제 */
			$('.exsitingGid').click(function(){
				var gbid = $(this).text();
				console.log(gbid);
				var deleteCheck = confirm("해당 글을 삭제하시겠습니까?");
				if(deleteCheck){
					$.ajax({
		       	url : "${conPath}/groupboard/deleteGroupBoard.do",
		       	type : "GET",
		       	data : {"gbid" : gbid}, 
		       	success: function(data){
		       		  $('#GroupBoardWrap').load(location.href+' #GroupBoardWrap');
		       	}
					});
				}
			});
			
			
			/* 시간 test */
			var curDate = new Date();
			var curTime = curDate.getFullYear() + "-" 
			+ (curDate.getMonth() + 1) + "-" 
			+ curDate.getDate() + " " 
			+ curDate.getHours() + ":" 
			+ curDate.getMinutes() + ":" 
			+ curDate.getSeconds();
			$('#currenttime').text(curTime);
			
// 			/* 무한 스크롤 */
// 			$("#GroupBoardWrap").scroll(function() { 

// 				// 페이징을 위한 변수 ( *무시 해도 되는 부분 )
// 				var page = $("[name='feed_page']").val(); 
// 				var last_page = $("[name='feed_last_page']").val(); 
// 				if(page == last_page) return; 


// 				var innerHeight = $(this).innerHeight(); 
// 				var scroll=$(this).scrollTop() + $(this).innerHeight(); 
// 				var height=$(this)[0].scrollHeight; 

// 				if(scroll >= height){ 
// 					// exe 
// 				} 
// 			});
		});
		
		
</script>
</head>
<body>
	<h1>메인페이지</h1>
	<div>
		<p>실시간으로 바뀌면 안되는부분</p>
		<p id="currenttime"></p>
		
		<p>접속 회원 리스트</p>
		<p id="currentMemebers"></p>
	</div>
	
	<div id="GroupBoardWrap" style="overflow:auto">
		<!-- 이전대화 더보기 -->
		<input type="button" value="이전 대화 더보기" id="pastGroupBoardList">
		<table id="pastGroupBoardResult">
		</table>
		
		<!-- 기존대화 출력 -->
		<table id="exsitingList">
			<c:if test="${not empty grouplist}">
				<c:forEach var="glist" items="${grouplist}">
					<tr>
						<td class="exsitingGid" >${glist.gbid}</td>
						<td>${glist.gid}</td>
						<td>${glist.mid}</td>
						<c:if test="${not empty glist.gbfilename}">
							<c:if test="${not empty glist.gbcontent}">
								<td>
									<img src="${conPath }/groupFileBoardUploadFiles/${glist.gbfilename}" 
											 alt="첨부이미지" width="100" height="100"><br>
									${glist.gbcontent} 
								</td>
							</c:if>
							<c:if test="${empty glist.gbcontent}">
								<td>
									<img src="${conPath }/groupFileBoardUploadFiles/${glist.gbfilename}" 
											 alt="첨부이미지" width="100" height="100"><br>
								</td>
							</c:if>
						</c:if>
						<c:if test="${empty glist.gbfilename}">
							<td>
								${glist.gbcontent} 
							</td>
						</c:if>
						<td></td>
						<td>${glist.gbrdate} </td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
		<!-- 타이머 새대화 출력-->
		<table id="singleLatestGroupboardResult">
		</table>
	</div>
	
	<div>
		<!-- 대화 입력 -->
		<input type="hidden" name="gid" value="1" id="tempGid"> 
		<input type="hidden" name="mid" value="aaa" id="tempMid">
		<table>
			<tr>
				<td>
					내용 입력 : <input type="text" name="gbcontent" id="tempGbcontent">
					   			 <input type="file" name="gbfilename"	id="tempGbfilename">
				</td>
				<td>
					<input type="button" value="입력" id="insertGroupBoard">
				</td>
			</tr>
		</table>
	</div>

</body>
</html>











