<%@ page language="java" contentType="text/html; charset= UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
			<td>${insertGroupBoardVO.gbid }</td>
			<td>${insertGroupBoardVO.gid }</td>
			<td>${insertGroupBoardVO.mid }</td>
			<td>${insertGroupBoardVO.gbcontent }</td>
			<td>${insertGroupBoardVO.gbfilename }</td>
			<td>${insertGroupBoardVO.gbrdate }</td>
</body>
</html>