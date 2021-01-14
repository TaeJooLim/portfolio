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

function getBtypeList() {
	$.ajax({
		url			: "/erp/admin/getBtypeList",
		type		: "post",
		data		: { pId : $("#selBOM option:selected").val() },
		success		: function(resData) {
						$("#bCode").html(resData.pCode);
						$("#bBrand").html(resData.pBrand);
						$("#bModelnum").html(resData.pModelnum);
						$("#bUnit").html(resData.pUnit);
						$("#bSize").html(resData.pSize);
						$("#bBuy").html(resData.pBuy);
						$("#bNote").html(resData.pNote);
		},
		error		: function() {
						alert("원자재리스트 불러오기 AJAX 장애발생\n관리자에게 문의해주세요.");
		}
	});
};

function BOMInsert() {
	if($("#pIdFk").val() == '') {
		alert("제품을 선택해주세요");
		$("#words").focus();
		return false;
	}
	if($("#bAmount").val() == '') {
		alert("원자재 수량을 입력해주세요");
		$("#bAmount").focus();
		return false;
	}
	
	$.ajax({
		url			: "/erp/admin/BOMInsert",
		type		: "post",
		data		: $("#BOMInsert").serialize(),
		success 	: function(resData) {
						getBOMList();
		},
		error 		: function() {
						alert("원자재 입력 AJAX 장애발생\n관리자에게 문의해주세요.");
		}
	});
};

function getBOMList() {
	var prodName = $("#pName").html();
	var prodCode = $("#pCode").html();

	$.ajax({
		url			: "/erp/admin/getBOMList",
		type		: "post",
		data		: { pIdFk : $("#pIdFk").val() },
		success		: function(resData) {
						var str = '';
						$.each(resData, function(index, value) {
							str += "<tr>";
							str += "<td>" + (index + 1) + "</td>";
							str += "<td>" + prodName + "</td>";
							str += "<td>" + prodCode + "</td>";
							str += "<td>" + value.pName + "</td>";
							str += "<td>" + value.pCode + "</td>";
							str += "<td>" + value.pUnit + "</td>";
							str += "<td>" + value.pSize + "</td>";
							str += "<td>" + value.pmAmount + "</td>";
							str += "<td>" + value.pBuy + "</td>";
							str += "<td>" + (value.pBuy * value.pmAmount) + "</td>";
							str += "<td><button type='button' class='s_btn_red' onClick='delBOMOne(" + value.pId + ")'>삭제</button></td>";
						});
						
						if (resData != '') {
							$("#bodList").html(str);
						}
		},
		error 		: function() {
						alert("BOM리스트 불러오기 AJAX 장애발생\n관리자에게 문의해주세요.");
		}
	});
};

function getProcessList() {
	var prodName = $("#pName").html();
	var prodCode = $("#pCode").html();
	
	$.ajax({
		url 		: "/erp/admin/getProcessList",
		type 		: "post",
		data 		: { pIdFk : $("#pIdFk").val() },
		success 	: function(resData) {
						var str = '';
								
						$.each(resData, function(index, value) {
							str += "<tr>";
							str += "<td>" + (index + 1) + "</td>";
							str += "<td>" + prodName + "</td>";
							str += "<td>" + prodCode + "</td>";
							str += "<td>" + value.procSeq + "</td>";
							str += "<td>" + value.procName + "</td>";
							str += "<td>" + value.procWcName + "</td>";
							str += "<td>" + value.procWorkers + "명</td>";
							str += "<td>" + value.procWorkingTime + "H</td>";
							str += "<td>" + value.procEmpDepartmentName + "</td>";
							str += "<td>" + value.procEmpName + " " + value.procEmpPositionName + "</td>";
							str += "<td>" + value.procEmpCP + "</td>";
							str += "<td><button type='button' class='s_btn_red' onClick='delProcessOne("+ value.procId +")'>삭제</button></td>";
						});
						
						if (resData != '') {
							$("#processList").html(str);
						}
		},
		error 		: function() {
		
		}
	});
};

function setProcessOne() {
	if($("#pIdFk").val() == '') {
		alert("제품을 선택해주세요");
		$("#words").focus();
		return false;
	}

	if($("#procName").val() == '') {
		alert("공정이름을 입력해주세요");
		$("#procName").focus();
		return false;
	}
	if($("#procWorkers").val() == '') {
		alert("작업인원을 입력해주세요");
		$("#procWorkers").focus();
		return false;
	}
	if($("#procWorkingTime").val() == '') {
		alert("작업시간을 입력해주세요");
		$("#procWorkingTime").focus();
		return false;
	}
	
	var formData = {
		wcId 				: $("#wcId option:selected").val(),
		procSeq 			: $("#procSeq option:selected").val(), 
		procName 			: $("#procName").val(), 
		procWorkers 		: $("#procWorkers").val(), 
		procWorkingTime 	: $("#procWorkingTime").val(),
		empIdFk 			: $("#empIdFk").val(), 
		pIdFk 				: $("#pIdFk").val()
	};
	
	$.ajax({
		url 		: "/erp/admin/setProcessOne",
		type 		: "post",
		data 		: formData, 
		success 	: function(resData) {
						getProcessList();
		},
		error 		: function() {
						alert("공정리스트 불러오기 AJAX장애발생\n관리자에게 문의해주세요");
		}
	});
};

function delBOMOne(pmIdFk) {
	var formData = {
		pIdFk : $("#pIdFk").val(), 
		pmIdFk : pmIdFk
	}

	if(confirm("선택하신 정보를 삭제하시겠습니까?")) {
		$.ajax({
			url 		: "/erp/admin/delBOMOne",
			type 		: "post",
			data 		: formData,
			success 	: function(resData) {
							getBOMList();
			},
			error 		: function() {
							alert("BOM삭제 AJAX 장애발생\n관리자에게 문의해주세요");
			}
		});
	}
};

function delProcessOne(procId) {
	if (confirm("선택하신 정보를 삭제하시겠습니까?")) {
		$.ajax({
			url 		: "/erp/admin/delProcessOne",
			type 		: "post", 
			data 		: {procId : procId},
			success 	: function(resData) {
							alert("선택하신 정보가 성공적으로 삭제되었습니다");
							getProcessList();
			},
			error 		: function() {
							alert("공정삭제 AJAX 장애발생\n관리자에게 문의해주세요");
			}
		});
	}
};