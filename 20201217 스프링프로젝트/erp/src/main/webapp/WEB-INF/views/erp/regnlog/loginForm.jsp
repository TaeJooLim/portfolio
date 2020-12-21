<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BLUE ERP 로그인페이지</title>
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/common.css">
        <link rel="stylesheet" href="css/regnlog_style.css">
    
        <script src="https://kit.fontawesome.com/a74ea2df94.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="login_page_wrap bg_ivory flex flex_vc flex_hc noto">
            <div class="login_page_bottom_box flex bg_white space_between">
                <div class="loginimg">
                    <img src="images/regnlog/loginimg.jpg" />
                </div>
                <div class="login_box p_30 center flex flex_hc flex_vc">
                        <div>
                            <h2 class="p_b30">로그인</h2>
                            <form id="" name="logFrm" method="POST" action="${pageContext.request.contextPath}/login">
                                <div class="login_input_grp">
                                    <input type="text" class="login_box_input p_l10 noto font_16 weight_500" id="empNum" name="empNum"
                                    placeholder="사원번호를 입력해주세요." autofocus tabindex="1" required />
                                    <input type="password" class="login_box_input p_l10 noto font_16 weight_500 m_t5" id="empPassword" name="empPassword"
                                    placeholder="비밀번호를 입력해주세요." tabindex="2" required />
                                    <p class="font_12 left p_l5 m_t5">최초 비밀번호는 생년월일 8자리(YYYYMMDD)로 설정됩니다.</p>
                                    <p class="font_12 left p_l5">로그인 후 비밀번호를 반드시 변경 해주세요.</p>
                                </div>
                                <div class="login_checkbox m_t5 flex space_between">
                                    <div class="flex space_between">
                                        <input type="checkbox" class="login_remember m_r5" style="margin-top: 2px;" id=""
                                        name="" />
                                        <span class="font_14">사원번호 기억하기</span>
                                    </div>
                                    <span class="font_14"><a style="color: #000;" href="#">비밀번호 찾기</a></span>
                                </div>
                                <button type="submit" id="logBtn" class="login_btn m_tb20 bg_blue_1 white font_16">로그인</button>
                            </form>
                            <span class="font_14">사원번호와 비밀번호를 분실하셨다면</span>
                            <div class="signup_using_btn_grp m_t10">
                                <button class="font_14 weight_200 search_btn white bg_blue_3">사원번호 찾기</button>
                                <button class="font_14 weight_200 search_btn white bg_blue_3">비밀번호 찾기</button>
                            </div>
                            <div class="m_t20">
                                <span class="font_14">회원이 아니시면 </span>
                                <span class="font_14"><a class="blue_1" href="${pageContext.request.contextPath}/register">지금
                                        회원가입하세요</a></span>
                            </div>
                        </div>
                        <input type="hidden" id="chkMsg" value="${msg}" />
                </div>
            </div>
        </div>
    </body>
<script src="js/regnlog.js"></script>
<script>
	$(function() {
		if($("#chkMsg").val() == '') {
			
		}
		else {
			alert($("#chkMsg").val());
		}
	});
</script>
</html>