function vatCalculate() {
	$("#pBuy").blur(function(e) {
		var buyPrice = $("#pBuy").val();
		$("#pTax").val(buyPrice * 0.1);
	});
	
	$("#pBuy").keyup(function () {
        //정규표현식 = 숫자만 사용가능
        $(this).val($(this).val().replace(/[^0-9]$/gi, ""));
    });
    $("#pSell").keyup(function () {
        //정규표현식 = 숫자만 사용가능
        $(this).val($(this).val().replace(/[^0-9]$/gi, ""));
    });
};

function deleteProductOne(pId) {
	if(confirm("선택하신 상품을 삭제하시겠습니까?")) {
		$.ajax({
			url 		: "/erp/admin/deleteProductOne",
			type		: "POST",
			data		: { pId : pId },
			success		: function(resData) {
							alert("선택하신 상품이 성공적으로 삭제되었습니다.");
							window.location.reload();
			},
			error 		: function() {
							alert("상품목록 불러오기 AJAX 에러발생!\n관리자에게 문의해주세요.");
			}
		});
	} else {
		window.location.reload();
	}
};