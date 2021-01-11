document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
	
$(".readonly").keydown(function(e){
    e.preventDefault();
    });
$(".readonly").attr("autocomplete", "off");
 	
$("#wcFloor, #wcArea").keyup(function () {
    //정규표현식 = 숫자만 사용가능
    $(this).val($(this).val().replace(/[^0-9]$/gi, ""));
});	
	
$(".search_box i").click(function(){
    $(".emp_chk_bg").show();
 });

$("#emp_chk_btn").click(function(){
	empChk();
});

$("#pop_close").click(function(){
	$(".emp_chk_bg").hide();
});

function empChk(){
	$.ajax({
		url		: "/erp/admin/workcenter_empChk",
		type	: "POST",
		data	: {empName:$(".empName").val()},
		success	: function(results) {
		$("#emp_chk_list").find("tr").remove();
			var str = null;
			if(results == ''){
					str += '<tr>';
	                str += '<td colspan="5">검색결과가 없습니다.</td>';
	                str += '</tr>';
			}else{			
			 $.each(results , function(key, results){
					str += '<tr>';
	                str += '<td>' + results.empName + '</td><td>' + results.empNum + '</td><td>' + results.empDepartmentName + '</td><td>' + results.empPositionName+ '</td>';
	                str += '<td> <button type="button" id="proc_sel_btn" class="proc_sel_btn s_btn_gray" onClick="empIn(\'' + results.empName + '\',' + results.empId + ');">선택</button> </td>';
	                str += '</tr>';
	           });
	           };
			 $("#emp_chk_list").append(str);
	         $(".empName").val('');
		},
		error	:function() {
			alert("시스템 에러");			
		}
	});
}

function empIn(empName,empId){
	$("#empName").val(empName);
	$("#empId").val(empId);
	$(".emp_chk_bg").hide();
}

function wcDel(wcId){
	if( confirm("등록된 워크센터를 삭제하시겠습니까?") ) {
	$.ajax({
		url		: "/erp/admin/workcenter_del",
		type	: "POST",
		data	: {wcId : wcId},
		success	: function(resData) {
			alert( "워크센터가 삭제되었습니다.");
			window.location.reload();
			
		},
		error	:function() {
			alert("시스템 에러");			
		}
	});
	}else{
		window.location.reload();
		}
}