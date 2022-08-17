<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
<<<<<<< HEAD
=======
<link href="${conPath }/css/member/join2.css" rel="stylesheet">

>>>>>>> 4da87254d69c96dc6462e4d49fb510a98bf99c4a
=======
<<<<<<< HEAD
<link href="${conPath }/css/member/join3.css" rel="stylesheet">
=======
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
<link href="${conPath }/css/member/join.css" rel="stylesheet">
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
<style>
</style>
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
<<<<<<< HEAD
=======
<<<<<<< HEAD
	$(document).ready(function() {
		$('.joinBtn').click(function(){
		    $('.modal').fadeIn();
		    $('.modal_content').fadeIn();
		    $('#login_wrap').fadeOut();
		  });
		
		$('.modal').click(function(e){
			var target = e.target; // 이벤트가 적용된 부분
			if(!$('.modal_content').has(target).length){
				$('.modal').fadeOut();
				$('input[name="mid"]').val('');
				$('input[name="mpw"]').val('');
 				$('input[name="mpwChk"]').val('');
 				$('input[name="mname"]').val('');
		    	$('input[name="memail"]').val('');
		    	$('#mpwChkResult').html('');
		    	$('#midConfirmResult').html('');
		    	$('#memailConfirmResult').html('');
		    	$('#login_wrap').fadeIn();
			}
		});
		
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
	    	
	    	$('.form').submit(function(){
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
=======
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
   $(document).ready(function() {
      $('.joinBtn').click(function(){
          $('.modal').fadeIn();
          $('.modal_content').fadeIn();
          $('#login_wrap').fadeOut();
        });
      
      $('.modal').click(function(e){
         var target = e.target; // 이벤트가 적용된 부분
         if(!$('.modal_content').has(target).length){
            $('.modal').fadeOut();
            $('input[name="mid"]').val('');
            $('input[name="mpw"]').val('');
             $('input[name="mpwChk"]').val('');
             $('input[name="mname"]').val('');
             $('input[name="memail"]').val('');
             $('#mpwChkResult').html('');
             $('#midConfirmResult').html('');
             $('#memailConfirmResult').html('');
             $('#login_wrap').fadeIn();
         }
      });
      
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
          
          $('.form').submit(function(){
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
<<<<<<< HEAD
=======
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
</script>
<script>
function openPop(){
<<<<<<< HEAD
  var popup = window.open('${conPath}/member/searchIdPwForm.do', '아이디/패스워드 찾기', 'width=300px,height=200px,scrollbars=yes');
=======
  var width = '500px';
  var height = '400px';
  var left = Math.ceil((window.screen.width - width)/2);
  /* var top = Math.ceil((window.screen.height - height)); */
 /*  var popup = window.open('${conPath}/member/searchIdPwForm.do', '아이디/패스워드 찾기', 'width='+width+',height='+height+',left='+left+',top='+top+',scrollbars=yes'); */
  var popup = window.open('${conPath}/member/searchIdPwForm.do', '아이디/패스워드 찾기', 'width='+width+',height='+height+',left='+left+', scrollbars=yes');
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
}
</script>
</head>
<body>
<<<<<<< HEAD
=======
<<<<<<< HEAD
	<c:if test="${not empty result}">
		<script>
			alert('${result}');
		</script>
	</c:if>
	<c:if test="${not empty searchMidResult}">
		<script>
			alert('${searchMidResult}');
		</script>
	</c:if>
	<c:if test="${not empty searchMpwResult}">
		<script>
			alert('${searchMpwResult}');
		</script>
	</c:if>
	<c:if test="${not empty joinResult}">
		<script>alert('${joinResult}');</script>
	</c:if>
	  <nav class="header">
		<div class="container">
			<h1 class="logo">
				<a href="${conPath}/member/loginForm.do">D<span>U</span></a>
			</h1>
			<ul>
				<li><a href="${conPath}/member/loginForm.do">로그인</a></li>
				<li class="joinBtn"><a href="#" >회원가입</a></li>
				<li><a href="${conPath}/qboard/listQboardForMember.do">Q&A</a></li>
			</ul>
		</div>
	  </nav>
	
     <div class="modal">
        <div class="modal_content" title="클릭하면 창이 닫힙니다.">
       <header><h2>JOIN</h2></header>
		
		<form action="${conPath }/member/join.do" method="post" class="form">
		
	     <div class="input-box">
	       <input id="userid" type="text" name="mid" required="required" placeholder="아이디">
           <label for="userid">아이디</label>
           <div id="midConfirmResult"></div>
	     </div>
	     
	     <div class="input-box">
	       <input id="password" type="password" name="mpw" required="required" placeholder="비밀번호">
           <label for="password">비밀번호</label>
	     </div>
	     
	     <div class="input-box">
	       <input id="passwordCheck" type="password" name="mpwChk" required="required" placeholder="비밀번호">
           <label for="passwordCheck">비밀번호</label>
           <div id="mpwChkResult"></div>
	     </div>
	     
	     <div class="input-box">
	       <input id="username" type="text" name="mname" required="required" placeholder="이름">
           <label for="username">이름</label>
	     </div>
	     
	     <div class="input-box">
	       <input id="useremail" type="text" name="memail" required="required" placeholder="이메일">
           <label for="useremail">이메일</label>
           <div id="memailConfirmResult"></div>
	     </div>
=======
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
   <c:if test="${not empty result}">
      <script>
         alert('${result}');
      </script>
   </c:if>
   <c:if test="${not empty searchMidResult}">
      <script>
         alert('${searchMidResult}');
      </script>
   </c:if>
   <c:if test="${not empty searchMpwResult}">
      <script>
         alert('${searchMpwResult}');
      </script>
   </c:if>
   <c:if test="${not empty joinResult}">
      <script>alert('${joinResult}');</script>
   </c:if>
     <nav class="header">
      <div class="container">
         <h1 class="logo">
            <a href="${conPath}/member/loginForm.do">D<span>U</span></a>
         </h1>
         <ul>
            <li><a href="${conPath}/member/loginForm.do">로그인</a></li>
            <li class="joinBtn"><a href="#" >회원가입</a></li>
<%--             <li class="joinBtn"><a href="${conPath}/member/joinForm.do" >회원가입</a></li> --%>
            <li><a href="${conPath}/qboard/listQboardForMember.do">Q&A</a></li>
         </ul>
      </div>
     </nav>
   
     <div class="modal">
        <div class="modal_content" title="클릭하면 창이 닫힙니다.">
       <header><h2>JOIN</h2></header>
      
      <form action="${conPath }/member/join.do" method="post" class="form">
      
        <div class="input-box">
          <input id="userid" type="text" name="mid" required="required" placeholder="아이디">
           <label for="userid">아이디</label>
           <div id="midConfirmResult"></div>
        </div>
        
        <div class="input-box">
          <input id="password" type="password" name="mpw" required="required" placeholder="비밀번호">
           <label for="password">비밀번호</label>
        </div>
        
        <div class="input-box">
          <input id="passwordCheck" type="password" name="mpwChk" required="required" placeholder="비밀번호">
           <label for="passwordCheck">비밀번호</label>
           <div id="mpwChkResult"></div>
        </div>
        
        <div class="input-box">
          <input id="username" type="text" name="mname" required="required" placeholder="이름">
           <label for="username">이름</label>
        </div>
        
        <div class="input-box">
          <input id="useremail" type="text" name="memail" required="required" placeholder="이메일">
           <label for="useremail">이메일</label>
           <div id="memailConfirmResult"></div>
        </div>
<<<<<<< HEAD
=======
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
         <!-- <div class="input_submit"> -->
           <input type="submit" value="회원가입">
         <!-- </div> -->
         
<<<<<<< HEAD
=======
<<<<<<< HEAD
	    </form>
  		</div>
	  </div>
	  
<!-- 빈이가 만든 로그인 ------------------------------------------------------------------------------------------------------------------------------>	  
	<div class="mainSection">
   		<div id="login_wrap">
        	<h2>LOGIN</h2>
      		<form action="${conPath }/member/login.do" method="post">
        		<div class="input-box">
          			<input id="username" class="login_btn" type="text" name="mid" required="required" placeholder="아이디" value="${mid }">
           			<label for="username" style="top:5px; padding-left:13px;">아이디</label>
        		</div>
        
        		<div class="input-box">
          			<input id="password" class="login_btn" type="password" name="mpw" required="required" placeholder=" 비밀번호" value="${mpw }">
           			<label for="password" style="top:5px;  padding-left:12px;">비밀번호</label>
        		</div>
        		<div id="forgot"><a href="#" onclick="openPop();">ID/PW 찾기</a></div>
         		<input type="submit" value="로그인">
     		</form>
   		</div>
	</div>
<!-- 빈이가 만든 로그인 ------------------------------------------------------------------------------------------------------------------------------>	  
	<jsp:include page="../main/footer.jsp"/>
=======
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
       </form>
        </div>
     </div>
   <div class="mainSection">
         <div id="login_wrap">
           <h2>LOGIN</h2>
            <form action="${conPath }/member/login.do" method="post">
              <div class="input-box">
                   <input id="username" class="login_btn" type="text" name="mid" required="required" placeholder="아이디" value="${mid }">
                    <label for="username" style="top:5px; padding-left:14.5px;">아이디</label>
              </div>
        
              <div class="input-box">
                   <input id="password" class="login_btn" type="password" name="mpw" required="required" placeholder="비밀번호" value="${mpw }">
                    <label for="password" style="top:5.5px;  padding-left:14px;">비밀번호</label>
              </div>
              <div id="forgot"><a href="${conPath}/member/searchIdPwForm.do">ID/PW 찾기</a></div>
               <input type="submit" value="로그인">
           </form>
         </div>
   </div>
<<<<<<< HEAD
   <jsp:include page="../main/footer.jsp"/>
=======
     <button class="joinBtn">JOIN</button>
<%--      <button onclick="location='${conPath}/member/joinForm.do'" class="joinBtn">JOIN</button> --%>
     
     
     
     
     <button onclick="location='${conPath}/admin/adminloginForm.do'">AMODE</button>
     <button onclick="location='${conPath}/qboard/listQboardForMember.do'">QBOARD</button>

    <%--  <form action="${conPath }/member/login.do" method="post">
       <table>
         <caption>LOGIN</caption>
         <tr>
           <th>ID</th>
           <td><input type="text" name="mid" required="required" value="${mid }"></td>
         </tr>
         <tr>
           <th>PW</th>
           <td><input type="password" name="mpw" required="required" value="${mpw }"></td>
         </tr>
         <tr>
           <td colspan="2">
             <input type="submit" value="LOGIN">
           </td>
         </tr>
       </table>
     </form> --%>
     <%-- <button onclick="location='${conPath}/member/searchIdPwForm.do'">FIND ID&PW</button> --%>
<<<<<<< HEAD
=======
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
</body>
</html>