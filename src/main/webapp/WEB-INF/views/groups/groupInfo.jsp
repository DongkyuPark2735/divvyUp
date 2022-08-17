<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="${conPath}/css/groups/groupInfo.css" rel="stylesheet">
<script>
		function confirmAction() {
			if (${check} == 0) {
				let confirmAction = confirm("정산하시겠습니까? 정산이 시작되면 지출추가가 불가합니다");
				if (confirmAction) {
					location='${conPath }/centralSystem/insertSplit.do?gid='+${groupInfo.gid };
				} 
			} else if (${check} == 1) {
				alert('이미 정산이 진행되었습니다')
			}
		}
	</script>
<script>
		function pay(gdbalance) {
			var child = open('${conPath }/centralSystem/payForm.do?gid=${groupInfo.gid }&mid=${member.mid }&gdbalance='+gdbalance, '', 'width=500, height=350');
			if (!child) {
				alert('Please allow pop-ups');
			}
		}
		function get(gdbalance) {
			if (${checkAllPaid } == 1) {
				var child = open('${conPath }/centralSystem/getForm.do?gid=${groupInfo.gid }&mid=${member.mid }&gdbalance='+gdbalance, '', 'width=500, height=350');
				if (!child) {
					alert('Please allow pop-ups');
				}
			} else if (${checkAllPaid } == 0) {
				alert('잔액 부족으로 정산을 진행할 수 없습니다');
			}
		}
	</script>
<script>
      $(document).ready(function(){
         /* 타이머 새글 가져오기 */
         $('#chattingBoardWarp #chattingBoardInsert #tempGbcontent').focus();
         var sessionGid = ${sesionGBgid}; /*세션 gid셋팅*/
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
                 $("img[class='imgForDelete']").click(function(){
                     deleteGrouBoardFcn();
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
         
         /* 글 삭제 함수 선언*/
         function deleteGrouBoardFcn(){
            var gbid = $(this).parent('td').siblings('.gidClick').text();
            var deleteCheck = confirm("해당 글을 삭제하시겠습니까?");
            if(deleteCheck){
               $.ajax({
                url : "${conPath}/groupboard/deleteGroupBoard.do",
                type : "GET",
                data : {"gbid" : gbid}, 
                success: function(data){
                     location.reload();
                }
               });
            }
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
            deleteGrouBoardFcn();
         });
         
         /* 글 불러오기 스크롤  */
         var cnt;
         $("#chattingBoardWarp #chattingBoardList").scroll(function() { 
            var innerHeight = $(this).innerHeight(); // 스크롤 길이
            var scroll=$(this).scrollTop() + $(this).innerHeight(); //현재 스크롤 마지막 부분
            var height=$(this)[0].scrollHeight;   //전체 스크롤 마지막 부분
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
                 $("img[class='imgForDelete']").click(function(){
                     deleteGrouBoardFcn();
                  });
               });   
            }   
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
         
         /* 기존글 삭제 버튼 */
         $('#chattingBoardList table#exsitingList tr').mouseover(function () {
            deleteImgShow(this);
         });
         
         /* 기존글 삭제 버튼 */
         $('#chattingBoardList table#exsitingList tr').mouseleave(function () {
            deleteImgHide(this);
         });
         
//          /* 방금쓴글 삭제 버튼 생성  tr*/
//          $('#chattingBoardList table#singleLatestGroupboardResult tr').mouseover(function () {
//             var tempGdidforDelete = $(this).children('td:nth-child(1)').text();
//             var tempMidforDelete = $(this).children('td:nth-child(3)').text();
//             if(tempMidforDelete == sessionMid){
//                $(this).children("td:nth-child(5)").show();
//             }
//          });
      });
</script>


