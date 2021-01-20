<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${sessionScope.empNum == null}">
	<script>
		alert("등록된 사용자가 아닙니다.\n관리자에게 문의하세요.");
		window.location.replace("${pageContext.request.contextPath}/login");
	</script>
</c:if>
<c:if test="${sessionScope.empConfirm ne Y}">
	<script>
		alert("미승인 사용자입니다.\n관리자에게 문의하세요.");
		window.location.replace("${pageContext.request.contextPath}/login");
	</script>
</c:if>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BLUE ERP SYSTEM | ADMIN</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_common.css">
  	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/menu/blue_erp.ico">

    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- JQuery -->
    
    <!-- FontAweSome -->
    <script src="https://kit.fontawesome.com/5990def7eb.js" crossorigin="anonymous"></script>
    <!-- FontAweSome -->
    
</head>
<style>
</style>
<body>
    <div class="w_100 bg_gray">
        <header style="background-color: #009eb0;">
            <div class="nav_icon center font_16">
                <i class="fas fa-bars"></i>
            </div>
            <div class="logo center font_18">
                <a class="white" href="${pageContext.request.contextPath}/user_main?empId=${sessionScope.empId}">
                    <div class="logo_img_wrap w_100 h_100 flex flex_vc flex_hc" style="background-color: #00afc0;">
                        <img src="${pageContext.request.contextPath}/images/menu/blue_erp_logo(white).png">
                    </div>
                </a>
            </div>
            <div class="option">
                <div class="home font_14 p_lr5">
                    <a href="${pageContext.request.contextPath}/user/my_info?empId=${sessionScope.empId}" style="color: #F8B500;">
                        <i class="fas fa-user-circle"></i> 
                        <span class="weight_700">${sessionScope.empName} ${sessionScope.empPositionName}</span>
                    </a>
                </div>
                <c:if test="${sessionScope.empNum eq 'admin'}">
	                <div class="home font_14 p_lr5">
	                    <a href="${pageContext.request.contextPath}/admin_main" class="white">
	                        <i class="fas fa-house-user"></i> 
	                        <span class="weight_700">관리자메인</span>
	                    </a>
	                </div>
                </c:if>
                <div class="home font_14 p_lr5">
                    <a href="${pageContext.request.contextPath}/user/message_fromList?empId=${sessionScope.empId}" class="white">
                        <i class="fas fa-envelope"></i> 
                        <span class="weight_700">쪽지함</span>
                    </a>
                </div>
                <div class="home font_14 p_lr5">
                    <a href="${pageContext.request.contextPath}/logout" class="white">
                        <i class="fas fa-sign-out-alt"></i>
                        <span class="weight_700">로그아웃</span>
                    </a>
                </div>
            </div>
        </header>
        <div class="main flex">
            <nav class="flex">
                <div class="main_menu font_14">
                    <a class="menu_tab" href="#hrMngmt">
                        <i class="fas fa-users"></i>
                    </a>
                    <a class="menu_tab" href="#attendMngmt">
                        <i class="far fa-calendar-alt"></i>
                    </a>
                    <a class="menu_tab" href="#salesMngmt">
                        <i class="fas fa-briefcase"></i>
                    </a>
                    <a class="menu_tab" href="#productMngmt">
                        <i class="fas fa-industry"></i>
                    </a>
                    <a class="menu_tab" href="#purchasingMngmt">
                        <i class="fas fa-shopping-cart"></i>
                    </a>
                    <a class="menu_tab" href="#carMngmt">
                        <i class="fas fa-car"></i>
                    </a>
                    <a class="menu_tab" href="#approvalMngmt">
                        <i class="fas fa-signature"></i>
                    </a>
                    <a class="menu_tab" href="#boardMngmt">
                        <i class="fas fa-chalkboard"></i>
                    </a>
                    <a class="menu_tab" href="#userMngmt">
                        <i class="fas fa-user"></i>
                    </a>
                </div>
                <div id="sub_menu" class="">
                    <ul id="hrMngmt" class="menu">
                        <h3>인사/급여관리</h3>
						<li><a href="${pageContext.request.contextPath}/user/employee_list.html">사원목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/organization_chart?empDepartment=${sessionScope.empDepartment}">사내조직도</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/salary_list">급여처리내역</a></li>
						<li><a href="${pageContext.request.contextPath}/user/salary_tax_list">세금계산테이블</a></li>
                    </ul>
					<ul id="attendMngmt" class="menu">
                        <h3>근태관리</h3>
                        <li><a href="${pageContext.request.contextPath}/user/attend_list?empIdFk=${sessionScope.empId}">나의 출퇴근현황</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/attend_list_all">출퇴근현황</a></li>
                    	<li><a href="${pageContext.request.contextPath}/user/vacation?empId=${sessionScope.empId}">휴가사용신청</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/vacation_list">휴가사용이력조회</a></li>
                    </ul>
                    <ul id="salesMngmt" class="menu">
                        <h3>영업관리</h3>
                        <li><a href="${pageContext.request.contextPath}/user/contract_list">계약서목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/contract">계약서입력</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/client_list">거래처목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/client_reg">거래처입력</a></li>
                    </ul>
                    
                    <ul id="productMngmt" class="menu">
                        <h3>생산/물류관리</h3>
                        <li><a href="${pageContext.request.contextPath}/user/release_list">출고상품목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/BOMnProcess">BOM 및 공정관리</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/product_list">상품목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/product_reg">상품정보입력</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/workcenter">워크센터관리</a></li>
                    </ul>
					<ul id="purchasingMngmt" class="menu">
                        <h3>구매관리</h3>
                        <li><a href="${pageContext.request.contextPath}/user/order_insert?empDepartment=${sessionScope.empDepartment}">구매요청서작성</a></li>
                       	<li><a href="${pageContext.request.contextPath}/user/orderList">구매요청서목록</a></li>
                    </ul>
                    <ul id="carMngmt" class="menu">
                        <h3>법인차량관리</h3>
                        <li><a href="${pageContext.request.contextPath}/user/corp_car_management">법인차량관리</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/corp_car_log">법인차량운행일지</a></li>
                    </ul>
                    <ul id="approvalMngmt" class="menu">
                        <h3>전자결재관리</h3>
                        <li><a href="${pageContext.request.contextPath}/user/appWaiting?appType=V&empId=${sessionScope.empId}">미결함</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/appComplete?empId=${sessionScope.empId}">완결함</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/appSend?empId=${sessionScope.empId}">상신함</a></li>
                    </ul>
                    <ul id="boardMngmt" class="menu">
                        <h3>게시판관리</h3>
                        <li><a href="${pageContext.request.contextPath}/user/board_list?boardNum=999notice">게시글목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/board_reg">게시판관리</a></li>
                    </ul>
                    <ul id="userMngmt" class="menu">
                        <h3>사용자정보관리</h3>
                        <li><a href="${pageContext.request.contextPath}/user/my_info?empId=${sessionScope.empId}">내정보 관리</a></li>
                    </ul>
                </div>
            </nav>
            <div class="main_wrap">