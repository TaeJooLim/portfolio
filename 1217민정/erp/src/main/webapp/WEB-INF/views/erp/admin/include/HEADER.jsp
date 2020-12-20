<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BLUE ERP SYSTEM | ADMIN</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
    
    <!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/menu/blue_erp.ico">
    <!-- favicon -->

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
                        <span class="weight_700">관리자</span>
                    </a>
                </div>
                <div class="home font_14 p_lr5">
                    <a href="#" class="white">
                        <i class="fas fa-house-user"></i> 
                        <span class="weight_700">사용자메인</span>
                    </a>
                </div>
                <div class="home font_14 p_lr5">
                    <a href="#" class="white">
                        <i class="fas fa-envelope"></i> 
                        <span class="weight_700">쪽지함</span>
                    </a>
                </div>
                <div class="home font_14 p_lr5">
                    <a href="#" class="white">
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
                    <a class="menu_tab" href="#salesMngmt">
                        <i class="fas fa-briefcase"></i>
                    </a>
                    <a class="menu_tab" href="#attendMngmt">
                        <i class="far fa-calendar-alt"></i>
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
                    <a class="menu_tab" href="#boardMngmt">
                        <i class="fas fa-clipboard-list"></i>
                    </a>
                    <a class="menu_tab" href="#userMngmt">
                        <i class="fas fa-user"></i>
                    </a>
                    <a class="menu_tab" href="#companyMngmt">
                        <i class="far fa-building"></i>
                    </a>
                </div>
                <div id="sub_menu" class="">
                    <ul id="hrMngmt" class="menu">
                        <h3>인사/급여관리</h3>
                        <li><a href="${pageContext.request.contextPath}">회사정보수정</a></li>
                        <li><a href="#">NOT FOUND</a></li>
                        <li><a href="#">NOT FOUND</a></li>
                        <li><a href="#">NOT FOUND</a></li>
                    </ul>

                    <ul id="salesMngmt" class="menu">
                        <h3>영업관리</h3>
                        <li><a href="${pageContext.request.contextPath}/admin/client_reg">거래처 등록</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/client_list">거래처 목록</a></li>
                        <li><a href="#">NOT FOUND</a></li>
                        <li><a href="#">NOT FOUND</a></li>
                    </ul>
                    <ul id="attendMngmt" class="menu">
                        <h3>근태관리</h3>
                        <li><a href="erp_employee/employee_list.html">사원목록</a></li>
                        <li><a href="erp_employee/employee_register.html">사원 상세정보등록/수정</a></li>
                        <li><a href="#">NOT FOUND</a></li>
                    </ul>
                    <ul id="productMngmt" class="menu">
                        <h3>생산/물류관리</h3>
                        <li><a href="erp_product/product_list.html">상품목록</a></li>
                        <li><a href="erp_product/product_reg.html">상품등록</a></li>
                    </ul>

                    <ul id="purchasingMngmt" class="menu">
                        <h3>구매관리</h3>
                        <li><a href="erp_salary/salary_list.html">급상여처리하기</a></li>
                        <li><a href="#">NOT FOUND</a></li>
                    </ul>

                    <ul id="carMngmt" class="menu">
                        <h3>법인차량관리</h3>
                        <li><a href="erp_stock/stock_list.html">창고별 재고관리</a></li>
                    </ul>

                    <ul id="boardMngmt" class="menu">
                        <h3>게시판관리</h3>
                        <li><a href="erp_vacation/erp_vacation_info.html">사원 연차내역 조회</a></li>
                    </ul>

                    <ul id="userMngmt" class="menu">
                        <h3>사용자정보관리</h3>
                        <li><a href="erp_vacation/erp_vacation_info.html">사원 연차내역 조회</a></li>
                    </ul>

                    <ul id="companyMngmt" class="menu">
                        <h3>회사정보관리</h3>
                        <li><a href="erp_vacation/erp_vacation_info.html">사원 연차내역 조회</a></li>
                    </ul>
                </div>
            </nav>

            <div class="main_wrap">