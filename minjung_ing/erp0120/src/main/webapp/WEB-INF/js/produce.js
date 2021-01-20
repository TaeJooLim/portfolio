function updateQcOne(prodValue, num, id) {
	if(confirm("선택하신 공정의 품질검사결과를 수정하시겠습니까?")) {
		$.ajax({
			url 		: "/erp/admin/updateQcOne",
			type 		: "post",
			data 		: { prodValue : prodValue, num : num, prodId : id },
			success 	: function(resData) {
							alert("품질검사결과가 성공적으로 수정되었습니다");
							window.location.reload();
			},
			error 		: function() {
							alert("품질검사결과 수정 AJAX 장애발생\n관리자에게 문의해주세요");
			}
		});
	}
}