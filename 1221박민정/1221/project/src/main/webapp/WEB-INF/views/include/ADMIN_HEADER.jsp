<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headNmenu.css">
    <script src="https://kit.fontawesome.com/2524621651.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/menu.js"></script>
</head>
<c:if test="${sessionScope.memID == null}">
	<script>
		alert("등록된 사용자가 아닙니다.\n관리자에게 문의하세요");
		location.href="${pageContext.request.contextPath}/login";
	</script>
</c:if>
<c:if test="${sessionScope.memLevel < 2}">
	<script>
		alert("접근권한이 없습니다.\n관리자에게 문의하세요.");
		location.href="${pageContext.request.contextPath}/userhome";
	</script>
</c:if>