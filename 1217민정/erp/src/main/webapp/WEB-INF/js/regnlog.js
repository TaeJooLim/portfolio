function setEmpOne() {
	$.ajax({
		url 		: "/register",
		type 		: "POST",
		data 		: $("#regFrm").serialize(),
		success 	: function(e) {
						alert("회원가입성공");
						window.location.href="/admin_main";
		},
		error 		: function() {
						alert("회원가입 AJAX 에러발생!\n관리자에게 문의해주세요.");
		},
		complete 	: function() {
		}
	});
};


