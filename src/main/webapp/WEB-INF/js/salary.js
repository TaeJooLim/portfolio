function setSalaryAll() {
	if(confirm("급여지급내역 정보를 업데이트 하시겠습니까?")) {
		$.ajax({
			url		: "/erp/admin/setSalaryAll",
			type 	: "post",
			data 	: { toDate : $("#toDate").val() },
			success : function(resData) {
						if(resData == 0) {
							alert("급여지급내역이 성공적으로 저장되었습니다");
							window.location.href='/erp/admin/salary_list';
						}
						else {
							alert("급여지급내역이 이미 존재합니다\n관리자에게 문의해주세요");
						}
			},
			error 	: function() {
						alert("급여지급내역 저장 AJAX장애발생\n관리자에게 문의해주세요");
			}
		});
	}
}