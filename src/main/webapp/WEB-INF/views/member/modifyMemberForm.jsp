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
  <link href="${conPath }/css/member/join2.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <script>
     $(document).ready(function(){
    	 $('input[name="mpw"], input[name="mpwChk"]').keyup(function(){
    			var mpw = $('input[name="mpw"]').val();
    			var mpwChk = $('input[name="mpwChk"]').val();
    			if(!mpw || !mpwChk){
    				$('#mpwChkResult').html('');
    			}else if(mpw == mpwChk){
    				$('#mpwChkResult').html('<i>비밀번호 일치</i>');
    			}else{
    				$('#mpwChkResult').html('<b>비밀번호 불일치</b>');
    			}
    	     });
       	 
       	 $('input[name="memail"]').keyup(function(){
      		  var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // 메일 패턴
      		  var memail = $('input[name="memail"]').val();
      		  var sessionMemail = '${member.memail}';
      		  if(memail == sessionMemail) {
    			  $('#memailConfirmResult').html('<i>사용가능 EMAIL</i>');
     	      }else if(patternMail.test(memail)){
      		    $.ajax({
      			    url : '${conPath}/member/confirmMemail.do',
      			    type : 'get',
      			    dataType : 'html',
      			    data : "memail="+memail,
      			    success : function(data){
      					  $('#memailConfirmResult').html(data);
      			    }
      		    });
      		  }else if(!memail) {
      			  $('#memailConfirmResult').html('');
      		  }else {
      			  $('#memailConfirmResult').html('<b>메일 형식을 지켜주세요</b>');
      		  }
      	});
       	
       	$('form').submit(function(){
     		var mpwChkResult = $('#mpwChkResult').text().trim();
     		var memailConfirmResult = $('#memailConfirmResult').text().trim();
     		if(mpwChkResult!='비밀번호 일치') {
     		    alert('PW 일치여부를 확인하세요');
   				$('input[name="mpw"]').val('');
   				$('input[name="mpwChk"]').val('');
   				$('input[name="mpw"]').focus();
   				return false;
     	    }else if(memailConfirmResult!='사용가능 EMAIL') {
     		    alert('사용가능 EMAIL을 입력하세요');
   				$('input[name="memail"]').val('');
   				$('input[name="memail"]').focus();
   				return false;
     	    }
       	});
     });
  </script>
</head>
<body>
	<nav class="header">
      <div class="container">
      <h1 class="logo"><a href="${conPath}/main/mainto.do">D<span>U</span></a></h1>
                 
                
              <c:if test="${param.windowType eq 0}">
                 <div style="left:350px; align-items: left; position:absolute;" class="section mt-5">
               <div class="row" >
                  <div class="col-12" >
                     <div id="switch" >
                        <div id="circle"></div>
                     </div>
                  </div>   
            </div>         
         </div>  
         </c:if>
           <c:if test="${empty param.windowType}">
                    <div style="left:350px; align-items: left; position:absolute;" class="section mt-5">
               <div class="row" >
                  <div class="col-12" >
                     <div id="switch" >
                        <div id="circle"></div>
                     </div>
                  </div>   
            </div>         
         </div>  
         </c:if>
          <c:if test="${param.windowType eq 1}">
             <div style="left:350px; align-items: left; position:absolute;" class="section mt-5">
               <div class="row" >
                  <div class="col-12" >
                     <div id="switch" class="switched" >
                        <div id="circle"></div>
                     </div>
                  </div>   
            </div>         
         </div>  
         </c:if>
        
        <ul>
         <c:if test="${not empty member and empty admin }">
           <li>
             <a href="#">${mid }님 ▶</a>
             <ul class="submenu">
               <li><a href="${conPath}/member/modifyMemberForm.do?mid=${mid }">회원정보 관리</a></li>
          	   <li><a href="${conPath}/qboard/listQboardForMe.do?mid=${mid }">나의 문의 내역</a></li>
               <li><a href="#">#</a></li>
             </ul>
           </li>
         </c:if>
         <c:if test="${empty member }">
           <li>
             ${aid }님 ▶
           </li> 
         </c:if>
         <li>
           <%--  <a href="${conPath}/notification/notificationConfirmForm.do" class="notification"> --%>
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
	
	
	
	
	<div class="mainSection3">
	  <div id="login_wrap">
		<header>
		  <h2>회원정보 관리</h2>
		</header>
		
		<form action="${conPath }/member/modifyMember.do" method="post">
		
	     <div class="input-box">
	       <input id="userid" type="text" name="mid" readonly="readonly" value="${member.mid }" placeholder="아이디">
           <label for="userid">ID</label>
           <div id="midConfirmResult"></div>
	     </div>
	     
	     <div class="input-box">
	       <input id="password" type="password" name="mpw" required="required" placeholder="비밀번호">
           <label for="password">PW1</label>
	     </div>
	     
	     <div class="input-box">
	       <input id="passwordCheck" type="password" name="mpwChk" required="required" placeholder="비밀번호">
           <label for="passwordCheck">PW2</label>
           <div id="mpwChkResult"></div>
	     </div>
	     
	     <div class="input-box">
	       <input id="username" type="text" name="mname" required="required" value="${member.mname }" placeholder="이름">
           <label for="username">NAME</label>
	     </div>
	     
	     <div class="input-box">
	       <input id="useremail" type="text" name="memail" required="required" value="${member.memail }" placeholder="이메일">
           <label for="useremail">EMAIL</label>
           <div id="memailConfirmResult"></div>
	     </div>
         <input type="submit" value="정보수정">
         
	    </form>
	   </div>
	 </div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>