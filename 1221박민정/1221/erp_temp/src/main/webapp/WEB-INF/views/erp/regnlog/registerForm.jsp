<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BLUE ERP 회원가입페이지</title>
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
                <form id="regFrm" name="regFrm" method="POST" action="">
                    <div>
                        <h1 class="p_b30">회원가입</h1>
                        	<div class="login_input_grp">
                        		<div class="list_select_grp flex space_between m_b10">
            	              		<select class="noto font_16 p_l10" id="empDepartment" name="empDepartment" style="width:49.45%" tabindex="1">
                               
        	                   		</select>
    	                       		<select class="noto font_16 p_l10" id="empPosition" name="empPosition" style="width:49.45%" tabindex="2">
                               
	                           		</select>
                        		</div>
	                            <input type="date" max="2020_12_31" min="1970_01_01"
	                                class="login_box_input p_l10 noto font_16 weight_500 m_b10" id="empEnter" name="empEnter"
	                                data-placeholder="입사년도, 월, 일을 입력해주세요." tabindex="3" required />
	                            <input type="date" max="2020_12_31" min="1970_01_01" class="login_box_input p_l10 noto font_16 weight_500"
	                                 id="empBirth" name="empBirth" data-placeholder="생년월일을 입력해주세요." tabindex="4"
	                                 required />
	                            <p class="font_12 left p_l5">최초 비밀번호는 생년월일 8자리(YYYYMMDD)로 설정됩니다.</p>
	                            <p class="font_12 left p_l5">로그인 후 비밀번호를 반드시 변경 해주세요.</p>
	                            <input type="text" class="login_box_input p_l10 noto font_16 weight_500 m_t10" id="empName"
	                                name="empName" placeholder="사원명을 입력해주세요." tabindex="5" required />
	                            <input type="text" class="login_box_input p_l10 noto font_16 weight_500 m_t10" id="empEmail"
	                                name="empEmail" placeholder="이메일 주소를 입력해주세요." tabindex="6" required />
	                            <button id="regBtn" type="button" class="login_btn m_t20 bg_blue_1 white font_16 noto">회원가입</button>
	                            <div class="m_t20">
	                                <span class="font_14"><a class="blue_1"
	                                        href="${pageContext.request.contextPath}/login">로그인 페이지로 돌아가기</a>
	                                </span>
	                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
<script src="js/departNposition.js"></script>
<script>
	$("#regBtn").click(function(){
		if($("#empEnter").val() == '') {
			alert("입사일자를 입력해주세요.");
			$("#empEnter").fucus();
			return false;
		}
		if($("#empBirth").val() == '') {
			alert("생년월일을 입력해주세요.");
			$("#empBirth").fucus();
			return false;
		}
		if($("#empName").val().trim() == '') {
			alert("성함을 입력해주세요.");
			$("#empName").fucus();
			return false;
		}
		if($("#empEmail").val() == '') {
			alert("이메일을 입력해주세요.");
			$("#empEmail").fucus();
			return false;
		}
		setEmpOne();
		window.location.href="${pageContext.request.contextPath}/admin_main";
	});
   
   $(function(){
      getDepartmentList();
      getPositionList();
   });
</script>
</html>