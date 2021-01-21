<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 세션이 생성되어있으면 로그인/회원가입 페이지 스킵 -->
<c:if test="${sessionScope.empId ne null}">
	<script>
		window.location.href='${pageContext.request.contextPath}/user_main?empId=${sessionScope.empId}';
	</script>
</c:if>
<!-- 세션이 생성되어있으면 로그인/회원가입 페이지 스킵 -->
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BLUE ERP 로그인페이지</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/common_table.css">
    <link rel="stylesheet" href="css/regnlog_style.css">
    <link rel="stylesheet" href="css/button_style.css">
 	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/menu/blue_erp.ico">
    
    <script src="https://kit.fontawesome.com/a74ea2df94.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
    <body>
        <div class="login_page_wrap bg_ivory flex flex_vc flex_hc noto">
            <div class="login_page_bottom_box flex bg_white space_between">
                <div class="loginimg">
                    <img src="images/regnlog/loginimg.jpg" />
                </div>
                <div class="login_box p_30 center flex flex_hc flex_vc" style="position: relative;">
                    <div>
                        <h1 class="p_b30">로그인</h1>
                        <form class="m_b20" id="" name="logFrm" method="POST" action="${pageContext.request.contextPath}/login">
                            <div class="login_input_grp m_b20">
                                <input type="text" class="login_box_input p_l10 noto font_16 weight_500 m_b15" id="empNum" name="empNum"
                                    placeholder="사원번호를 입력해주세요." autofocus tabindex="1" required />
                                <input type="password" class="login_box_input p_l10 noto font_16 weight_500" id="empPassword" name="empPassword"
                                    placeholder="비밀번호를 입력해주세요." tabindex="2" required />
                                <p class="font_14 left p_l5">최초 비밀번호는 생년월일 8자리(YYYYMMDD)로 설정됩니다.</p>
                                <p class="font_14 left p_l5">로그인 후 비밀번호를 반드시 변경 해주세요.</p>
                            </div>
                            <button type="submit" id="logBtn" class="login_btn bg_blue_1 white font_16">로그인</button>
                        </form>
                        <span class="font_14">사원번호와 비밀번호를 분실하셨다면</span>
                        <div class="signup_using_btn_grp flex space_between m_t10">
                            <button class="font_14 weight_200 btn_white popup">사원번호 찾기</button>
                            <button class="font_14 weight_200 btn_white popup2">비밀번호 찾기</button>
                        </div>
                        <div class="m_t10">
                            <span class="font_14">회원이 아니시면 </span>
                            <span class="font_14"><a class="blue_1" href="${pageContext.request.contextPath}/register">지금
                                        회원가입하세요</a></span>
                        </div>
                    </div>
                    <input type="hidden" id="chkMsg" value="${msg}" />
                    <!-- 사원번호 찾기 모달 시작-->
					<div class="modal_wrapper">
				        <div class="modal flex space_between flex_wrap" style="align-content: flex-start;">
				            <div>
				                <h3 class="font_18">사원번호 찾기</h3>
				            </div>
				            <a href="" class="popup font_20">
				                <i class="fas fa-window-close"></i>
				            </a>
				            <div class="m_t20 w_100 flex" style="flex-wrap: nowrap; overflow-y: auto;">
				            	<div class="font_12 m_b10 w_100 p_10" style="background-color: #f9f9f9;">
				                    <strong>사원명</strong>과<strong> 생년월일</strong>을 입력해주세요.
				                </div>
				            </div>
				            <div class="w_100 center">
				                <form method="POST" action="">
				                    <table class="list">
				                        <tr>
				                            <td class="bg_gray weight700">사원명</td>
				                            <td class="p_lr3">
				                                <input type="text" class="input_100" id="empName" name="" placeholder="사원명을 입력해주세요.">
				                            </td>
				                        </tr>
				                        <tr>
				                            <td class="bg_gray weight700">생년월일</td>
				                            <td class="p_lr3 bg_white">
				                                <input type="date" class="input_100" id="empBirth" name="" placeholder="생년월일을 입력해주세요.">
				                            </td>
				                        </tr>
				                    </table>
				                    <button type="button" id="empNumChkBtn" class="btn_blue m_t10">입력완료</button>
				                </form>
				            </div>
				        </div>
				    </div>
				    <!-- 사원번호 찾기 모달 끝-->
				    <!-- 비밀번호 찾기 모달 시작-->
				    <div class="modal_wrapper2">
				        <div class="modal flex space_between flex_wrap" style="align-content: flex-start;">
				            <div>
				                <h3 class="font_18">비밀번호 찾기</h3>
				            </div>
				            <a href="" class="popup2 font_20">
				                <i class="fas fa-window-close"></i>
				            </a>
				            <div class="m_t20 w_100 flex" style="flex-wrap: nowrap; overflow-y: auto;">
				            	<div class="font_12 m_b10 w_100 p_10 left" style="background-color: #f9f9f9;">
				                    <strong>사원번호</strong>와<strong> 생년월일</strong>을 입력하시면, 생년월일 8자리(YYMMDD)로 비밀번호가 초기화됩니다.
				                </div>
				            </div>
				            <div class="w_100 center">
				                <form method="POST" action="">
				                    <table class="list">
				                        <tr>
				                            <td class="bg_gray weight700">사원번호</td>
				                            <td class="p_lr3">
				                                <input type="text" class="input_100" id="empNum2" name="empNum2" placeholder="사원번호를 입력해주세요." required />
				                            </td>
				                        </tr>
				                        <tr>
				                            <td class="bg_gray weight700">생년월일</td>
				                            <td class="p_lr3 bg_white">
				                                <input type="date" class="input_100" id="empBirth2" name="empBirth2" placeholder="생년월일을 입력해주세요." required />
				                            </td>
				                        </tr>
				                    </table>
				                    <button type="button" id="empPasswordChkBtn" class="btn_blue m_t10">입력완료</button>
				                </form>
				            </div>
				        </div>
				    </div>
				    <!-- 비밀번호 찾기 모달 끝-->
                </div>
            </div>
            <!-- 테스트용 부서장 정보-->
            <div class="m_l10" style="height: 75%;"> 
            	<button class="btn_test btn_write" style="position: absolute; right: 25%;">임시계정</button>
            	<div class="m_t10 p_5 sample_wrap center bg_white" style="border: 1px solid #ccc; width: 300px; position: absolute; display: none;">
                        	<table>
                        		<tr style="height:30px;border-bottom:1px solid #ccc;"><td colspan="3">테스트용 계정 목록</td></tr>
                        		<tr style="height:30px;border-bottom:1px solid #ccc;">
                        			<td>부서</td>
                        			<td>사원번호</td>
                        			<td>비밀번호</td>
                        		</tr>
                        		<tr style="height:30px;border-bottom:1px solid #ccc;">
                        			<td>관리자</td>
                        			<td>admin</td>
                        			<td>admin</td>
                        		</tr>
                        		<tr style="height:30px;border-bottom:1px solid #ccc;">
                        			<td>인사과</td>
                        			<td>120310019</td>
                        			<td>1234</td>
                        		</tr>
                        		<tr style="height:30px;border-bottom:1px solid #ccc;">
                        			<td>경영과</td>
                        			<td>120320020</td>
                        			<td>1234</td>
                        		</tr>
                        		<tr style="height:30px;border-bottom:1px solid #ccc;">
                        			<td>총무과</td>
                        			<td>120340022</td>
                        			<td>1234</td>
                        		</tr>
                        		<tr style="height:30px;border-bottom:1px solid #ccc;">
                        			<td>전산과</td>
                        			<td>120350023</td>
                        			<td>1234</td>
                        		</tr>
                        		<tr style="height:30px;border-bottom:1px solid #ccc;">
                        			<td>영업과</td>
                        			<td>120370025</td>
                        			<td>1234</td>
                        		</tr>
                        		<tr style="height:30px;border-bottom:1px solid #ccc;">
                        			<td>생산과</td>
                        			<td>120390027</td>
                        			<td>1234</td>
                        		</tr>
                        	</table>
                        </div> 
            </div>
            <!-- 테스트용 부서장 정보-->
        </div>
    </body>
<script src="js/regnlog.js"></script>
<script>
	$(".btn_test").click(function(){
		$(".sample_wrap").css("display","");
		});
</script>
<script>
	$(function() {
		if($("#chkMsg").val() == '') {
			
		}
		else {
			alert($("#chkMsg").val());
		}

		$(".popup").click(function () {	
            $(".modal_wrapper").toggleClass("open");	
        });
		$(".popup2").click(function () {	
            $(".modal_wrapper2").toggleClass("open");	
        });

        $("#empNumChkBtn").click(function() {
			empNumChk();
        });
        $("#empPasswordChkBtn").click(function() {
			empPasswordChk();
        });
	});
</script>
</html>