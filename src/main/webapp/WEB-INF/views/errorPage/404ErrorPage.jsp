<%@ page language="java" contentType="text/html; charset= UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
   <title>Home</title>
   <meta charset="UTF-8">
   <link href="${conPath }/css/style.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
   <style>
   	*{
   		margin: 0 auto;
   	}
  	body {
			background: 
			linear-gradient(rgba(255, 255, 255, 0.2),
			rgba(255, 255, 255, 0.2)),
			url('https://images.unsplash.com/photo-1517816743773-6e0fd518b4a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTN8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80');
			background-repeat: no-repeat;
			background-size: cover;
			background-position: bottom center;
		}
		div#errorWrap{
			height: 900px;
			text-align: center;
		}
		div#errorWrap {
			margin-top: 100px;
		}

   	div#errorWrap div#errorCode h1{
   		font-size: 200px;
   		font-weight: bold;
   		color: rgba(32, 34, 34, 0.8);
   	} 
   	div#errorWrap div h2{
			margin-top : 60px;   		
   		font-weight: bold;
   		color: rgba(32, 34, 34, 0.8);
   		margin-bottom: 60px;
   	} 
   	input {
			width: 200px; 
			height: 100px;
			border-radius: 10px;
			font-weight: bold;
			color: rgba(255, 255, 255, 0.8);
			background-color: rgba(32, 34, 34, 0.4);
			font-size: 25px;
			margin-bottom: 100px;
			border: none;
		}
   	input:hover {
			background-color: rgba(32, 34, 34, 0.8);
			cursor: pointer;
		}
		#errorWrap h3{
			color: rgba(32, 34, 34, 0.4);
		}
   	
   </style>
   <script>
      $(document).ready(function(){
         
      });
   </script>
</head>
<body>
	<div id="errorWrap">
		<div id="errorCode">
			<h1>404</h1>
		</div>
		<div>
			<h2>죄송합니다 요청하신 페이지는 존재하지 않습니다.</h2>
		</div>
			<input type="button" onclick="history.back();" value="돌아가기">			
		<h3><br>좋은시스템 문의 메일 :webmaster@joeun.com <br>ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All Rights Reserved.</h3>
	</div>
</body>
</html>













