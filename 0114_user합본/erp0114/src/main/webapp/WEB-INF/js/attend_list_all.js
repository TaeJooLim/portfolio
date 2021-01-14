	//체크박스 함수
	var flag = false;
	
	function chkAll() {
	
	    var chk = document.getElementsByName("chk");
	    if (flag == false) { //선택 x
	        flag = true;
	
	        for (var i = 0; i < chk.length; i++) {
	            chk[i].checked = true;
	        }
	
	    } else {
	        flag = false;
	        for (var i = 0; i < chk.length; i++) {
	            chk[i].checked = false;
	        }
	    }
	}
	
    function changeLate(thisValue,aid,empName,attendWorkdate){
		
        var msg = "("+ attendWorkdate +") "+empName+"의 지각여부를 변경하시겠습니까?";
		if( confirm(msg) ){
			$.ajax({
				url		: "/erp/user/change_late",
				type	: "POST",
				data	: {
					attendId	: aid,
					attendLate	: thisValue
				},
				success	: function(resData){
					window.location.reload();
				},
				error	: function(){
					alert("지각여부 변경 ajax 에러");
				}
			});
		}
		window.location.reload();
    }
    
	function changeWorkplace(thisValue,aid,empName,attendWorkdate){
		
        var msg = "("+ attendWorkdate +") "+empName+"의 내외근여부를 변경하시겠습니까?";
		if( confirm(msg) ){
			$.ajax({
				url		: "/erp/user/change_workplace",
				type	: "POST",
				data	: {
					attendId		: aid,
					attendWorkplace	: thisValue
				},
				success	: function(resData){
					window.location.reload();
				},
				error	: function(){
					alert("내외근여부 변경 ajax 에러");
				}
			});
		}
		window.location.reload();
	}
	
	function changeStatus(thisValue,aid,empName,attendWorkdate){
		
        var msg = "("+ attendWorkdate +") "+empName+"의 상태를 변경하시겠습니까?";
		if( confirm(msg) ){
			$.ajax({
				url		: "/erp/user/change_status",
				type	: "POST",
				data	: {
					attendId		: aid,
					attendStatus	: thisValue
				},
				success	: function(resData){
					window.location.reload();
				},
				error	: function(){
					alert("상태 변경 ajax 에러");
				}
			});
		}
		window.location.reload();
    }

    function changeInputBox(thisValue){

    	var a = '';

    	// 사원별 검색
		if( thisValue == 'emp_name'){
			$("#words").remove();
			
			a += '<input type="text" class="m_lr5 p_l5" style="width:160px; height:30px;" name="words" id="words" />';
			$("#searchOpt").after(a);
		}

    	// 근무월별 검색
		if( thisValue == 'attend_workdate' ){
			$("#words").remove();
			
			a += '<input type="month" class="m_lr5" style="width:160px; height:30px;" name="words" id="words" />';
			$("#searchOpt").after(a);
		}

    	// 지각유무별 검색
		if( thisValue == 'attend_late' ){
			$("#words").remove();
			
			a += '<select class="search_sel_box m_lr5 p_l5" style="width:160px; height:30px;" name="words" id="words">';
	        	a += '<option value="Y">지각</option>';
	        	a += '<option value="N">정상</option>';
	    	a += '</select>';
	    	$("#searchOpt").after(a);
		}
		
		// 상태별 검색
		if( thisValue == 'attend_status' ){
			$("#words").remove();
			
			a += '<select class="search_sel_box m_lr5 p_l5" style="width:160px; height:30px;" name="words" id="words">';
	        	a += '<option value="1" >처리필요</option>';
	        	a += '<option value="2" >정상출근</option>';
	        	a += '<option value="3" >휴가</option>';
	        	a += '<option value="4" >결근</option>';
	    	a += '</select>';
	    	$("#searchOpt").after(a);
		}
		
    	// 전체 검색
		if( thisValue == 'all' ){
			$("#words").remove();
			
			a += '<input type="text" class="m_lr5 p_l5" style="width:160px; height:30px;" name="words" id="words" />';
			$("#searchOpt").after(a);
		}
    	
    }

 	// 선택삭제
    function deleteRecords(aid){
    	var msg = "선택하신 기록을 삭제하시겠습니까?";

    	if(confirm(msg)){
			var chkArr = new Array();
			$(".chk:checked").each(function(){
				chkArr.push($(this).attr("data-uid"));
			});

			$.ajax({
				url		: "/erp/user/delete_records",
				type	: "POST",
				data	: {
					chkArr	:	chkArr
				},
				success	: function(resData){
					alert("삭제되었습니다.");
					window.location.reload();
				},
				error	: function(){
					alert("선택하신 근태기록이 없습니다.");
				}
				
			});
       	}else{
			window.location.reload();
      	}
    }

    function getRecordOne(attendId){
  		
		$.ajax({
			url		: "/erp/user/get_record_one",
			type	: "POST",
			data	: {
				attendId	: attendId
			},
			success	: function(resData){
				var a = '';
				a += '<tr>';
	            	a += '<th>부서</th>';
	            	a += '<th colspan="2">사원명</th>';
	            a += '</tr>';
	            a += '<tr style="background-color:#fff;">';
			  		a += '<td>'+ resData.departName +'</td>';
	         		a += '<td colspan="2">'+ resData.empName +'</td>';
	            a += '</tr>';
	            a +='<tr>';
	            	a += '<th>근무일자</th>';
	            	a += '<th>출근시간</th>';
	            	a += '<th>퇴근시간</th>';
            	a += '</tr>';
	            a += '<tr style="background-color:#fff;">';
	            	a += '<td>';
	            		a += '<input type="date" name="attendWorkdate" value="'+ resData.attendWorkdate +'"/>';
	            	a += '</td>';
	            	a += '<td>';
	            		a += '<input type="time" name="attendStarttime" value="'+ resData.attendStarttime +'"/>';
	            	a += '</td>';
	            	a += '<td>';
	            		a += '<input type="time" name="attendEndtime" value="'+ resData.attendEndtime +'"/>';
	            		a += '<input type="hidden" name="attendId" value="'+ resData.attendId +'"/>';
	            	a += '</td>';
	            a += '</tr>';

	            $("#modal_list").append(a);
			},
			error	: function(){
				alert("해당 사원의 근태기록을 찾을 수 없습니다.\n관리자에게 문의하세요.");
				window.location.reload();
			}
			
		});

		// 모달창 오픈
        $(".modal_wrapper").toggleClass("open");
		
   	}

   	function setRecordOne(){

		var formData = $("#frm").serialize();

		$.ajax({
			url		: "/erp/user/set_record_one",
			type	: "POST",
			data	: formData,
			success	: function(resData){
				alert("성공");
				window.location.reload();
			},
			error	: function(){
				alert("출퇴근기록 변경에 실패하였습니다.\n관리자에게 문의하세요.");
			}

		});

		window.location.reload();
  	}