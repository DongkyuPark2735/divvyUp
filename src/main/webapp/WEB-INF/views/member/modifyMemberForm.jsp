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
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <script>
     $(document).ready(function(){
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
	<div>
	  <form action="${conPath }/member/modifyMember.do" method="post">
	  <table>
	    <tr>
		  <td>ID <b>*</b></td>
		  <td></td>
		</tr>
		<tr>
		  <td>
			<input type="text" name="mid" readonly="readonly" value="${member.mid }">
		    <div></div>
		  </td>
		  <td></td>
		</tr>
		<tr>
		  <td>PW1 <b>*</b></td>
		  <td></td>
		</tr>
		<tr>
		  <td>
		    <input type="password" name="mpw" required="required">
			<div></div>
		  </td>
		  <td></td>
		</tr>
		<tr>
		  <td>PW2 <b>*</b></td>
		  <td></td>
		</tr>
		<tr>
		  <td>
		    <input type="password" name="mpwChk" required="required">
		    <div id="mpwChkResult"></div>
		  </td>
		  <td></td>
		</tr>
		<tr>
		  <td>NAME <b>*</b></td>
		  <td></td>
		</tr>
		<tr>
		  <td>
			<input type="text" name="mname" required="required" value="${member.mname }">
		    <div></div>
		  </td>
		  <td></td>
		</tr>
		<tr>
		  <td>EMAIL <b>*</b></td>
		  <td></td>
		</tr>
		<tr>
		  <td>
		    <input type="text" name="memail">
			<div id="memailConfirmResult"></div>
		  </td>
		  <td></td>
		</tr>
		<tr>
		  <td>
		    <input type="submit" value="MODIFY">
		  </td>
		</tr>
	  </table>
	  </form>
	</div>
</body>
</html>