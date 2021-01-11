function changeInput(thisValue){

    var a = '';

    // 일자별 검색
   if( thisValue == 'off_date'){
      $("#words").remove();
      
      a += '<input type="date" class="m_lr5 p_l5" style="width:178px; height:30px;" name="words" id="words"/>';
      $("#searchOpt").after(a);
   }

    // 휴가분류별 검색
   if( thisValue == 'off_type' ){
      $("#words").remove();
      
      a += '<select class="search_sel_box m_lr5 p_l5" style="width:178px; height:30px;" name="words" id="words">';
           a += '<option value="A">연차</option>';
           a += '<option value="B">반차</option>';
           a += '<option value="C">반반차</option>';
           a += '<option value="D">휴가</option>';
       a += '</select>';
       $("#searchOpt").after(a);
   }

	// 결재여부 
	   if( thisValue == 'off_confirm' ){
	      $("#words").remove();      
	      a += '<select class="search_sel_box m_lr5 p_l5" style="width:178px; height:30px;" name="words" id="words">';
	           a += '<option value="Y">완결</option>';
	           a += '<option value="N">미결</option>';
	       a += '</select>';
	       $("#searchOpt").after(a);
	   }

    // 사원명 or 사원번호 or 전체검색
   if( thisValue == 'emp_name' || thisValue == 'emp_num' || thisValue == 'all' ){
       $("#words").remove();
       
       a += '<input type="text" class="m_lr5 p_l5" style="width:178px; height:30px;" name="words" id="words" />';
       $("#searchOpt").after(a);
    }
 }

function updateConfirm(offConfirm, offDocNum) {

	if(confirm("결재하시겠습니까?")) {
		var formData = {
				offConfirm	 : offConfirm,
				offDocNum: offDocNum
		};
		
		$.ajax({
			url		: "/erp/admin/vacation_confirm",
			type	:"POST",
			data	: formData,
			success	: function(resData) {
				alert("결재가 완료되었습니다.");
				window.location.reload();
			},
			error	: function() {
			}
		});
	} else {
		window.location.reload();
	}
} 