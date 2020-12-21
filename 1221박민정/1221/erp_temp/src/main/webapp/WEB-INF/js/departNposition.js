function getDepartmentList() {
	$.ajax({
		url 			: "/erp/getDepartmentList",
		type			: "POST",
		contentType 	: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType 		: "json",
		success 		: function(resData) {
              				$.each(resData, function(key, value){
								$("#empDepartment").append(
									"<option value=" + value.empDepartment + ">" + value.empDepartmentName + "</option>"
								);
							});
		},
		error 			: function() {
               				alert("부서 불러오기 AJAX 에러발생!\n관리자에게 문의해주세요.");
		},
		complete 		: function() {
		}
	});
};

function getPositionList() {
	$.ajax({
		url 			: "/erp/getPositionList",
		type 			: "POST",
		contentType 	: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType 		: 'json',
		success 		: function(resData) {
							$.each(resData, function(key, value){
								$("#empPosition").append(
									"<option value=" + value.empPosition + ">" + value.empPositionName + "</option>"
								);
							});
		},
		error 			: function() {
							alert("직급 불러오기 AJAX 에러발생!\n관리자에게 문의해주세요.");
		},
		complete 		: function() {
		}
	});
};