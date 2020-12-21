<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<body>
    <header>
        <div class="logo center">
            <i class="fab fa-digg"></i>
        </div>
    </header>
    <main class="flex">
        <div class="login-wrap">
            <!-- <div class="login-logo"> -->
            <h1 class="center p-tb20">Login</h1>
            <div class="login-box p20">
			
                <form id="login-form" name="login-form" class="login-form" method="POST" autocomplete="off">
                	<div name="checkLogin" id="checkLogin" class="center"></div>
                    <div class="login-input p-tb10">
                        <input type="text" name="memID" id="memID" class="memID p-tb10 p-lr5" placeholder="아이디" autofocus required />
                        <input type="password" name="memPwd" id="memPwd" class="memPwd p-tb10 p-lr5" placeholder="비밀번호" required />
                    </div>
                    <button type="button" id="btn" name="btn" class="login-submit p-tb15 weight700 font16">로그인</button>
                </form>

                <div class="chk_continer left p-tb10">
                    <input type="checkbox" class="save-userid">
                    <span class="font14">아이디저장</span>
                </div>
            </div>

            <div class="a-container flex flex-justify p-lr20">
                <a href="${pageContext.request.contextPath}" class="font14">아이디 찾기</a>
                <a href="${pageContext.request.contextPath}" class="font14">비밀번호 찾기</a>
                <a href="${pageContext.request.contextPath}/register" class="font14">회원가입</a>
            </div>
        </div>
    </main>
</body>
<script>
	function login(){
		$.ajax({
			url		: "${pageContext.request.contextPath}/login",
			type	: "POST",
			data 	: $("#login-form").serialize(),
			success	: function(resData) {
				if( resData == "failure" ) {
					$("#checkLogin").html("등록된 사용자가 아닙니다.");
					$("#memID").val("");
					$("#memPwd").val("");
					
				}else if( resData == "needConfirm" ){
					$("#checkLogin").html("승인되지 않은 사용자입니다.<br/>관리자에게 문의하세요.");
	
				}else{
					alert("로그인 되었습니다.");
					window.location.href = "${pageContext.request.contextPath}/userhome";
				}
			},
			error	: function() {
				alert("시스템 오류");
			}
		});
	}
	
	$(function() {
		$("#login-form").keypress(function(e){
			if(e.keyCode == 13){
				login();
			}
		});
		
		$("#btn").click(function() {
			login();
		});
	});
</script>
</html>