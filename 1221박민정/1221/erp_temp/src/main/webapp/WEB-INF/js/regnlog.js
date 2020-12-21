function setEmpOne() {
	$.ajax({
		url 		: "/register",
		type 		: "POST",
		data 		: $("#regFrm").serialize(),
		success 	: function() {
						alert("성공적으로 가입이 완료되었습니다.");
		},
		error 		: function() {
						alert("회원가입 AJAX 에러발생!\n관리자에게 문의해주세요.");
		},
		complete 	: function() {
		}
	});
};

function empNumChk() {

	var formData = {
		emp_name : $("#empName").val(),
		emp_birth : $("#empBirth").val()
	};

	$.ajax({
		url			: "/erp/login/empNumChk",
		type		: "post",
		data		: formData,
		success		: function(resData) {
						if(resData == "fail") {
							alert("입력하신 내용과 일치하는 사원정보가 없습니다.\n다시 입력해주세요.");
						} else{
							alert("사원번호는 " + resData + "입니다");
						}
		},
		error		: function() {
						alert("사원번호 찾기 AJAX 장애발생");
		}
	});
};

function empPasswordChk() {
	
	var formData = {
		emp_numchk	: $("#empNum2").val(),
		emp_birthchk : $("#empBirth2").val()
	};

	$.ajax({
		url			: "/erp/login/empPasswordChk",
		type		: "post",
		data		: formData,
		success		: function(resData) {
						if(resData == "fail") {
							alert("입력하신 내용과 일치하는 사원정보가 없습니다.\n다시 입력해주세요.");
						} else{
							alert("비밀번호가 성공적으로 초기화되었습니다.");
						}
		},
		error		: function() {
						alert("비밀번호 찾기 AJAX 장애발생");
		}
	});
};