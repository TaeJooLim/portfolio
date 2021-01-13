<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BLUE ERP SYSTEM | 관리자페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
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
    <div class="w_100 h_100 bg_gray">
        <header>
            <div class="nav_icon center font_16">
                <i class="fas fa-bars"></i>
            </div>
            <div class="logo center font_18">
                <a class="white" href="${pageContext.request.contextPath}/admin_main">
                    <div class="logo_img_wrap w_100 h_100 flex flex_vc flex_hc">
                        <img src="${pageContext.request.contextPath}/images/menu/blue_erp_logo(white).png">
                    </div>
                </a>
            </div>
            <div class="option">
                <div class="home font_14 p_lr5">
                    <a href="#" style="color: #CFAA9E;">
                        <i class="fas fa-user-circle"></i> 
                        <span class="weight_700">${sessionScope.empName}</span>
                    </a>
                </div>
                <div class="home font_14 p_lr5">
                    <a href="${pageContext.request.contextPath}/user_main?empId=${sessionScope.empId}" class="white">
                        <i class="fas fa-house-user"></i> 
                        <span class="weight_700">사용자메인</span>
                    </a>
                </div>
                <div class="home font_14 p_lr5">
                    <a href="${pageContext.request.contextPath}/common/message_fromList?empId=${sessionScope.empId}" class="white">
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
                    <a class="menu_tab" href="#companyMngmt">
                        <i class="far fa-building"></i>
                    </a>
                    <a class="menu_tab" href="#approvalMngmt">
                        <i class="fas fa-signature"></i>
                    </a>
                    <a class="menu_tab" href="#boardMngmt">
                        <i class="fas fa-clipboard-list"></i>
                    </a>
                </div>
                <div id="sub_menu" class="">
                    <ul id="hrMngmt" class="menu">
                        <h3>인사/급여관리</h3>
                        <li><a href="${pageContext.request.contextPath}/admin/salary_list">급여처리내역</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/salary_tax_list">세금계산테이블</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/employee_list.html">사원목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/employee_list.html">사내조직도(X)</a></li>
                    </ul>
                    <ul id="attendMngmt" class="menu">
                        <h3>근태관리</h3>
                        <li><a href="${pageContext.request.contextPath}/admin/attend_list">출퇴근현황(X)</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/vacation_list">휴가사용이력조회</a></li>
                    </ul>
                    <ul id="salesMngmt" class="menu">
                        <h3>영업관리</h3>
                        <li><a href="${pageContext.request.contextPath}/admin/contract_list">계약서목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/contract">계약서입력</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/client_list">거래처목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/client_reg">거래처입력</a></li>
                    </ul>
                    <ul id="productMngmt" class="menu">
                        <h3>생산/제조관리</h3>
                        <li><a href="${pageContext.request.contextPath}/admin/produce">생산현황</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/qc">품질검사</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/release_list">출고상품목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/BOMnProcess">BOM 및 공정관리</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/product_list">상품목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/product_reg">상품정보입력</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/#">창고별재고조회(X)</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/workcenter">워크센터관리</a></li>
                    </ul>
                    <ul id="purchasingMngmt" class="menu">
                        <h3>구매관리</h3>
                        <li><a href="${pageContext.request.contextPath}/admin/order_insert?empDepartment=${sessionScope.empDepartment}">구매요청서작성</a></li>
                        <c:if test="${sessionScope.empHeadcheck eq 'Y' && sessionScope.empDepartment eq '400' || sessionScope.empNum eq 'admin'}">
                        	<li><a href="${pageContext.request.contextPath}/admin/orderList">구매요청서목록</a></li>
                        </c:if>
                    </ul>
                    <ul id="carMngmt" class="menu">
                        <h3>법인차량관리</h3>
                        <li><a href="${pageContext.request.contextPath}/admin/corp_car_management">법인차량관리</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/corp_car_log">법인차량운행일지</a></li>
                    </ul>
                    <ul id="companyMngmt" class="menu">
                        <h3>회사정보관리</h3>
                        <li><a href="${pageContext.request.contextPath}/admin/company">회사기초정보입력</a></li>
                    </ul>
                    <ul id="approvalMngmt" class="menu">
                        <h3>전자결재관리</h3>
                        <li><a href="erp_vacation/erp_vacation_info.html">미결함(X)</a></li>
                        <li><a href="erp_vacation/erp_vacation_info.html">완결함(X)</a></li>
                    </ul>
                    <ul id="boardMngmt" class="menu">
                        <h3>게시판관리</h3>
                        <li><a href="${pageContext.request.contextPath}/admin/board_list?boardNum=999notice">게시글목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/board_reg">게시판관리</a></li>
                    </ul>
                </div>
            </nav>

            <div class="main_wrap">