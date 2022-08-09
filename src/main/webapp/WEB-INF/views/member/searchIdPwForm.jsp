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
  <style>
  	ul.tabs{
  		margin: 0px;
  		padding: 0px;
  		list-style: none;
	}
	ul.tabs li{
  		background: none;
 		color: #222;
  		display: inline-block;
  		padding: 10px 15px;
  		cursor: pointer;
	}

	ul.tabs li.current{
  		background: #ededed;
  		color: #222;
		}

	.tab-content{
  		display: none;  
  		padding: 15px 0;
  		border-top:3px solid #eee;
	}

	.tab-content.current{
  		display: inherit;
	}
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
	<div class="container">
		<ul class="tabs">
    		<li class="tab-link current" data-tab="tab-1">ID 찾기</li>
    		<li class="tab-link" data-tab="tab-2">PW 찾기</li>
  		</ul>
 
  		<div id="tab-1" class="tab-content current">
			<form action="${conPath}/member/searchMid.do" method="post">
			  <table>
			    <tr>
		  		  <td>NAME <b>*</b></td>
				</tr>
				<tr>
		  		  <td>
					<input type="text" name="mname" required="required">
		  		  </td>
				</tr>
				<tr>
		  		  <td>EMAIL <b>*</b></td>
				</tr>
				<tr>
		  		  <td>
		    		<input type="text" name="memail" required="required">
		  		  </td>
				</tr>
				<tr>
				  <td><input type="submit" value="SEARCH"></td>
				</tr>
			  </table>
			</form>
  		</div>
  
  		<div id="tab-2" class="tab-content">
			<form action="${conPath}/member/searchMpw.do" method="post">
			  <table>
			    <tr>
		  		  <td>ID <b>*</b></td>
				</tr>
				<tr>
		  		  <td>
					<input type="text" name="mid" required="required">
		  		  </td>
				</tr>
			    <tr>
		  		  <td>NAME <b>*</b></td>
				</tr>
				<tr>
		  		  <td>
					<input type="text" name="mname" required="required">
		  		  </td>
				</tr>
				<tr>
		  		  <td>EMAIL <b>*</b></td>
				</tr>
				<tr>
		  		  <td>
		    		<input type="text" name="memail" required="required">
		  		  </td>
				</tr>
				<tr>
				  <td><input type="submit" value="SEARCH"></td>
				</tr>
			  </table>
			</form>
  		</div>
	</div>
</body>
</html>