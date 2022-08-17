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
			/* 대화입력창 포커스 */
			$('#chattingBoardWarp #chattingBoardInsert #tempGbcontent').focus();
			var sessionGid = ${sesionGBgid}; /*세션 gid셋팅*/
			/* 스크롤 아래로 시작 */
			$('#chattingBoardList').scrollTop($('#chattingBoardList')[0].scrollHeight);
			
			/* 타이머 새글 가져오기 */
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
							var midforfloatRight = $("#chattingBoardList table#singleLatestGroupboardResult tr:last td:nth-child(3)").text();
							if(sessionMid == midforfloatRight){
								$("#chattingBoardList table#singleLatestGroupboardResult tr:last td:nth-child(3)").css(
										{"float":"right"});
								$("#chattingBoardList table#singleLatestGroupboardResult tr:last td:nth-child(4)").css(
										{"float":"right","border-radius":"20px 0px 20px 20px"});
								$("#chattingBoardList table#singleLatestGroupboardResult tr:last td:nth-child(5)").css(
										{"float":"right"});
								$("#chattingBoardList table#singleLatestGroupboardResult tr:last td:nth-child(6)").css(
										{"float":"right"});
							}
							$("#chattingBoardList table#singleLatestGroupboardResult tr:last td:nth-child(5)").hide();
			    	}
			    }
				}).done(function () {
					  /* 타이머 글 삭제 버튼 생성 */
					  $('#chattingBoardList table#singleLatestGroupboardResult tr').mouseover(function () {
							deleteImgShow(this);
						});
					  /* 타이머 글 삭제버튼 제거 */
					  $('#chattingBoardList table#singleLatestGroupboardResult tr').mouseleave(function () {
							deleteImgHide(this);
						});
					  /* 방금쓴 타이머 글 삭제 */
					  $("#chattingBoardList table#singleLatestGroupboardResult img[class='imgForDelete']").click(function(){
							deleteGrouBoardFcn(this);
						});
					});
			}, 1000);
			
			/* 글입력 함수 선언 */
			function insertGrouBoardFcn(){
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
						$('#chattingBoardWarp #chattingBoardInsert #tempGbcontent').focus();
		     	}
				});
			};
			
			/* 글삭제 버튼 생성 함수선언 */
			function deleteImgShow(trOver) {
				var tempGdidforDelete = $(trOver).children('td:nth-child(1)').text();
				var tempMidforDelete = $(trOver).children('td:nth-child(3)').text();
				if(tempMidforDelete == sessionMid){
					$(trOver).children("td:nth-child(5)").show();
				}
			};
			
			/* 글삭제 버튼 숨김 함수선언 */
			function deleteImgHide(trOver) {
				var tempGdidforDelete = $(trOver).children('td:nth-child(1)').text();
				var tempMidforDelete = $(trOver).children('td:nth-child(3)').text();
				if(tempMidforDelete == sessionMid){
					$(trOver).children("td:nth-child(5)").hide();
				}
			};
			
			/* 글 삭제 함수 선언*/
			function deleteGrouBoardFcn(deleteGbid){
				var gbid = $(deleteGbid).parent('td').siblings('.gidClick').text();
				if(confirm("해당 글을 삭제하시겠습니까?")){
					$.ajax({
		       	url : "${conPath}/groupboard/deleteGroupBoard.do",
		       	type : "GET",
		       	data : {"gbid" : gbid}, 
		       	success: function(data){
							location.reload();
		       	}
					});
				};
			};
			
			/* 글 입력 */
			$('#tempGbcontent').keydown(function (key) {
		    if (key.keyCode == 13) {
					insertGrouBoardFcn();
		    }
		  });
			$('#insertGroupBoard').click(function () {
					insertGrouBoardFcn();
			});

			/* 기존글삭제 */
			$("img[class='imgForDelete']").click(function(){
				deleteGrouBoardFcn(this);
			});
			
			/* 글 불러오기 스크롤  */
			var cnt;
			$("#chattingBoardWarp #chattingBoardList").scroll(function() { 
				var innerHeight = $(this).innerHeight(); // 스크롤 길이
				var scroll=$(this).scrollTop() + $(this).innerHeight(); //현재 스크롤 마지막 부분
				var height=$(this)[0].scrollHeight;	//전체 스크롤 마지막 부분
				if(isNaN(cnt)){
					cnt = 1;
				}
				var startRow = (cnt*20)+1;
				var endRow = (cnt*20)+20;
				if(scroll <= (innerHeight+0.4)){
					$.ajax({
				  	url : "${conPath}/groupboard/pastGroupBoardList.do",
				    type : "GET",
				    data : {"startRow" : startRow, "endRow":endRow, "gid":sessionGid}, 
				    success: function(data){
				    	var tmpData = $.trim(data);
				      if(tmpData){
								$('#pastGroupBoardResult').prepend(data);
								$('#chattingBoardList').scrollTop(scroll + 10);
								cnt = cnt+1;
								for(var i=1; i<=$("#chattingBoardList table#pastGroupBoardResult tr").length; i++){
					    	  var midforfloatRightPastList = $("#chattingBoardList table#pastGroupBoardResult tr:nth-child("+i+") td:nth-child(3)").text();
					    	  if(sessionMid == midforfloatRightPastList){
										$("#chattingBoardList table#pastGroupBoardResult tr:nth-child("+i+") td:nth-child(3)").css(
												{"float":"right"});
										$("#chattingBoardList table#pastGroupBoardResult tr:nth-child("+i+") td:nth-child(4)").css(
												{"float":"right","border-radius":"20px 0px 20px 20px"});
										$("#chattingBoardList table#pastGroupBoardResult tr:nth-child("+i+") td:nth-child(5)").css(
												{"float":"right"});
										$("#chattingBoardList table#pastGroupBoardResult tr:nth-child("+i+") td:nth-child(6)").css(
												{"float":"right"});
									} 
								}
								$("#chattingBoardList table#pastGroupBoardResult tr td:nth-child(5)").hide();
				      }else{
								$('#pastGroupBoardResult').prepend("<h2>이전 대화가 없습니다.</h2h>");
				      }
				   	}
				  }).done(function () {
					  /* 이전글 삭제 버튼 생성 */
					  $('#chattingBoardList table#pastGroupBoardResult tr').mouseover(function () {
							deleteImgShow(this);
						});
					  /* 이전글 삭제버튼 제거 */
					  $('#chattingBoardList table#pastGroupBoardResult tr').mouseleave(function () {
							deleteImgHide(this);
						});
					  /* 이전글 삭제 */
					  $("#chattingBoardList table#pastGroupBoardResult img[class='imgForDelete']").click(function(){
							deleteGrouBoardFcn(this);
						});
					});	
				};	
			});
			
			/* 파일첨부 파일이름 */
			$("#tempGbfilename").on('change',function(){
			  var fileName = $("#tempGbfilename").val();
			  $("#upload-name").html(fileName);
			  
			});
			
			/* 세션 mid글 오른쪽 정렬  */
			var sessionMid = $('#tempMid').val();
			for(var i=1; i<=$("#chattingBoardList table#exsitingList tr").length; i++){
				var midforfloatRight = $("#chattingBoardList table#exsitingList tr:nth-child("+i+") td:nth-child(3)").text();
				if(sessionMid == midforfloatRight){
					$("#chattingBoardList table#exsitingList tr:nth-child("+i+") td:nth-child(3)").css({"float":"right"});
					$("#chattingBoardList table#exsitingList tr:nth-child("+i+") td:nth-child(4)").css({"float":"right","border-radius":"20px 0px 20px 20px"});
					$("#chattingBoardList table#exsitingList tr:nth-child("+i+") td:nth-child(5)").css({"float":"right"});
					$("#chattingBoardList table#exsitingList tr:nth-child("+i+") td:nth-child(6)").css({"float":"right"});
				} 
			}	
			
			/* 모든 삭제IMG 숨기기 */
			$("img[class='imgForDelete']").parents('td').hide();

			/* 기존글 삭제 버튼 생성 */
			$('#chattingBoardList table#exsitingList tr').mouseover(function () {
				deleteImgShow(this);
			});
			
			/* 기존글 삭제 버튼 숨김*/
			$('#chattingBoardList table#exsitingList tr').mouseleave(function () {
				deleteImgHide(this);
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
			<!-- 과거대화 출력 -->
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
												 alt="첨부이미지" width="300" height="300"><br>
										${glist.gbcontent} 
									</td>
								</c:if>
								<c:if test="${empty glist.gbcontent}">
									<td>
										<img src="${conPath }/groupFileBoardUploadFiles/${glist.gbfilename}" 
												 alt="첨부이미지" width="300" height="300"><br>
									</td>
								</c:if>
							</c:if>
							<c:if test="${empty glist.gbfilename}">
								<td>
									${glist.gbcontent} 
								</td>
							</c:if>
							<td>
								<img alt="글삭제" src="${conPath }/groupFileBoardUploadFiles/pngwing.png"
									width="10" height="10" class="imgForDelete">
							</td>
							<td> 
								<fmt:formatDate value="${glist.gbrdate}" pattern="yy년MM월dd일 HH:mm:ss"/>
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
			<input type="hidden" name="gid" value="${sesionGBgid}" id="tempGid"> 
			<input type="hidden" name="mid" value="${sesionGBmid}" id="tempMid">
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











