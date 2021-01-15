function contDel(contID){
		if( confirm("계약내용 및 정보를 삭제하시겠습니까?") ) {
			$.ajax({
				url		: "/erp/admin/contract_list_delete",
				type	: "POST",
				data	: {contID : contID},
				success	: function(resData) {
					alert( "계약서가 삭제되었습니다.");
					window.location.reload();
					
				},
				error	:function() {
					alert("시스템 에러");			
				}
			});
		} else{
			window.location.reload();
		}
	};
	
	function chkProduce(contDocNum) {
		$.ajax({
			url 		: "/erp/admin/chkProduce",
			type 		: "post",
			data 		: { contDocNum : contDocNum },
			success 	: function(resData) {
							if (resData == 0) {
								var address = "/erp/admin/produce?contDocNum="+contDocNum;
								window.location.href=address;
							} else {
								if(confirm("생산 진행중인 제품입니다. 생산현황을 확인하시겠습니까?")) {
									var address = "/erp/admin/produce?contDocNum="+contDocNum;
									window.location.href=address;
								}
							}
			},
			error 		: function() {
							alert("생산등록/현황 이동 AJAX장애발생\n관리자에게 문의해주세요");
			} 
		});
	};

	function chkQc(contDocNum) {
		$.ajax({
			url 		: "/erp/admin/chkProduce",
			type 		: "post",
			data 		: { contDocNum : contDocNum },
			success 	: function(resData) {
							if (resData == 0) {
								if(confirm("생산등록이 되지 않은 제품입니다. 생산등록 하시겠습니까?")) {
									var address = "/erp/admin/produce?contDocNum="+contDocNum;
									window.location.href=address;
								}
							} else {
								var address = "/erp/admin/qc?contDocNum="+contDocNum;
								window.location.href=address;
							}
			},
			error 		: function() {
							alert("품질검사 이동 AJAX장애발생\n관리자에게 문의해주세요");
			} 
		});
	};

	function chkRelease(contDocNum) {
		$.ajax({
			url 		: "/erp/admin/chkQc",
			type 		: "post",
			data 		: { contDocNum : contDocNum },
			success 	: function(resData) {
							if (resData == 1) {
								alert("이미 출고되어 수정할 수 없는 계약입니다");
								window.location.reload();
							} else {
								var address = "/erp/admin/contract_modify?contDocNum="+contDocNum;
								window.location.href=address;
							}
			},
			error 		: function() {
							alert("계약서내용 수정페이지 이동 AJAX장애발생\n관리자에게 문의해주세요");
			} 
		});
	}