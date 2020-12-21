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
                        <h2 class="p_b30">회원가입</h2>
                        <div class="login_input_grp">
                            <select class="noto font_16 p_l10" id="empDepartment" name="empDepartment" tabindex="1" style="width:49.4%;">
                               
                            </select>
                            <select class="noto font_16 p_l10" id="empPosition" name="empPosition" tabindex="2" style="width:49.4%;">
                               
                            </select>
                            <input type="date" max="2020_12_31" min="1970_01_01"
                                class="login_box_input p_l10 noto font_16 weight_500 m_t5" id="empEnter" name="empEnter" 
                                data-placeholder="입사년도, 월, 일을 입력해주세요." tabindex="3" required/>
                            <input type="date" max="2020_12_31" min="1970_01_01" class="login_box_input p_l10 noto font_16 weight_500 m_t5"
                                 id="empBirth" name="empBirth" data-placeholder="생년월일을 입력해주세요." tabindex="4" required
                                  />
                            <p class="font_12 left p_l5 m_t5">최초 비밀번호는 생년월일 8자리(YYYYMMDD)로 설정됩니다.</p>
                            <p class="font_12 left p_l5">로그인 후 비밀번호를 반드시 변경 해주세요.</p>
                            <input type="text" class="login_box_input p_l10 noto font_16 weight_500 m_t5" id="empName"
                                name="empName" placeholder="사원명을 입력해주세요." tabindex="5" />
                            <input type="text" class="login_box_input p_l10 noto font_16 weight_500 m_t5" id="empEmail"
                                name="empEmail" placeholder="이메일 주소를 입력해주세요." tabindex="6" />
                            <button id="regBtn" type="button" 
                                class="login_btn m_t20 bg_blue_1 white font_16 noto">회원가입</button>
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
<script src="${pageContext.request.contextPath}/js/departNposition.js"></script>
<script>
	function setEmpOne() {
		var formData = $("#regFrm").serialize();
		
	    $.ajax({
	        url: "${pageContext.request.contextPath}/register",
	        type: "POST",
	        data: formData,
	        success: function() {
	            alert("회원가입성공");
	            window.location.href = "/erp/login";
	        },
	        error: function () {
	            alert("회원가입 AJAX 에러발생!\n관리자에게 문의해주세요.");
	        },
	        complete: function () {}
	    });
	};
	
	$(function () {
	    getDepartmentList();
	    getPositionList();
	
	    $("#regBtn").click(function () {
	    	
	    	if( $("#empEnter").val() == '' ){
	    		alert("입사일을 입력해주세요.");
	    		$("#empEnter").focus();
	    		return false;
	    	}
	    	
	    	if( $("#empBirth").val() == '' ){
	    		alert("생년월일을 입력해주세요.");
	    		$("#empBirth").focus();
	    		return false;
	    	}
		    
	        if( $("#empName").val().trim() == '') {
	            alert("회원이름을 입력해주세요.");
	            $("#empName").focus();
	            return false;
	        }
	        
	        if( $("#empEmail").val().trim() == '' ){
	    		alert("이메일을 입력해주세요.");
	    		$("#empEmail").focus();
	    		return false;
	    	}
	        
	        else{
				setEmpOne();
	        }
	    });
	});
</script>
</html>