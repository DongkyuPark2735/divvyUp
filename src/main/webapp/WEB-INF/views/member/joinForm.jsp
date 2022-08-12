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
  <link href="${conPath }/css/member/login.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <script>
     $(document).ready(function(){
    	 $('input[name="mid"]').keyup(function(){
   		  var mid = $('input[name="mid"]').val();
   		  $.ajax({
   			  url : '${conPath}/member/confirmMid.do',
   			  type : 'get',
   			  dataType : 'html',
   			  data : "mid="+mid,
   			  success : function(data){
   					$('#midConfirmResult').html(data);
   			  }
   		   });
   	     });
      
    	 $('input[name="mpw"], input[name="mpwChk"]').keyup(function(){
 			var mpw = $('input[name="mpw"]').val();
 			var mpwChk = $('input[name="mpwChk"]').val();
 			if(mpw == mpwChk){
 				$('#mpwChkResult').html('<i>비밀번호 일치</i>');
 			}else{
 				$('#mpwChkResult').html('<b>비밀번호 불일치</b>');
 			}
 	     });
    	 
    	 $('input[name="memail"]').keyup(function(){
   		  var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // 메일 패턴
   		  var memail = $('input[name="memail"]').val();
   		  if(patternMail.test(memail)){
   		    $.ajax({
   			    url : '${conPath}/member/confirmMemail.do',
   			    type : 'get',
   			    dataType : 'html',
   			    data : "memail="+memail,
   			    success : function(data){
   					  $('#memailConfirmResult').html(data);
   			    }
   		    });
   		  }else if (!memail) {
   			  $('#memailConfirmResult').html('');
   		  }else {
   			  $('#memailConfirmResult').html('<b>메일 형식을 지켜주세요</b>');
   		  }
   	    });
    	
    	$('form').submit(function(){
    		var midConfirmResult = $('#midConfirmResult').text().trim();
  		    var mpwChkResult = $('#mpwChkResult').text().trim();
  		    var memailConfirmResult = $('#memailConfirmResult').text().trim();
  		    if(midConfirmResult!='사용가능 ID') {
  		    	alert('사용가능 ID를 입력하세요');
  		    	$('input[name="mid"]').val('');
				$('input[name="mid"]').focus();
				return false;
  		    }else if(mpwChkResult!='비밀번호 일치') {
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
	 <div id="login_wrap">
		<header>
		  <h2>JOIN</h2>
		</header>
		
		<form action="${conPath }/member/join.do" method="post">
		
	     <div class="input-box">
	       <input id="userid" type="text" name="mid" required="required" placeholder="아이디">
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
	       <input id="username" type="text" name="mname" required="required" placeholder="이름">
           <label for="username">NAME</label>
	     </div>
	     
	     <div class="input-box">
	       <input id="useremail" type="text" name="memail" required="required" placeholder="이메일">
           <label for="useremail">EMAIL</label>
           <div id="memailConfirmResult"></div>
	     </div>
         <input type="submit" value="회원가입">
         
	    </form>
	 </div>  
</body>
</html>