</head>
<body>

	<c:if test="${done eq 1 }">
		<script>alert('모든 정산이 끝났습니다');</script>
	</c:if>
	<c:if test="${modifyResult eq 1 }">
		<script>
			alert('그룹정보 수정 성공');
		</script>
	</c:if>

	<c:if test="${modifyResult eq 0 }">
		<script>
			alert('그룹정보 수정 실패');
		</script>
	</c:if>
	<c:if test="${modifyResult2 eq 1 }">
		<script>
			alert('그룹멤버 수정 성공');
		</script>
	</c:if>

	<c:if test="${modifyResult2 eq 0 }">
		<script>
			alert('그룹멤버 수정 실패');
		</script>
	</c:if>
	
	<nav class="header">
		<div class="container">
			<h1 class="logo">
				<a href="${conPath }/main/mainto.do">D<span>U</span></a>
			</h1>
			<ul>
				<li><a href="${conPath}/member/modifyMemberForm.do?mid=${mid }">${mid }님
						▶</a></li>
				<li><a
					href="${conPath}/notification/notificationConfirmForm.do"
					class="notification"> <img src="${conPath}/icon/noti.png"
						class="imgNoti" />
						<div class="badge">${uncheckdNotificationCnt }</div>
				</a></li>
				<li><a href="${conPath }/main/mainto.do">홈으로</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="${conPath}/main/logout.do"> <img
						src="${conPath}/icon/logout.png" class="imgLogout" />
				</a></li>
			</ul>
		</div>
	</nav>
	<div id="totalWrap">

		<div id="content">
			<div class="groupDetail">
				<table>
					<tr>
						<td colspan="2"><h1>그룹 정보</h1></td>
					</tr>
					<tr>
						<td class="titles">그룹 번호</td>
						<td>${groupInfo.gid }</td>
					<%-- 	<td rowspan="5">
								<c:if test="${not empty groupInfo.gimg }">
									<img src="${conPath }/groupsImgFileUpload/${groupInfo.gimg }">
								</c:if>
								<c:if test="${empty groupInfo.gimg }">
									<img style="width: 300px;"
										src="https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2012/03/228076193_6ed6989589_z.jpg?fit=640%2C420&ssl=1">
								</c:if>
						</td> --%>
					</tr>
					<tr>
						<td class="titles">이름</td>
						<td>${groupInfo.gname }</td>
					</tr>
					<tr>
						<td class="titles">생성일</td>
						<td>${groupInfo.grdate }</td>
					</tr>

					<tr>
						<td class="titles">내용</td>
						<td><p>${groupInfo.gcontent }</p></td>
					</tr>
					<tr>
						<td class="titles">생성자</td>
						<td>${groupInfo.mid }</td>
					</tr>
					<c:if test="${member.mid eq groupInfo.mid }">
						<td colspan="2"><input type="button" value="그룹 정보수정"
							class="groupModifyBtn"
							onclick="location='${conPath }/groups/modifyForm.do?gid=${groupInfo.gid }&mid=${member.mid }'"></td>

					</c:if>
				</table>
			</div>
			<div class="groupMember">
				<h1>그룹 멤버</h1>
				<table class="scrollable" style="height:22vh; width: 100%;">
					<tr class="titles">
						<td class="titles">아이디</td>
						<td class="titles">정상잔액</td>
						<td class="titles">가입일</td>
					</tr>
					<c:set var="sum" value="0" />
					<c:forEach items="${groupDetailList }" var="gMems">
						<tr>
							<td >${gMems.mid }</td>
							<td>${gMems.gdbalance }<input type="hidden" id="gdbalance"
								value="${gMems.gdbalance }" /></td>
							<c:set var="sum" value="${sum + Math.abs(gMems.gdbalance) }" />
							<td>${gMems.gdrdate }</td>
							<c:if test="${check eq 1}">
								<c:if test="${member.mid eq gMems.mid}">
									<c:if test="${gMems.gdbalance < 0 }">
										<td><input type="button" value="내기" class="btn3"
											onclick="pay('${gMems.gdbalance }');"></td>
									</c:if>
									<c:if test="${gMems.gdbalance > 0 }">
										<td><input type="button" value="받기" class="btn3"
											onclick="get('${gMems.gdbalance }');"></td>
									</c:if>
								</c:if>
								<c:if test="${gMems.gdbalance eq 0 }">
									<td style="color: 'green';">정산완료</td>
								</c:if>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			<table class="buttons">
				<tr>
					
					<c:if test="${done eq 0 }">

						<td colspan="2"><input type="button" value="이벤트 목록"
							class="groupInfoBtn"
							onclick="location='${conPath }/event/eventList.do?gid=${groupInfo.gid }&mid=${member.mid }'"></td>

						<c:if test="${check eq 0}">

							<td><input type="button" value="이벤트 추가" class="groupInfoBtn"
								onclick="location='${conPath }/event/selectEventType.do?gid=${groupInfo.gid }&mid=${member.mid }'"></td>
							
							<c:if test="${sum != 0}">
								<c:if test="${member.mid eq groupInfo.mid }">
									<!-- 그룹 생성자만 정산하기 버튼 보임 -->
									
									<td>
										<button class="groupInfoBtn"
											onclick=" return confirmAction();">정산하기</button>
									</td>

								</c:if>
							</c:if>
							<td><button class="groupInfoBtn" onclick="history.back()">뒤로가기</button></td>
						</c:if>
					</c:if>
					
				</tr>
				<c:if test="${done eq 1 }">
					<tr>
						<td>정산이 끝났습니다</td>
					</tr>
				</c:if>
			</table>
		</div>
		
		<div id="chatting">
<%-- 			<div id="chattingBoardWarp">
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
                  <input type="file" name="gbfilename"   id="tempGbfilename" style="display: none;">
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
			
		</div>  --%>
	</div>
</body>
</html>
