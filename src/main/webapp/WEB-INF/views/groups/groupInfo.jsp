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
	
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=26f1ae0031a1d23227e6b9c730b8c47a&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.56575216993657  , 126.97951280073256), // 지도의 중심좌표
	        level: 8 // 지도의 확대 레벨
	    };  
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	
		$(document).ready(function(){
	 		list = ${locationLists };
	 		$.each(list, function (idx, item) {
	 			geocoder.addressSearch(item, function(result, status) {
	
	 		    // 정상적으로 검색이 완료됐으면 
	 		     if (status === kakao.maps.services.Status.OK) {
	
	 		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	 		        // 결과값으로 받은 위치를 마커로 표시합니다
	 		        var marker = new kakao.maps.Marker({
	 		            map: map,
	 		            position: coords
	 		        });
						
	 		       	var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;">'+item+'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	 		      	var infowindow = new kakao.maps.InfoWindow({
	 		    	    content : iwContent
	 		      	});
	 		    	   
	 		    	
	 		        
					
	 		      kakao.maps.event.addListener(marker, 'mouseover', function() {
	 		    	  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
	 		    	    infowindow.open(map, marker);
	 		    	   
	 		    	});
	 		    	// 마커에 마우스아웃 이벤트를 등록합니다
	 		    	kakao.maps.event.addListener(marker, 'mouseout', function() {
	 		    	    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
	 		    	    infowindow.close();
	 		    	});
	 		    
	 		     }
	 		});
		});
	 		
	});
	</script>
</head>
<body>
	<c:if test="${done eq 1 }">
		<script>alert('모든 정산이 끝났습니다');</script>
	</c:if>	
	
	<table id="groupDetail">
		<tr>
			<td colspan="3">group ID : ${groupInfo.gid }</td>
		</tr>
		<tr>
			<td colspan="3">group name : ${groupInfo.gname }</td>
		</tr>
		<tr>
			<td colspan="3">date : ${groupInfo.grdate }</td>
		</tr>
		<tr>
			<td colspan="3">group img : 
				<c:if test="${not empty groupInfo.gimg }">
					<img src="${conPath }/groupsImgFileUpload/${groupInfo.gimg }">
				</c:if> 
				<c:if test="${empty groupInfo.gimg }">
					첨부파일 첨부 안 함
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="3">group summary : ${groupInfo.gcontent }</td>
		</tr>
		<tr>
			<td colspan="3">group leader : ${groupInfo.mid }</td>
		</tr>
		<tr>
			<td colspan="3">그룸 멤버 리스트 :</td>
		</tr>
		</table>
		
		<table>
			<th>멤버 아이디</th>
			<th>멤버 balance</th>
			<th>가입일</th>
		<c:set var = "sum" value= "0"/>
		<c:forEach items="${groupDetailList }" var="gMems">
			<tr>
				<td style="width: 100px;">${gMems.mid }</td>
				<td style="width: 100px;">${gMems.gdbalance }
				<input type="hidden" id="gdbalance" value="${gMems.gdbalance }" /></td>
				<c:set var ="sum" value= "${sum + Math.abs(gMems.gdbalance) }"/>
				<td style="width: 100px;">${gMems.gdrdate }</td>
					<c:if test="${check eq 1}">
						<c:if test="${member.mid eq gMems.mid}">
							<c:if test="${gMems.gdbalance < 0 }">
								<td>
									<input type="button" value="내기" onclick="pay('${gMems.gdbalance }');">
								</td>
							</c:if>
							<c:if test="${gMems.gdbalance > 0 }">
								<td>
									<input type="button" value="받기" onclick="get('${gMems.gdbalance }');">
								</td>
							</c:if>
						</c:if>
						<c:if test="${gMems.gdbalance eq 0 }">
							<td style="color: 'green';">정산 할거 없음</td>
						</c:if>
					</c:if>
			</tr>
		</c:forEach>
	</table>
	
	<table class="mapShow">
				<tr><td><div id="map" ></div></td></tr>
	</table>
	
	
	<table>
		<c:if test="${member.mid eq groupInfo.mid }">
			<tr>
				<td colspan="2"><input type="button" value="그룹 정보 수정" onclick="location='${conPath }/groups/modifyForm.do?gid=${groupInfo.gid }&mid=${member.mid }'"></td>
			</tr>
		</c:if>
		<c:if test="${done eq 0 }">
			<tr>
				<td colspan="2"><input type="button" value="이벤트 목록" onclick="location='${conPath }/event/eventList.do?gid=${groupInfo.gid }&mid=${member.mid }'"></td>
			</tr>
				<c:if test="${check eq 0}">
					<tr>
						<td><input type="button" value="이벤트 추가" onclick="location='${conPath }/event/selectEventType.do?gid=${groupInfo.gid }&mid=${member.mid }'"></td>
					</tr>
					<c:if test = "${sum != 0}">
						<c:if test="${member.mid eq groupInfo.mid }"> <!-- 그룹 생성자만 정산하기 버튼 보임 -->
							<tr>
								<td>
									<button onclick=" return confirmAction();">정산하기</button>
								</td>
							</tr>
						</c:if>
					</c:if>
				</c:if>
		</c:if>
		<c:if test="${done eq 1 }">
			<tr>
				<td>정산이 끝났습니다</td>
			</tr>
		</c:if>
	</table>
</body>
</html>
