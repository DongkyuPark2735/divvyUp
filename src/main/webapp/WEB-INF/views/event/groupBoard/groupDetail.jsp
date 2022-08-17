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
<link href="${conPath}/css/tempChattCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
		$(document).ready(function(){
			/* 타이머 새글 가져오기 */
			var sessionGid = ${sesiongGid};
			$('#chattingBoardList').scrollTop($('#chattingBoardList')[0].scrollHeight);
			
			timer = setInterval( function () {
				console.log('새글 가져오기 타이머 작동 중');
				var exsitingGidByList = $("table#exsitingList tr:last td:nth-child(1)").text();
				var exsitingGidByTimer = $("table#singleLatestGroupboardResult tr:last td:nth-child(1)").text();
				$.ajax({
					url : "${conPath}/groupboard/singleLatestGroupboard.do",
			    type : "GET",
			    data : {"gid" : sessionGid}, 
			    success: function(data){
			    	var result = data.trim();
			    	var index = result.indexOf('joinMList">');
			    	var lstIndex = result.lastIndexOf('</td>');
			    	$('#currentMemebers').html(result.substring(index+11, lstIndex));
			    	
			    	var index2 = data.indexOf('gidClick">');
			    	var lstIndex2 = data.indexOf('</td>');
			    	var checkGid = $.trim(data).substring(index2+2, lstIndex2-8);
			    	if(checkGid != exsitingGidByList && checkGid != exsitingGidByTimer){
							$('#singleLatestGroupboardResult').append("<tr>"+data+"</tr>");
							$('#chattingBoardList').scrollTop($('#chattingBoardList')[0].scrollHeight);
			    	}
			    }
				});
			}, 1000);
			
			
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
			$('.gidClick').click(function(){
				var gbid = $(this).text();
				var deleteCheck = confirm("해당 글을 삭제하시겠습니까?");
				if(deleteCheck){
					$.ajax({
		       	url : "${conPath}/groupboard/deleteGroupBoard.do",
		       	type : "GET",
		       	data : {"gbid" : gbid}, 
		       	success: function(data){
		       			console.log($('#GroupBoardWrap').text());
		       		  $('div#GroupBoardWrap').load(location.href+' #GroupBoardWrap');
		       	}
					});
				}
			});
			
			/* 글 불러오기 스크롤  */
			var cnt;
			$("#chattingBoardWarp #chattingBoardList").scroll(function() { 
				var innerHeight = $(this).innerHeight(); // 스크롤 길이
				var scroll=$(this).scrollTop() + $(this).innerHeight(); //현재 스크롤 마지막 부분
				var height=$(this)[0].scrollHeight;	//전체 스크롤 마지막 부분
				console.log("innerHeight : " + innerHeight);
				console.log("scroll : " + scroll);
				console.log("height : " + height);
				
				if(isNaN(cnt)){
					cnt = 1;
				}
				
				var startRow = (cnt*20)+1;
				var endRow = (cnt*20)+20;
	
				if(scroll <= (innerHeight+0.4)){
					$.ajax({
				       	url : "${conPath}/groupboard/pastGroupBoardList.do",
				       	type : "GET",
				       	data : {"startRow" : startRow, "endRow":endRow, "gid":1}, 
				       	success: function(data){
				       		var tmpData = $.trim(data);
				       		if(data){
										$('#pastGroupBoardResult').prepend(data);
										$('#chattingBoardList').scrollTop(scroll + 10);
									  cnt = cnt+1;
				       		}else if(tmpData == ""){
										$('#pastGroupBoardResult').prepend("<b>이전 대화가 없습니다.</b>");
				       		}
				   	    }
				  });					
				}
			});
			
			
			/* 파일첨부 파일이름 */
			$("#tempGbfilename").on('change',function(){
			  var fileName = $("#tempGbfilename").val();
			  $("#upload-name").html(fileName);
			});
		});
		
</script>
</head>
<body>

	<h1>메인페이지</h1>
	<div id="chattingBoardWarp">
		<div id="chattingHeaderBar">
			<p>'파라미터gid' Group Board</p>
			<p id="currentMemebers"></p>
		</div>
		
		<div id="chattingBoardList" style="overflow:auto; height: 500px; width: 500px;" >
			<table id="pastGroupBoardResult">
			
			</table>
			
			<!-- 기존대화 출력 -->
			<table id="exsitingList">
				<c:if test="${not empty grouplist}">
					<c:forEach var="glist" items="${grouplist}">
						<tr>
							<td class="gidClick" >${glist.gbid}</td>
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
							<td> 
								<fmt:formatDate value="${glist.gbrdate}" pattern="yy년MM월dd일 hh:mm:ss"/>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			
			<!-- 타이머 새대화 출력-->
			<table id="singleLatestGroupboardResult">
			</table>
		</div>
		
		<div id="chattingBoardInsert" >
			<!-- 대화 입력 -->
			<input type="hidden" name="gid" value="1" id="tempGid"> 
			<input type="hidden" name="mid" value="aaa" id="tempMid">
			<table>
				<tr>
					<td>
						<label for="tempGbfilename">
							<img src="${conPath }/groupFileBoardUploadFiles/fileIcon.png" width="40" height="30" >
						</label>
						<input type="file" name="gbfilename"	id="tempGbfilename" style="display: none;">
					</td>
					<td>
						<input type="text" name="gbcontent" id="tempGbcontent">
					</td>
					<td>
						<img id="insertGroupBoard" src="${conPath }/groupFileBoardUploadFiles/pngegg.png" width="40" height="30" >
					</td>
				</tr>
			</table>
			<p id="upload-name"></p>
		</div>
	</div>	
</body>
</html>











