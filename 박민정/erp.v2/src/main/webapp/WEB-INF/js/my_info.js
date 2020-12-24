$(function () {	
    $(".popup").click(function () {	
        $(".modal_wrapper").toggleClass("open");	
    });
});

function chkPwd(empNum){
	var pwd		= $("#empPassword").val();
	var re_pwd	= $("#re_empPassword").val();
	
	if ( pwd != re_pwd ){
		alert("비밀번호가 일치하지 않습니다.");
		$("#re_empPassword").val('');
		$("#re_empPassword").focus();
		return false;
	}
	
	$.ajax({
		url		: "/erp/admin/check_pwd",
		type	: "POST",
		data	: {
			pwd		: pwd,
			empNum	: empNum
		},
		success	: function(resData){
			if( resData == "success" ){
				alert("비밀번호 변경을 완료하였습니다.");
				window.location.reload();
			}else{
				alert("비밀번호는 영문소문자와 숫자를 조합하여 8~20자 이내여야 합니다.");
				$("#empPassword").val('');
				$("#re_empPassword").val('');
				$("#empPassword").focus();
				return false;
			}
		},
		error	: function(){
			alert("비밀번호 에러!");
		}
	});
}