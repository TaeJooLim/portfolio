<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
<body>
    <header>
        <div class="logo center">
            <i class="fab fa-digg"></i>
        </div>
    </header>
    <main class="p-tb20">
        <form id="frm" onsubmit="return isPwdSame();" method="POST" class="register p-tb20 p-lr40 flex flex-justify flex-wrap" autocomplete="off">
            <div class="" style="width:100%;">
                <div class="h2-wrap">
                    <h2 class="center">개인정보</h2>
                </div>
                <p>아이디</p>
                <input type="text" name="memID" id="memID" class="memID" 
                placeholder="" required tabindex="1">
                <div id="checkID" style="color:#f00; padding-bottom:10px;"></div>
				
                <div class="pwd-wrap flex flex-justify">
                    <div class="p-r5">
                        <p>비밀번호</p>
                        <input type="password" name="memPwd" id="memPwd" class="memPwd" 
                        required tabindex="2">
                    </div>
                    <div class="p-l5">
                        <p>비밀번호 확인</p>
                        <input type="password" name="memPwdCheck" id="memPwdCheck" class="memPwdCheck" required tabindex="3">
                    </div>
                </div>
                <div id="checkPwd" style="color:#f00;"></div>

                <div class="name-wrap flex flex-justify">
                    <div class="p-lr3">
                        <p>이름</p>
                        <input type="text" name="memName" id="memName" class="memName" required maxlength="5" tabindex="4">
                    </div>
                    <div class="p-lr3">
                        <p>성별</p>
                        <select style="width:150px;" name="memGender" id="memGender" class="sel-100" required tabindex="5">
                            <option value="" disabled selected>선택</option>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>
                    </div>
                </div>

                <p>주민등록번호</p>
                <div class="p-lr3 flex flex-justify">
                    <input oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"  
                    type="text" name="memJumin" id="memJumin" style="width:45%;" required maxlength="6"  tabindex="6">
                    <p style="line-height: 35px;">-</p>
                    <input oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
                    type="password" name="memJuminBack" id="memJuminBack" style="width:45%;" required maxlength="7" tabindex="7">
                </div>
                
                <div class="p-lr3 flex flex-justify">
					<div>
	                    <p>부서</p>
	                    <div>
		                    <select style="width:150px;" name="memBuseoCode" id="memBuseoCode" class="sel-100" tabindex="8">
		                    </select>
	                    </div>
	                </div>
	
	                <div>
	                    <p>직급</p>
	                    <select style="width:150px;" name="memGradeCode" id="memGradeCode" class="sel-100" tabindex="9">
	                    </select>
	                </div>
				</div>
				
				<div class="p-lr3 m-t10" style="width:100%;">
					<p>입사일</p>
                	<input type="date" max="2020-12-31" min="1970-12-31" 
                	name="memEntdate" id="memEntdate" placeholder="입사년월일을 입력하세요." 
                	required tabindex="10"/>
				</div>
                
            </div>
			
            <div class="form-bottom" style="width:100%;">
                <button type="submit" class="btn_submit font18 m-tb10 p-tb10 weight700" tabindex="11">가입하기</button>
                <div class="login right">
                    <a href="${pageContext.request.contextPath}"  tabindex="12">로그인</a>
                </div>
            </div>
        </form>
    </main>
</body>
<script>
    function loadBuseo(){
        $.ajax({
            url			: "${pageContext.request.contextPath}/get_buseo",
            type		: "POST",
            data 		: "",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType    : "json",
            success     : function(resData){
                $.each(resData, function(key, value){
                    $("#memBuseoCode").append(
                        "<option value=" + value.buseo_id + ">" 
                        + value.buseo_name + "</option>"
                    );
                });
            },
            error   	: function(){
                alert("시스템 에러");
            },
            complete    : function(){

            }
        });
    }
    
    function loadGrade(){
        $.ajax({
            url :   "${pageContext.request.contextPath}/get_grade",
            type    :   "POST",
            data    :   "",
            contentType :   "application/x-www-form-urlencoded; charset=utf-8",
            dataType    :   "json",
            success     :   function(resData){
                $.each(resData, function(key, value){
                    $("#memGradeCode").append(
                        "<option value=" + value.grade_id + ">"
                        + value.grade_name + "</option>"
                    );
                });
            },
            error   :   function(){
                alert("시스템 에러");
            },
            complete    :   function(){

            }
        });
    }

	// PWD 정규식 확인
    function checkPwd(){
        var pwd = $("#memPwd");
        var pwdCheck = $("#memPwdCheck");
        var getPwdCheck= RegExp(/^(?=.*[a-z])(?=.*[0-9])[0-9A-Za-z!@#]{8,16}$/);
        var getHangle = RegExp(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/);

        if(!getPwdCheck.test(pwd.val()) || getHangle.test(pwd.val())){
        	$("#checkPwd").html("8~16자의 영문 대소문자와 숫자,특수문자(!@#)를 사용하세요.");
            pwd.val("");
            pwdCheck.val("");
            return false;
        }

        $("#checkPwd").html("");
    }

	// (onSubmit) 비밀번호 재입력과 동일여부 확인
	function isPwdSame(){
		var pwd = $("#memPwd");
        var pwdCheck = $("#memPwdCheck");
		
		if(pwd.val() != pwdCheck.val()) {
        	$("#checkPwd").html("비밀번호가 다릅니다. 확인하세요.");
			pwdCheck.val("");
			return false;
		}

		alert("회원가입이 완료되었습니다.");
	}

	// ID 정규식 확인
    function RegExpID(){
        var memID = $("#memID");
        var getIDCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])[0-9a-z!@#]{6,18}$/);
        var getHangle = RegExp(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/);
        
        if(!getIDCheck.test(memID.val()) || getHangle.test(memID.val())){
            $("#checkID").html("6~18자의 영문 소문자와 숫자를 사용하세요.");
            memID.val("");
            return false;
        }

        $("#checkID").html("");
        return true;
    }
	
    // ID 중복확인
    function checkID(){
        $.ajax({
            url         : "${pageContext.request.contextPath}/checkID",
            type        : "POST",
            data        : { memID : $("#memID").val() },
            success     : function(resData){
                if( resData == "notExists" ){
                    $("#checkID").html("사용가능한 아이디입니다.");
                }else{
                    $("#checkID").html("중복된 아이디입니다.");
                    $("#memID").val("");
                }
            },
            error       : function(){
                alert("시스템 에러");
            },
            complete    : function(){
            }
        });
    }
	
    $(function(){
        loadBuseo();
        loadGrade();
        $("#memID").blur(function(){
			RegExpID();
			if(RegExpID() == true){
				checkID();
			}
        });
        $("#memPwd").blur(function(){
			checkPwd();
        });
    });
</script>
</html>