function chk() {
		
		if($("#offDateCnt").val() == '') {
			alert("휴가 신청 일수를 확인해주세요.");
			return false;
			
		}else return true;
	};
	
	function chkDate() {

		if ($("#offStartDate").val() == '') {
			alert("시작일자를 입력해주세요.");
			$("#offStartDate").focus();
			return false;
		}

		if($("#offEndDate").val() == '') {
			alert("종료일자를 입력해주세요.");
			$("#offEndDate").focus();
			return false;
		}
		
		
		var formData = {
				begin : $("#offStartDate").val(),
				end : $("#offEndDate").val()
		}
		
		$.ajax({
			url		: "/erp/user/vacation_reg",
			type	: "post",
			data	: formData,
			success	: function(resData) {
						$("#offDateCnt").val(resData);
						$("#dateCnt").val(resData);
			},
			error	: function(){
						alert("실패");
			}
		});
	}

	function deleteOne(offConfirm, offDocNum, offDateCnt) {
		
		if(offConfirm == 'N' && confirm("선택하신 항목을 삭제하시겠습니까?")) {

			var formData = {
					offDocNum 	: offDocNum, 
					offDateCnt	: offDateCnt, 
					empId		:  $("#empIdFk").val(),
					empOffUse	: $("#empOffUse").val(),
					empOffRemain: $("#empOffRemain").val()
			}	
		
			$.ajax({
				url 		: "/erp/user/vacation_delete_one",
				type		: "POST",
				data		: formData,
				success		: function(resData) {
								alert("선택하신 항목이 삭제되었습니다.");
								window.location.reload();
				},
				error 		: function() {
								alert("에러발생\n관리자에게 문의하세요.");
				}
			});
		} else {
			alert("결재가 완료된 항목은 취소할 수 없습니다.");
			window.location.reload();
		}
	};