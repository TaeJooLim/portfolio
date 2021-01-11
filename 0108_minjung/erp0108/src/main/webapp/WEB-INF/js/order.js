$("#orderPBuy, #orderPAmount").keyup(function () {
    //정규표현식 = 숫자만 사용가능
    $(this).val($(this).val().replace(/[^0-9]$/gi, ""));
});


function setOrderList(){
	
	if($("#orderPAmount").val() == '') {
		alert("수량을 입력해주세요.");
		$("#orderPAmount").focus();
		return false;
	}
	
	if($("#orderPUnit").val() == '') {
		alert("품명을 선택하여 단위/단가를 입력해주세요.");
		return false;
	}
	
	$.ajax({
		url		: "/erp/admin/order_insert_set",
		type	: "POST",
		data	: $("#setOrderFrm").serialize(),
		success	: function(resData) {
			alert("구매요청서가 등록되었습니다.");
			window.location.reload();
		},
		error	: function() {
			alert("관리자에게 문의하세요.");
		}
	})
}

function pUnit(){
	
	var orderPName = $("#orderPName").val();
	
	$.ajax({
		url		: "/erp/admin/order_pUnit_change",
		type	: "POST",
		data	: {orderPName : orderPName},
		success	: function(resData) {
			$("#orderPUnit").val(resData);
		},
		error	: function() {
			alert("에러발생\n관리자에게 문의하세요.");
		}
		
	});
}

function pBuy(){
	
	var orderPName = $("#orderPName").val();
	
	$.ajax({
		url		: "/erp/admin/order_pBuy_change",
		type	: "POST",
		data	: {orderPName : orderPName},
		success	: function(resData) {
			$("#orderPBuy").val(resData);
		},
		error	: function() {
			alert("에러발생\n관리자에게 문의하세요.");
		}
		
	});
}

function deleteOne(orderId) {
	if(confirm("선택하신 항목을 삭제하시겠습니까?")) {
		$.ajax({
			url 		: "/erp/admin/order_delete_one",
			type		: "POST",
			data		: { orderId : orderId },
			success		: function(resData) {
							alert("선택하신 항목이 삭제되었습니다.");
							window.location.reload();
			},
			error 		: function() {
							alert("에러발생\n관리자에게 문의하세요.");
			}
		});
	} else {
		window.location.reload();
	}
};