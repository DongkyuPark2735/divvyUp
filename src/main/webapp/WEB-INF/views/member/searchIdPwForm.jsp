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
  <style>
   body{
   		background-color: transparent;
   }
  
   .container{
   		width: 100%;
   		height: 100%;
/*    		margin: 0 auto; */
   		background-color: transparent;
/*    		margin-top: 80px; */
   } 
  
  	ul.tabs{
  		margin: 0px;
  		padding: 0px;
  		list-style: none;
	}
	ul.tabs li{
  		background: none;
 		color: #222;
  		display: inline-block;
/*   		padding: 10px 15px; */
  		cursor: pointer;
   		font-weight: bold;
		width: 160px;
/*   		height: 80px; */
  		text-align: center;
  		line-height: 50px;
		font-size: 15pt;
	}

	ul.tabs li.current{
  		background: #1DBF73;
  		color: white;
  		font-weight: bold;
	}

	.tab-content{
  		display: none;  
  		padding: 15px 0;
  		border-top:3px solid #eee;
	}

	.tab-content.current{
  		display: inherit;
	}
	
	form{
		/* padding:20px; */
	}
	
.input-box{
	position:relative;
	margin:20px 0;
}

.input-box > input{
	background:transparent;
	border:none;
	border-bottom: solid 1px #ccc;
	margin-bottom: 10px;
	padding:0px 0px 5px 0px; /* 인풋박스 행간 조정*/
	width:100%;
	color: black;
	font-size: 20px; /*인풋상자 폰트 사이즈*/
	cursor: pointer;
}
}

input::placeholder{
	color:transparent;
}

input:placeholder-shown + label{
	color:#aaa;
	font-size:15pt;
	margin-top: 2px;
}

input:focus + label, label{
	color:#8aa1a1;
	font-size:4pt; /*글짜칠때 위로 올라가는 아이디 사이즈*/
	pointer-events: none;
	position: absolute;
	left:0px;
	top:0px;
	margin-top: -15px;/* 픽셀 작을수록 높이 올라감*/
	transition: all 0.2s ease ;
	-webkit-transition: all 0.2s ease;
	-moz-transition: all 0.2s ease;
	-o-transition: all 0.2s ease;
}

input:focus, input:not(:placeholder-shown){
	border-bottom: solid 1px #8aa1a1;
	outline:none;
}

input[type=submit]{
	background-color: #1DBF73;
	border:none;
	color:white;
	border-radius: 5px;
	width:100%;
	height:50px;
	font-size: 15pt;
	/* margin-top:50px; */
}
/* 	input[type=submit]{
	background-color: #1DBF73;
	border:none;
	color:white;
	border-radius: 5px;
	width:100%;
	height:35px;
	font-size: 14pt;
	font-weight: bold;
	} */
	
	
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <script>
     $(document).ready(function(){
    	 $('ul.tabs li').click(function(){
 		    var tab_id = $(this).attr('data-tab');
 		 
 		    $('ul.tabs li').removeClass('current');
 		    $('.tab-content').removeClass('current');
 		 
 		    $(this).addClass('current');
 		    $("#"+tab_id).addClass('current');
 	 	})
     });
  </script>
</head>
<body>
	<c:if test="${not empty searchMidResult }">
    	<script>
    	  alert('${searchMidResult }');
    	</script>
    </c:if>
    <c:if test="${not empty searchMpwResult }">
    	<script>
    	  alert('${searchMpwResult }');
    	</script>
    </c:if>
	<div class="container">
		<ul class="tabs">
    		<li class="tab-link current" data-tab="tab-1">ID 찾기</li>
    		<li class="tab-link" data-tab="tab-2">PW 찾기</li>
  		</ul>
 
  		<div id="tab-1" class="tab-content current">
			<form action="${conPath}/member/searchMid.do" method="post">
			  <div class="input-box">
	       		<input id="username" type="text" name="mname" required="required" placeholder="이름">
           		<label for="username">이름</label>
	     	  </div>
	     	  
	     	  <div class="input-box">
	       		<input id="useremail" type="text" name="memail" required="required" placeholder="이메일">
           		<label for="useremail">이메일</label>
	     	  </div>
	     	  
	     	  <div></div>
	     	  <input type="submit" value="ID 찾기">
			</form>
  		</div>
  
  		<div id="tab-2" class="tab-content">
			<form action="${conPath}/member/searchMpw.do" method="post">
			
			  <div class="input-box">
	       		<input id="userid" type="text" name="mid" required="required" placeholder="아이디">
           		<label for="userid">아이디</label>
	     	  </div>
			  
			  <div class="input-box">
	       		<input id="username" type="text" name="mname" required="required" placeholder="이름">
           		<label for="username">이름</label>
	     	  </div>
	     	  
	     	  <div class="input-box">
	       		<input id="useremail" type="text" name="memail" required="required" placeholder="이메일">
           		<label for="useremail">이메일</label>
	     	  </div>
	     	  
			  <input type="submit" value="PW 찾기">
			</form>
  		</div>
	</div>
</body>
</html>