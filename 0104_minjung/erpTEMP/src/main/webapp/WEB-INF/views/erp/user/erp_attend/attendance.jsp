<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BLUE ERP SYSTEM | ADMIN</title>
    <link rel="stylesheet" href="../../../css/reset.css">
    <link rel="stylesheet" href="../../../css/common.css">
    <link rel="stylesheet" href="../../../css/common_table.css">
    <link rel="stylesheet" href="../../../css/button_style.css">
    <link rel="stylesheet" href="../../../css/menu.css">
    <link rel="stylesheet" href="../../../css/user_main.css">

    <!--****** attendance *******-->
    <link rel="stylesheet" href="../../../css/erp_attendance.css">
    <!-- calendar css -->
    <link rel="stylesheet" href="calendar/core/main.css">
    <link rel="stylesheet" href="calendar/daygrid/main.css">
    <!-- calendar css -->
    <!-- calendar -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <!-- calendar -->
    <!--****** attendance *******-->

    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- JQuery -->
    
    <!-- FontAweSome -->
    <script src="https://kit.fontawesome.com/5990def7eb.js" crossorigin="anonymous"></script>
    <!-- FontAweSome -->
    
</head>
<body>
    <div class="w_100 h_100 bg_gray" style="min-height: 100vh;">
        <header style="background-color: #148cb2;">
            <div class="nav_icon center font_16">
                <i class="fas fa-bars"></i>
            </div>
            <div class="logo center font_18" style="background-color: #0099a4;">
                <a class="white" href="#">
                    <div class="logo_img_wrap w_100 h_100 flex flex_vc flex_hc">
                        <img src="../../../images/menu/blue_erp_logo(white).png">
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
                        <li><a href="../admin/erp_attend/worktime_list.html">회사정보수정</a></li>
                        <li><a href="#">NOT FOUND</a></li>
                        <li><a href="#">NOT FOUND</a></li>
                        <li><a href="#">NOT FOUND</a></li>
                    </ul>

                    <ul id="salesMngmt" class="menu">
                        <h3>영업관리</h3>
                        <li><a href="erp_correspondent/correspondent_list.html">거래처목록</a></li>
                        <li><a href="erp_correspondent/correspondent_reg.html">거래처등록</a></li>
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
                <div class="main_right bg_white" style="width: 100%;">
                    <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                        <h2 class="font_18">근태관리목록</h2>
                    </div>
                </div>
                <div class="main_right_info" style="padding: 30px 20px;">
                    <div class="flex space_between flex_vc">
                        <div class="td_40">
                            <h3 class="blue_2"><i class="fas fa-edit "></i> 출퇴근기록</h3>
                            <span class="weight_500" style="color:#555">선택한 년도의 해당 월 출근내역을 확인합니다.</span>
                        </div>
                        <div class="font_20 weight_700 center">
                            <a href="#"><i class="fas fa-chevron-left" style="color: #555"></i></a>
                            <span class="p_lr10">2020.11</span>
                            <a href="#"><i class="fas fa-chevron-right" style="color: #555"></i></a>
                        </div>
                        <div class="td_40 right">
                            <select class="input_box" style="width: 100px;">
                                <option>2020</option>
                                <option>2019</option>
                                <option>2018</option>
                                <option>2017</option>
                                <option>2016</option>
                                <option>2015</option>
                                <option>2014</option>
                                <option>2013</option>
                                <option>2012</option>
                            </select>
                            <span class="p_r5">년</span>
                            <select class="input_box" style="width: 100px;">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                                <option>11</option>
                                <option selected>12</option>
                            </select>
                            <span class="p_r5">월</span>
                            <button class="btn_white">검색</button>
                        </div>
                    </div>
                    <div class="m_t10">
                        <div class="attend_box">
                            <div class="m_b10">
                                <h3>출퇴근 Summary</h3>
                            </div>
                            <div class="flex space_between">
                                <div class="attend_box_s flex" style="background-color: #00B8D4; border: transparent; box-shadow: 2px 3px 2px #ececec;">
                                    <div class="attend_icon m_r10" style="background-color: #E0F7FA;">
                                        <i class="fas fa-briefcase font_16" style="color: #00B8D4; "></i>
                                    </div>
                                    <div class="attend_info">
                                        <div class="font_16 white weight_500">실제 출퇴근등록일</div>
                                        <div class="white"><span class="font_20 weight_700">20</span> 건</div>
                                    </div>
                                </div>
        
                                <div class="attend_box_s flex" style="">
                                    <div class="attend_icon m_r10" style="background-color: #EDE7F6">
                                        <i class="fas fa-briefcase font_16" style="color: #7C4DFF;"></i>
                                    </div>
                                    <div class="attend_info">
                                        <div class="font_16 weight_500">정상근로일</div>
                                        <div class=""><span class="font_20 weight_700" style="color: #7C4DFF;">17</span> 건</div>
                                    </div>
                                </div>
                                <div class="attend_box_s flex" style="">
                                    <div class="attend_icon m_r10" style="background-color: #E8EAF6">
                                        <i class="fas fa-exclamation-circle font_16" style="color: #555"></i>
                                    </div>
                                    <div class="attend_info">
                                        <div class="font_16 weight_500">처리필요</div>
                                        <div class=""><span class="font_20 weight_700" style="color: #555">6</span> 건</div>
                                    </div>
                                </div>
                                <div class="attend_box_s flex" style="">
                                    <div class="attend_icon m_r10" style="background-color: #FCE4EC">
                                        <i class="fas fa-briefcase font_16" style="color: #FF4081"></i>
                                    </div>
                                    <div class="attend_info">
                                        <div class="font_16 weight_500">지각일</div>
                                        <div class=""><span class="font_20 weight_700" style="color: #FF4081">1</span> 건</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="m_t20 attend_box">
                        <div class="m_b20">
                            <h3>
                                사용자 님의 2020.12 출퇴근기록
                            </h3>
                            <spaa>1 페이지에 15개 표시(20개?)</spaa>
                        </div>
                        <div class="">
                            <table class="attend_list center">
                                <thead>
                                    <tr style="background-color: #Eee;">
                                        <th class="td_15">일자</th>
                                        <th class="td_10">출근시간</th>
                                        <th class="td_10">퇴근시간</th>
                                        <th class="td_10">소정근무시간</th>
                                        <th class="td_10">초과근무시간</th>
                                        <th class="td_10">총근무시간</th>
                                        <th class="td_10">지각여부</th>
                                        <th class="td_10">외근여부</th>
                                        <th class="td_15">상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>2020.12.07</td>
                                        <td>08:53</td>
                                        <td>18:00</td>
                                        <td>8:00</td>
                                        <td>0:07</td>
                                        <td>9:07</td>
                                        <td> - </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option value="Y"> - </option>
                                                <option value="N"> 외근/출장 </option>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option value="1">처리필요</option>
                                                <option value="2" selected>정상출근</option>
                                                <option value="3">휴가</option>
                                                <option value="4">결근</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2020.12.06</td>
                                        <td> - </td>
                                        <td> - </td>
                                        <td>8:00</td>
                                        <td> - </td>
                                        <td> - </td>
                                        <td> - </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option value="Y"> - </option>
                                                <option value="N"> 외근/출장 </option>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option value="1" selected>처리필요</option>
                                                <option value="2">정상출근</option>
                                                <option value="3">휴가</option>
                                                <option value="4">결근</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2020.12.05</td>
                                        <td> - </td>
                                        <td> - </td>
                                        <td>8:00</td>
                                        <td> - </td>
                                        <td> - </td>
                                        <td> - </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option value="Y"> - </option>
                                                <option value="N"> 외근/출장 </option>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option selected>처리필요</option>
                                                <option>정상출근</option>
                                                <option>휴가</option>
                                                <option>결근</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2020.12.04</td>
                                        <td>13:00</td>
                                        <td>18:00</td>
                                        <td>8:00</td>
                                        <td>0:00</td>
                                        <td>9:00</td>
                                        <td> - </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option value="Y"> - </option>
                                                <option value="N" selected> 외근/출장 </option>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option>처리필요</option>
                                                <option selected>정상출근</option>
                                                <option>휴가</option>
                                                <option>결근</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2020.12.03</td>
                                        <td>09:10</td>
                                        <td>18:10</td>
                                        <td>8:00</td>
                                        <td>0:00</td>
                                        <td>9:00</td>
                                        <td> 지각 </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option value="Y"> - </option>
                                                <option value="N"> 외근/출장 </option>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option value="1">처리필요</option>
                                                <option value="2" selected>정상출근</option>
                                                <option value="3">휴가</option>
                                                <option value="4">결근</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2020.12.02</td>
                                        <td>08:50</td>
                                        <td>18:00</td>
                                        <td>8:00</td>
                                        <td>0:10</td>
                                        <td>9:10</td>
                                        <td> - </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option value="Y"> - </option>
                                                <option value="N"> 외근/출장 </option>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option value="1">처리필요</option>
                                                <option value="2" selected>정상출근</option>
                                                <option value="3">휴가</option>
                                                <option value="4">결근</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2020.12.01</td>
                                        <td>09:00</td>
                                        <td>18:00</td>
                                        <td>8:00</td>
                                        <td>0:00</td>
                                        <td>9:00</td>
                                        <td> - </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option value="Y"> - </option>
                                                <option value="N"> 외근/출장 </option>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="input_box" style="width: 100px" disabled>
                                                <option value="1">처리필요</option>
                                                <option value="2" selected>정상출근</option>
                                                <option value="3">휴가</option>
                                                <option value="4">결근</option>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="m_t10 center">
                                <div class="page_grp center white_s_no">
                                    <a href="">
                                        <span class="page" style="margin-bottom: 0"><i class="fas fa-angle-double-left"></i></span>
                                    </a>
                                    <a href="">
                                        <span class="page" style="margin-bottom: 0"><i class="fas fa-angle-left"></i></span>
                                    </a>
                                    <a href="">
                                        <span class="page page_selected" style="margin-bottom: 0">1</span>
                                    </a>
                                    <a href="">
                                        <span class="page" style="margin-bottom: 0">2</span>
                                    </a>
                                    <a href="">
                                        <span class="page" style="margin-bottom: 0"><i class="fas fa-angle-right"></i></span>
                                    </a>
                                    <a href="">
                                        <span class="page" style="margin-bottom: 0"><i class="fas fa-angle-double-right"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <footer class="center">
        <span> &copy; Copyright Project All rights reserved. </span>
    </footer>
</body>
<script src="../../js/menu.js"></script>
<script src="../../js/user_main.js"></script>
</html>